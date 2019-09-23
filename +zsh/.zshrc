# ******************************************************************************
# My ~/.zshrc file
# Maintained by: Andrew McBurney
# ******************************************************************************

if [ -n "$INSIDE_EMACS" ] || [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    plugins=(git bundler osx rake ruby kubectl kube-ps1 zsh-autosuggestions)
else
    plugins=(git vi-mode bundler osx rake ruby kubectl kube-ps1 zsh-autosuggestions)
fi

source ~/.zshenv
source ~/.dotfiles/+zsh/alias
source ~/.dotfiles/+zsh/functions
source ~/.dotfiles/+zsh/theme
source $ZSH/oh-my-zsh.sh
source ~/.dotfiles/+zsh/loaders
