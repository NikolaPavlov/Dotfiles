#!/usr/bin/env sh


[ -z "$1" ] && exit
feh --bg-scale "$1"
convert "$1" ~/.config/wall.png
notify-send -i ~/.config/wall.png "Wallpaper updated"
