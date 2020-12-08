#!/bin/bash

# $1 directory to backup (if=)
# $2 destination directory of the backup (of=)

exclude_file=./directories_to_exclue_from_backup.txt
sudo rsync -aAXv --progress --delete --exclude-from=$exclude_file / /media/4Tb/Backups/LinuxBackup/DailyBackupEarth/
