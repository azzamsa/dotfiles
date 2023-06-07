# Post Install

The steps I need to take after finishing fresh installation of an OS.

## Current Machine

- 80TU Lenovo ideapad 310-14IKB + NVIDIA GeForce 920MX
- Fedora Silverblue

## Upgrade The Os

```bash
rpm-ostree status
rpm-ostree upgrade --check
rpm-ostree upgrade
```

## Install Basic Packages

```bash
rpm-ostree install --apply-live gnome-tweaks tlp tlp-rdw wl-clipboard zsh
systemctl reboot

rpm-ostree override remove firefox firefox-langpacks
systemctl reboot
```

## Symlinks The Dotfiles

- first, you need to copy the `dotfiles` directory from the backup directory.

```bash
pushd ~/dotfiles >/dev/null || exit
stow --no-fold git gnupg zellij zsh vi starship
popd >/dev/null || exit
```

## Set ZSH As Default Shell

If this is your first time setting up zsh
copy the code below to `~/.zshenv`

```bash
ZDOTDIR=~/.config/zsh
source -- "$ZDOTDIR"/.zshenv
```

```bash
sudo usermod -s /bin/zsh $USERNAME
```

Remove unnecessary bash configuration.

```bash
rm .bash_profile .bashrc .profile .bash_logout
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

## Setup Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup default stable
rustup component add rust-analyzer
# rustup which --toolchain stable rust-analyzer
```

## Setup Python

```bash
curl -sSf https://rye-up.com/get | bash
curl -sSL https://install.python-poetry.org | python3 -
```

## Install Flatpak Applications

```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update

flatpak install --assumeyes flathub com.calibre_ebook.calibre com.github.johnfactotum.Foliate com.github.qarmin.czkawka com.github.tchx84.Flatseal com.logseq.Logseq com.mattjakeman.ExtensionManager com.rafaelmardojai.Blanket fr.romainvigier.MetadataCleaner io.dbeaver.DBeaverCommunity io.github.seadve.Kooha org.atheme.audacious org.audacityteam.Audacity org.bleachbit.BleachBit org.flameshot.Flameshot org.flozz.yoga-image-optimizer org.gimp.GIMP org.gnome.Boxes org.gnome.FileRoller org.gnome.Firmware org.gnome.seahorse.Application org.gramps_project.Gramps org.inkscape.Inkscape org.kde.okular org.keepassxc.KeePassXC org.libreoffice.LibreOffice org.mozilla.firefox org.mozilla.Thunderbird org.telegram.desktop org.videolan.VLC rest.insomnia.Insomnia us.zoom.Zoom
```

Pin Brave browser. It is installed just for emergency.

```
flatpak mask com.brave.Browser
```

Flameshot must be installed in the host via flatpak. Otherwise, the toolbox version of Flameshot is not able to copy image to clipboard.

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
# podman tag <image id> base
```

### Daily

```bash
toolbox create -i base daily
toolbox enter daily

# Tools
sudo dnf install --assumeyes copyq emacs flameshot jq neofetch  pandoc ShellCheck stow tidy workrave yt-dlp telnet aspell-id

# Emacs
doom sync && doom doctor

# Rust
sudo dnf install --assumeyes @development-tools clang mold openssl-devel openssl1.1

# Javascript
fnm use v18
```

## Install Rust Apps

```bash
toolbox enter daily

cargo binstall --no-confirm --no-symlinks atuin bandwhich bat cargo-edit cargo-nextest cargo-outdated cargo-tarpaulin cargo-watch difftastic dprint dua-cli evcxr_repl fnm genact git-cliff hurl just kondo rust-script starship stylua tokei watchexec-cli zellij zoxide xlpr tere
```

## Install Python Apps

```bash
rye install grip
```

## Export Daily Apps in Toolboxes

## Export Emacs

```bash
toolbox enter daily
cp /usr/share/applications/emacs.desktop ~/.local/share/applications
```

Change the `Exec` and `Icon` line.

```bash
Exec=toolbox run -c daily ~/.config/emacs/bin/doom run
Icon=/var/home/<username>/.local/share/icons/emacs_256.png
```

## Export Workrave

```
toolbox enter daily
cp /usr/share/applications/workrave.desktop ~/.local/share/applications
```

Change the `Exec` and `Icon` line.

```bash
Exec=toolbox run -c daily env GDK_BACKEND=x11 workrave
Icon=/var/home/<username>/.local/share/icons/workrave.png
```

Set the timer.

- Each 20 minutes work, take 5 minutes rest.
- Each 3 hours work, take 1 hour rest.

## Export CopyQ

```
toolbox enter daily
cp /usr/share/applications/com.github.hluk.copyq.desktop ~/.local/share/applications
```

Change the `Exec` and `Icon` line.

```bash
Exec=toolbox run -c daily env QT_QPA_PLATFORM=xcb copyq
Icon=/var/home/<username>/.local/share/icons/copyq_256.png
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
- https://github.com/junegunn/fzf
- https://github.com/charmbracelet/glow

### Ripgrep With Pcre2 Feature

```bash
mkdir -p ~/opt/ripgrep
git clone --depth 1 https://github.com/BurntSushi/ripgrep.git ~/opt/ripgrep
cargo install --path ~/opt/ripgrep --features 'pcre2'
```

## Setup Terminal

### Change Theme

```bash
bash -c  "$(curl -sLo- https://git.io/vQgMr)"
```

Choose `night owl` as theme and `Iosevka Nerd Font 18`

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

## Setup Firefox

Enable `DNS over HTTPs` by going to `Settings` -> `Network Settings` -> `Connection Settings`

## Setup Flatpak Apps Permission

- `filesystems=home`
  - Kohaa
  - Telegram
  - Firefox
  - Audacious

## Modify GNOME Settings

### Keyboard

Go to `Settings` -> `Keyboard`.

- Navigation
  - Move to workspace on the left: Ctrl + Tab
  - Move to workspace on the right: Ctrl + Alt + Tab
  - Switch Windows: Alt + Tab
- CopyQ
  - name: CopyQ
  - command: toolbox run -c daily env QT_QPA_PLATFORM=xcb copyq show
  - shortcut: Ctrl + Shift + P
- Flameshot
  - name: Flameshot
  - command: toolbox run -c daily flameshot gui
  - shortcut: print

### Multitasking

- Workspace: Fixed number. 4 workspaces.
- Application switching: include only applications from the current workspace.
- Multi-monitor: workspace on primary display only.

### Set time, paper size and units in British

i.e. weeks starting with Mondays, A4, metric.

Put the code below in `/etc/locale.conf`

```
LANG=en_US.UTF-8
LC_TIME=en_GB.UTF-8
LC_PAPER=en_GB.UTF-8
LC_MEASUREMENT=en_GB.UTF-8
```

## Setup directory icons

```shell
$ gio info music/
  metadata::custom-icon: file:///usr/share/icons/Adwaita/512x512/places/folder-music.png
```

Add more icons from:

- https://github.com/Bonandry/adwaita-plus
- https://github.com/somepaulo/MoreWaita

## Setup Emoji

Some apps aren't able to display colored emoji without proper setting. I believe it because they are containerized.

### CopyQ

Add the following code to `~/.config/fontconfig/fonts.conf`.

```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
 <match target="pattern">
    <edit name="family" mode="prepend_first">
      <string>Twemoji</string>
      <string>Noto Color Emoji</string>
    </edit>
  </match>
</fontconfig>
```

## Emacs

Add `(add-to-list 'doom-emoji-fallback-font-families "Twemoji")` to the Doom config.

## VSCodium

Set `'Iosevka Nerd Font', Twemoji` as font.
