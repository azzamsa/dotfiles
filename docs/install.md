# Installation Guide

The steps I need to install GNU/Linux to my machine.

## Current Machine

- 80TU Lenovo ideapad 310-14IKB + NVIDIA GeForce 920MX
- Fedora Workstation

## Preparing The ISO image

Go to Fedora website. Grab the Workstation ISO, and copy it to your Ventoy USB stick.

⚠ Wait until the copying proccess is **completely** finished. Otherwise, the file will be corrupted. Make sure to run `sha5sum`.

Follow the regular installation proccess. Make sure you choose 1) Automatic Partition, and 2) Encrypt partition.

⚠ Always show the password during the prompt. You don't want to repeat the whole procces just because you make a typo.

💡 if you get `nouveau` error during login. Rebot, then append `nouveau.modeset=0` in the grub setting. Press `E` to get into it (in case you forget).
The parameter above also helps if you have any login related error after NVIDIA proprietary driver installation.

## Upgrade The Os

```bash
sudo dnf update
```

## Setting Up Terminal

I hate leaving my prompt.

### Default bash

Copy the `dotfile` directory to the new machine.

```bash
# util-linux-user contains `chsh`
sudo dnf install --assumeyes git stow util-linux-user zsh
```

Populate the dotfiles.

```bash
cd ~/dotfiles
stow --no-folding --restow git zellij zsh
```

Change the default bash.

```bash
sudo chsh -s "$(which zsh)"
```

If this is your first time setting up zsh
copy the code below to `~/.zshenv`

```bash
ZDOTDIR=~/.config/zsh
source -- "$ZDOTDIR"/.zshenv
```

⚠ The default bash won't change if you don't log out.

### Prompt Tools

```bash
export CARGO_HOME="$XDG_DATA_HOME"/cargo

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup default stable

cargo install cargo-binstall

cargo binstall --no-confirm --no-symlinks atuin fnm starship zellij zoxide
```

### Look and Feel

Get `Iosevka Nerd Fonts` from your previous machine or https://github.com/ryanoasis/nerd-fonts/releases, then copy to `~/.local/share/fonts/`.
Use [Gogh](https://github.com/Gogh-Co/Gogh/) to change theme.

```bash
bash -c  "$(curl -sLo- https://git.io/vQgMr)"
```

Choose "Dacula (53)" as theme, and "Iosevka Nerd Font 18"

## I hate brightness

Install [Soft Brightness Plus](https://extensions.gnome.org/extension/5943/soft-brightness-plus/).

```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install --assumeyes flathub com.mattjakeman.ExtensionManager
```

Open extension manager and install Soft Brigthness.

## Install GPU Drivers

```bash
# ⚠ don't skip this step. Otherwise you get other version and your card didn't work
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusio
n.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda
```

## Use Flatpak Version

💡 I don't want to pollute my base system. Using flatpak, I can freely remove application without worrying my system will be breaks.

I learn it hard way. I remove one of my Qt project dependency, and suddenly my GNOME network manager is gone. I tried Fedora Silverblue for 107 days.
It is not my cup of tea. 1) Many application assume it runs on non-containerized environment. Failed to read env variables, font, sending singal, etc. 2) Flashing my qmk keyboard from containerized env doesn't work 3) My company uses a VPN app that writes to `/usr` which is unwritable.

I think I will just use mutable OS the immutable way!

```bash
# main
flatpak install --assumeyes com.github.tchx84.Flatseal org.gnome.seahorse.Application org.keepassxc.KeePassXC org.mozilla.firefox

# productivity
flatpak install --assumeyes com.calibre_ebook.calibre com.github.johnfactotum.Foliate com.logseq.Logseq com.rafaelmardojai.Blanket

# utilities
flatpak install --assumeyes com.github.qarmin.czkawka com.brave.Browser fr.romainvigier.MetadataCleaner io.dbeaver.DBeaverCommunity io.github.seadve.Kooha org.atheme.audacious org.audacityteam.Audacity org.bleachbit.BleachBit org.gimp.GIMP org.gnome.FileRoller org.gnome.Firmware org.gramps_project.Gramps org.inkscape.Inkscape org.kde.okular org.libreoffice.LibreOffice org.mozilla.Thunderbird org.telegram.desktop org.videolan.VLC rest.insomnia.Insomnia

# office
flatpak install --assumeyes com.github.IsmaelMartinez.teams_for_linux us.zoom.Zoom

sudo dnf remove rhythmbox firefox libreoffice*
```

## Setup Battery Management

```bash
sudo dnf remove power-profiles-daemon

sudo systemctl enable tlp.service
sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket

# set `STOP_CHARGE_THRESH_BAT0="1"` in `/etc/tlp.conf``
sudo tlp start
sudo tlp-stat -s -c -b
```

## Setup Rust Tooling

```bash
rustup component add rust-analyzer
# rustup which --toolchain stable rust-analyzer
```

To use `mold` as default linker, put the code below to `.cargo/config`.

```toml
# https://github.com/rui314/mold#how-to-use
[target.x86_64-unknown-linux-gnu]
linker = "clang"
rustflags = ["-C", "link-arg=-fuse-ld=/usr/bin/mold"]
```

## Setup Python Tooling

```bash
curl -sSf https://rye-up.com/get | bash
curl -sSL https://install.python-poetry.org | python3 -
```

## Setup Toolbx

```bash
toolbox enter daily

