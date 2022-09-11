#!/usr/bin/env zsh

eval "$(fnm env --use-on-cd)"


# Broot alias
function br {
    local cmd cmd_file code
    cmd_file=$(mktemp)
    if broot --outcmd "$cmd_file" "$@"; then
        cmd=$(<"$cmd_file")
        rm -f "$cmd_file"
        eval "$cmd"
    else
        code=$?
        rm -f "$cmd_file"
        return "$code"
    fi
}

# Jog functions
function zshaddhistory() {
  echo "${1%%$'\n'}⋮${PWD}   " >> ~/.zsh_history_ext
}
