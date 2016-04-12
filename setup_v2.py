import os


CWD = os.getcwd()
HOME_DIR = os.path.expanduser('~')

VUNDLE_GIT_REPO = 'https://github.com/VundleVim/Vundle.vim.git'
VUNDLE_DESTINATION = HOME_DIR + '/.vim/bundle/Vundle.vim'

BASHRC_FILE = CWD + '/bashrc'
BASHRC_DESTINATION = HOME_DIR + '/.bashrc'

VIMRC_FILE = CWD + '/vim/vimrc'
VIMRC_DESTINATION = HOME_DIR + '/.vimrc'

NEOVIM_NVIMRC_FILE = CWD + '/neovim/init.vim'
NEOVIM_NVIMRC_DESTINATION = HOME_DIR + '/.config/nvim/init.vim'
NEOVIM_NVIMRC_DESTINATION_FOLDER = HOME_DIR + '/.config/nvim'

I3_CONFIG_FILE = CWD + '/config'
I3_DESTINATION = HOME_DIR + '/.i3/config'
I3_DESTINATION_FOLDER = HOME_DIR + '/.i3'

ZATHURA_FILE = CWD + '/zathurarc'
ZATHURA_DESTINATION = HOME_DIR + '/.config/zathura/zathurarc'
ZATHURA_DESTINATION_FOLDER = HOME_DIR + '/.config/zathura'

AUTOSTARTRC = CWD + '/autostartrc.sh'
AUTOSTARTRC_DESTINATION = HOME_DIR + '/.autostartrc.sh'


# install vundle if not present in the current system
if os.path.exists(HOME_DIR + '/.vim/bundle/Vundle.vim'):
    print('vundle is already instaled!')
else:
    os.system('git clone ' + VUNDLE_GIT_REPO + ' ' + VUNDLE_DESTINATION)


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


def create_symlink(from_file, to_file):
    if os.path.exists(to_file):
        os.remove(to_file)
        os.symlink(from_file, to_file)
        print('replace file with symlink ' + to_file)
    else:
        os.symlink(from_file, to_file)
        print('created symlink ' + to_file)


create_dirs_if_doesnt_exists()
create_symlink(BASHRC_FILE, BASHRC_DESTINATION)
create_symlink(VIMRC_FILE, VIMRC_DESTINATION)
create_symlink(NEOVIM_NVIMRC_FILE, NEOVIM_NVIMRC_DESTINATION)
create_symlink(I3_CONFIG_FILE, I3_DESTINATION)
create_symlink(ZATHURA_FILE, ZATHURA_DESTINATION)
create_symlink(AUTOSTARTRC, AUTOSTARTRC_DESTINATION)
