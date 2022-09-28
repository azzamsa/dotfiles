# Changelog

All notable changes to this project will be documented in this file.

## [2.2.0] - 2022-09-28

### Bug Fixes

- Update post-install
- Some vars are not set
- Don't highlight paste
- Remove some names
- Download binary manually
- Migrate to Fedora
- Bring back starship
- Add more paths
- Weird behavior without explicit `HISTFILE` location
- Use `menu` instead of blind `completer`
- I don't use tmux
- Broot is better than fasd

### Features

- List supported packages if package name missing
- Update post install
- Check rust updates
- Add more package to install
- Clean unused flatpak packages
- `update`
- Tmsu installations
- Migrate to `atuin`
- `clean`
- `up` rust-analyzer
- Use `binstall` to install frequently updated Rust package
- Shfmt `--write` alias
- Binstall `fnm`
- Add `cargo` alias
- Names
- Use `lld` as default linker
- Ding

### Performance

- Remove unused code

### Refactor

- Port `sfetch` to rust
- Port `names` to rust
- Reformat using `shfmt`

### Ci

- Add ci for Rust files
- Update workflow

## [2.1.0] - 2022-09-12

### Bug Fixes

- Update .gitignore
- Remove its configuration
- Remove fish and starship

### Documentation

- Update readme

### Build

- Add usage guide

## [2.0.0] - 2022-09-12

### Bug Fixes

- Migrate some alias to `dnf` instead of `apt`
- Custom completion can't accepts custom arguments
- Swap `tab relative` keybinding
- Replace built-in history keybinding
- Enable showing $PWD in Terminal title
- Revert wezterm-here
- Auto-type the history command
- Wrong zoxide setup
- Zoxide support Nushell out of the box
- Some package need bleeding edge version
- Avoid accidental quit
- Don't hardcode themes
- Use latest packages
- Use gnome defaults
- Remove abbrev
- Avoid f5 hiccup
- Maximum recursion depth reached
- Key layer slows my workflow
- Remove unused config
- GNOME doesn't need GTK config
- X config is not needed anymore
- Migrate to flatpak
- Migrate to GNOME
- Opacity in browser is a bad idea
- Now I use Emacs in non-specified workspace
- Use sticky key for switching workspace
- Migrate to dracula dark theme
- Brightness text should use `foreground` color
- Move everything to Fira Code
- Migrate to dark theme
- Mic is not reliable
- Enable `follow` for mpv
- Picom won't start at startup
- Suddenly it can't find script custom path
- Adjust hue for inactive pane in newer version
- Use smaller increment/decrement in brightness
- Wrong foreground color in battery module
- Don't daemonize picom
- Workrave applet should be sticky
- Install more app to venv
- No space after python version
- I don't need fancy tab-bar
- Use full name in office
- Wrong function name
- Daemonize picom
- Handle day night in brighten/dim
- Use initial in IPC to avoid state changes in restart
- Typo
- Update-alternatives need sudo rights
- Java applications menus immediately closing after the click
- Skip sticky windows when switching window
- Put lockscreen image back to wallpapers directory
- Use full percentage for CPU
- Running the monitor.sh in bspwmrc cause it to restart indefinitely
- Missing percentage in label
- Remove maildir-utils and friends
- Use dunstify instead
- It has been dark before 5 pm
- Darken the inactive pane
- Remove unused module
- Can't set foreground color on ramp
- Use native xwindow module
- `pinentry-gtk2` took ages to load
- Must start with desktop number 1
- Use darker color for `pager_color_prefix`
- Use pinentry-gtk2
- Node prompt has no whitespace at the end
- Improve day/night detection
- Use xwindo again to show title
- Swap the main key with emacs
- Delete old unused configs
- Doesn't use bitmap font
- Use more modern icon sets
- Avoid conflicting keys with emacs
- Picom binary is missing
- Wezterm now installed via deb files
- 12 hour format is more redable for merge
- Revert the top margin
- Use gnome-keyring instead of keychain
- Use regular date module. `interval` not supported in ipc module
- Don't focus to empty node
- Start Emacs in tiled by default
- Can't change focus with active mouse hovering on other windor
- `--no-folding` solves the cluttered symlink directories
- Use a more brightner version of foreground color
- Try using homerow for workspaces
- Using chain in bspwm is hard
- Migrate to bspwm

### Documentation

