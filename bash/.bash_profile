#!/usr/bin/env bash

# Avoid source loops by only processing this file once
if [[ ! "$BASHPROFILE_LOADED" ]]; then

    case $- in
        *i*) ;;
        *) return;;
        esac

    #echo "╦ ╦┌─┐┬  ┬  ┌─┐  ┌─┐┌─┐┌─┐┌─┐┌┬┐┌─┐┌─┐"
    #echo "╠═╣├┤ │  │  │ │  ├─┤┌─┘┌─┘├─┤│││└─┐├─┤"
    #echo "╩ ╩└─┘┴─┘┴─┘└─┘  ┴ ┴└─┘└─┘┴ ┴┴ ┴└─┘┴ ┴"
    #echo "Welcome $USER! It's now $(date '+%A %B %d %Y %r'), be a good hacker, I LOVE U azzamsa"

    # Add ~/bin and .local/bin to PATH
    PATH+=$HOME/bin:
    [[ -d "$HOME/.local/bin" ]] && PATH+=$HOME/.local/bin

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

    umask 002
       
    # Load the shell dotfiles, and then some:
    for dotfile in ~/.{bash_aliases,bash_prompt,exports,functions}; do
        [ -r "${dotfile}" ] && [ -f "${dotfile}" ] && source "${dotfile}"
    done;
    unset dotfile

fi

BASHPROFILE_LOADED=1
