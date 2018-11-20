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
export NVM_DIR="$HOME/.nvm"

# Setting PATH for Python 3.4.
export PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"

# Setting PATH for MacPython 2.5.
export PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"

# Added by the Heroku Toolbelt.
export PATH="/usr/local/heroku/bin:$PATH"

# Coreutils.
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# GOPATH for my machine.
export GOPATH="/Users/$(whoami)/go"

# Add GOPATH binaries to PATH.
export PATH=$PATH:$GOPATH/bin

# Rbenv root.
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# Pyenv root.
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
