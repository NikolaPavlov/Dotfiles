import os


CWD = os.getcwd()
HOME_DIR = os.path.expanduser('~')
VUNDLE_GIT_REPO = 'https://github.com/VundleVim/Vundle.vim.git'
VUNDLE_DESTINATION = HOME_DIR + '/.vim/bundle/Vundle.vim'
I3_DESTINATION_FOLDER = HOME_DIR + '/' + '.i3'
ZATHURA_DESTINATION_FOLDER = HOME_DIR + '/' + '.config/zathura'
BASHRC_FILE = CWD + '/' + 'bashrc'
BASHRC_DESTINATION = HOME_DIR + '/' + '.bashrc'
VIMRC_FILE = CWD + '/' + 'vimrc'
VIMRC_DESTINATION = HOME_DIR + '/' + '.vimrc'
I3_CONFIG_FILE = CWD + '/' + 'config'
I3_DESTINATION = HOME_DIR + '/' + '.i3/config'
ZATHURA_FILE = CWD + '/' + 'zathurarc'
ZATHURA_DESTINATION = HOME_DIR + '/' + '.config/zathura/zathurarc'


def is_dirs_there(dirs):
    pass


def create_symlink(from_file, to_file):
    if os.path.exists(to_file):
        os.remove(to_file)
        os.symlink(from_file, to_file)
        print('replace file with symlink ' + to_file)
    else:
        if not os.path.exists(I3_DESTINATION_FOLDER):
            os.mkdir(I3_DESTINATION_FOLDER)
        if not os.path.exists(ZATHURA_DESTINATION_FOLDER):
            os.mkdir(ZATHURA_DESTINATION_FOLDER)
        os.symlink(from_file, to_file)
        print('created symlink ' + to_file)

is_dirs_there()
create_symlink(BASHRC_FILE, BASHRC_DESTINATION)
create_symlink(VIMRC_FILE, VIMRC_DESTINATION)
create_symlink(I3_CONFIG_FILE, I3_DESTINATION)
create_symlink(ZATHURA_FILE, ZATHURA_DESTINATION)

# install vundle if not present in the current system
if os.path.exists(HOME_DIR + '/.vim/bundle/Vundle.vim'):
    print('vundle is already instaled!')
else:
    os.system('git clone ' + VUNDLE_GIT_REPO + ' ' + VUNDLE_DESTINATION)
