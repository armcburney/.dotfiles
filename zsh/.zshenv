# ******************************************************************************
# Exports
# ******************************************************************************

export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH=$HOME/.oh-my-zsh

export NVM_DIR="$HOME/.nvm"

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"

# Setting PATH for MacPython 2.5
# The orginal version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# GOPATH for datadog machine
export GOPATH="/Users/$(whoami)/coding/go"

# Add GOPATH binaries to PATH
export PATH=$PATH:$GOPATH/bin
