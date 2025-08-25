# Installation Guide

The steps I need to install Debian GNU/Linux on my machine.

## Current Machine

- EndeavourOS + GNOME

## Preparing The ISO image

Go to the distro’s website and download the **LIVE ISO**, then copy it to your Ventoy USB stick.

Whenever possible, use the provided _torrent_ file to reduce load on the server. Wait until the copying process is **fully** finished.
Otherwise, the file may end up corrupted. After that, verify the checksum:

```shell
sha256sum -c CHECKSUM
```

Copy the ISO using Ventoy. If you run into issues even after verifying the checksum, try another flashing tool such as `Fedora Media Writer` or `BalenaEtcher`.

## Installation

Always preview and double-check the password during installation. You don’t want to repeat the entire process just because of a typo.

Enable encrypted volumes (LUKS). Don’t make life harder by using manual partitioning.
Just go with guided mode and use the full Samsung 250 GB disk. I dedicate a separate disk for installation.
Even though I could split off `/home`, I always make sure to back everything up before reinstalling.
By doing this, I don’t have to worry about accidentally wiping important files.
I also use symlinks to my larger SSD so applications still see everything under `~/` instead of `/media/user/...`.

Stick with the defaults for everything, including locales, to avoid running into edge cases. You can always change the locale later in GNOME settings.

## Upgrade The Os

Use the Endeavour `welcome assistant` helper tool.

## Setting Up Terminal

I hate leaving my prompt.

Copy important files to new machine `~/dot`, `~/.local/share/atuin/`, `~/.local/share/fonts`.
Later, you need to move more directory, See `~/.config/meta/backup.include`

```bash
sudo pacman -S bash git fish
```

Respect XDG.

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

Prompt Tools needs some Rust based tools.

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup default stable
rustup component add rust-analyzer
```

```bash
sudo pacman -S clang mold openssl wl-clipboard

cargo install cargo-binstall
cargo binstall --no-confirm --no-symlinks atuin dotter fnm starship just zoxide
```

Populate the dotfiles.

```bash
cd ~/dot
just deploy # or j p
```

Load the shell.

```bash
bash # Yes, type `bash`!
fish
```

## Setup Bluetooth

```bash
sudo systemctl start bluetooth
sudo systemctl enable bluetooth
```

## Setup GNOME Extensions

I need this early to have smooth access to brightness control and clipboard.

📻 Flatpak apps won’t appear in the desktop menu until after a restart.

Or you can just copy the whole `~/.local/share/gnome-shell/extensions` to the new system, then re-login.

```bash
in flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub --assumeyes com.mattjakeman.ExtensionManager

# brightness & pano
in ddcutil libgda6
```

Login to https://extensions.gnome.org/extension/ and click `install`. It should open Extension Manager App.
It is easier than searching manually inside the Extension manager App.

- [Brightness control using ddcutil](https://extensions.gnome.org/extension/2645/brightness-control-using-ddcutil/).
- [Pano - Clipboard Manager](https://extensions.gnome.org/extension/5278/pano/)
- [Internet Speed Meter](https://extensions.gnome.org/extension/2980/internet-speed-meter/)
- [Lock Keys](https://extensions.gnome.org/extension/36/lock-keys/)
- [AppIndicator and KStatusNotifierItem Support](https://extensions.gnome.org/extension/615/appindicator-support/)
- [Caffeine](https://extensions.gnome.org/extension/517/caffeine/)
- [Burn My Windows](https://extensions.gnome.org/extension/4679/burn-my-windows/)
- [Blur my Shell](https://extensions.gnome.org/extension/3193/blur-my-shell/)
- [Bluetooth Battery Meter](https://extensions.gnome.org/extension/6670/bluetooth-battery-meter/)
- [Auto Move Windows](https://extensions.gnome.org/extension/16/auto-move-windows/)

## Install Apps

💡 I don't want to pollute my base system. Using Flatpak, I can freely remove applications without worrying my system will be broken.

I think I will just use mutable OS an immutable way!

Flatpaks:

```bash
# Main
flatpak install flathub --assumeyes app.zen_browser.zen dev.vencord.Vesktop com.brave.Browser com.github.tchx84.Flatseal org.keepassxc.KeePassXC org.flameshot.Flameshot

