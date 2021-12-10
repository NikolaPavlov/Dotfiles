#!/bin/bash

# crontab -e as root to edit cronie
# crontab -l as root to list cronie cron jobs

exclude_file=/home/gogo/Scripts/directories_to_exclue_from_backup.txt
rsync -aAXv --progress --delete --exclude-from=$exclude_file / /media/4Tb/Backups/LinuxBackup/CronDailyBackupEarth/
