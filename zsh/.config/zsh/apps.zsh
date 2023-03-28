#!/usr/bin/env zsh

eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd)"
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"

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

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GRIPHOME="$XDG_CONFIG_HOME"/grip fs
export _ZO_EXCLUDE_DIRS="$HOME:$HOME/.local/*:$HOME/.config/*"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export EMACSDIR=$XDG_CONFIG_HOME/emacs
export DOOMDIR=$XDG_CONFIG_HOME/doom
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history
export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"
export WINEPREFIX="$XDG_DATA_HOME"/wine
export LESSHISTFILE="$XDG_STATE_HOME"/less/history
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
