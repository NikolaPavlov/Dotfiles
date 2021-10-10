let mapleader=','
"{{{ Plugins
if &compatible
    set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
    call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
    call dein#add('yuki-ycino/fzf-preview.vim')
endif

" dein#recache_runtimepath() " --> for cleaning plugins

if dein#check_install()
    call dein#install()
endif

filetype plugin indent on
syntax enable

"}}}
