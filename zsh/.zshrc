# ******************************************************************************
# My ~/.zshrc file
# Maintained by: Andrew McBurney
# ******************************************************************************

source ~/.dotfiles/zsh/.zshenv
source ~/.dotfiles/zsh/theme
source ~/.dotfiles/zsh/functions
source ~/.dotfiles/zsh/alias

unsetopt nomatch

plugins=(git vi-mode bundler osx rake ruby)

# ******************************************************************************
# ZSH Other
# ******************************************************************************

COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

source $ZSH/oh-my-zsh.sh

# Reverse image search with fzf
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

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# fuzzy grep open via ag
vg() {
    local file

    file="$(ag --nobreak --noheading $@ | fzf -0 -1 | awk -F: '{print $1 " +" $2}')"

    if [[ -n $file ]]
    then
        vim $file
    fi
}

# fd - cd to selected directory
fd() {
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune \
               -o -type d -print 2> /dev/null | fzf +m) &&
        cd "$dir"
}

# cf - fuzzy cd from anywhere
# ex: cf word1 word2 ... (even part of a file name)
# zsh autoload function
cf() {
    local file

    file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"

    if [[ -n $file ]]
    then
        if [[ -d $file ]]
        then
            cd -- $file
        else
            cd -- ${file:h}
        fi
    fi
}

# fh - repeat history
fh() {
    eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fkill - kill process
fkill() {
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}
