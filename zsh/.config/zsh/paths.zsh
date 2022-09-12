#!/usr/bin/env zsh

path=(
  ~/bin/{private,public}(N)
  ~/.emacs.d/bin(N)
  ~/.cargo/bin(N)
  ~/.local/bin(N)
  ~/.nodebin/node_modules/.bin(N)
  $path
)
