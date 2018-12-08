# ******************************************************************************
# Exports
# ******************************************************************************

if [ -n "$INSIDE_EMACS" ]; then
    # Use the current emacs session as the editor.
    export EDITOR="emacsclient"
    export HGMERGE="emacsclient"
else
    # Use the vim as the editor.
    export EDITOR="vim"
    export HGMERGE="vim"
fi

export TERM="xterm-256color"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

# Add helper functions to PATH.
export PATH="$HOME/.dotfiles/bin:$PATH"

# Added by the Heroku Toolbelt.
export PATH="/usr/local/heroku/bin:$PATH"

# Coreutils.
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# GOPATH for my machine.
export GOPATH="/Users/$(whoami)/go"

# Add GOPATH binaries to PATH.
export PATH=$PATH:$GOPATH/bin
