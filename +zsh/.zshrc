# ******************************************************************************
# My ~/.zshrc file
# Maintained by: Andrew McBurney
# ******************************************************************************

source ~/.zshenv
source ~/.dotfiles/+zsh/alias
source ~/.dotfiles/+zsh/functions
source ~/.dotfiles/+zsh/loaders
source ~/.dotfiles/+zsh/theme

unsetopt nomatch

plugins=(git vi-mode bundler osx rake ruby)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"
