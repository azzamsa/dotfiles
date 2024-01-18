#!/usr/bin/env bash

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# append to history, don't overwrite it
shopt -s histappend

# adding bash completion
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
