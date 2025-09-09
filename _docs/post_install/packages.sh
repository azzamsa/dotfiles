#!/usr/bin/env fish

#
# Python
curl -sSf https://rye.astral.sh/get | bash
rye install qmk grip poetry

#
# Cargo
cargo install --locked cargo-nextest

cin cargo-update cargo-edit cargo-outdated cargo-tarpaulin bacon dprint git-cliff hurl selene stylua tokei typos-cli watchexec-cli git-cliff dprint typos-cli jaq

# Utilities
cin bandwhich bat dua-cli kondo yazi-fm eza typstyle typst-cli

# Flex
cin lolcrab macchina

#
# System
in --assume-yes gnome-tweaks bibata-cursor-theme gnome-shell-pomodoro fastfetch
# pandoc will pull a whopping `199.2 MB` deps, because it so powerful it pull latex and everything.
in --assume-yes jq fd-find ripgrep fzf telnet pandoc podman podman-compose shfmt
# appimage
in --assume-yes libfuse-dev

# emacs, jinx
in --assume-yes vim neovim
in --assume-yes emacs aspell libenchant-2-dev
cin emacs-lsp-booster

# yazi
in --assume-yes ffmpeg 7zip poppler-utils imagemagick

#
# Node
fnm use v24
# To get LTS version, see https://endoflife.date/nodejs
cd ~/opt/nodebin
npm install
