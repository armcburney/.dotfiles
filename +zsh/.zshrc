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

plugins=(git vi-mode bundler osx rake ruby kubectl kube-ps1 zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"
