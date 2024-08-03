# Installation Guide

The steps I need to install Debian GNU/Linux on my machine.

## Current Machine

- Fedora + GNOME

## Preparing The ISO image

Go to the Distro website. Grab the GNOME-flavored ISO, and copy it to your Ventoy USB stick.

⚠ Wait until the copying process is **completely** finished. Otherwise, the file will be corrupted. Make sure to run `sha5sum`.

⚠ Always show the password during the prompt. You don't want to repeat the whole process just because you make a typo.

💡 if you get `nouveau` error during login. Rebot, then append `nouveau.modeset=0` in the grub setting. Usually after `rgb quite`. Press `e` to get into it (in case you forget).
The parameter above also helps if you have any login related error after NVIDIA proprietary driver installation.

## Upgrade The Os

```bash
sudo dnf update
```

Also, use `software center` to upgrade other components.

## Setting Up Terminal

I hate leaving my prompt.

### Default bash

Copy the `dotfile` directory to the new machine.

```bash
sudo dnf install --assumeyes bash git fish
```

Populate the dotfiles.

```bash
cd ~/dotfiles
dotter deploy
```

Make sure bash doesn't fail to load.

```bash
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
```

Load `bash`.

```bash
bash # Yes, type `bash`!
```

### Prompt Tools

```bash
export CARGO_HOME="$XDG_DATA_HOME"/cargo

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup default stable
```

```bash
sudo dnf install --assumeyes clang

cargo install cargo-binstall
cargo binstall --no-confirm --no-symlinks atuin fnm starship zellij zoxide
```

## I hate brightness

```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub --assumeyes com.mattjakeman.ExtensionManager
```

