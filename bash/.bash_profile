#!/usr/bin/env bash

# Avoid source loops by only processing this file once
if [[ ! "$BASHPROFILE_LOADED" ]]; then

    case $- in
        *i*) ;;
        *) return;;
        esac

    # Autocorrect typos in path names when using `cd`
    shopt -s cdspell;

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

    # Load the shell dotfiles, and others
    for dotfile in ~/.{bash_aliases,bash_prompt,exports,functions,secrets}; do
        [ -r "${dotfile}" ] && [ -f "${dotfile}" ] && source "${dotfile}"
    done;
    unset dotfile

fi

BASHPROFILE_LOADED=1
