# ******************************************************************************
# My ~/.zshrc file
# Maintained by: Andrew McBurney
# ******************************************************************************

source ~/.zshenv
source ~/.dotfiles/+zsh/alias
source ~/.dotfiles/+zsh/functions
source ~/.dotfiles/+zsh/loaders
source ~/.dotfiles/+zsh/theme
source ~/.dotfiles/+zsh/private_env

unsetopt nomatch

plugins=(git vi-mode bundler osx rake ruby)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
