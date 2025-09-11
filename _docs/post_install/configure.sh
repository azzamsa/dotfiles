#!/usr/bin/env fish

# Atuin
atuin login
atuin sync

# Populate the dotfiles.
just --justfile ~/dot/justfile deploy

#
# Python
curl -sSf https://rye.astral.sh/get | bash
rye install qmk grip poetry python-lsp-server

#
# Node
fnm use v24
# To get LTS version, see https://endoflife.date/nodejs
npm install --prefix ~/opt/nodebin

#
# yazi
ya pkg add yazi-rs/flavors:catppuccin-mocha
# remove the (in case) duplicate `yazi`
rm ~/.local/bin/yazi

#
# ddcutil
# https://github.com/daitj/gnome-display-brightness-ddcutil
sudo modprobe i2c-dev
# ddcutil capabilities | grep "Feature: 10"

#
# Flameshot
# allow Flatpak Flameshot to take screenshots
flatpak permission-set screenshot screenshot org.flameshot.Flameshot yes
# Check if it's working as intended.
# flatpak run --command=flameshot org.flameshot.Flameshot gui

#
# Fish Completions
atuin gen-completions --shell fish --out-dir ~/.config/fish/completions/
just --completions fish >~/.config/fish/completions/just.fish
rg --generate complete-fish >~/.config/fish/completions/rg.fish

#
# More Binaries
eget idursun/jjui --to ~/.local/bin/jjui
eget getzola/zola

#
# Emacs

# Those files are unnecessary and occasionally cause me to misclick.
sudo rm -f \
    /usr/share/applications/emacs-term.desktop \
    /usr/share/applications/emacs-mail.desktop \
    /usr/share/applications/emacsclient-mail.desktop \
    /usr/share/applications/emacsclient.desktop
# Debian use `Emacs (GUI)`
sudo sed -i 's/^Name=Emacs (GUI)$/Name=Emacs/' /usr/share/applications/emacs.desktop

# Remove ImageMagick From Dash
sudo rm /usr/share/applications/display-im7.q16.desktop

# Remove bloatware.
set -l pkgs \
    rhythmbox xiterm+thai goldendict-ng hdate-applet fcitx5 mozc-utils-gui firefox-esr \
    thunderbird anthy* shotwell \
    # Dictionaries
    wbrazilian witalian wfrench wspanish wswedish wcatalan wbulgarian wdanish \
    wngerman wpolish wportuguese

for pkg in $pkgs
    sudo nala purge $pkg
end

sudo nala autoremove && sudo nala autopurge
