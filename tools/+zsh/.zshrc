# ******************************************************************************
# My ~/.zshrc file
# Maintained by: Andrew McBurney
# ******************************************************************************

source ~/.zshenv
source ~/.dotfiles/tools/+zsh/alias
source ~/.dotfiles/tools/+zsh/functions
source ~/.dotfiles/tools/+zsh/loaders
source ~/.dotfiles/tools/+zsh/theme

unsetopt nomatch

plugins=(git vi-mode bundler osx rake ruby)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
