export VISUAL=nvim
export EDITOR=nvim

alias w='whois'
alias v='nvim'
alias ..='cd ..'
alias e='exit'
alias c='clear'
alias cl='clear'
alias r='ranger'
alias a='alsamixer'
alias s='startx'
alias rm='rm -Irv'
alias off='poweroff'
alias cp='cp -i'
alias mv='mv -i'
alias tt='xfce4-terminal'
alias ps='ps auxf'
alias mkdir='mkdir -pv'
alias wget='wget -c'
alias du='ncdu'
alias df='pydf'
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias l='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias free='free -m'
alias myip='curl http://ipecho.net/plain; echo'
alias hardware='sudo lshw -short'

alias p1='ping 192.168.1.1'
alias p8='ping 8.8.8.8 -c 100'
alias netstat='netstat -antp'

# Pacman
alias install='sudo pacman -S '
alias remove='sudo pacman -Rs '
alias search='sudo  pacman -Ss '
# Python
alias p='python3.7'
alias i='ipython'
# Git
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gpush='git push'
alias gpull='git pull'
alias glog='git log'
alias gitreset='git reset --hard HEAD'
# Docker
alias d='docker'
alias di='docker images'
alias drmc='docker rm -f $(docker ps -a -q)' # remove all images
alias drmi='docker rmi -f $(docker images -q)' # remove image
alias dc='docker-compose'
# Encryption
alias secret='sudo mount -t ecryptfs EncFolder/ EncFolder/'
#TODO: Update secret alias with full parameters
alias playlist='youtube-dl -ci -o "%(title)s-%(id)s.%(ext)s" --yes-playlist --audio-format mp3 --audio-quality 0 ' # download all from youtube playlist
alias mp3='youtube-dl --extract-audio --audio-format mp3'
alias mp4='youtube-dl -f 22 '
# Django
alias cookie='cookiecutter https://github.com/pydanny/cookiecutter-django'
alias pm='python manage.py'
alias pmr='python manage.py runserver'
alias pmmm='python manage.py makemigrations'
alias pmm='python manage.py migrate'
alias t='python manage.py test'
# MPSYouTube
alias yt='mpsyt'

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

# Colorful user prompt in bash
PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '

# autojump
. /usr/share/autojump/autojump.bash

# vi mode in terminal
set -o vi

# change dirs withowth cd instead with ..
shopt -s autocd

# disable <ctrl-s> in xfce4-terminal (legacy software control flow)
stty -ixon

#add powerline to terminal
#http://www.tecmint.com/powerline-adds-powerful-statuslines-and-prompts-to-vim-and-bash/
export TERM='screen-256color'
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh

# Complete after sudo
complete -cf sudo

#virtualenvwrapper dir
export WORKON_HOME="$HOME/.virtualenvs"
export PROJECT_HOME="$HOME/projects"
source /usr/bin/virtualenvwrapper.sh

# pyenv-virtualenvwrapper loaded when open terminal
eval "$(pyenv init -)"
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export WORKON_HOME=$HOME/.virtualenvs
pyenv virtualenvwrapper_lazy

# Links
# http://bropages.org/ ---> command line examples

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
