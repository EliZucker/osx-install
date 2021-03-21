#!/bin/sh

# #Install Zsh & Oh My Zsh
brew install zsh
curl -L http://install.ohmyz.sh | sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM1:-$ZSH/custom}/plugins/alias-tips

# ADD THIS LINE TO ZSHRC:
# plugins = (git zsh-autosuggestions alias-tips)

# install shell integration & utilities
curl -L https://iterm2.com/misc/install_shell_integration.sh | bash

