# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/p788892/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/p788892/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/p788892/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/p788892/.fzf/shell/key-bindings.zsh"
