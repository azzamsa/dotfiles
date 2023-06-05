#!/usr/bin/env zsh

path=(
  ~/.local/bin(N)
  ~/opt/nodebin/node_modules/.bin(N)
  "$XDG_CONFIG_HOME"/emacs/bin(N)
  "$XDG_DATA_HOME"/cargo/bin(N)
  "$XDG_DATA_HOME"/rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin(N)
  "$HOME"/.rye/env(N)
  $path
)
