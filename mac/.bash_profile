# ~/.bash_profile for mac environments 
# Andrew McBurney

# Aliases
alias ls='ls -G'
alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias sshuw='ssh -Y armcburn@linux.student.cs.uwaterloo.ca'

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
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Git branch information
function parse_git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# ls whenever you cd.
function cd {
  builtin cd "$@" && ls
}

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Export PS1 with coloured theme and git branch parsing
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]: \[\033[01;31m\]$(parse_git_branch)\[\033[00m\] \[\033[01;34m\]\w \[\033[00m\]\$ '
unset color_prompt force_color_prompt

# Enable vim key bindings for bash

