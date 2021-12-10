#!/bin/bash

# $1 directory to backup (if=)
# $2 destination directory of the backup (of=)

exclude_file=./directories_to_exclue_from_backup.txt

sudo rsync -aAXv -e "ssh -p 39901" --progress --delete --exclude-from=$exclude_file $1 $2

# -a archive mode (it keeps ownership, timestamp, permissions)
# -A preserves ACLs
# -X preserve extended attributes
# -v verbose
# --delete: updates remote if files have been deleted from local
# --progress: shows progress
