#!/usr/bin/env zsh

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

# nnn
if (( $+commands[nnn] )); then
  export NNN_BMS="p:$HOME/projects;t:/tmp/"
fi

n ()
{
    # Block nesting of nnn in subshells
    if [[ "${NNNLVL:-0}" -ge 1 ]]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The backslash allows one to alias n to nnn if desired without making an
    # infinitely recursive alias
    \nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# zoxide
if (( $+commands[zoxide] )); then
  export _ZO_EXCLUDE_DIRS="$HOME:$HOME/.local/*:$HOME/.config/*"
fi

if (( $+commands[cargo] )); then
    export CARGO_HOME="$XDG_DATA_HOME"/cargo
fi

if (( $+commands[gpg] )); then
    export GNUPGHOME="$XDG_DATA_HOME"/gnupg
fi

if (( $+commands[grip] )); then
    export GRIPHOME="$XDG_CONFIG_HOME"/grip fs
fi

if (( $+commands[rustup] )); then
    export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
fi

if (( $+commands[emacs] )); then
    export EMACSDIR=$XDG_CONFIG_HOME/emacs
    export DOOMDIR=$XDG_CONFIG_HOME/doom
fi

if (( $+commands[wget] )); then
    alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
fi

if (( $+commands[sqlite3] )); then
    export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history
fi

if (( $+commands[psql] )); then
    export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"
fi

export WINEPREFIX="$XDG_DATA_HOME"/wine
export LESSHISTFILE="$XDG_STATE_HOME"/less/history
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
