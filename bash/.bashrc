#!/usr/bin/env bash

PS1='(bash) > '

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Bash history
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export HISTSIZE=100000     # big big history
export HISTFILESIZE=100000 # big big history
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTCONTROL="ignoreboth"
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

#
# Paths
#

export PATH
export PATH=~/opt/bin:~/.local/bin:~/.cargo/bin:$PATH
export PATH=~/opt/nodebin/node_modules/.bin:$PATH

export VISUAL='neovide'
export EDITOR='neovide'
# Nvim complaints about missing $TERM variable
export TERM='xterm-256color'

#
# Apps
#
source "$HOME"/.config/meta/env
eval "$(fnm env --use-on-cd)"

# Use plists for lsp-mode deserialization.
export LSP_USE_PLISTS=true

export ZDOTDIR=~/.config/zsh

# If inside toolbx do something
if [[ "$(hostname)" = "toolbox" ]]; then
	# I don't change my default $SHELL
	# So I need to run my preferred shell at toolbx startup
	zsh
fi

#
# Don't pollute home directory
#

# ⚠ Never change the default cargo and rustup directory
# It will make lsp-mode and eglot rebuild the entire project after each changes!

export EMACSDIR="$XDG_CONFIG_HOME"/emacs
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GRIPHOME="$XDG_CONFIG_HOME"/grip
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"
alias nvidia-settings="nvidia-settings --config=$XDG_CONFIG_HOME/nvidia/settings"
export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history
export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"
export WINEPREFIX="$XDG_DATA_HOME"/wine
export LESSHISTFILE="$XDG_STATE_HOME"/less/history
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export VIRTUALFISH_HOME="$XDG_DATA_HOME"/virtualfish
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo
