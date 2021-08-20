export VISUAL=nvim
export EDITOR=nvim

alias w='whoami '
alias v='nvim '
alias e='exit '
alias c='clear '
alias cl='clear '
alias a='alsamixer '
alias rm='rm -Irv '
alias off='poweroff '
alias cp='cp -i '
alias mv='mv -i '
alias ps='ps auxf '
alias mkdir='mkdir -pv '
alias wget='wget -c '
alias du='ncdu '
alias df='pydf'
alias u='sudo apt update && sudo apt upgrade'


# exa aliases
alias l='exa -l'
alias ll='exa -l'
alias ls='exa -l'
alias la='exa -l -a'

alias grep='grep --color=tty -d skip '
alias myip='curl ifconfig.me '

alias p1='ping 192.168.2.1 '
alias p8='ping 8.8.8.8 -c 100 '
alias pg='ping google.com '

# Pacman
alias install='sudo pacman -S '
alias remove='sudo pacman -Rns '
alias search='sudo  pacman -Ss '
# Python
# Perl
alias p='perl '
alias pl='perl '
alias pd='perldoc '
# Git
alias g='git'
alias pull='cd ~/Documents/Repos/Dotfiles/ && git pull && cd ~/Documents/Repos/Wiki && git pull '
alias push='git add . && git commit -m "up" && git push '
DELIM='####################'
alias syncall='echo "$DELIM" && task sync && echo "$DELIM" && cd ~/Documents/Repos/Dotfiles && git add . && git commit -m "up" && git push && echo "$DELIM"  && cd ~/Documents/Repos/Wiki && git add . && git commit -m "up" && git push'

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
# Programs
alias vifm='vifmrun '
alias reflect='sudo reflector --latest 200 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist '
alias radio='com.github.louis77.tuner'
alias z='zathura '
# Other
alias s='startx'
alias temp='watch -n 2 sensors'
# alias top='bashtop'
alias flac='smloadr'
alias runqmk='cd ~/Documents/Repos/qmk_firmware/ && qmk compile ~/Temp/jj50.json && sudo qmk flash'
alias rec='recordmydesktop --device hw:1'
alias weather='curl wttr.in';
alias lsblk='lsblk -f'

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

# powerline
# source /usr/share/powerline/bindings/bash/powerline.sh

# autojump
. /usr/share/autojump/autojump.bash

# vi mode in terminal
set -o vi

# change dirs withowth cd
shopt -s autocd

# Complete after sudo
complete -cf sudo

# add ruby to $PATH
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
fi

# add cargo (rust) to $PATH
PATH="$PATH:$HOME/.cargo/bin"

# nvim as a manpage viewr
export MANPAGER="nvim +set\ filetype=man -"

# virtualenvwrapper
#export WORKON_HOME=~/.virtualenvs
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
#export VIRTUALENVWRAPPER_VIRTUALENV=/home/$USER/.local/bin/virtualenv
# source ~/.local/bin/virtualenvwrapper.sh
source /usr/bin/virtualenvwrapper.sh

# autocomplete for gopass
source <(gopass completion bash)

# autocomplete git
source /usr/share/bash-completion/completions/git

# Temp
export PATH
# export PERL5LIB=./lib:$PERL5LIB
export PERL5LIB=~/perl5/lib/perl5
# export LC_ALL="en_US.UTF-8"
HISTCONTROL=ignoreboth:erasedups

# PS1="$\e[0;35m >\e[m "

alias sw='ssh work'
alias score='ssh core'
alias sweb='ssh web'
alias cdcore=$CDCORE
alias cdremedy=$CDREMEDY

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
# source /usr/share/fzf/key-bindings.bash
# source /usr/share/fzf/completion.bash

# TODO:
# export FZF_DEFAULT_COMMAND='ag -l --nogroup  --nocolor --hidden -g ""'
# Ctrl + t --> search in current dir
# Ctrl + r --> search history
# Alt + c --> change to dir
# cd **
# ssh **
# fzf -f --> exact match




# When selecting files with fzf, we show file content with syntax highlighting,
# or without highlighting if it's not a source file. If the file is a directory,
# we use tree to show the directory's contents.
# We only load the first 200 lines of the file which enables fast previews
# of large text files.
# Requires highlight and tree: pacman -S highlight tree

# export FZF_DEFAULT_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null ||
    # cat {} || tree -C {}) 2> /dev/null | head -200'"


PATH="/home/gogo/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/gogo/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/gogo/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/gogo/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/gogo/perl5"; export PERL_MM_OPT;





# temp
bitrate () {
    echo `basename "$1"`: `file "$1" | sed 's/.*, \(.*\)kbps.*/\1/' | tr -d " " ` kbps
}

# curl cheat.sh/ls
