#!/usr/bin/env bash

exec 5> >(logger -t $0)
BASH_XTRACEFD="5"
PS4='$LINENO: '
set -x

echo "╦ ╦┌─┐┬  ┬  ┌─┐  ┌─┐┌─┐┌─┐┌─┐┌┬┐┌─┐┌─┐"
echo "╠═╣├┤ │  │  │ │  ├─┤┌─┘┌─┘├─┤│││└─┐├─┤"
echo "╩ ╩└─┘┴─┘┴─┘└─┘  ┴ ┴└─┘└─┘┴ ┴┴ ┴└─┘┴ ┴"
echo "Welcome $USER! It's now $(date '+%A %B %d %Y %r'), be a good hacker, I LOVE U azzamsa"

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for dotfile in ~/.{bash_aliases,bash_prompt,exports,functions}; do
    [ -r "${dotfile}" ] && [ -f "${dotfile}" ] && source "${dotfile}"
done;
unset dotfile

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# append to history, don't overwrite it
shopt -s histappend





