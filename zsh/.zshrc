# ******************************************************************************
# My ~/.zshrc file
# Maintained by: Andrew McBurney
# ******************************************************************************

unsetopt nomatch

# ******************************************************************************
# Exports
# ******************************************************************************

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:$HOME/.skeleton/bin/run"
export ZSH=$HOME/.oh-my-zsh
export UPDATE_ZSH_DAYS=7

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"

# Setting PATH for MacPython 2.5
# The orginal version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# ******************************************************************************
# ZSH Theme
# ******************************************************************************

if [ -n "$INSIDE_EMACS" ]; then
  ZSH_THEME="refined"
else
  ZSH_THEME="powerlevel9k/powerlevel9k"
  POWERLEVEL9K_MODE='awesome-patched'
  POWERLEVEL9K_PROMPT_ON_NEWLINE=true
  POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%{%F{249}%}\u250f"
  POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%{%F{249}%}\u2517%{%F{default}%} "
  POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
  POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
  POWERLEVEL9K_OS_ICON_BACKGROUND="black"
  POWERLEVEL9K_OS_ICON_FOREGROUND="249"
  POWERLEVEL9K_TODO_BACKGROUND="black"
  POWERLEVEL9K_TODO_FOREGROUND="249"
  POWERLEVEL9K_DIR_HOME_BACKGROUND="black"
  POWERLEVEL9K_DIR_HOME_FOREGROUND="249"
  POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="black"
  POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="249"
  POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="black"
  POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="249"
  POWERLEVEL9K_STATUS_OK_BACKGROUND="black"
  POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
  POWERLEVEL9K_STATUS_ERROR_BACKGROUND="black"
  POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
  POWERLEVEL9K_NVM_BACKGROUND="black"
  POWERLEVEL9K_NVM_FOREGROUND="249"
  POWERLEVEL9K_NVM_VISUAL_IDENTIFIER_COLOR="green"
  POWERLEVEL9K_RVM_BACKGROUND="black"
  POWERLEVEL9K_RVM_FOREGROUND="249"
  POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_COLOR="red"
  POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="black"
  POWERLEVEL9K_LOAD_WARNING_BACKGROUND="black"
  POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="black"
  POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="249"
  POWERLEVEL9K_LOAD_WARNING_FOREGROUND="249"
  POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="249"
  POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
  POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
  POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"
  POWERLEVEL9K_VI_INSERT_MODE_STRING="INSERT"
  POWERLEVEL9K_VI_COMMAND_MODE_STRING="NORMAL"
  POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='005'
  POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='236'
  POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='245'
  POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='236'
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=('context' 'dir' 'vcs')
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=('status' 'nvm' 'node_version' 'rvm' 'vi_mode')
fi

# ******************************************************************************
# ZSH Other
# ******************************************************************************

COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ******************************************************************************
# Functions
# ******************************************************************************

# ls whenever you cd.
function cd {
  builtin cd "$@" && ls
}

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
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls -G'
alias sk="skeleton"
alias fb='node ~/fb-messenger-cli/cli.js'

# ******************************************************************************
# Other
# ******************************************************************************

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
