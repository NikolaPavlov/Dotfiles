#!/bin/bash

# $1 directory to backup
# $2 backup destination directory
# notes: 
# run it with sudo
# rsync [stick your options here] / user@backup-server:/path/to/backups
# echo 'rsync [dir_for_backup] [dir to backup]'

rsync -aAXv --delete --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/home/*/.gvfs"} $1 $2
