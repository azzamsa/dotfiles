#!/usr/bin/env zsh

eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd)"
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
source "$HOME/.rye/env"
source "$HOME/.cargo/env"
source "$XDG_CONFIG_HOME/broot/launcher/bash/br"

# Broot alias
function br {
    local cmd cmd_file code
    cmd_file=$(mktemp)
    if broot --outcmd "$cmd_file" "$@"; then
        cmd=$(<"$cmd_file")
        command rm -f "$cmd_file"
        eval "$cmd"
    else
        code=$?
        command rm -f "$cmd_file"
        return "$code"
    fi
}

function joshuto() {
	  ID="$$"
	  mkdir -p /tmp/$USER >/dev/null 2>&1
	  OUTPUT_FILE="/tmp/$USER/joshuto-cwd-$ID"
	  env joshuto --output-file "$OUTPUT_FILE" $@
	  exit_code=$?

	  case "$exit_code" in
		    # regular exit
		    0)
			  ;;
		    # output contains current directory
		    101)
			      JOSHUTO_CWD=$(cat "$OUTPUT_FILE")
			      cd "$JOSHUTO_CWD"
			      ;;
		    # output selected files
		    102)
			      ;;
		    *)
			      echo "Exit code: $exit_code"
			      ;;
	  esac
}

export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GRIPHOME="$XDG_CONFIG_HOME"/grip fs
export _ZO_EXCLUDE_DIRS="$HOME:$HOME/.local/*:$HOME/.config/*"
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history
export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"
export WINEPREFIX="$XDG_DATA_HOME"/wine
export LESSHISTFILE="$XDG_STATE_HOME"/less/history
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
