# ******************************************************************************
# My ~/.zshrc file
# Maintained by: Andrew McBurney
# ******************************************************************************

unsetopt nomatch

. ~/.dotfiles/zsh/.zshenv
. ~/.dotfiles/zsh/theme
. ~/.dotfiles/zsh/functions
. ~/.dotfiles/zsh/alias

# ******************************************************************************
# ZSH Other
# ******************************************************************************

COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ******************************************************************************
# Other
# ******************************************************************************

# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Load rbenv automatically
eval "$(rbenv init -)"

# Rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