Install [Brightness control](https://extensions.gnome.org/extension/2645/brightness-control-using-ddcutil/).

## Use Flatpak Version

💡 I don't want to pollute my base system. Using Flatpak, I can freely remove applications without worrying my system will be broken.

I think I will just use mutable OS an immutable way!

```bash
# Main
flatpak install flathub --assumeyes com.github.tchx84.Flatseal org.gnome.seahorse.Application org.keepassxc.KeePassXC

# Productivity tools
flatpak install flathub --assumeyes com.calibre_ebook.calibre com.github.johnfactotum.Foliate com.logseq.Logseq

# Work
flatpak install flathub --assumeyes org.gnome.Evolution org.mozilla.Thunderbird com.usebruno.Bruno io.dbeaver.DBeaverCommunity rest.insomnia.Insomnia

# Utilities
flatpak install flathub --assumeyes com.github.finefindus.eyedropper com.github.huluti.Curtail com.github.qarmin.czkawka com.github.tenderowl.frog com.gitlab.newsflash fr.romainvigier.MetadataCleaner io.github.adrienverge.PhotoCollage io.github.flattool.Warehouse com.dec05eba.gpu_screen_recorder net.nokyan.Resources org.atheme.audacious org.audacityteam.Audacity org.bleachbit.BleachBit org.gimp.GIMP org.gnome.Firmware org.gnome.Fractal org.gramps_project.Gramps org.inkscape.Inkscape org.kde.okular org.telegram.desktop org.videolan.VLC

# Office
flatpak install flathub --assumeyes com.github.IsmaelMartinez.teams_for_linux us.zoom.Zoom

# Emergency
flatpak install flathub --assumeyes com.brave.Browser
```

## Setup Power Management

⚠ Skip this step if you are on PC.

```bash
sudo dnf remove power-profiles-daemon
```

```bash
sudo dnf install --assumeyes tlp tlp-rdw

sudo systemctl enable tlp.service
sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket
```

Configure `/etc/tlp.conf`.

```diff
-STOP_CHARGE_THRESH_BAT0=60
+STOP_CHARGE_THRESH_BAT0="1"
```

Start `TLP`.

```bash
sudo tlp start
sudo tlp-stat -s -c -b
```

## Setup Python Tooling

```bash
python3 -m pip install --user qmk grip poetry
```

## Setup Toolbx

Setup `daily` container.

```bash
toolbox enter daily

# Main prompt
toolbox run -c daily sudo dnf install --assumeyes fish zsh

toolbox run -c daily sudo dnf install --assumeyes yt-dlp ffmpeg
```

## Install More Apps

```bash
sudo dnf install --assumeyes aspell-id gnome-tweaks workrave

sudo dnf install --assumeyes jq podman-compose telnet

# More codecs
sudo dnf config-manager --set-enabled fedora-cisco-openh264
sudo dnf install --assumeyes gstreamer1-plugin-openh264
```

```bash
# Javascript
fnm use <version> # To get LTS version, see https://endoflife.date/nodejs
```

```bash
# Development tool
cargo binstall --no-confirm --no-symlinks cargo-edit cargo-nextest cargo-outdated cargo-tarpaulin dprint git-cliff git-cliff hurl just selene stylua tokei typos-cli watchexec-cli rye

# Utilities
cargo binstall --no-confirm --no-symlinks bandwhich bat dua-cli kondo yazi-fm

# Flex
cargo binstall --no-confirm --no-symlinks lolcrab macchina
```

## Install More GNOME Extensions

Login to https://extensions.gnome.org/extension/ and click `install`. It should open Extension Manager App.
It is easier than searching manually inside the Extension manager App.

- [Pano - Clipboard Manager - GNOME Shell Extensions](https://extensions.gnome.org/extension/5278/pano/)
- [Internet Speed Meter - GNOME bash Extensions](https://extensions.gnome.org/extension/2980/internet-speed-meter/)
- [Lock Keys - GNOME bash Extensions](https://extensions.gnome.org/extension/36/lock-keys/)
- [AppIndicator and KStatusNotifierItem Support - GNOME bash Extensions](https://extensions.gnome.org/extension/615/appindicator-support/)
- [Caffeine - GNOME Shell Extensions](https://extensions.gnome.org/extension/517/caffeine/)
- [Wallpaper Slideshow - GNOME Shell Extensions](https://extensions.gnome.org/extension/6281/wallpaper-slideshow/)
- [Burn My Windows - GNOME Shell Extensions](https://extensions.gnome.org/extension/4679/burn-my-windows/)
- [Blur my Shell - GNOME Shell Extensions](https://extensions.gnome.org/extension/3193/blur-my-shell/)

## Install Binaries Manually

Install `eget` from https://github.com/zyedidia/eget/releases

```bash
eget junegunn/fzf --to ~/.local/bin
eget rui314/mold --to ~/.local/bin
eget getzola/zola --to ~/.local/bin
eget neovide/neovide --to ~/.local/bin/neovide --asset "neovide.AppImage"
```

## Setup Apps

## Firefox

Add the IP list to `/etc/host`. You know how to do it.

### Workrave

Set the timers to:

- Each 20 minutes of work, take 5 minutes rest.
- Each 3 hours of work, take 1-hour rest.

Update the `Exec` line in `/usr/share/applications/workrave.desktop`. Otherwise, the tray icon is not displayed.

```diff
+Exec=workrave
+Exec=env GDK_BACKEND="x11" workrave
```

## Flameshot

Change the `Exec` line in `/usr/share/applications/org.flameshot.Flameshot.desktop`.

```diff
[Desktop Entry]
-Exec=flameshot
+Exec=/home/user/.local/bin/nflameshot

[Desktop Action Configure]
-Exec=flameshot config
+Exec=/home/user/.local/bin/nflameshot config

[Desktop Action Capture]
-Exec=flameshot gui --delay 500
+Exec=/home/user/.local/bin/nflameshot gui --delay 500

[Desktop Action Launcher]
-Exec=flameshot launcher
+Exec=/home/user/.local/bin/nflameshot launcher
```

## Setting Up DNS

On laptop.

- `Setting` -> `Wifi` -> `DNS`
  - IPv4: `1.1.1.1`, `1.0.0.1`
  - IPv6: `2606:4700:4700::1111`, `2606:4700:4700::1001`

## Modify GNOME Settings

### Tweaks

```bash
# https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/
sudo dnf install --assumeyes papirus-icon-theme

# https://github.com/ful1e5/Bibata_Cursor
```

Fonts:

- Interface Text: "JetBrains Mono Nerd Font Regular 13"
- Document Text: "JetBrains Mono Nerd Font Regular 12"
- Monospace Text: "JetBrains Mono Nerd Font Regular 12"
- Legacy Window Titles: "Cantarell Bold 12"
- Hinting : Slight
- Antialiasing: Standard (greyscale)
- Scaling Factor: 1.00

Appearance:

- Cursor: Bibata-Modern-Classic
- Icons: Papirus-Dark

Startup Applications:

- You know what to add!

Top Bar:

- Only show hour

### Format

Set time, paper size, and units in British.

Go to `Settings` -> `Region and Languages`. Set format to `United Kingdom`.

### Keyboard

Go to `Settings` -> `Keyboard`.

- Flameshot
  - name: Flameshot
  - command: /home/user/.local/bin/nflameshot gui
  - shortcut: PrtScn

I always use the same keybindings. See [keymaps.conf](https://github.com/azzamsa/dotfiles/blob/master/wm/hypr/keymaps.conf)

### Multitasking

- Workspace: Fixed number. 4 workspaces.
- Application switching: include only applications from the current workspace.
- Multi-monitor: workspace on primary display only.

To prevent Apps to move to the Laptop monitor during suspension, go to `Display` and set it to `Mirror`.

### Text Editor

- Disable "Restore session"

## Polish

### Setup apps

```bash
broot --install
br
```

```bash
atuin gen-completions --shell fish --out-dir ~/.config/fish/completions/
just --completions fish > ~/.config/fish/completions/just.fish
```

More:

- Increase the default value of "clear clipboard after" in KeepassXC

## Copy all previous app data

Take a look at `~/.config/meta/backup.include`

## Clean Up

- Remove unnecessary bash configuration.
- Remove uninteresting default apps

```bash
sudo dnf remove gnome-maps
```
