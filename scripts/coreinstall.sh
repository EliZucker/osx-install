# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing Git..."
brew install git

echo "Git config"

git config --global user.name "EliZucker"
git config --global user.email "thezuck@google.com"

# echo "Installing brew git utilities..."
# brew install git-extras
# brew install legit
# brew install git-flow

echo "Installing other brew stuff..."
brew install wget
brew install sqlite
brew install mas
brew install openssl

echo "Cleaning up brew"
brew cleanup

echo "Installing homebrew cask"
brew install caskroom/cask/brew-cask

# echo "Copying dotfiles from Github"
# cd ~
# git clone git@github.com:bradp/dotfiles.git .dotfiles
# cd .dotfiles
# sh symdotfiles

#Install Zsh & Oh My Zsh
echo "Installing Oh My ZSH..."
curl -L http://install.ohmyz.sh | sh

# echo "Setting up Oh My Zsh theme..."
# cd  /Users/bradparbs/.oh-my-zsh/themes
# curl https://gist.githubusercontent.com/bradp/a52fffd9cad1cd51edb7/raw/cb46de8e4c77beb7fad38c81dbddf531d9875c78/brad-muse.zsh-theme > brad-muse.zsh-theme

echo "Setting up Zsh plugins..."
brew install zsh-autosuggestions
# add this line to zshrc:
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

echo "Setting ZSH as shell..."
chsh -s /bin/zsh

echo "installing apps with mas..."

# get Apple ID
echo ""
echo "Enter AppleID to signin to Mac App Store:"
read -p "  AppleID (john@foo.com): " APPLEID

# make sure signed into Mac App Store
mas signin $APPLEID

# install macos apps
mas install 937984704 # Amphetamine
mas install 966085870 # ticktick
mas install 472226235 # lanscan

echo "installing apps with Cask..."
brew cask install android-platform-tools
brew cask install calibre
brew cask install coconutbattery
brew cask install iina
brew cask install keka
brew cask install selfcontrol
brew cask install spectacle
brew cask install iterm2
brew cask install google-chrome
brew cask install spotify
brew cask install visual-studio-code
brew cask install sequel-pro
brew cask install slack
brew cask install qbittorrent
brew cask install handbrake
brew cask install appcleaner
brew cask install fantastical
brew cask install muse
brew cask install intellij-idea
brew cask install stay
brew cask install docker
brew cask install expressvpn

brew cask cleanup
brew cleanup

echo "Setting some Mac settings..."

#"Allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

#"Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

#"Saving to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

#"Use column view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle Clmv

#"Speeding up Mission Control animations and grouping windows by application"
# defaults write com.apple.dock expose-animation-duration -float 0.1
# defaults write com.apple.dock "expose-group-by-app" -bool true

#"Setting Dock to auto-hide and removing the auto-hiding delay"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

#"Setting email addresses to copy as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in Mail.app"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

#"Setting screenshots location to ~/Desktop"
defaults write com.apple.screencapture location -string "$HOME/Desktop/Screenshots"

#"Enabling Safari's debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

killall Finder
echo "Done!"