# setxkbmap -option caps:escape

export TERMINAL=alacritty
export BROWSER=google-chrome-stable
export XDG_CURRENT_DESKTOP=qtile
export EDITOR=nvim
export VISUAL=nvim
export FILE_MANAGER=thunar
export READER=zathura

# Import session environment to systemd and DBus
dbus-update-activation-environment --systemd --all

# Start notification daemon
dunst &

qtile start
# exec startxfce4