# Productivity tools
flatpak install flathub --assumeyes com.calibre_ebook.calibre com.github.johnfactotum.Foliate io.github.AllanChain.sane-break

# Work
flatpak install flathub --assumeyes org.gnome.Evolution org.mozilla.Thunderbird com.usebruno.Bruno io.dbeaver.DBeaverCommunity

# Utilities
flatpak install flathub --assumeyes com.github.finefindus.eyedropper  com.github.qarmin.czkawka io.gitlab.news_flash.NewsFlash io.github.flattool.Warehouse com.dec05eba.gpu_screen_recorder net.nokyan.Resources org.atheme.audacious org.audacityteam.Audacity org.gimp.GIMP org.gnome.Firmware org.inkscape.Inkscape org.kde.okular org.telegram.desktop

# Office
flatpak install flathub --assumeyes com.github.IsmaelMartinez.teams_for_linux us.zoom.Zoom

# Optionals
flatpak install flathub --assumeyes org.bleachbit.BleachBit fr.romainvigier.MetadataCleaner com.github.huluti.Curtail
```

Cargo:

```bash
# Development tool
cin cargo-edit cargo-outdated cargo-tarpaulin bacon dprint git-cliff hurl selene stylua tokei typos-cli watchexec-cli cargo-nextest git-cliff dprint typos-cli

curl -sSf https://rye.astral.sh/get | bash

# Utilities
cin bandwhich bat dua-cli kondo yazi-fm eza typstyle typst-cli

# Flex
cin lolcrab macchina
```

System:

```bash
# yazi
in yazi ffmpeg 7zip jq poppler fd ripgrep fzf resvg imagemagick
in bibata-cursor-theme fastfetch
in telnet pandoc podman

# appimage
in libfuse-dev

# emacs, jinx
in aspell enchant
cin emacs-lsp-booster
```

Python:

```bash
rye install qmk grip poetry
```

Javascript:

```bash
cd ~/opt/nodebin
fnm use <version> # To get LTS version, see https://endoflife.date/nodejs
npm install
```

Binaries:

Install `eget` from https://github.com/zyedidia/eget/releases

```bash
eget idursun/jjui --to ~/.local/bin/jjui
eget kayrus/gof5
eget getzola/zola
```

AppImages:

```bash
flatpak install flathub --assumeyes it.mijorus.gearlever
```

- https://github.com/neovide/neovide/releases
- https://github.com/neovim/neovim/releases
- https://yaak.app/download

## Setup Apps

### Yazi

```bash
# This get both `ya` and `yazi `
ya pkg add yazi-rs/flavors:catppuccin-mocha
```

### Atuin

```bash
atuin login
atuin sync
```

### Emacs

```bash
in emacs
eget rust-lang/rust-analyzer --asset "rust-analyzer-x86_64-unknown-linux-gnu.gz"
git clone git@github.com:azzamsa/camp.d.git ~/.config/emacs

# Those files are unnecessary and occasionally cause me to misclick.
cd /usr/share/applications/
sudo rm emacs-term.desktop emacs-mail.desktop emacsclient-mail.desktop emacsclient.desktop
```

### Neovim

```bash
in nvim
cin toor

