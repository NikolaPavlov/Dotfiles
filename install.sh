#!/urs/bin/bash


export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXTRA_DIR="$HOME/.extra"


mkdir -p $HOME/.config/polybar
mkdir -p $HOME/.config/nvim/undo_dir

ln -sfv "$DOTFILES_DIR/bashrc" ~/.bashrc
ln -sfv "$DOTFILES_DIR/nvim/init.vim" ~/.config/nvim/init.vim
ln -sfv "$DOTFILES_DIR/i3" ~/.config/
ln -sfv "$DOTFILES_DIR/Polybar/config" ~/.config/polybar/config
ln -sfv "$DOTFILES_DIR/Zathura" ~/.config/zathura
ln -sfv "$DOTFILES_DIR/Git/.gitconfig" ~/
ln -sfv "$DOTFILES_DIR/Irssi" ~/.irssi
ln -sfv "$DOTFILES_DIR/Scripts/phonetic_keys.sh" ~/.phonetic_keys
