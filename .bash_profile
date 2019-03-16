[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:$HOME/Scripts

export EDITOR="nvim"
export TERMINAL="sakura"
export BROWSER="firefox"
export READER="zathura"
export IMAGEVIEWER='sxiv'

# nnn
export NNN_OPENER=xdg-open
export NNN_FALLBACK_OPENER=nvim
export NNN_USE_EDITOR=1
export NNN_OPS_PROG=1
export NNN_SCRIPT="$HOME/Scripts/nnn"

# nnn bookmarks
export NNN_BMS="d:~/Documents;w:/media/400Gb/Wallpapers/;r:~/Documents/Repos;p:~/Projects;"
