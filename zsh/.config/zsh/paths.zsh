#!/usr/bin/env zsh

path=(
  ~/bin/{private,public}(N)
  ~/.emacs.d/bin(N)
  "$XDG_DATA_HOME"/cargo/bin(N)
  ~/.local/bin(N)
  ~/.nodebin/node_modules/.bin(N)
  $path
)
