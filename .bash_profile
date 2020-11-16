[[ -f ~/.bashrc ]] && . ~/.bashrc

# add Scripts to PATH
export PATH=$PATH:$HOME/Scripts

export EDITOR="nvim"
export TERMINAL="sakura"
export BROWSER="firefox"
export READER="zathura"
export IMAGEVIEWER='sxiv'


# qt settings (qt5ct)
export QT_QPA_PLATFORMTHEME="qt5ct"
if [ -e /home/gogo/.nix-profile/etc/profile.d/nix.sh ]; then . /home/gogo/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
