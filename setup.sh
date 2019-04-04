#!/bin/sh

#                    _           _        _ _ 
#  ___  _____  __   (_)_ __  ___| |_ __ _| | |
# / _ \/ __\ \/ /   | | '_ \/ __| __/ _` | | |
#| (_) \__ \>  <    | | | | \__ \ || (_| | | |
# \___/|___/_/\_\   |_|_| |_|___/\__\__,_|_|_|


echo "I  ❤️  🍎"
echo "Mac OS Install Setup Script"
echo "By Nutchanon Ninyawee (CircleOnCircles)"
echo "Follow me on twitter @CircleOnCircles"

# a fork By Nina Zakharenko
# Follow me on twitter! https://twitter.com/nnja
# Some configs reused from:
# https://github.com/ruyadorno/installme-osx/
# https://gist.github.com/millermedeiros/6615994
# https://gist.github.com/brandonb927/3195465/

source cecho.sh

echo ""
cecho "###############################################" $red
cecho "#        DO NOT RUN THIS SCRIPT BLINDLY       #" $red
cecho "#         YOU'LL PROBABLY REGRET IT...        #" $red
cecho "#                                             #" $red
cecho "#              READ IT THOROUGHLY             #" $red
cecho "#         AND EDIT TO SUIT YOUR NEEDS         #" $red
cecho "###############################################" $red
echo ""

# Set continue to false by default.
CONTINUE=false

echo ""
cecho "Have you read through the script you're about to run and " $red
cecho "understood that it will make changes to your computer? (y/n)" $red
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  CONTINUE=true
fi

if ! $CONTINUE; then
  # Check if we're continuing and output a message if not
  cecho "Please go read the script, it only takes a few minutes" $red
  exit
fi

# Here we go.. ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


##############################
# Prerequisite: Install Brew #
##############################

echo "Installing brew..."

if test ! $(which brew)
then
	## Don't prompt for confirmation when installing homebrew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null
fi

# Latest brew, install brew cask
brew upgrade
brew update


source setup_ssh.sh


##############################
# Install via Brew           #
##############################

echo "Starting brew app install..."

### Personal
brew cask install 1password
brew cask install 1password-cli
brew cask install daisydisk
brew cask install parallels
# brew cask install parallels-toolbox WILL download installer
# prefer direct download instead

### Developer Tools
brew cask install iterm2
brew cask install dash
brew install ispell

### Data Science
brew cask install tableau
brew cask install tableau-prep
brew cask install orange

### Development
brew cask install docker
# brew install postgresql
# brew install redis


### Command line tools - install new ones, update others to latest version
brew install git  # upgrade to latest
brew install git-lfs # track large files in git https://github.com/git-lfs/git-lfs
brew install wget
brew install zsh # zshell
brew install tmux
brew install tree
brew link curl --force
brew install grep --with-default-names
brew install trash  # move to osx trash instead of rm
brew install less


### Python
brew install python
brew install pyenv
brew install pipenv
# TODO: add poetry https://github.com/sdispater/poetry

### Microcontrollers & Electronics
# brew install avrdude
# brew cask install arduino
# Manually install teensyduino from:
# https://www.pjrc.com/teensy/td_download.html


### Dev Editors 
brew cask install visual-studio-code
brew cask install pycharm



### Writing
# brew cask install evernote
brew cask install macdown
brew cask install notion


### Conferences, Blogging, Screencasts
brew cask install deckset
brew cask install ImageOptim  # for optimizing images
# brew cask install screenflow # Not Buy Yet


### Productivity
brew cask install wavebox
brew cask install google-chrome
brew cask install alfred
brew cask install dropbox

# brew cask install timing  # time and project tracker
brew cask install keycastr  # show key presses on screen (for gifs & screencasts)
# brew cask install betterzip
# brew cask install caffeine  # keep computer from sleeping
brew cask install skitch  # app to annotate screenshots
brew cask install muzzle
brew cask install flux


### Keyboard & Mouse
# brew cask install karabiner-elements  # remap keys, emacs shortcuts
brew cask install scroll-reverser  # allow natural scroll for trackpad, not for mouse


### Quicklook plugins https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode # syntax highlighting in preview
brew cask install qlstephen  # preview plaintext files without extension
brew cask install qlmarkdown  # preview markdown files
brew cask install quicklook-json  # preview json files
brew cask install epubquicklook  # preview epubs, make nice icons
brew cask install quicklook-csv  # preview csvs


### Chat / Video Conference
brew cask install slack
brew cask install microsoft-teams
brew cask install zoomus
brew cask install signal


### Music and Video
brew cask install vlc

### HAcker
brew install aircrack-ng
brew install wifi-password
brew install speedtest-cli
brew install arp-scan
brew install nmap


### Run Brew Cleanup
brew cleanup


source font.sh

source mas.sh &


#############################################
### Install few global python packages
#############################################

echo "Installing global Python packages..."

pip3 install --upgrade pip
pip3 install --user pylint
pip3 install --user flake8

source set_macos_preferences.sh &

#############################################
### Install dotfiles repo, run link script
#############################################
# TODO: 
# clean up my personal repo to make it public
# dotfiles for vs code, emacs, gitconfig, oh my zsh, etc. 
# git clone git@github.com:nnja/dotfiles.git
# cd dotfiles
# fetch submodules for oh-my-zsh
# git submodule init && git submodule update && git submodule status
# make symbolic links and change shell to zshell
# ./makesymlinks.sh
# upgrade_oh_my_zsh