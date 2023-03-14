#!/usr/bin/env zsh

path=(
  ~/.local/bin(N)
  ~/opt/bin/{private,public}(N)
  ~/opt/nodebin/node_modules/.bin(N)
  "$XDG_CONFIG_HOME"/emacs/bin(N)
  "$XDG_DATA_HOME"/cargo/bin(N)
  $path
)
