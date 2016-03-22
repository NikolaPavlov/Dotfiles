import os


CWD = os.getcwd()
HOME_DIR = os.path.expanduser('~')
VUNDLE_GIT_REPO = 'https://github.com/VundleVim/Vundle.vim.git'
VUNDLE_DESTINATION = HOME_DIR + '/.vim/bundle/Vundle.vim'
BASHRC_FILE = CWD + '/bashrc'
BASHRC_DESTINATION = HOME_DIR + '/.bashrc'
VIMRC_FILE = CWD + '/vim/vimrc'
VIMRC_DESTINATION = HOME_DIR + '/.vimrc'
VIM_PLUGINS = CWD + '/vim/plugins.vim'
VIM_PLUGINS_DESTINATION = HOME_DIR + '/.vim/plugins.vim'
VIM_KEY_BIDINGS = CWD + '/vim/key_bidings.vim'
VIM_KEY_BIDINGS_DESTINATION = HOME_DIR + '/.vim/key_bidings.vim'
I3_CONFIG_FILE = CWD + '/config'
I3_DESTINATION = HOME_DIR + '/.i3/config'
I3_DESTINATION_FOLDER = HOME_DIR + '/.i3'
ZATHURA_FILE = CWD + '/zathurarc'
ZATHURA_DESTINATION = HOME_DIR + '/.config/zathura/zathurarc'
ZATHURA_DESTINATION_FOLDER = HOME_DIR + '/.config/zathura'

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
create_symlink(VIM_PLUGINS, VIM_PLUGINS_DESTINATION)
create_symlink(VIM_KEY_BIDINGS, VIM_KEY_BIDINGS_DESTINATION)
create_symlink(I3_CONFIG_FILE, I3_DESTINATION)
create_symlink(ZATHURA_FILE, ZATHURA_DESTINATION)
