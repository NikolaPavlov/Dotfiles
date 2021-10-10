#!/urs/bin/bash


export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXTRA_DIR="$HOME/.extra"


mkdir -p $HOME/.config/alacritty
mkdir -p $HOME/.config/nvim/undo_dir
mkdir -p $HOME/.config/i3
mkdir -p $HOME/.config/i3status
mkdir -p $HOME/.config/zathura
mkdir -p $HOME/.irssi
mkdir -p $HOME/.config/qtile
mkdir -p $HOME/.gnupg

ln -sfv "$DOTFILES_DIR/alacritty/alacritty.yml" ~/.config/alacritty/alacritty.yml
ln -sfv "$DOTFILES_DIR/.bashrc" $HOME
ln -sfv "$DOTFILES_DIR/.bash_profile" $HOME
ln -sfv "$DOTFILES_DIR/nvim/init.vim" ~/.config/nvim/init.vim
ln -sfv "$DOTFILES_DIR/nvim/init.lua" ~/.config/nvim/init.lua
ln -sfv "$DOTFILES_DIR/nvim/lua" ~/.config/nvim/lua
ln -sfv "$DOTFILES_DIR/Zathura/zathurarc" ~/.config/zathura/zathurarc
ln -sfv "$DOTFILES_DIR/Git/.gitconfig" $HOME
ln -sfv "$DOTFILES_DIR/Irssi/config" ~/.irssi/config
ln -sfv "$DOTFILES_DIR/Scripts" $HOME
ln -sfv "$DOTFILES_DIR/vifm" ~/.config/
ln -sfv "$DOTFILES_DIR/qtile/config.py" ~/.config/qtile
ln -sfv "$DOTFILES_DIR/qtile/autostart.sh" ~/.config/qtile
ln -sfv "$DOTFILES_DIR/gnupg/gpg-agent.conf" ~/.gnupg
ln -sfv "$DOTFILES_DIR/TaskWarrior/taskrc" ~/.taskrc
