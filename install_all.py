import os


CWD = os.getcwd()
HOME_DIR = os.path.expanduser('~')

BASHRC_FILE = CWD + '/.bashrc'
BASHRC_DESTINATION = HOME_DIR + '/.bashrc'

NEOVIM_NVIMRC_FILE = CWD + '/Neovim/init.vim'
NEOVIM_NVIMRC_DESTINATION = HOME_DIR + '/.config/nvim/init.vim'
NEOVIM_NVIMRC_DESTINATION_FOLDER = HOME_DIR + '/.config/nvim'

I3_CONFIG_FILE = CWD + '/i3/config'
I3_DESTINATION = HOME_DIR + '/.config/i3/config'
I3_DESTINATION_FOLDER = HOME_DIR + '/.i3'

POLYBAR_CONFIG = CWD + '/Polybar/config'
POLYBAR_CONFIG_DESTINATION = HOME_DIR + '/.config/polybar/config'
POLYBAR_DESTINATION_FOLDER = HOME_DIR + '/.config/polybar/'

ZATHURA_FILE = CWD + '/Zathura/zathurarc'
ZATHURA_DESTINATION = HOME_DIR + '/.config/zathura/zathurarc'
ZATHURA_DESTINATION_FOLDER = HOME_DIR + '/.config/zathura'

PHONETIC = CWD + '/Scripts/phonetic_keys.sh'
PHONETIC_DESTINATION = HOME_DIR + '/.phonetic_keys.sh'

IRSSI_FOLDER = CWD + '/Irssi/'
IRSSI_DESTINATION_FOLDER = HOME_DIR + '/.irssi'


def printGreen(str_to_print):
    print("\033[92m {}\033[00m" .format(str_to_print))


def printRed(str_to_print):
    print("\033[91m {}\033[00m" .format(str_to_print))


def create_dir_if_doesnt_exist(dir_to_check):
    if not os.path.exists(dir_to_check):
        os.mkdir(dir_to_check)
        print('created ' + dir_to_check)


def create_symlink(from_file, to_file):
    '''
    remove file if already exists and replace it with link
    '''
    try:
        os.remove(to_file)
        printRed('file removed ' + to_file)
    except:
        pass
    os.symlink(from_file, to_file)
    printGreen('Created symlink from ' + from_file + ' to ' + to_file + '\n')

create_dir_if_doesnt_exist(NEOVIM_NVIMRC_DESTINATION_FOLDER)
create_dir_if_doesnt_exist(I3_DESTINATION_FOLDER)
create_dir_if_doesnt_exist(ZATHURA_DESTINATION_FOLDER)
create_dir_if_doesnt_exist(POLYBAR_DESTINATION_FOLDER)
create_symlink(BASHRC_FILE, BASHRC_DESTINATION)
create_symlink(NEOVIM_NVIMRC_FILE, NEOVIM_NVIMRC_DESTINATION)
create_symlink(I3_CONFIG_FILE, I3_DESTINATION)
create_symlink(POLYBAR_CONFIG, POLYBAR_CONFIG_DESTINATION)
create_symlink(PHONETIC, PHONETIC_DESTINATION)
create_symlink(IRSSI_FOLDER, IRSSI_DESTINATION_FOLDER)
create_symlink(ZATHURA_FILE, ZATHURA_DESTINATION)
