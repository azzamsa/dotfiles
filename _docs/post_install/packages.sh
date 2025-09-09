#!/usr/bin/env bash

read -p "Have you put 'eget, ya' in '~/.local/bin'? (y/n): " answer

#
# Flatpaks
in flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub --assume-yes com.mattjakeman.ExtensionManager

# brightness
in --assume-yes ddcutil
# pano
in --assume-yes gir1.2-gda-5.0 gir1.2-gsound-1.0

#
# Install Main Packages
flatpak install flathub --assumeyes app.zen_browser.zen dev.vencord.Vesktop com.brave.Browser com.github.tchx84.Flatseal org.keepassxc.KeePassXC org.flameshot.Flameshot

# Productivity tools
flatpak install flathub --assumeyes com.calibre_ebook.calibre com.github.johnfactotum.Foliate

# Work
flatpak install flathub --assumeyes org.gnome.Evolution org.mozilla.Thunderbird com.usebruno.Bruno io.dbeaver.DBeaverCommunity

# Utilities
flatpak install flathub --assumeyes com.github.finefindus.eyedropper com.github.qarmin.czkawka io.gitlab.news_flash.NewsFlash io.github.flattool.Warehouse com.dec05eba.gpu_screen_recorder net.nokyan.Resources org.atheme.audacious org.audacityteam.Audacity org.gimp.GIMP org.gnome.Firmware org.inkscape.Inkscape org.kde.okular org.telegram.desktop

# Office
flatpak install flathub --assumeyes com.github.IsmaelMartinez.teams_for_linux us.zoom.Zoom

# Optionals
flatpak install flathub --assumeyes org.bleachbit.BleachBit fr.romainvigier.MetadataCleaner com.github.huluti.Curtail org.gramps_project.Gramps org.gnome.World.PikaBackup

#
# Cargo
cin cargo-update cargo-edit cargo-outdated cargo-tarpaulin bacon dprint git-cliff hurl selene stylua tokei typos-cli watchexec-cli git-cliff dprint typos-cli jaq
cargo install --locked cargo-nextest

curl -sSf https://rye.astral.sh/get | bash

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
# Python
rye install qmk grip poetry

#
# Node
fnm use v24
# To get LTS version, see https://endoflife.date/nodejs
cd ~/opt/nodebin
npm install
