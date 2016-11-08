# Show git branch
function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

# 'ls' automatically when you 'cd'
function cd {
  builtin cd "$@" && ls -F
}

# Exports
export PS1="\W \u \$(parse_git_branch)\$ "
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Aliases
alias sshuw='ssh -Y armcburn@linux.student.cs.uwaterloo.ca'

# To allow vim key bindings in terminal
set -o vi
