export VISUAL=vim
export EDITOR=vim


alias ..='cd ..'
alias e='exit'
alias c='clear'
alias cl='clear'
alias r='ranger'
alias a='alsamixer'
alias v='vim'
alias s='startx'
alias rm='rm -Irv'
alias off='poweroff'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias l='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias df='df -h'                                         # human-readable sizes
alias free='free -m'                                         # show sizes in MB
alias ports='netstat -tulanp'
alias myip='curl http://ipecho.net/plain; echo'
#alias vboxshare='sudo mount -t vboxsf Share /mnt'
alias ping1='ping 192.168.1.1'
alias ping8='ping 8.8.8.8'

# Pacman
alias update='sudo pacman -Syu'
# Python
alias p='python3.5'
# Git
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'
alias gsb='git show-branch'
alias gco='git checkout'
alias gg='git grep'
alias gk='gitk --all'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gcp='git cherry-pick'
alias grm='git rm'
alias gpush='git push'
alias gpull='git pull'

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
