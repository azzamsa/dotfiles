#!/usr/bin/env fish

# I prefer to work with `fish` than `bash`
sudo apt install --assume-yes fish

alias in "sudo nala install"
alias out "sudo nala purge"
alias cin "cargo binstall --no-confirm --no-symlinks --secure"
alias cout "cargo remove"
