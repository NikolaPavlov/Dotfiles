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
#   - Before launching opencode: import any new/changed session export found
#     in ~/share/opencode-session/*.json.
#   - After opencode exits: export any session whose time_updated advanced
#     since the last sync, to ~/share/opencode-session/<id>.json.
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
MARKER_FILE="$STATE_DIR/last-sync-ms"
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
    if "$REAL_OPENCODE" import "$f" >>"$LOG" 2>&1; then
      synced["$base"]="$mtime"
      log "imported $base"
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

# --- run the real TUI, passing through all args ---
boot_ms=$(( $(date +%s%N) / 1000000 ))
"$REAL_OPENCODE" "$@"
exit_code=$?

# --- export phase: any session touched since the last sync ---
last_marker=$(cat "$MARKER_FILE" 2>/dev/null || echo "$boot_ms")
changed_ids=$(sqlite3 "$DB" "SELECT id FROM session WHERE time_updated > $last_marker;" 2>>"$LOG")

while IFS= read -r id; do
  [ -z "$id" ] && continue
  tmp="$SHARE_DIR/.$id.json.tmp"
  if "$REAL_OPENCODE" export "$id" > "$tmp" 2>>"$LOG"; then
    mv "$tmp" "$SHARE_DIR/$id.json"
    mtime=$(stat -c %Y "$SHARE_DIR/$id.json")
    synced["$id.json"]="$mtime"
    log "exported $id"
  else
    rm -f "$tmp"
    log "FAILED to export $id"
  fi
done <<< "$changed_ids"

: > "$IMPORTED_STATE"
for k in "${!synced[@]}"; do
  echo "$k:${synced[$k]}" >> "$IMPORTED_STATE"
done

echo "$(( $(date +%s%N) / 1000000 ))" > "$MARKER_FILE"

exit $exit_code
