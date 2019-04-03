#############################################
### Installs from Mac App Store
#############################################

source cecho.sh
echo "Installing apps from the App Store..."

### find app ids with: mas search "app name"
brew install mas

### Mas login is currently broken on mojave. See:
### Login manually for now.

cecho "Need to log in to App Store manually to install apps with mas...." $red
echo "Opening App Store. Please login."
open "/Applications/App Store.app"
echo "Is app store login complete.(y/n)? "
read response
if [ "$response" != "${response#[Yy]}" ]
then
  # Office
	mas install 409183694 # Keynote
	mas install 409201541 # Pages
	mas install 409203825 # Numbers
	mas install 462054704 # MS. Word
	mas install 462058435 # MS. Excel
	mas install 462062816 # MS. PowerPoint

	# Media
	mas install 682658836 # GarageBand
	mas install 408981434 # iMovie
	mas install 1351639930 # Gifski, convert videos to gifs
	mas install 668208984  # GIPHY Capture. The GIF Maker (For recording my screen as gif)

	# Personal 
	mas install 1446580517 # Noted - voice recorder 
	mas install 485812721 # TweetDeck

	# Work
  mas install 1295203466 # Microsoft Remote Desktop
	mas install 497799835 # Xcode
	mas install 803453959 # Slack

	# Utilities
	mas install 1116599239 # NordVPN IKE
	mas install 441258766 # Magnet
	mas install 1191449274 # ToothFairy

	# Data Science
	mas install 1167193104 # CSView

else
	cecho "App Store login not complete. Skipping installing App Store Apps" $red
fi