#!/bin/bash
# Loading the new arch install

echo "****************************************************************"
echo "Installing Updating Pacman for first time"
echo "****************************************************************"

sudo pacman --noconfirm -Syu

# Core
pacman --noconfirm -Syu
sudo pacman --noconfirm -S xorg xorg-server xorg-utils xorg-server-utils xorg-xinit
sudo pacman --noconfirm -S gcc patch curl zlib readline libxml2 libxslt
sudo pacman --noconfirm -S bison autoconf automake diffutils make libtool
sudo pacman --noconfirm -S tar gzip unzip unrar p7zip p7zip-plugins
sudo pacman --noconfirm -S wget curl whois

# Disk
sudo pacman --noconfirm -S gvfs ntfs-3g gvfs-afc

# Plugins for mp3 playback and other media
sudo pacman --noconfirm -S alsa-oss alsa-lib alsa-utils
sudo pacman --noconfirm -S flashplugin

# i3
sudo pacman -S i3-wm dmenu i3status

# Progs
sudo pacman --noconfirm -S git
sudo pacman --noconfirm -S firefox
sudo pacman --noconfirm -S xfce4-terminal
sudo pacman --noconfirm -S thunar thunar-volman thunar-archive-plugin file-roller
sudo pacman --noconfirm -S redshift
sudo pacman --noconfirm -S lxappearance
sudo pacman --noconfirm -S thunderbird
sudo pacman --noconfirm -S smplayer
sudo pacman --noconfirm -S gparted
sudo pacman --noconfirm -S zathura
sudo pacman --noconfirm -S nmap
sudo pacman --noconfirm -S transmission-qt
sudo pacman --noconfirm -S keepass
sudo pacman --noconfirm -S keepassx
sudo pacman --noconfirm -S youtube-dl
sudo pacman --noconfirm -S autojump
sudo pacman --noconfirm -S baobab
sudo pacman --noconfirm -S fdupes fslint
sudo pacman --noconfirm -S gpicview
sudo pacman --noconfirm -S tree
sudo pacman --noconfirm -S rsync
sudo pacman --noconfirm -S xclip
sudo pacman --noconfirm -S openssh
sudo pacman --noconfirm -S macchanger
sudo pacman --noconfirm -S ipython
sudo pacman --noconfirm -S irssi
# VirtualBox
sudo pacman --noconfirm -S virtualbox virtualbox-guest-utils
sudo tee /etc/modules-load.d/virtualbox-vboxdrv.conf <<< "vboxdrv"
