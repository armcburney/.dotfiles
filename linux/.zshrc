# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/andrewmcburney/.oh-my-zsh

# Path to xterm-256color
export TERM='xterm-256color'

# If in emacs, set to a minimal zsh theme, else, use the powerline theme
if [ -n "$INSIDE_EMACS" ]; then
    ZSH_THEME="pure"
else
    ZSH_THEME="powerlevel9k/powerlevel9k"
	POWERLEVEL9K_MODE='awesome-patched'
	POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
	POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
	POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status nvm node_version pyenv virtualenv time)
    POWERLEVEL9K_PROMPT_ON_NEWLINE=true
fi

COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="mm/dd/yyyy"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# bindkeys
bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

# functions
function cd { builtin cd "$@" && ls }

# aliases
alias relzsh="source ~/.zshrc"
alias a="clear"
alias am="setxkbmap dvorak && setxkbmap -option caps:swapescape"
alias us="setxkbmap us"

set -o vi

export NVM_DIR="/home/andrewmcburney/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

eval `dircolors ~/.solarized/dircolors.ansi-dark`
