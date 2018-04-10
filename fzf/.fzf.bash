# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/andrewmcburney/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/andrewmcburney/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/andrewmcburney/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/andrewmcburney/.fzf/shell/key-bindings.bash"

