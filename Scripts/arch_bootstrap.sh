#!/bin/bash

echo -e "-------------------------------------"
echo -e "Install git prior running the script."
echo -e "-------------------------------------"


sudo pacman -S openssh
# ssh-keygen -b 16384
ssh-keygen -b 4096

echo -e "--------------------------------------------------"
echo -e "Add this ssh key to your GitHub before continuing."
echo -e "--------------------------------------------------"
cat $HOME/.ssh/id_rsa.pub

echo -e "---------------------------------------------------"
echo -e "Press any key when you ready."
echo -e "---------------------------------------------------"
read y

mkdir -p $HOME/Documents/Repos
cd $HOME/Documents/Repos
git clone git@github.com:NikolaPavlov/Dotfiles.git
cd $HOME/Documents/Repos/Dotfiles
sh ./install.sh


echo -e "---------------------------------------------------"
echo -e " Set up yay"
echo -e "---------------------------------------------------"
sudo pacman -S base base-devel
cd ~/.config
git clone https://aur.archlinux.org/yay.git
makepkg -si
cd ~


echo -e "---------------------------------------------------"
echo -e " Install applications"
echo -e "---------------------------------------------------"
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
