import os
import errno


cwd = os.getcwd()
home = os.path.expanduser('~')


def force_symlink(file1, file2):
    try:
        os.symlink(file1, file2)
        print('link created ' + file1)
    except Exception as e:
        if e.errno == errno.EEXIST:
            os.remove(file2)
            os.symlink(file1, file2)
            print('link replaced ' + file1)


force_symlink(cwd + '/' + 'bashrc', home + '/' + '.bashrc')
force_symlink(cwd + '/' + 'vimrc', home + '/' + '.vimrc')
force_symlink(cwd + '/' + 'zathurarc', home + '/.config/zathura/' + 'zathurarc')
force_symlink(cwd + '/' + 'autostartrc.sh', home + '/' + '.autostartrc')
force_symlink(cwd + '/' + 'config', home + '/.i3/' + 'config')

# Install Vundle
try:
    os.system('git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim')
except:
    print('error installing vundle')
