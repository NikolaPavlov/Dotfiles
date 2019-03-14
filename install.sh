#!/urs/bin/bash


export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXTRA_DIR="$HOME/.extra"


mkdir -p $HOME/.config/polybar
mkdir -p $HOME/.config/nvim/undo_dir
mkdir -p $HOME/.config/ranger

ln -sfv "$DOTFILES_DIR/.bashrc" $HOME
ln -sfv "$DOTFILES_DIR/.bash_profile" $HOME
ln -sfv "$DOTFILES_DIR/nvim/init.vim" ~/.config/nvim/init.vim
ln -sfv "$DOTFILES_DIR/i3/config" ~/.config/i3/
ln -sfv "$DOTFILES_DIR/Polybar/config" ~/.config/polybar/config
ln -sfv "$DOTFILES_DIR/Zathura" ~/.config/zathura
ln -sfv "$DOTFILES_DIR/Git/.gitconfig" $HOME
ln -sfv "$DOTFILES_DIR/Irssi" ~/.irssi
ln -sfv "$DOTFILES_DIR/Scripts" $HOME
ln -sfv "$DOTFILES_DIR/Ranger/rc.conf" ~/.config/ranger/
ln -sfv "$DOTFILES_DIR/Ranger/commands.py" ~/.config/ranger/