# sqlite3 for dnf completions
sudo dnf install --assumeyes zsh sqlite3
```

## Install More Apps

```bash
sudo dnf install --assumeyes aspell-id neofetch
```

```bash
toolbox enter daily

# main
# mesa-libGL is needed by Olive, Foliate
sudo dnf install --assumeyes mesa-libGL

# Tools
sudo dnf install --assumeyes jq pandoc ShellCheck yt-dlp telnet

# Rust
sudo dnf install --assumeyes @development-tools clang mold openssl-devel openssl1.1

# Javascript
fnm use v18
```

```bash
toolbox enter daily

# rust development tool
cargo binstall --no-confirm --no-symlinks cargo-edit cargo-nextest cargo-outdated cargo-tarpaulin cargo-watch dprint git-cliff git-cliff hurl just tokei watchexec-cli

# utilities
cargo binstall --no-confirm --no-symlinks bandwhich bat dua-cli kondo rust-script stylua
```

```bash
rye install grip
```

## Install More GNOME Extensions

Login to https://extensions.gnome.org/extension/ and click `install`. It should open Extension Manager App.
It is easier than searching manually inside Extension manager App.

- [Internet Speed Meter - GNOME bash Extensions](https://extensions.gnome.org/extension/2980/internet-speed-meter/)
- [Lock Keys - GNOME bash Extensions](https://extensions.gnome.org/extension/36/lock-keys/)
- [AppIndicator and KStatusNotifierItem Support - GNOME bash Extensions](https://extensions.gnome.org/extension/615/appindicator-support/)

## Install Binaries Manually

Install eget from https://github.com/zyedidia/eget/releases

```bash
eget junegunn/fzf --to ~/.local/bin
eget restic/restic --to ~/.local/bin
```

### Ripgrep With Pcre2 Feature

```bash
mkdir -p ~/opt/ripgrep
git clone --depth 1 https://github.com/BurntSushi/ripgrep.git ~/opt/ripgrep
cargo install --path ~/opt/ripgrep --features 'pcre2'
```

## Setup Apps

### Flatpak Apps Permission

- `filesystems=home`
  - Kohaa
  - Telegram
  - Firefox
  - Audacious

### Emacs

Compile latest Emacs from source. You know how to do it.

### CopyQ

Upadate the `Exec` line in `/usr/share/applications/com.github.hluk.copyq.desktop`

```bash
Exec=env QT_QPA_PLATFORM=xcb copyq
```

Tell CopyQ to use emoji. Add the following code to `~/.config/fontconfig/fonts.conf`.

```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
 <match target="pattern">
    <edit name="family" mode="prepend_first">
      <string>Twemoji</string>
    </edit>
  </match>
</fontconfig>
```

## Firefox

Enable `DNS over HTTPs` by going to `Settings` -> `Network Settings` -> `Connection Settings`

### Workrave

Set the timers to:

- Each 20 minutes work, take 5 minutes rest.
- Each 3 hours work, take 1 hour rest.

Upadate the `Exec` line in `/usr/share/applications/workrave.desktop`. Otherwise, the tray icon is not displayed.

```bash
Exec=env GDK_BACKEND="x11" workrave
```

## Setup Credentials

To avoid git prompting password every each login.
Copy the ssh password to Seahorse app. Open seahorse, go to `Password > Login`. Then paste the password to `Unlock password for: ...`

## Setting up VPN

### ProtonVPN

Go to Network setting. Add new VPN from a file. Fill the required information according to https://account.proton.me/u/0/vpn/OpenVpnIKEv2

## Setting Up DNS

On laptop.

- `Setting` -> `Wifi` -> `DNS`
  - IPv4: `1.1.1.1`, `1.0.0.1`
  - IPv6: `2606:4700:4700::1111`, `2606:4700:4700::1001`

On router.

- Advanced -> Router -> DHCP -> run `$("#dhcp_dns").show();` in browser console.

## Modify GNOME Settings

### Keyboard

Go to `Settings` -> `Keyboard`.

- Navigation
  - Move to workspace on the left: Ctrl + Tab
  - Move to workspace on the right: Ctrl + Alt + Tab
  - Switch Windows: Alt + Tab
- CopyQ
  - name: CopyQ
  - command: copyq show
  - shortcut: Ctrl + Shift + P
- Flameshot
  - name: Flameshot
  - command: flameshot gui
  - shortcut: print

### Multitasking

- Workspace: Fixed number. 4 workspaces.
- Application switching: include only applications from the current workspace.
- Multi-monitor: workspace on primary display only.

### Text Editor

- Disable "Restore sessioon"

## Nautilus (File Manager)

- Enable "Expandable folder in list view"

## Polish

### Populate other dotfiles

```bash
cd ~/dotfiles
stow --no-folding --restow gnupg starship
```

### Set time, paper size and units in British

i.e. weeks starting with Mondays, A4, metric.

Put the code below in `/etc/locale.conf`

```
LANG=en_US.UTF-8
LC_TIME=en_GB.UTF-8
LC_PAPER=en_GB.UTF-8
LC_MEASUREMENT=en_GB.UTF-8
```

### Pin apps

Pin Brave browser. It is installed just for emergency.

```
flatpak mask com.brave.Browser
```

## Clean Up

Remove unnecessary bash configuration.

```bash
rm .bash_profile .bashrc .profile .bash_logout
```
