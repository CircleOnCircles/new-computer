import os
from elevate import elevate

def is_root():
    return os.getuid() == 0

if not is_root():
    elevate()


from shutil import which
import subprocess

if which('brew'):
    os.system('/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')
else:
    print('homebrew is already installed.')
os.system('brew upgrade')
os.system('brew update')