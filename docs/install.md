# Installation Guide

The steps I need to install Debian GNU/Linux on my machine.

## Current Machine

- 80TU Lenovo ideapad 310-14IKB + NVIDIA GeForce 920MX
- Debian 12 + GNOME

## Preparing The ISO image

Go to the Debian website. Grab the GNOME-flavored ISO, and copy it to your Ventoy USB stick.

⚠ Wait until the copying process is **completely** finished. Otherwise, the file will be corrupted. Make sure to run `sha5sum`.

⚠ Always show the password during the prompt. You don't want to repeat the whole process just because you make a typo.

## Using BTRFS and LUKS

Debian doesn't support BTRFS and LUKS out of the box. `Expert Install` mode is required.

Use manual partition. The default `Guided - use entire disk and set up LVM` uses 500 MB for `/boot`.
⚠ We need to allocate more than the default value for `/boot`. Otherwise, We will get `zstd error no space left initramfs`.

The partition layout:

```bash
Encrypted volume (sda2_crypt) - 238.1 GB Linux device-mapper (crypt)
     #1        238.1 GB       K      lvm
LVM VG toph-vg, LV root - 238.1 GB Linux device-mapper (linear)
     #1         238.1 GB       F      btrfs     /

SCSI1 (©,9,0) (sda) - 250.1 GB ATA Samsung SSD 879
                1.9 MB             FREE SPACE
    #1          2.0 GB      F      ext2           /boot
    #2          238.1 GB    K      crypto        (sda2_crypt)
    #3          2.0 GB      f      ESP
                8.0 GB             FREE SPACE
```

💡I use ZRAM. So I don't need a SWAP partition. I also left some free space as a precaution.

## Improve SSD performance

Press `Ctrl - Alt - F2` to enter the terminal.

```bash
df

umount /target/boot/efi
umount /target/boot
umount /target

mount /dev/mapper/toph--vg-root /mnt
cd mnt
ls # check for @rootfs

btrfs subvolume list . # remember the id

# Mostly the id is `256`. But always make sure!
mount -o rw,noatime,space_cache=v2,ssd,discard=async,compress=zstd:3,subvolid=256 /dev/mapper/toph--vg-root   /target
mount /dev/sda<num> /target/boot
mount /dev/sda<num> /target/boot/efi

nano /etc/fstab # then change the `default` to the same SSD options above
```

## Getting rid of `raspi-firmware`

Can't install any firmware because of this. I am not installing on raspi.

```bash
sudo apt purge raspi-firmware
```

## Install GPU Drivers

Upon login, You will get a login loop. This is expected because of the missing NVIDIA driver.
To see the log you can log in using the tty (`Ctrl` + `Alt` + `F3`). Install the missing driver then reboot.

```bash
sudo apt install nvidia-detect
sudo nvidia-detect

sudo apt install nvidia-driver # based on `nvidia-detect` output
```

Make sure the driver is correctly installed by going to GNOME settings> About page.

## Force Debian GNOME to use Wayland

Debian disables Wayland by default if the NVIDIA driver is installed. I have been using Wayland with NVIDIA driver on Fedora without issue.
So, I believe it will be seamless.

Go to `/lib/udev/rules.d/61-gdm.rules` and comment everything under `Check if suspend/resume services necessary for working wayland support is avaliable..`. Do the same thing to the lines below `If this is a hybrid graphics laptop with vendor nvidia driver, disable wayland`.

Then add `GRUB_CMDLINE_LINUX="nvidia-drm.modeset=1"` in `/etc/default/grub`. Finally, run `sudo update-grub`.

