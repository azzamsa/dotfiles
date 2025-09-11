#!/usr/bin/env fish

#
# Polish

# GNOME Tweak
gsettings set org.gnome.desktop.interface font-name "Atkinson Hyperlegible Next 13"
gsettings set org.gnome.desktop.interface document-font-name "Atkinson Hyperlegible Next 13"
gsettings set org.gnome.desktop.interface monospace-font-name "Maple Mono NF 13"
gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Ice

# Characters
gsettings set org.gnome.Characters recent-characters "['🎉', '🏖️', '🧁', '🙏🏻']"

#
# Keybindings

# Using numbers feels slower and less comfortable given the size of my keyboard

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>x']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>c']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>d']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>r']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "[]"

dconf write /org/gnome/shell/extensions/auto-move-windows/application-list ['dev.vencord.Vesktop.desktop:3', 'app.zen_browser.zen.desktop:2']