git clone git@github.com:azzamsa/roof.git ~/.config/nvim
eget neovide/neovide --to ~/.local/bin/neovide --asset "neovide.AppImage"
```

### Helix

The flatpak version depends on huge `org.freedesktop.Sdk` library.
Use the binary instead.

Take the `helix-<version>-x86_64-linux.tar.xz` from the [release](https://github.com/helix-editor/helix/releases) page.
Unpack, then put `hx` in `~/.local/bin`, `hx.fish` in `~/.config/fish/completions/`, and `runtime` in `~/.config/helix`

### Fish

```bash
atuin gen-completions --shell fish --out-dir ~/.config/fish/completions/
just --completions fish > ~/.config/fish/completions/just.fish
rg --generate complete-fish > ~/.config/fish/completions/rg.fish
```

### Discord / Vesktop (Vencord)

Change the default chat scale.
Then zoom using `Ctrl +`

Enable plugins: `BetterFolders`, `AnonymizeFileName`, `NoReplyMention`, `NoServerEmoji`.

### Firefox

Copy the content from previous machine to `/ect/host` to be able to access certain websites.
Change the default scale to 130%.

### Flameshot

```bash
# allow Flatpak Flameshot to take screenshots
flatpak permission-set screenshot screenshot org.flameshot.Flameshot yes

# Check if it's working as intended.
flatpak run --command=flameshot org.flameshot.Flameshot gui
```

Disable `Show Tray Icon`.

### KeePassXC

Increase the default value of "clear clipboard after" in KeepassXC

### Pano

Enable `Sync to Primary clipboard`.
Increase history limit to `400`.
Disable `Keep search entry`.

## Setting Up DNS

On laptop.

- `Setting` -> `Wifi` -> `DNS`
  - IPv4: `1.1.1.1,1.0.0.1`
  - IPv6: `2606:4700:4700::1111,2606:4700:4700::1001`

## Setup GNOME

### Tweaks

Fonts:

- Interface Text: "Maple Mono NF 13"
- Document Text: "Maple Mono NF 13"
- Monospace Text: "Maple Mono NF 13"
- Hinting : Slight
- Antialiasing: Standard (greyscale)
- Scaling Factor: 1.00

Appearance:

- Cursor: Bibata-Modern-Classic

Startup Applications:

- You know what to add!

Top Bar:

- Only show hour

### Locale

Set time, paper size, and units in British.

Go to `Settings` -> `Region and Languages`. Set format to `United Kingdom`.

### Date & Time

`Settings` -> `Date & Time`.

Enable `Automatic Time Zone`.
Set `Time Format` to `AM/PM`.

### Shortcut / Keymap

Go to `Settings` -> `Keyboard`.

Custom shortcut:

- Flameshot
  - name: `Flameshot`
  - command: `bash -c "flatpak run --command=flameshot org.flameshot.Flameshot gui --raw | wl-copy"`
  - shortcut: `PrtScn`
- Flameshot Screen
  - name: `Flameshot`
  - command: flatpak run --command=flameshot org.flameshot.Flameshot screen
  - shortcut: `Shitf + PrtScn`

Navigations:

Using numbers feels slower and less comfortable given the size of my keyboard

```
Switch to workspace 1    Super+X
Switch to workspace 2    Super+C
Switch to workspace 3    Super+D
Switch to workspace 4    Super+A
```

Alt-Tab per Workspace:

```
Switch Windows           Alt+TAB
Switch Applications      Disabled
```

For more, see [keymaps.conf](https://github.com/azzamsa/dotfiles/blob/master/wm/hypr/keymaps.conf)

### Multitasking

- Workspace: Fixed number. 4 workspaces.
- Application switching: include only applications from the current workspace.
- Multi-monitor: workspace on primary display only.

To prevent Apps to move to the Laptop monitor during suspension, go to `Display` and set it to `Mirror`.

### Text Editor

- Disable "Restore session"

## Clean Up

Remove bloatware.

```bash
out rhythmbox xiterm+thai goldendict hdate-applet fcitx mozc-utils-gui firefox-esr
sudo nala autoremove && sudo nala autopurge
```

## Setup Hardware

### Bluetooth

Orbit trackball: press the DPI button 3s to enter the pair mode.
VXE: press the all tree buttons 3s to enter the pair mode.
Soundcore V20i: it activates pair mode automatically everytime it went out of it case.

## Setup Power Management

⚠ Skip this step if you are on PC.

```bash
out power-profiles-daemon
```

```bash
in tlp tlp-rdw

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

## Setting Up Docker

[Debian | Docker Docs](https://docs.docker.com/engine/install/debian/#uninstall-old-versions)

The version on official repo is too old.
