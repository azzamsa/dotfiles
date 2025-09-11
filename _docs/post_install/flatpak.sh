#!/usr/bin/env fish

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

#
# Setup Core Packages
set -l pkgs \
    app.zen_browser.zen ca.desrt.dconf-editor com.audacityteam.Audacity com.brave.Browser \
    com.calibre_ebook.calibre com.dec05eba.gpu_screen_recorder com.github.IsmaelMartinez.teams_for_linux \
    com.github.finefindus.eyedropper com.github.johnfactotum.Foliate com.github.qarmin.czkawka \
    com.github.tchx84.Flatseal com.mattjakeman.ExtensionManager com.usebruno.Bruno \
    dev.vencord.Vesktop io.dbeaver.DBeaverCommunity io.github.flattool.Warehouse \
    io.github.pieterdd.StretchBreak io.gitlab.news_flash.NewsFlash it.mijorus.gearlever \
    net.nokyan.Resources org.atheme.audacious org.flameshot.Flameshot org.gimp.GIMP \
    org.gnome.Evolution org.gnome.Firmware org.gnome.World.PikaBackup org.inkscape.Inkscape \
    org.keepassxc.KeePassXC org.kde.okular org.mozilla.Thunderbird org.telegram.desktop us.zoom.Zoom

for pkg in $pkgs
    flatpak install flathub --assumeyes $pkg
end

# Optionals
# org.gramps_project.Gramps org.bleachbit.BleachBit fr.romainvigier.MetadataCleaner com.github.huluti.Curtail
