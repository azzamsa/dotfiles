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
sudo dnf install --assumeyes bash git stow fish
```

Populate the dotfiles.

```bash
cd ~/dotfiles
stow --no-folding --restow git zellij fish bash
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
# main
flatpak install flathub --assumeyes com.github.tchx84.Flatseal org.gnome.seahorse.Application org.keepassxc.KeePassXC

# productivity
flatpak install flathub --assumeyes com.calibre_ebook.calibre com.github.johnfactotum.Foliate com.logseq.Logseq com.rafaelmardojai.Blanket

# utilities
flatpak install flathub --assumeyes com.brave.Browser com.github.qarmin.czkawka com.github.tenderowl.frog com.github.tenderowl.frog com.gitlab.newsflash fr.romainvigier.MetadataCleaner io.dbeaver.DBeaverCommunity io.github.seadve.Kooha org.atheme.audacious org.audacityteam.Audacity org.bleachbit.BleachBit org.gimp.GIMP org.gnome.Firmware org.gramps_project.Gramps org.inkscape.Inkscape org.kde.okular org.mozilla.Thunderbird org.telegram.desktop org.videolan.VLC rest.insomnia.Insomnia

# office
flatpak install flathub --assumeyes com.github.IsmaelMartinez.teams_for_linux us.zoom.Zoom
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

## Setup Rust Tooling

```bash
rm ~/.cargo/bin/rust-analyzer

eget rust-lang/rust-analyzer --to ~/.local/bin --asset "rust-analyzer-x86_64-unknown-linux-gnu.gz"
```

To use `mold` as the default linker, put the code below to `.cargo/config`.

```toml
# https://github.com/rui314/mold#how-to-use
[target.x86_64-unknown-linux-gnu]
linker = "clang"
rustflags = ["-C", "link-arg=-fuse-ld=/usr/bin/mold"]
```

## Setup Python Tooling

```bash
python3 -m pip install --user qmk grip poetry
python3 -m pip install --user black python-lsp-server
```

## Setup Toolbx

Setup `daily` container.

```bash
toolbox enter daily
toolbox run -c daily sudo dnf install --assumeyes fish yt-dlp pandoc ShellCheck
```

## Install More Apps

```bash
sudo dnf install --assumeyes aspell-id copyq gnome-tweaks workrave

sudo dnf install --assumeyes jq podman-compose telnet

# More codecs
sudo dnf config-manager --set-enabled fedora-cisco-openh264
sudo dnf install --assumeyes gstreamer1-plugin-openh264
```

```bash
# Javascript
fnm use v18
```

```bash
# rust development tool
cargo binstall --no-confirm --no-symlinks cargo-edit cargo-machete cargo-nextest cargo-outdated cargo-tarpaulin cargo-watch dprint git-cliff git-cliff hurl just tokei watchexec-cli

# utilities
cargo binstall --no-confirm --no-symlinks bandwhich bat dua-cli kondo rust-script stylua
```

## Install More GNOME Extensions

Login to https://extensions.gnome.org/extension/ and click `install`. It should open Extension Manager App.
It is easier than searching manually inside the Extension manager App.

- [Internet Speed Meter - GNOME bash Extensions](https://extensions.gnome.org/extension/2980/internet-speed-meter/)
- [Lock Keys - GNOME bash Extensions](https://extensions.gnome.org/extension/36/lock-keys/)
- [AppIndicator and KStatusNotifierItem Support - GNOME bash Extensions](https://extensions.gnome.org/extension/615/appindicator-support/)

## Install Binaries Manually

Install eget from https://github.com/zyedidia/eget/releases

```bash
eget junegunn/fzf --to ~/.local/bin
eget restic/restic --to ~/.local/bin
eget rui314/mold --to ~/.local/bin
```

## Setup Apps

### Emacs

Compile the latest Emacs from the source. You know how to do it. Then copy the appropriate `emacs.desktop` file.

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

## CopyQ

Change the `Exec` line in `/usr/share/applications/com.github.hluk.copyq.desktop`.

```diff
-Exec=copyq --start-server show
+Exec=env QT_QPA_PLATFORM=xcb copyq --start-server show
```

Add CopyQ commands.

```
[Command]
Name=Play Sound on Copy
Automatic=true
Command="
    copyq:
    if ( isClipboard() )
      execute('pw-play', '/usr/share/sounds/gnome/default/alerts/click.ogg')"
Icon=\xf028
```

## Setting Up DNS

On laptop.

- `Setting` -> `Wifi` -> `DNS`
  - IPv4: `1.1.1.1`, `1.0.0.1`
  - IPv6: `2606:4700:4700::1111`, `2606:4700:4700::1001`

## Modify GNOME Settings

### Tweaks

Fonts:

- Interface Text: "Cantarell Regular 12"
- Document Text: "Cantarell Regular 12"
- Monospace Text: "Iosevka Nerd Font Regular 12"
- Legacy Window Titles: "Cantarell Bold 12"
- Hinting : Slight
- Antialiasing: Standard (greyscale)
- Scaling Factor: 1.00

Startup Applications:

- You know what to add!

Top Bar:

- Only show hour

### Format

Set time, paper size, and units in British.

Go to `Settings` -> `Region and Languages`. Set format to `United Kingdom`.

### Keyboard

Go to `Settings` -> `Keyboard`.

- Navigation
  - Move to workspace on the left: Ctrl + Tab (Super + PageUp)
  - Move to workspace on the right: Ctrl + Alt + Tab (Super + PageUp)
  - Switch Windows: Alt + Tab
- Wondows
  - Close windows: Super + Shift + Q (Super + F4)
- Flameshot
  - name: Flameshot
  - command: flameshot gui
  - shortcut: PrtScn

### Multitasking

- Workspace: Fixed number. 4 workspaces.
- Application switching: include only applications from the current workspace.
- Multi-monitor: workspace on primary display only.

To prevent Apps to move to the Laptop monitor during suspension, go to `Display` and set it to `Mirror`.

### Text Editor

- Disable "Restore session"

## Polish

### Populate other dotfiles

```bash
cd ~/dotfiles
stow --no-folding --restow gnupg starship
```

### Setup apps

```bash
broot --install
br
```

```bash
atuin gen-completions --shell fish --out-dir ~/.config/fish/completions/
```

More:

- Increase the default value of "clear clipboard after" in KeepassXC
- Change Pano keys from `Super + Shift + V` to `Ctrl + Alt + P`

## Copy all previous app data

Take a look at `~/.config/meta/backup.include`

## Clean Up

Remove unnecessary bash configuration.
