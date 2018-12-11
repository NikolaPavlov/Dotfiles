#!/bin/bash

# $1 directory to backup
# $2 backup destination directory
# notes:
# run it with sudo
# rsync  / user@backup-server:/path/to/backups
# echo 'rsync [dir_for_backup] [dir to backup]'

rsync -aAXv --delete --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/home/*/.gvfs","/swapfile"} $1 $2
