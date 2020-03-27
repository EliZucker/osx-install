#!/bin/sh

CURRENT_DIR=`pwd`

# install zsh  (already installed by homebrew)
# brew install zsh zsh-completions

# install oh my zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# install iterm2  (already installed by homebrew)
# brew cask install iterm2


### MY STUFF:

# #Install Zsh & Oh My Zsh
# echo "Installing Oh My ZSH..."
# curl -L http://install.ohmyz.sh | sh

# ZSH: TO BE DETERMINED
# brew install zsh
# brew install zsh-autosuggestions
# add this line to zshrc:
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# echo "Setting ZSH as shell..."
# chsh -s /bin/zsh




### END OF MY STUFF

# install shell integration & utilities
curl -L https://iterm2.com/misc/install_shell_integration.sh | bash

cd "$CURRENT_DIR"
