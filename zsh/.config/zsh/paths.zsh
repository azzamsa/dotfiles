#!/usr/bin/env zsh

path=(
  "$HOME"/opt/bin(N)
  "$HOME"/.local/bin(N)
  "$HOME"/opt/nodebin/node_modules/.bin(N)
  "$XDG_DATA_HOME"/cargo/bin(N)
  "$XDG_DATA_HOME"/rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin(N)
  "$HOME"/.rye/shims(N)
  $path
)