- Add license
- Post ZSH migration
- List all branches
- Improve separation between section
- Capitalize docstring
- Capitalize docstring
- Separate configuration for office
- More documentation
- Add more log
- Wezterm here documentation
- Replace assets with the new tiny simple look

### Features

- Initial configuration
- Enable `switch to last active tab when closing tab`
- More shortcut
- Enable command completions
- Initial config
- More aliases
- Support fnm
- Use Nushell as login shell
- Add external executable path
- Use menu to avoid having multiple prompt in custom history
- Exclude failed command
- Always remove to trash
- Add wepb to post-install
- Use keybinding for history
- Initial commit
- Play well both in ligth and dark mode
- Broot file manager
- Visual feedback after copy
- Use layers for keybindings
- Support atuin
- Add more utilities package
- Support poetry
- Add rule for thunar
- Add fd-find to post installation
- Pre-push hooks that protect a branch from being pushed into
- Kernel info in sfetch
- Fdfind is too long
- Setup lightdm
- Add credentials to keyring app
- Updating rust-analyzer made easy
- Make it easier for family members to use this machine
- Add more package to nodebin
- Show tree in current directory
- Toggle next/prev movement on pane direction
- Initial config
- Manage volume level from the bar
- Add more package to post-install
- Brighten and dim screen from bar
- Dim and brighten the screen
- Enable more fn keys
- Toggle speaker status from the bar
- Toggle mic status from the bar
- Emacs pgtk supports
- Auto brightness
- Auto suspend
- Load the desired autorandr mode based on connected monitors
- Use env variable for wlan interface name
- Bluetooth support in installation
- Fully support automatic monitor switching
- Move all workspace to internal monitor when HDMI turned off
- Intial commit
- Strip any credentials from window title
- Support fallback fonts
- Sfetch
- Use the similar keymap with the current window manager
- Nordify
- Focus to previous node
- Resize window
- I3 like window split
- Group keys to have more free keys
- I need `notify-send` to notify things
- Language servers installations
- Add bspwm steps to post install
- Merge most used script here
- Use homerow for workspace number
- Move  move all the workspace to second montior
- Brightness based on monitors and time
- Hide empty workspaces
- Support external monitors
- Use nord theme

### Miscellaneous Tasks

- Ignore non dotfiles directory

### Performance

- History menu
- Use IPC for toggle mic status

### Refactor

- Shorten the code
- Duplicate entries
- Long parameter name is easier to digest
- Bspwm now executed by lightdm
- Blacken
- Use simpler approach to get current HDMI name
- Avoid duplicate code in brightness
- Rules
- Make all the spaces consistent
- Use simpler logic to get active monitor
- Use more simple regex
- Move independent scripts to bin
- Adhere to bspwm vocabularies
- Use more sensible function name
- Use full parameter name for more readablity
- Use POSIX sh for all scripts
- Reorder keybindings
- Follow bash best practice
- Avoid duplicate code in managing multiple screen

### Styling

- Format
- Use VictorMono as primary font

### Build

- Update git-cliff configuration

### Ci

- Add release workflows
- Remove missing item
- Add Python lints
- Initial

## [1.0.0] - 2021-12-03

### Add

- Pull with rebase option
- Magit alias
- Support rrun with bash completion name
- Rrun compile to custom dir
- Auto-suspend to startup
- Welcome texlive 2018
- Ability to read user PATH from sudo
- Rust run

### Bug Fixes

