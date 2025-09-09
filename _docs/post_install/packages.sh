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

# nvim
in --assume-yes vim neovim

#
# emacs, jinx
in --assume-yes emacs aspell libenchant-2-dev
cin emacs-lsp-booster
# Those files are unnecessary and occasionally cause me to misclick.
sudo rm -f \
    /usr/share/applications/emacs-term.desktop \
    /usr/share/applications/emacs-mail.desktop \
    /usr/share/applications/emacsclient-mail.desktop \
    /usr/share/applications/emacsclient.desktop

#
# yazi
in --assume-yes ffmpeg 7zip poppler-utils imagemagick
ya pkg add yazi-rs/flavors:catppuccin-mocha
# remove the (in case) duplicate `yazi`
rm ~/.local/bin/yazi

#
# Node
fnm use v24
# To get LTS version, see https://endoflife.date/nodejs
cd ~/opt/nodebin
npm install
