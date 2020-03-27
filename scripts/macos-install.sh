#!/bin/sh

# install mas-cli to install from the Mac App store
brew install mas

# get Apple ID
echo ""
echo "Enter AppleID to signin to Mac App Store:"
read -p "  AppleID (john@foo.com): " APPLEID

# make sure signed into Mac App Store
mas signin $APPLEID

# install macos apps
mas install 408981434  # iMovie
mas install 409183694  # Keynote
mas install 497799835  # Xcode
mas install 409201541  # Pages
mas install 803453959  # Slack
mas install 472226235  # LanScan
mas install 1116599239  # NordVPN
mas install 937984704 # Amphetamine

# Need to remember to install these from the app store...
mas install 462058435  # Microsoft Excel
mas install 462062816  # Microsoft PowerPoint
mas install 462054704  # Microsoft Word

