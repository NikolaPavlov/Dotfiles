export VISUAL=nvim
export EDITOR=nvim

alias w='whoami '
alias v='nvim '
alias e='exit '
alias c='clear '
alias cl='clear '
alias a='alsamixer '
alias s='startx '
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
alias free='free -m '
alias myip='curl ifconfig.me '

alias p1='ping 192.168.1.1 '
alias p8='ping 8.8.8.8 -c 100 '
alias pg='ping google.com '

alias tsocks='tsocks '

# Pacman
alias install='sudo pacman -S '
alias remove='sudo pacman -Rns '
alias search='sudo  pacman -Ss '
# Python
# alias p='python3.8 '
# alias i='ipython '
# alias pt='pytest '
# Perl
alias p='perl '
alias pl='perl '
alias pd='perldoc '
# PipEnv
alias pe='pipenv '
alias pes='pipenv shell '
# Git
alias g='git'
alias pull='cd ~/Documents/Repos/Dotfiles/ && git pull && cd ~/Documents/Repos/Wiki && git pull '
# git reset --hard <commitId> && git clean -f
alias push='git add . && git commit -m "up" && git push '

# Docker
alias d='docker '
alias di='docker images '
alias drmi='docker rmi -f $(docker images -q) ' # remove image
alias drmc='docker rm -f $(docker ps -a -q) ' # remove all images
alias dc='docker-compose '
# Vagrant
alias va='vagrant '
alias vs='vagrant status '
alias vup='vagrant up '
alias vgs='vagrant global status '
alias vssh='vagrant ssh '
# Encryption
alias secret='sudo mount -t ecryptfs EncFolder/ EncFolder/ '
#TODO: Update secret alias with full parameters
# YouTube + Spotify
alias playlist='youtube-dl -ci -o "%(title)s-%(id)s.%(ext)s" --yes-playlist --audio-format mp3 --audio-quality 0 '
alias mp3='youtube-dl -i -f bestaudio --extract-audio --audio-format mp3 --no-check-certificate '
alias dl='~/.local/bin/spotdl --song '
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
alias tdel='task $1 delete '
alias tdone='task $1 done '
alias te='task $1 edit '
alias tn='task next '
alias tannotete='task $1 annotate $2 '
# Programs
alias vifm='vifmrun '
alias f='firefox '
alias clock='tty-clock -c '
alias reflect='sudo reflector --latest 200 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist '
alias radio='curseradio '
alias z='zathura '
alias todo='vit '
alias cal='calcurse '

alias runqmk='cd ~/Documents/Repos/qmk_firmware/ && qmk compile ~/Temp/jj50.json && sudo qmk flash'
alias rec='recordmydesktop --device hw:1'

alias weather='curl wttr.in';

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
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/home/$USER/.local/bin/virtualenv
source ~/.local/bin/virtualenvwrapper.sh
# source /usr/bin/virtualenvwrapper.sh

# autocomplete for gopass
source <(gopass completion bash)

# Temp
export PATH
# export PERL5LIB=./lib:$PERL5LIB
export PERL5LIB=~/perl5/lib/perl5
# export LC_ALL="en_US.UTF-8"
HISTCONTROL=ignoreboth:erasedups
PS1="$\e[0;35m >\e[m "
alias runregix='p -MTime::HiRes -I./ regix_info1.pl 201593304 '

if [ -f $HOME/.sensitive ]; then
    . $HOME/.sensitive
fi
alias sshcore=$SSHCORE
alias sshweb=$SSHWEB
alias sshwork='ssh npavlov@10.0.7.111'
alias cdcore=$CDCORE
alias cdremedy=$CDREMEDY


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
# TODO:
export FZF_DEFAULT_COMMAND='ag -l --nogroup  --nocolor --hidden -g ""'
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
