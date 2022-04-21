export VISUAL=nvim export EDITOR=nvim

alias v='nvim '
alias p='python'
alias e='exit '
alias cl='clear '
alias c='clear '
alias a='alsamixer '
alias s='startx'
alias rm='rm -Irv '
alias off='poweroff '
alias cp='cp -i '
alias mv='mv -i '
alias ps='ps auxf '
alias mkdir='mkdir -pv '
alias lsblk='lsblk -f'
alias wget='wget -c '
alias grep='grep --color=tty -d skip '
alias du='ncdu '
alias df='pydf'
alias u='sudo apt update && sudo apt upgrade'
alias temp='watch -n 2 sensors'
alias vifm='vifmrun '
alias vf='vifmrun '
alias z='zathura '
alias flac='smloadr'
alias rec='recordmydesktop --device hw:1'
alias vpn='~/Documents/Repos/Dotfiles/Scripts/vpn.sh'
alias runqmk='cd ~/Documents/Repos/qmk_firmware/ && qmk compile ~/Temp/jj50.json && sudo qmk flash'
alias reflect='sudo reflector --latest 200 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist '
alias radio='streamtuner2'
alias sw='ssh work'
alias score='ssh core'
alias sweb='ssh web'

# exa aliases
alias l='exa -l'
alias ll='exa -l'
alias ls='exa -l'
alias la='exa -l -a'

# Pings
alias myip='curl ifconfig.me '
alias p1='ping 192.168.2.1 '
alias p8='ping 8.8.8.8 -c 100 '
alias pg='ping google.com '

# Pacman
alias install='sudo pacman -S '
alias remove='sudo pacman -Rns '
alias search='sudo  pacman -Ss '

# Git
alias g='git'
alias pull='cd ~/Documents/Repos/Dotfiles/ && git pull && cd ~/Documents/Repos/WikiNeorg && git pull '
alias push='git add . && git commit -m "up" && git push '
DELIM='####################'
alias syncall='echo "$DELIM" && task sync && echo "$DELIM" && cd ~/Documents/Repos/Dotfiles && git add . && git commit -m "up" && git push && echo "$DELIM"  && cd ~/Documents/Repos/WikiNeorg && git add . && git commit -m "up" && git push'

# Encryption
alias secret='sudo mount -t ecryptfs EncFolder/ EncFolder/ '
#TODO: Update secret alias with full parameters

# YouTube
alias mp3='youtube-dl -i -f bestaudio --extract-audio --audio-format mp3 --no-check-certificate '
alias playlist='youtube-dl -ci -o "%(title)s-%(id)s.%(ext)s" --yes-playlist --audio-format mp3 --audio-quality 0 '

# Django
alias pm='python manage.py '
alias pmr='python manage.py runserver '
alias pms='python manage.py shell '
alias pmmm='python manage.py makemigrations '
alias pmm='python manage.py migrate '
alias pmt='python manage.py test '

# TaskWarrior
alias t='task '
alias tl='task list '
alias ta='task add $1 '
alias tn='task next '

# FZF
# https://www.youtube.com/watch?v=QeJkAs_PEQQ&list=WL&index=118&t=6s
# https://www.youtube.com/watch?v=qgG5Jhi_Els&list=WL&index=118
# https://github.com/junegunn/fzf/wiki/examples

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

# curl cheat.sh/ls
function cs() { curl -m 7 "http://cheat.sh/$1"; }

# autojump
. /usr/share/autojump/autojump.bash

# vi mode in terminal
set -o vi

# change dirs withowth cd
shopt -s autocd

# Complete after sudo
complete -cf sudo

# add ruby to $PATH
# if which ruby >/dev/null && which gem >/dev/null; then
#     PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
# fi

# add cargo (rust) to $PATH
PATH="$PATH:$HOME/.cargo/bin"

# nvim as a manpage viewr
export MANPAGER="nvim +set\ filetype=man -"

# virtualenvwrapper
source /usr/bin/virtualenvwrapper.sh
export WORKON_HOME=~/Envs
mkdir -p $WORKON_HOME

# autocomplete for gopass
source <(gopass completion bash)

# autocomplete for git
source /usr/share/bash-completion/completions/git

# bitrate of a file
bitrate () {
    echo `basename "$1"`: `file "$1" | sed 's/.*, \(.*\)kbps.*/\1/' | tr -d " " ` kbps
}

# Temp
export PATH
export PERL5LIB=~/perl5/lib/perl5
HISTCONTROL=ignoreboth:erasedups
HISTTIMEFORMAT="%Y-%m-%d %T "

PATH="/home/gogo/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/gogo/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/gogo/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/gogo/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/gogo/perl5"; export PERL_MM_OPT;
