# Post Install

The steps I need to take after finishing fresh installation of an OS.

## Current Machine

- 80TU Lenovo ideapad 310-14IKB + NVIDIA GeForce 920MX
- Fedora 37 Silverblue

## Upgrade The Os

```bash
rpm-ostree status
rpm-ostree upgrade --check
rpm-ostree upgrade
```

## Install Basic Packages

```bash
rpm-ostree install --apply-live zsh nnn wl-clipboard libgda libgda-sqlite tlp tlp-rdw gnome-tweaks
systemctl reboot

rpm-ostree override remove firefox firefox-langpacks
systemctl reboot
```

## Symlinks The Dotfiles

- first, you need to copy the `dotfiles` directory from the backup directory.

```bash
pushd ~/dotfiles >/dev/null || exit
stow --no-fold bin git gnupg zellij zsh vi starship
popd >/dev/null || exit
```

## Set ZSH As Default Shell

```bash
sudo usermod -s /bin/zsh $USERNAME
```

## Install GPU Drivers

```bash
rpm-ostree install --apply-live https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusio
n.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
systemctl reboot

rpm-ostree install --apply-live akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda
systemctl reboot
```

## Setup Battery Management

```bash
rpm-ostree override remove power-profiles-daemon

sudo systemctl enable tlp.service
sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket

# set `STOP_CHARGE_THRESH_BAT0="1"` in `/etc/tlp.conf``
sudo tlp start\nsudo tlp-stat -s -c -b
```

## Install Rust on Host

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup default stable
```

## Install Flatpak Applications

```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update

flatpak install --assumeyes flathub org.gnome.Firmware org.telegram.desktop com.logseq.Logseq org.keepassxc.KeePassXC \
  com.mattjakeman.ExtensionManager org.mozilla.firefox org.mozilla.Thunderbird org.videolan.VLC org.kde.okular \
  io.github.seadve.Kooha fr.romainvigier.MetadataCleaner us.zoom.Zoom \
  com.github.johnfactotum.Foliate io.dbeaver.DBeaverCommunity org.inkscape.Inkscape \
  org.gimp.GIMP com.github.tchx84.Flatseal \
  org.libreoffice.LibreOffice net.hovancik.Stretchly org.gustavoperedo.FontDownloader \
  com.github.maoschanz.drawing rest.insomnia.Insomnia com.calibre_ebook.calibre \
  org.gnome.FileRoller org.gnome.Boxes org.gnome.seahorse.Application
```

## Setup Toolboxes

### Base

```bash
toolbox create base
toolbox enter base

# Tools
sudo dnf install --assumeyes zsh

# create a base image
podman stop base
podman commit base
```

### Daily

```bash
toolbox create -i base daily
toolbox enter base

# Tools
sudo dnf install --assumeyes emacs nnn jq ShellCheck tidy neofetch stow workrave pandoc

sudo dnf install --assumeyes python3.11-pip
python3 -m pip install --user grip

# Emacs
doom sync && doom doctor
```

### Rust

```bash
toolbox create -i base rust
toolbox enter rust

sudo dnf install --assumeyes @development-tools clang mold
```

### Pyhon

```bash
toolbox create -i base python
toolbox enter python

sudo dnf install --assumeyes python3.11 python3.11-devel python3.11-pip
```

### Javascript

```
toolbox create -i base javascript
toolbox enter javascript

fnm use v18
```

## Install Rust Apps

```bash
toolbox enter rust

cargo binstall --no-confirm --no-symlinks cargo-edit cargo-watch cargo-tarpaulin watchexec-cli cargo-outdated just fnm stylua starship \
  bat genact dua-cli atuin zoxide zellij rust-script evcxr_repl bandwhich hurl kondo git-cliff dprint cargo-nextest \
  tokei difftastic
```

## Export Daily Apps in Toolboxes

```bash
toolbox enter daily
cp /usr/share/applications/emacs.desktop ~/.local/share/applications
cp /usr/share/applications/workrave.desktop ~/.local/share/applications
```

## Install GNOME Extensions

- https://extensions.gnome.org/extension/5278/pano/
- https://extensions.gnome.org/extension/2980/internet-speed-meter/
- https://extensions.gnome.org/extension/36/lock-keys/
- https://extensions.gnome.org/extension/1625/soft-brightness/
- https://extensions.gnome.org/extension/615/appindicator-support/

## Install Binaries Manually

- https://github.com/mvdan/sh/releases
- https://github.com/restic/restic/releases
- https://github.com/oniony/TMSU/releases
- https://github.com/talklittle/tmsu-nautilus-rs/releases

### Ripgrep With Pcre2 Feature

```bash
mkdir -p ~/opt/ripgrep
git clone --depth 1 https://github.com/BurntSushi/ripgrep.git ~/opt/ripgrep
cargo install --path ~/opt/ripgrep --features 'pcre2'
```

## Setup ProtonVPN

- https://account.proton.me/u/0/vpn/OpenVpnIKEv2