- Use arrow key for pane and window direction
- Use more accessible keys
- Use more accessible leader key
- Remove unused virtualfish prompt config
- Use the arrow key again in i3wm
- Use the number at the home-row position
- Use more accesible menu key in i3wm
- Wezterm doesn't need any fallback font
- Nodejs character positioned incorrectly
- Remove battery in status bar
- Set fallback font in wezterm
- Use `fira code` for all text
- Stretchly is too huge
- Old rofi config is deprecated
- Wezterm background shouldn't be pure white
- Make rofi match current indigo theme
- Light theme should have light as base color.
- Too much space between icon and text i3status
- Match the background with the window title color.
- Don't use value from Xresources anymore.
- Removed bash, sbcl, tmux, next
- Use more reachable keys
- Auto-start terminai
- Adjust i3 key to colemak
- Don't start heavy app in startup
- Hide username in Wezterm title
- `mousedragend1pane` fixed in 3.3
- Remove auto move window based on the title
- Copied word using a mouse not sent to clipboard
- Tmux keybindings is wierd
- Change floating window keybinding
- Add missing default layout in menu
- Remove unused colors
- Set workspace in startup program
- For emacs-style `copy-mode` is enough
- Don't rever to default mode after floating window toggle
- Recent version of st terminal doesn't send selection correctly to clipboard
- Grenclip doesn't accept copy selection from tmux
- Remove unused tmux custom keymap
- Use `st` instead of `stterm`
- Remove hibernate from `i3-exit`
- `workrave` typo
- Remove keymap modification
- Strive to use sticky key all the way down
- Firefox logo does not shown correcly after migration to bullseye
- Remove i3-gaps config
- Make emacs keybinding consistent in rofi
- Emoji without space doesn't work in some social app
- Remove unused i3wm keybindings
- Move dmenu, clipboard, and kill window under the same command.
- Rrun
- Move long command to bash script
- Rrun.fish
- No need fish plugins
- Disable compton and xautolock
- A change to zman and bilal interface
- Migrate to fnm
- Remove all custom screenshot commands
- Don't make shadow in `peek`
- Disable insert key
- Increase default brightness
- Use manually installed emacs.
- Update .stow-local-ignore
- 15 is less bright for my eyes
- Disable Telegram auto-start
- Workrave is better than activity-watch
- Adjust mpv key to a common pattern
- Don't prevent xautolock to do its job
- Change cursor to brighter color
- `LS_COLORS` doesn't work in Emacs
- Override up and down icon in network i3status
- Emacs tramp hang over fish prompt
- Utilities path not found
- Disable transparancy in st terminal
- Color warning on tmux
- Switch to light theme.
- Drop lava color scheme. Prefers Zenburn.
- Drop duplicate config
- Remove sdkman, gvm, and rvm
- Use ISO format in status bar date time
- Critical battery level is too high
- Brighten `binding_mode` color
- Don't draw shadow in i3 title bar
- Increase terminal font size
- Path for work gitconfig
- Start mpv at lower volume
- Start `aza-login` manually
- Remove silientcast config

### Documentation

- Readme
- Add description for each color variable in fish
- `MouseDragEnd1Pane` doesn't work in tmux 3.1
- Add tmux yank comment
- Colors from X resources
- Add comment in i3wm app config
- Modifier key
- Explain remapping key goal

### Features

- Abbrev in fish shell
- Add abbrev
- Dim inactive panes
- Linkify any URL with port
- Add scroll page wezterm
- Search mode in wezterm
- Support xinitrc
- Show icons in dmenu
- Support moving tab in wezterm
- Tell fisher not to put a mess in ~/.config
- Enable copy-mode and quickselect in wezterm
- Migrate to wezterm
- Add 🥗 to greenclip
- Add tmux-jump and tmux-fingers
- Set default workspace for common app
- Make space as super on hold
- Map menu to super
- New greenclip config
- Adopt to new zaman & bilal interface
- Make workrave notification float
- Do it all on big screen
- More aliases
- Enable stowing .gitignore
- Global .gitignore
- Install from backports alias
- Support scratchpad
- Support activity watcher
- Support `bat`
- Add more path to fish_user_path
- Add fisher to fish
- Add `zman` to status bar
- Add lava and zenburn color scheme fish shell
- Add more fish utilites
- Add `docker_ip` function
- Use JSON version of ~bilal~ output in status bar
- Add default $EDITOR
- Add `clear` alias
- Display salah time (bilal) in status bar
- Migrate from py3status to i3status-rs
- Support window animations using compton
- Change programming tools font to fira code
- Change system font to fira sans
- Hide nextcloud tray window border
- Get docker ip
- Support go111module
- New signing key
- Support resizing images
- Add keychain  support
- Completion for obs-cli

### Fix

- Wrong Xmodmap mapping
- Wrap long lines
- Lower battery threshold status icon
- I prefer to use tab selection

### Refactor

- Remove unused value from Xresources
- Rename colors name
- Remove unused code
- `cdn.fish`, make it simpler
- Drop emacsclient config

### Reformat

- Indent lines correctly

### Styling

- Use new firefox logo in i3status
- I love indigo color!

### Add

- Salah time config

### Build

- Release config

<!-- generated by git-cliff -->
