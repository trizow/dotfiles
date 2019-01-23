# Setup fzf
# ---------
if [[ ! "$PATH" == */home/troy.bebee/.fzf/bin* ]]; then
  export PATH="$PATH:/home/troy.bebee/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/troy.bebee/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/troy.bebee/.fzf/shell/key-bindings.zsh"

