[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:$HOME/.scripts
export EDITOR="nvim"
export TERMINAL="sakura"
export BROWSER="firefox"
export READER="zathura"

# nnn env vars
export NNN_OPENER=xdg-open
NNN_FALLBACK_OPENER=nvim
export NNN_USE_EDITOR=1
export NNN_OPS_PROG=1
export NNN_SCRIPT="$HOME/Scripts"

# nnn bookmarks
export NNN_BMS="d:~/Documents/Repos/Dotfiles/;w:/media/400Gb/Snimki_Primary/Wallpapers/;r:~/Documents/Repos"
