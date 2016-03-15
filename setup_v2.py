import os
import errno


CWD = os.getcwd()
HOME_DIR = os.path.expanduser('~')
VUNDLE_GIT_REPO = 'https://github.com/VundleVim/Vundle.vim.git'
VUNDLE_REPO_DESTINATION = HOME_DIR + '/.vim/bundle/Vundle.vim'
I3_CONFIG_DIR = HOME_DIR + '/' + '.i3'
ZATHURA_CONFIG_DIR = HOME_DIR + '/' + '.config/zathura'

BASHRC_FILE = CWD + '/' + 'bashrc'
BASHRC_FILE_DESTINATION = HOME_DIR + '/' + '.bashrc'
VIMRC_FILE = CWD + '/' + 'vimrc'
VIMRC_FILE_DESTINATION = HOME_DIR + '/' + '.vimrc'
I3_CONFIG_FILE = CWD + '/' + 'config'
I3_CONFIG_FILE_DESTINATION = HOME_DIR + '/' + '.i3/config'
ZATHURA_FILE = CWD + '/' + 'zathurarc'
ZATHURA_FILE_DESTINATION = HOME_DIR + '/' + '.config/zathura/zathurarc'


def create_symlink(from_file, to_file):
    if os.path.exists(to_file):
        os.remove(to_file)
        os.symlink(from_file, to_file)
        print('replace file with symlink ' + to_file)
    else:
        if not os.path.exists(I3_CONFIG_DIR):
            os.mkdir(I3_CONFIG_DIR)
        if not os.path.exists(ZATHURA_CONFIG_DIR):
            os.mkdir(ZATHURA_CONFIG_DIR)
        os.symlink(from_file, to_file)
        print('created symlink ' + to_file)


create_symlink(BASHRC_FILE, BASHRC_FILE_DESTINATION)
create_symlink(VIMRC_FILE, VIMRC_FILE_DESTINATION)
create_symlink(I3_CONFIG_FILE, I3_CONFIG_FILE_DESTINATION)
create_symlink(ZATHURA_FILE, ZATHURA_FILE_DESTINATION)

if os.path.exists(HOME_DIR + '/.vim/bundle/Vundle.vim'):
    print('vundle is already instaled!')
else:
    os.system('git clone ' + VUNDLE_GIT_REPO + ' ' + VUNDLE_REPO_DESTINATION)
