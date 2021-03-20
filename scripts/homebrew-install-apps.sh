#!/bin/bash

# add additional repos for homebrew to track, update & install

# install apps
brew install cmake
brew install ffmpeg
brew install flac
brew install gdb
brew install gdbm
brew install mas
brew install openssl
brew install python
brew install kubectl
brew install wget
brew install sqlite
brew install youtube-dl
brew install webtorrent-cli

brew install --cask anaconda
brew install --cask adobe-creative-cloud
brew install --cask android-platform-tools
brew install --cask calibre
brew install --cask coconutbattery
brew install --cask iina
brew install --cask keka
brew install --cask kicad
brew install --cask selfcontrol
brew install --cask spectacle
brew install --cask iterm2
brew install --cask google-chrome
brew install --cask spotify
brew install --cask visual-studio-code
brew install --cask sequel-pro
brew install --cask slack
brew install --cask qbittorrent
brew install --cask handbrake
brew install --cask appcleaner
brew install --cask fantastical
brew install --cask intellij-idea
brew install --cask stay
brew install --cask docker
brew install --cask mactex
brew install --cask skype
brew install --cask wireshark
brew install --cask viscosity
brew install --cask zoomus
brew install --cask karabiner-elements
brew install --cask discord
# brew cask install arduino (this cask is broken)
brew install --cask disk-inventory-x
brew install --cask whatsyoursign
brew install --cask qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize suspicious-package quicklookase qlvideo
xattr -d -r com.apple.quarantine ~/Library/QuickLook
echo "Oversight (last app) might hang.. "
brew install --cask oversight