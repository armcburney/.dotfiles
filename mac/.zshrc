# ******************************************************************************
# My ~/.zshrc file
# Maintained by: Andrew McBurney
# ******************************************************************************

unsetopt nomatch

# ******************************************************************************
# Exports
# ******************************************************************************

export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=/Users/andrewmcburney/.oh-my-zsh
export PATH="$PATH:$HOME/.skeleton/bin/run"
export UPDATE_ZSH_DAYS=7

# ******************************************************************************
# ZSH
# ******************************************************************************

# Theme
ZSH_THEME="pure"

COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# ******************************************************************************
# Functions
# ******************************************************************************

# ls every time you cd
function cd { builtin cd "$@" && ls }

# ******************************************************************************
# Aliases
# ******************************************************************************

# emacs
alias ed="emacs --daemon"
alias ek="emacsclient -e \"(kill-emacs)\""
alias em="emacsclient -t"

# ssh
alias sshuw='ssh -Y armcburn@linux.student.cs.uwaterloo.ca'
alias ssham='ssh root@138.197.135.132'

# other
alias a="clear"
alias sk="skeleton"
alias fb='node ~/fb-messenger-cli/cli.js'
