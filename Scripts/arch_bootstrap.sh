#!/bin/bash
# https://www.youtube.com/watch?v=vckbal6BnD4

echo "-------------------------------------"
echo "Install git prior running the script."
echo "-------------------------------------"


sudo pacman -S openssh
ssh-keygen -t ecdsa -b 521

echo "--------------------------------------------------"
echo "Add this ssh key to your GitHub before continuing."
echo "--------------------------------------------------"
cat $HOME/.ssh/id_rsa.pub

echo"---------------------------------------------------"
echo"Press any key when you ready."
echo"---------------------------------------------------"
read y

mkdir -p $HOME/Documents/Repos/Dotfiles
cd $HOME/Documents/Repos/Dotfiles
# TODO: git clone Dotfiles
sh ./install.sh


echo"---------------------------------------------------"
echo" Set up yay"
echo"---------------------------------------------------"
sudo pacman -S base-devel
cd ~/.config
git clone https://aur.archlinux.org/yay.git
makepkg -si
cd ~


echo"---------------------------------------------------"
echo" Install applications"
echo"---------------------------------------------------"
pacman = (
xorg
qtile
alacritty
neovim
)
yay = (
spotify
)

sudo pacman -S ${pacman[@]}
yay -S ${yay[@]}
