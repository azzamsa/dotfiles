#!/usr/bin/env bash

# Avoid source loops by only processing this file once
if [[ ! "$BASHPROFILE_LOADED" ]]; then

  #Re-enable for debug of profile commands
  #exec 5> >(logger -t $0)
  #BASH_XTRACEFD="5"
  #PS4='$LINENO: '
  #set -x

  echo "╦ ╦┌─┐┬  ┬  ┌─┐  ┌─┐┌─┐┌─┐┌─┐┌┬┐┌─┐┌─┐"
  echo "╠═╣├┤ │  │  │ │  ├─┤┌─┘┌─┘├─┤│││└─┐├─┤"
  echo "╩ ╩└─┘┴─┘┴─┘└─┘  ┴ ┴└─┘└─┘┴ ┴┴ ┴└─┘┴ ┴"
  echo "Welcome $USER! It's now $(date '+%A %B %d %Y %r'), be a good hacker, I LOVE U azzamsa"

  # Add ~/bin and .local/bin to PATH
  PATH+=$HOME/bin:
  [[ -d "$HOME/.local/bin" ]] && PATH+=$HOME/.local/bin

  # Autocorrect typos in path names when using `cd`
  shopt -s cdspell;

  # append to history, don't overwrite it
  shopt -s histappend

  # Load the shell dotfiles, and then some:
  # * ~/.path can be used to extend `$PATH`.
  # * ~/.extra can be used for other settings you don’t want to commit.
  for dotfile in ~/.{bash_aliases,bash_prompt,exports,functions}; do
      [ -r "${dotfile}" ] && [ -f "${dotfile}" ] && source "${dotfile}"
  done;
  unset dotfile
fi

BASHPROFILE_LOADED=1
