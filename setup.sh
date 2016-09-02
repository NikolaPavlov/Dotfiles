#!/bin/python3.5
import os
import shutil


CWD = os.getcwd()
HOME_DIR = os.path.expanduser('~')

BASHRC_FILE = CWD + '/bashrc'
BASHRC_DESTINATION = HOME_DIR + '/.bashrc'

NEOVIM_NVIMRC_FILE = CWD + '/neovim/init.vim'
NEOVIM_NVIMRC_DESTINATION = HOME_DIR + '/.config/nvim/init.vim'
NEOVIM_NVIMRC_DESTINATION_FOLDER = HOME_DIR + '/.config/nvim'

I3_CONFIG_FILE = CWD + '/config'
I3_DESTINATION = HOME_DIR + '/.i3/config'
I3_DESTINATION_FOLDER = HOME_DIR + '/.i3'

ZATHURA_FILE = CWD + '/zathurarc'
ZATHURA_DESTINATION = HOME_DIR + '/.config/zathura/zathurarc'
ZATHURA_DESTINATION_FOLDER = HOME_DIR + '/.config/zathura'

PHONETIC = CWD + '/Scripts/phonetic_keys.sh'
PHONETIC_DESTINATION = HOME_DIR + '/.phonetic_keys.sh'

IRSSI_FOLDER = CWD + '/irssi/'
IRSSI_DESTINATION_FOLDER = HOME_DIR + '/.irssi'
# print(IRSSI_FOLDER)
# print(IRSSI_DESTINATION_FOLDER)


def create_dirs_if_doesnt_exists():
    if not os.path.exists(I3_DESTINATION_FOLDER):
        os.mkdir(I3_DESTINATION_FOLDER)
        print('created i3 destination folder')
    if not os.path.exists(ZATHURA_DESTINATION_FOLDER):
        os.mkdir(ZATHURA_DESTINATION_FOLDER)
        print('created zathura destination folder')
    if not os.path.exists(NEOVIM_NVIMRC_DESTINATION_FOLDER):
        os.mkdir(NEOVIM_NVIMRC_DESTINATION_FOLDER)
        print('created neovim destination folder')
    if not os.path.exists(IRSSI_DESTINATION_FOLDER):
        os.mkdir(IRSSI_DESTINATION_FOLDER)
        print('created irssi destination folder')


def create_symlink(from_file, to_file):
    if os.path.exists(to_file):
        # if destination is file remove it
        if os.path.isfile(to_file):
            os.remove(to_file)
            os.symlink(from_file, to_file)
            print('replace FILE with symlink ' + to_file)
        else:
        # if destination is folder remove it
            shutil.rmtree(IRSSI_DESTINATION_FOLDER)
            os.symlink(from_file, to_file)
            print('replace FOLDER with symlink ' + to_file)
    else:
        os.symlink(from_file, to_file)
        print('created symlink ' + to_file)


create_dirs_if_doesnt_exists()
create_symlink(BASHRC_FILE, BASHRC_DESTINATION)
create_symlink(NEOVIM_NVIMRC_FILE, NEOVIM_NVIMRC_DESTINATION)
create_symlink(I3_CONFIG_FILE, I3_DESTINATION)
create_symlink(ZATHURA_FILE, ZATHURA_DESTINATION)
create_symlink(PHONETIC, PHONETIC_DESTINATION)
create_symlink(IRSSI_FOLDER, IRSSI_DESTINATION_FOLDER)
