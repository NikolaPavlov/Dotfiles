#!/usr/bin/env bash
# opencode session sync wrapper
#
# Wraps the real opencode binary to sync session history between machines
# via a Syncthing-shared folder (~/share/opencode-session), without syncing
# the live SQLite DB itself - that's what caused corruption before.
#
# Installed via a shim in ~/.local/bin/opencode that execs this file:
#   #!/usr/bin/env bash
#   exec "$HOME/Documents/Repos/Dotfiles/Scripts/opencode_sync_wrapper.sh" "$@"
# Run that setup on every machine that should participate (this script
# itself only needs a `git pull` in this repo to update, unlike the shim).
#
# Behavior:
#   - Before launching opencode: for any new/changed session export found in
#     ~/share/opencode-session/*.json, delete the matching local session
#     first, then import. `opencode import` upserts messages by id and never
#     deletes local-only ones, so importing without deleting first merges
#     rather than replaces - each machine's own edits pile up forever under
#     the same session id instead of being overwritten, and the two machines
#     end up showing different content for "the same" session. Delete-then-
#     import makes it a clean replace (verified: re-importing after deleting
#     leaves exactly the incoming message set, nothing stale).
#   - Launch opencode with the caller's args, untouched. (A prior version of
#     this script tried injecting --session <id> to force-resume the latest
#     session, on the theory that opencode's default launch doesn't resume
#     anything. That couldn't be verified against the real interactive TUI
#     from a non-interactive shell, and it made things worse in practice -
#     plain `opencode import <file>` followed by a normal launch is the
#     manually-verified-working path, so leave the launch alone.)
#   - After opencode exits: export whichever session is most recently active
#     to ~/share/opencode-session/<id>.json, unconditionally - every exit
#     re-exports it, overwriting the file if unchanged. This is deliberate:
#     an earlier "only export sessions changed since last marker" approach
#     compared db timestamps against a last-sync-ms marker file, which
#     silently broke when that marker file got clobbered (e.g. by a
#     since-removed parallel Syncthing folder that was also directly
#     mirroring this state dir). Always exporting the current session avoids
#     that whole class of bug.
#   - Non-TUI subcommands (export, import, session, models, ...) pass
#     straight through untouched - only the default TUI launch is wrapped.
#
# Deliberately does not touch opencode.db while opencode itself is running:
# import happens before launch, export happens after exit, so there's never
# concurrent access from this script and the live TUI process.
set -uo pipefail

REAL_OPENCODE="/usr/bin/opencode"
SHARE_DIR="$HOME/share/opencode-session"
STATE_DIR="$HOME/.local/share/opencode/session-sync"
DB="$HOME/.local/share/opencode/opencode.db"
LOG="$STATE_DIR/sync.log"
IMPORTED_STATE="$STATE_DIR/imported.state"

mkdir -p "$SHARE_DIR" "$STATE_DIR"
touch "$LOG"

log() { echo "$(date '+%F %T') $*" >> "$LOG"; }

# Subcommands that aren't the interactive TUI launch - pass through as-is.
KNOWN_SUBCOMMANDS="completion acp mcp attach run debug providers auth agent upgrade uninstall serve web models stats export import github pr session plugin plug db"
first_arg="${1:-}"
skip_sync=false
case "$first_arg" in
  -h|--help|-v|--version) skip_sync=true ;;
esac
for c in $KNOWN_SUBCOMMANDS; do
  [ "$first_arg" = "$c" ] && skip_sync=true && break
done

if [ -n "${OPENCODE_SYNC_WRAPPER_ACTIVE:-}" ] || [ "$skip_sync" = true ] || ! command -v sqlite3 >/dev/null 2>&1; then
  exec "$REAL_OPENCODE" "$@"
fi

export OPENCODE_SYNC_WRAPPER_ACTIVE=1

# --- import phase: pull in any new/changed exports from the shared folder ---
declare -A synced
if [ -f "$IMPORTED_STATE" ]; then
  while IFS=: read -r k v; do synced["$k"]="$v"; done < "$IMPORTED_STATE"
fi

shopt -s nullglob
for f in "$SHARE_DIR"/*.json; do
  base=$(basename "$f")
  mtime=$(stat -c %Y "$f" 2>/dev/null || echo 0)
  if [ "${synced[$base]:-}" != "$mtime" ]; then
    id="${base%.json}"
    # opencode import upserts by message id - it never deletes local-only
    # messages that aren't in the incoming file. Without this delete, each
    # machine's own edits just accumulate forever under the same session id
    # instead of being replaced, so the two machines end up with visibly
    # different content in "the same" session. Deleting first makes this a
    # clean replace instead of a merge.
    "$REAL_OPENCODE" session delete "$id" >>"$LOG" 2>&1 || true
    if "$REAL_OPENCODE" import "$f" >>"$LOG" 2>&1; then
      synced["$base"]="$mtime"
      log "imported $base (clean replace)"
    else
      log "FAILED to import $base"
    fi
  fi
done
shopt -u nullglob

: > "$IMPORTED_STATE"
for k in "${!synced[@]}"; do
  echo "$k:${synced[$k]}" >> "$IMPORTED_STATE"
done

# --- run the real TUI, passing through all args untouched ---
"$REAL_OPENCODE" "$@"
exit_code=$?

# --- export phase: unconditionally export the most recently active session ---
current_id=$(sqlite3 "$DB" "SELECT id FROM session ORDER BY time_updated DESC LIMIT 1;" 2>>"$LOG")

if [ -n "$current_id" ]; then
  tmp="$SHARE_DIR/.$current_id.json.tmp"
  if "$REAL_OPENCODE" export "$current_id" > "$tmp" 2>>"$LOG"; then
    mv "$tmp" "$SHARE_DIR/$current_id.json"
    mtime=$(stat -c %Y "$SHARE_DIR/$current_id.json")
    synced["$current_id.json"]="$mtime"
    log "exported $current_id"
  else
    rm -f "$tmp"
    log "FAILED to export $current_id"
  fi
else
  log "no sessions found in db, nothing to export"
fi

: > "$IMPORTED_STATE"
for k in "${!synced[@]}"; do
  echo "$k:${synced[$k]}" >> "$IMPORTED_STATE"
done

exit $exit_code
