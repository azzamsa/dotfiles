#!/usr/bin/env fish

in flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub --assume-yes com.mattjakeman.ExtensionManager

# brightness
in --assume-yes ddcutil
# pano
in --assume-yes gir1.2-gda-5.0 gir1.2-gsound-1.0

#
# Install Main Packages
flatpak install flathub --assumeyes app.zen_browser.zen dev.vencord.Vesktop com.brave.Browser com.github.tchx84.Flatseal org.keepassxc.KeePassXC org.flameshot.Flameshot it.mijorus.gearlever

# Productivity tools
flatpak install flathub --assumeyes com.calibre_ebook.calibre com.github.johnfactotum.Foliate

# Work
flatpak install flathub --assumeyes org.gnome.Evolution org.mozilla.Thunderbird com.usebruno.Bruno io.dbeaver.DBeaverCommunity

# Utilities
flatpak install flathub --assumeyes com.github.finefindus.eyedropper com.github.qarmin.czkawka io.gitlab.news_flash.NewsFlash io.github.flattool.Warehouse com.dec05eba.gpu_screen_recorder net.nokyan.Resources org.atheme.audacious org.audacityteam.Audacity org.gimp.GIMP org.gnome.Firmware org.inkscape.Inkscape org.kde.okular org.telegram.desktop org.gnome.World.PikaBackup org.gramps_project.Gramps

# Office
flatpak install flathub --assumeyes com.github.IsmaelMartinez.teams_for_linux us.zoom.Zoom

# Optionals
# flatpak install flathub --assumeyes org.bleachbit.BleachBit fr.romainvigier.MetadataCleaner com.github.huluti.Curtail
