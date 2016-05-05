#!/bin/bash

# $1 directory to backup
# $2 backup destination directory
# note: run it with sudo

# echo 'rsync [dir_for_backup] [dir to backup]'

rsync -aAXv --delete --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/home/*/.gvfs"} $1 $2
