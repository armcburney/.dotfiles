# ******************************************************************************
# My ~/.zshrc file
# Maintained by: Andrew McBurney
# ******************************************************************************

plugins=(git vi-mode bundler osx rake ruby kubectl kube-ps1 zsh-autosuggestions)

source ~/.zshenv
source ~/.dotfiles/+zsh/alias
source ~/.dotfiles/+zsh/functions
source ~/.dotfiles/+zsh/theme
source $ZSH/oh-my-zsh.sh
source ~/.dotfiles/+zsh/loaders
