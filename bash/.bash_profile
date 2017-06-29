#!/usr/bin/env bash

echo "╦ ╦┌─┐┬  ┬  ┌─┐  ┌─┐┌─┐┌─┐┌─┐┌┬┐┌─┐┌─┐"
echo "╠═╣├┤ │  │  │ │  ├─┤┌─┘┌─┘├─┤│││└─┐├─┤"
echo "╩ ╩└─┘┴─┘┴─┘└─┘  ┴ ┴└─┘└─┘┴ ┴┴ ┴└─┘┴ ┴"
echo "Welcome $USER! It's now $(date '+%A %B %d %Y %r'), be a good hacker, I LOVE U azzamsa"

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_aliases,bash_prompt,exports,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
    break;
done;
unset file;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# append to history, don't overwrite it
shopt -s histappend





