#!/usr/bin/env bash

in() {
	sudo nala install "$@"
}

out() {
	sudo nala purge "$@"
}

cin() {
	cargo binstall --no-confirm --no-symlinks --secure "$@"
}

cout() {
	cargo remove "$@"
}

#
# Setup Nala

sudo apt install --assume-yes nala
# Find the fastest mirrors.
sudo nala fetch
# Upgrade The Os
sudo nala update && sudo nala upgrade

#
# Setup Core Packages
sudo nala install --assume-yes bash git fish

#
# Setup XDG
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

mkdir -p "$XDG_DATA_HOME"
mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$XDG_STATE_HOME"
mkdir -p "$XDG_CACHE_HOME"

mkdir -p "$HOME"/.config/meta
touch "$HOME"/.config/meta/env

mkdir -p "$XDG_STATE_HOME"/bash
touch "$XDG_STATE_HOME"/bash/history

#
# Setup Rust
# Prompt Tools needs some Rust based tools.
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup default stable
rustup component add rust-analyzer
. .local/share/cargo/env

#
# Setup Prompt

sudo nala install --assume-yes clang mold libssl-dev
sudo nala install --assume-yes zoxide wl-clipboard

cargo install cargo-binstall
cargo binstall --no-confirm --no-symlinks atuin dotter fnm starship just jj-cli

# Populate the dotfiles.
just --justfile ~/dot/justfile deploy
