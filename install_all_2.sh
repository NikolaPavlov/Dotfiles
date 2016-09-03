#!/usr/bin/python3.5

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


def create_dir_if_doesnt_exist(dir_to_check):
    if not os.path.exists(dir_to_check):
        os.mkdir(dir_to_check)
        print('created ' + dir_to_check)

def create_symlink(from_file, to_file):
    try:
        os.remove(to_file)
    except:
        continue
    try:
        shutil.rmtree(to_file)
    except:
        continue
    os.symlink(from_file, to_file)
    print('Created symlink from ' + from_file + 'to ' + to_file)

create_dir_if_doesnt_exist(NEOVIM_NVIMRC_DESTINATION_FOLDER)
create_dir_if_doesnt_exist(I3_DESTINATION_FOLDER)
create_dir_if_doesnt_exist(ZATHURA_DESTINATION_FOLDER)
create_dir_if_doesnt_exist(IRSSI_DESTINATION_FOLDER)
create_symlink(BASHRC_FILE, BASHRC_DESTINATION)
create_symlink(NEOVIM_NVIMRC_FILE, NEOVIM_NVIMRC_DESTINATION)
create_symlink(I3_CONFIG_FILE, I3_DESTINATION)
create_symlink(PHONETIC, PHONETIC_DESTINATION)
create_symlink(IRSSI_FOLDER, IRSSI_DESTINATION_FOLDER)
