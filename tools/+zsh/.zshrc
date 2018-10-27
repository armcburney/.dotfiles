# ******************************************************************************
# My ~/.zshrc file
# Maintained by: Andrew McBurney
# ******************************************************************************

source ~/.dotfiles/zsh/.zshenv
source ~/.dotfiles/zsh/alias
source ~/.dotfiles/zsh/functions
source ~/.dotfiles/zsh/loaders
source ~/.dotfiles/zsh/theme

unsetopt nomatch

plugins=(git vi-mode bundler osx rake ruby)

source $ZSH/oh-my-zsh.sh
