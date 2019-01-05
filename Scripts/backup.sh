#!/bin/bash

# $1 directory to backup (if=)
# $2 destination directory of the backup (of=)

sudo rsync -aAXv --delete --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/home/*/.gvfs","/swapfile","/home/gogo/VirtualBoxVMs/*"} $1 $2