Source: [No Wayland on Bookworm with Nvidia : debian](https://www.reddit.com/r/debian/comments/11qgvq5/no_wayland_on_bookworm_with_nvidia/)

### Use Nala

Use Nala early on to have its sophisticated `dnf history` like feature.

```bash
sudo apt install --assume-yes nala
```

Choose the fastest mirors

```bash
sudo nala fetch
```

## Upgrade The OS

```bash
sudo nala update && sudo nala upgrade
```

## Setting Up Terminal

I hate leaving my prompt.

### Default bash

Copy the `dotfile` directory to the new machine.

```bash
sudo nala install --assume-yes bash git stow fish
```

Populate the dotfiles.

```bash
cd ~/dotfiles
stow --no-folding --restow git zellij fish wezterm
```

Change the prompt style.

```bash
fish_config
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

```bash
sudo nala install --assume-yes flatpak

flatpak install flathub com.raggesilver.BlackBox
```

Get `Iosevka Nerd Fonts` from your previous machine or https://github.com/ryanoasis/nerd-fonts/releases, then copy to `~/.local/share/fonts/`.
Set BlackBox theme to `Dracula`.

## I hate brightness

Install [Soft Brightness Plus](https://extensions.gnome.org/extension/5943/soft-brightness-plus/).

```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install --assume-yes flathub com.mattjakeman.ExtensionManager
```

Open the extension manager and install Soft Brightness.

## Remove GNOME bloats

```bash
sudo nala purge aisleriot five-or-more four-in-a-row gnome-2048 gnome-klotski gnome-logs gnome-mahjongg gnome-maps gnome-mines gnome-music gnome-nibbles gnome-robots gnome-sound-recorder gnome-sudoku gnome-taquin gnome-tetravex gnome-todo hdate-applet hitori iagno im-config kasumi libreoffice-calc libreoffice-draw libreoffice-impress libreoffice-writer lightsoff mlterm mozc-utils-gui quadrapassel rhythmbox shotwell simple-scan swell-foop synaptic tali uim-gtk3 uim-gtk2.0 xiterm+thai xterm firefox-esr
```

```bashrc
sudo nala autoremove
sudo nala autoclean
```

## Use Flatpak Version

💡 I don't want to pollute my base system. Using Flatpak, I can freely remove applications without worrying my system will be broken.

I think I will just use mutable OS an immutable way!

```bash
# main
flatpak install --assume-yes com.github.tchx84.Flatseal org.gnome.seahorse.Application org.keepassxc.KeePassXC org.mozilla.firefox

# productivity
flatpak install --assume-yes com.calibre_ebook.calibre com.github.johnfactotum.Foliate com.logseq.Logseq com.rafaelmardojai.Blanket

# utilities
flatpak install --assume-yes com.github.qarmin.czkawka com.brave.Browser fr.romainvigier.MetadataCleaner io.dbeaver.DBeaverCommunity io.github.seadve.Kooha org.atheme.audacious org.audacityteam.Audacity org.bleachbit.BleachBit com.github.tenderowl.frog org.gimp.GIMP org.gnome.Firmware org.gramps_project.Gramps org.inkscape.Inkscape org.kde.okular org.libreoffice.LibreOffice org.mozilla.Thunderbird org.telegram.desktop org.videolan.VLC rest.insomnia.Insomnia

# office
flatpak install --assume-yes com.github.IsmaelMartinez.teams_for_linux us.zoom.Zoom
```

## Setup Battery Management

Remove GNOME power profiles and instal `TLP`.

```bash
sudo nala remove power-profiles-daemon
sudo nala install --assume-yes tlp tlp-rdw

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

eget rust-lang/rust-analyzer --to ~/.local/bin
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
curl -sSf https://rye-up.com/get | bash
curl -sSL https://install.python-poetry.org | python3 -
```

## Setup Toolbx

Install toolbx.

```bash
sudo nala install --assume-yes podman-toolbox
```

Setup `daily` container.

```bash
toolbox enter daily

sudo apt update && sudo apt install --yes nala
sudo nala install --assume-yes fish
```

## Install More Apps

```bash
sudo nala install --assume-yes aspell-id podman podman-compose
```

```bash
toolbox enter daily

# main
# mesa-libGL is needed by Foliate
sudo nala install --assume-yes mesa-libGL

# Tools
sudo nala install --assume-yes jq pandoc ShellCheck yt-dlp telnet

# Rust
sudo nala install --assume-yes clang mold pkg-config libssl-dev

# Javascript
fnm use v18
```

```bash
toolbox enter daily

# rust development tool
cargo binstall --no-confirm --no-symlinks cargo-edit cargo-nextest cargo-outdated cargo-tarpaulin cargo-watch dprint git-cliff git-cliff hurl joshuto just tokei watchexec-cli

# utilities
cargo binstall --no-confirm --no-symlinks bandwhich bat dua-cli kondo rust-script stylua
```

```bash
rye install grip
```

## Install More GNOME Extensions

Login to https://extensions.gnome.org/extension/ and click `install`. It should open Extension Manager App.
It is easier than searching manually inside the Extension manager App.

- [Internet Speed Meter - GNOME bash Extensions](https://extensions.gnome.org/extension/2980/internet-speed-meter/)
- [Lock Keys - GNOME bash Extensions](https://extensions.gnome.org/extension/36/lock-keys/)
- [AppIndicator and KStatusNotifierItem Support - GNOME bash Extensions](https://extensions.gnome.org/extension/615/appindicator-support/)

Setup [Pano - Clipboard Manager](https://extensions.gnome.org/extension/5278/pano/).

```bash
sudo nala install --assume-yes gir1.2-gda-5.0 gir1.2-gsound-1.0
```

Set the shortcut to `Ctrl + Shift + P`.

## Install Binaries Manually

Install eget from https://github.com/zyedidia/eget/releases

```bash
eget junegunn/fzf --to ~/.local/bin
eget restic/restic --to ~/.local/bin
eget rui314/mold --to ~/.local/bin
```

### Ripgrep With Pcre2 Feature

```bash
mkdir -p ~/opt/ripgrep
git clone --depth 1 https://github.com/BurntSushi/ripgrep.git ~/opt/ripgrep
cargo install --path ~/opt/ripgrep --features 'pcre2'
```

### `udeps` needed wierd dependecies

It is easier to use `distrobox` than `podman`.

Setup distrobox.

```bash
sudo nala install --assume-yes distrobox

# Debian and Ubuntu doesn't have libssl.so.1.1
distrobox create --image  quay.io/toolbx-images/archlinux-toolbox --name arch
distrobox-enter --name arch -- sudo pacman --sync --refresh --needed --noconfirm fish
```

Install `udeps` dependecies.

```bash
distrobox-enter --name arch -- sudo pacman --sync --refresh --needed --noconfirm openssl-1.1
```

Run udeps.

```bash
distrobox-enter --name arch
cargo +nightly udeps
```

## Setup Apps

### Flatpak Apps Permission

- `filesystems=home`
  - Kohaa
  - Telegram
  - Firefox
  - Audacious

### Emacs

Compile the latest Emacs from the source. You know how to do it.

## Firefox

Enable `DNS over HTTPs` by going to `Settings` -> `Network Settings` -> `Connection Settings

### Workrave

Set the timers to:

- Each 20 minutes of work, take 5 minutes rest.
- Each 3 hours of work, take 1-hour rest.

Update the `Exec` line in `/usr/share/applications/workrave.desktop`. Otherwise, the tray icon is not displayed.

```diff
+Exec=workrave
+Exec=env GDK_BACKEND="x11" workrave
```

## Setup Credentials

To avoid git prompting password every login.
Copy the ssh password to the Seahorse app. Open Seahorse, and go to `Password > Login`. Then paste the password to `Unlock password for: ...`

## Setting up VPN

### ProtonVPN

Go to the Network setting. Add a new VPN from a file. Fill in the required information according to https://account.proton.me/u/0/vpn/OpenVpnIKEv2

## Setting Up DNS

On laptop.

- `Setting` -> `Wifi` -> `DNS`
  - IPv4: `1.1.1.1`, `1.0.0.1`
  - IPv6: `2606:4700:4700::1111`, `2606:4700:4700::1001`

On router.

- Advanced -> Router -> DHCP -> run `$("#dhcp_dns").show();` in browser console.

## Modify GNOME Settings

### Tweaks

Fonts:

- Interface Text: "Noto Sans Medium 12"
- Document Text: "Noto Sans Medium 12"
- Monospace Text: "Noto Sans Mono Medium 12"
- Legacy Window Titles: "Noto Sans SemiBold 12"
- Hinting : Slight
- Antialiasing: Subpixel (for LCD screens)
- Scaling Factor: 1.00

Startup Applications:

- You know what to add!

Top Bar:

- Only show hour

### Format

Set time, paper size, and units in British.

```bash
sudo dpkg-reconfigure locales
```

Add `en_GB`.

Go to `Settings` -> `Region and Languages`. Set format to `United Kingdom`.

### Keyboard

Go to `Settings` -> `Keyboard`.

- Navigation
  - Move to workspace on the left: Ctrl + Tab
  - Move to workspace on the right: Ctrl + Alt + Tab
  - Switch Windows: Alt + Tab
- Flameshot
  - name: Flameshot
  - command: flameshot gui
  - shortcut: Ctrl + Shift + B

### Multitasking

- Workspace: Fixed number. 4 workspaces.
- Application switching: include only applications from the current workspace.
- Multi-monitor: workspace on primary display only.

To prevent Apps to move to the Laptop monitor during suspension, go to `Display` and set it to `Mirror`.

### Text Editor

- Disable "Restore session"

## Nautilus (File Manager)

- Enable "Expandable folder in list view"

## Polish

### Fix terrible fonts in Flatpak version of Firefox and Thunderbird when using Wayland

⚠️ This issue occurs mostly in Debian and openSUSE based distros with x11 fonts installed. Fedora and RHEL-based distros are usually not affected by default.

```bash
sudo apt remove xfonts-base xfonts-100dpi xfonts-75dpi
```

Source: [Fonts look terrible · Issue #4571 · flatpak/flatpak](https://github.com/flatpak/flatpak/issues/4571#issuecomment-1606258732)

### Enable [Playmouth](https://wiki.debian.org/plymouth)

```bash
sudo nala install --assume-yes plymouth plymouth-themes firmware-linux
```

Add the line below to `/etc/default/grub`, then run `sudo update-grub2`

```diff
-GRUB_CMDLINE_LINUX_DEFAULT="quiet"
+GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nvidia-drm.modeset=1"
```

### Enable [ZRAM](https://wiki.debian.org/ZRam)

```bash
sudo nala install --assume-yes zram-tools
```

Configure `/etc/default/zramswap`.

```diff
+PERCENT=60
+PERCENT=40
```

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
in gen-completions --shell fish --out-dir ~/.config/fish/completions/
out gen-completions --shell fish --out-dir ~/.config/fish/completions/
```

More:

- Increase the default value of "clear clipboard after" in KeepassXC

### Pin apps

Pin Brave browser. It is installed just for emergencies.

```
flatpak mask com.brave.Browser
```

## Copy all previous app data

Take a look at `~/.config/meta/backup.include`

## Clean Up

Remove unnecessary bash configuration.

```bash
rm .bash_profile .bashrc .profile .bash_logout
```
