#!/bin/bash

# $1 directory to backup (if=)
# $2 destination directory of the backup (of=)

exclude_file=/home/gogo/Documents/Repos/Dotfiles_b/Scripts/directories_to_exclue_from_backup.txt

sudo rsync -aAXv --delete --exclude-from=$exclude_file $1 $2
