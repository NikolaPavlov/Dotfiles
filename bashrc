export VISUAL=nvim
export EDITOR=nvim


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
alias t='xfce4-terminal'
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
alias free='free -m'                                         # show sizes in MB
alias myip='curl http://ipecho.net/plain; echo'

alias p1='ping 192.168.0.1'
alias p8='ping 8.8.8.8'
alias ping1='ping 192.168.0.1'
alias ping8='ping 8.8.8.8'
alias netstat='netstat -antp'
    # netstat options
    # -a  display all sockets (default: connected)
    # -n  don't resolve names
    # -p  display PID/program name for sockets

# Pacman
alias u='sudo pacman -Syu'
alias install='sudo pacman -S '
alias remove='sudo pacman -Rs '
# Python
alias p='python3.5'
# Git
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gpush='git push'
alias gpull='git pull'
alias glog='git log'
# Encryption
alias secret='sudo mount -t ecryptfs EncFolder/ EncFolder/'
#TODO: Update secret alias with full parameters
alias mp3='youtube-dl --extract-audio --audio-format mp3'
# Django
alias pmr='python manage.py runserver'
alias playlist='youtube-dl -cit' # download all from youtube playlist


# ex - archive extractor
# usage: ex <file>
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
      *.tgz)       tar xzf $1   ;;
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
. /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#add to $PATH
export PATH=$PATH:~/.gem/ruby/2.3.0/bin
