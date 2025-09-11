#!/usr/bin/env fish

#
# ddcutil
# https://github.com/daitj/gnome-display-brightness-ddcutil
sudo modprobe i2c-dev
ddcutil capabilities | grep "Feature: 10"

#
# Flameshot
# allow Flatpak Flameshot to take screenshots
flatpak permission-set screenshot screenshot org.flameshot.Flameshot yes

#
# Fish Completions
atuin gen-completions --shell fish --out-dir ~/.config/fish/completions/
just --completions fish >~/.config/fish/completions/just.fish
rg --generate complete-fish >~/.config/fish/completions/rg.fish

#
# More Binaries
# need explicit destination.
eget idursun/jjui --to ~/.local/bin/jjui

eget getzola/zola

#
# Clean up

# Remove ImageMagick From Dash
sudo rm /usr/share/applications/display-im7.q16.desktop

# Remove bloatware.
out rhythmbox xiterm+thai goldendict-ng hdate-applet fcitx5 mozc-utils-gui firefox-esr thunderbird anthy* shotwell
# Dictionaries
out wbrazilian witalian wfrench wspanish wswedish wcatalan wbulgarian wdanish wngerman wpolish wportuguese

sudo nala autoremove && sudo nala autopurge
