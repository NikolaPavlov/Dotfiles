export VISUAL=nvim
export EDITOR=nvim

alias w='whois'
alias v='nvim'
alias e='exit'
alias c='clear'
alias cl='clear'
alias a='alsamixer'
alias s='startx'
alias rm='rm -Irv'
alias off='poweroff'
alias cp='cp -i'
alias mv='mv -i'
alias ps='ps auxf'
alias mkdir='mkdir -pv'
alias wget='wget -c'
alias du='ncdu'
alias df='pydf'

# ls aliases
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
# alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
# alias l='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
# alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias l='lsd -l'
alias ll='lsd -l'
alias la='lsd -la'

alias grep='grep --color=tty -d skip'
alias free='free -m'
alias myip='curl http://ipecho.net/plain; echo'

alias p1='ping 192.168.1.1'
alias p8='ping 8.8.8.8 -c 100'

# Pacman
alias install='sudo pacman -S '
alias remove='sudo pacman -Rns '
alias search='sudo  pacman -Ss '
alias y='yay'
# Python
alias p='python3.7'
alias i='ipython'
alias t='python -m unittest discover'
alias pt='pytest'
# PipEnv
alias pe='pipenv'
alias pes='pipenv shell'
# Git
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gpush='git push'
alias gpull='git pull'
alias glog='git log'
alias pull='cd ~/Documents/Repos/Dotfiles/ && git pull && cd ~/Documents/Repos/Wiki && git pull'
# Docker
alias d='docker'
alias di='docker images'
alias drmc='docker rm -f $(docker ps -a -q)' # remove all images
alias drmi='docker rmi -f $(docker images -q)' # remove image
alias dc='docker-compose'
# Encryption
alias secret='sudo mount -t ecryptfs EncFolder/ EncFolder/'
#TODO: Update secret alias with full parameters
# YouTube + Spotify
alias playlist='youtube-dl -ci -o "%(title)s-%(id)s.%(ext)s" --yes-playlist --audio-format mp3 --audio-quality 0'
alias mp3='youtube-dl -i -f bestaudio --extract-audio --audio-format mp3 --no-check-certificate'
alias dl='~/.local/bin/spotdl --song'
# Django
alias pm='python manage.py'
alias pmr='python manage.py runserver'
alias pmmm='python manage.py makemigrations'
alias pmm='python manage.py migrate'
alias tt='python manage.py test'

# Programs
alias vifm='vifmrun'
alias va='vagrant'
alias f='firefox'
alias n='nnn -l'
alias clock='tty-clock -c'
alias reflect='reflector --latest 200 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias vis='vis -s'
alias radio='curseradio'



# ex - archive extractor
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xvf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# colorfull man pages
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# powerline-go https://github.com/justjanne/powerline-go
function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go  \
        -shell bash \
        -newline \
        -mode patched \
        -modules venv,user,host,cwd,git \
        -modules-right docker,dotenv \
        -condensed \
        -error $?)"
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# autojump
. /usr/share/autojump/autojump.bash

# vi mode in terminal
set -o vi

# change dirs withowth cd instead with ..
shopt -s autocd

# Complete after sudo
complete -cf sudo

# add ruby to $PATH
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
fi

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

# nvim as a manpage viewr
export MANPAGER="nvim +set\ filetype=man -"

# virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh
