# ******************************************************************************
# My ~/.zshrc file
# Maintained by: Andrew McBurney
# ******************************************************************************

plugins=(git vi-mode bundler osx rake ruby kubectl kube-ps1 zsh-autosuggestions)

source ~/.zshenv
source ~/.dotfiles/+zsh/alias
source ~/.dotfiles/+zsh/functions
source ~/.dotfiles/+zsh/loaders
source ~/.dotfiles/+zsh/theme

source $ZSH/oh-my-zsh.sh

# nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

# Reverse image search with fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
