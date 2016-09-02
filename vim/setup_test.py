import os
import shutil


CWD = os.getcwd()
HOME_DIR = os.path.expanduser('~')


IRSSI_FOLDER = CWD + '/irssi/'
IRSSI_DESTINATION_FOLDER = HOME_DIR + '/.irssi/'


print(IRSSI_FOLDER)
print(IRSSI_DESTINATION_FOLDER)

os.symlink(IRSSI_FOLDER, IRSSI_DESTINATION_FOLDER)
