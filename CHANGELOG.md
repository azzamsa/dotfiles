# Changelog

All notable changes to this project will be documented in this file.

## [6.0.0] - 2024-08-02

### 🚚 Migrations

- **wezterm:** Migrate back to GNOME ([3275834](https://github.com/azzamsa/dotfiles/commit/3275834a7d32a769b7d4531af3f04340b6811d26))

  After spending a full, solid week with Hyprland,
  I've come to the conclusion that a _Window Manager_ isn't my cup of tea.

  CopyQ doesn't work reliably; sometimes the text gets registered to the keyring, sometimes it doesn't.
  This forced me to use `cliphist` with a dynamic menu (anyrun/wofi/fuzzel/).
  However, none of them can preview images in the clipboard history,
  a crucial feature for my workflow, especially when I've taken annotated images during PR reviews or submissions.
  Some dynamic menus even strip newlines inside clipboard content, causing a loss of structure when pasting.
  Additionally, each dynamic menu requires fine-tuning,
  needing a bigger and wider window for selecting clipboard history but not for searching applications.

  I lack visual feedback for mic/speaker/brightness.
  While [Ags][ags] could provide this, it heavily depends on GJS,
  making it necessary to keep an eye on breaking changes.
  This is my assumption only, as I've noticed that with every GNOME release, extensions tend to break.
  I assume Ags is subject to the same fate.
  However, one thing I believe is never wrong: creating a similar GNOME experience with Ags demands a lot of free time.
  Features like window switcher, Alt-tab preview, sliders, etc., need considerable effort.

  I've lost the ability to see my calendar, weather, world clock, and notifications in my notification center.
  Switching my speaker right from the menu is no longer possible, and I need to build them with Ags.

  Workrave doesn't function well, and though Stretchly is a viable option, it can't detect [idle time][idle].

  Waybar's network speed appears to be not real-time.

- From `Iosevka` to JetBrains Mono ([ebcf633](https://github.com/azzamsa/dotfiles/commit/ebcf6330d78cda23070b22231ac422d9198d5798))
- Use `Tokyo Night` theme ([783a327](https://github.com/azzamsa/dotfiles/commit/783a3270bad344d20f470ef781131ea5fa655e29))

  The moon variant.

- Refactor Kangawa theme ([3535d5a](https://github.com/azzamsa/dotfiles/commit/3535d5aa83c582b4647182f6998e48a1c12c7eab))
- Use Kanagawa theme ([fb0d7f1](https://github.com/azzamsa/dotfiles/commit/fb0d7f18ff5d501c6a3bbd64398de91cf0703ded))
- Catppuccin Mocha ([64df9a0](https://github.com/azzamsa/dotfiles/commit/64df9a0aa6705c847755ce90217541c62a8383e9))

### ⛰️ Features

- **scripts:** Nushell works better for scripting than Rust ([fbc150e](https://github.com/azzamsa/dotfiles/commit/fbc150e50131dedac55e7c2424f697aa4cbc32b1))
- **scripts:** Just use `topgrade` ([caed680](https://github.com/azzamsa/dotfiles/commit/caed680b3f6df14bfb30027778391243219ac444))
- **scripts:** Port to nushell ([afce27f](https://github.com/azzamsa/dotfiles/commit/afce27f740c4da4c91f3b989076a6ee70193a51a))
- **nushell:** Add extras ([618099d](https://github.com/azzamsa/dotfiles/commit/618099dd63e96a57e660c140d91d025498574f82))
- **cargo:** Manage cargo config ([080b69d](https://github.com/azzamsa/dotfiles/commit/080b69d03d61a115ce0f305c9e33debb50f027e0))
- Migrate to more popular dotfile manager ([3bb716d](https://github.com/azzamsa/dotfiles/commit/3bb716d5594650973ee42bb5cbb797fd901bae85))
- Manage more shells ([4bee5cd](https://github.com/azzamsa/dotfiles/commit/4bee5cd68366636e11393e4ed61ed47f73a945a9))
- **atuin:** Manage atuin ([cd2471e](https://github.com/azzamsa/dotfiles/commit/cd2471e674df062c6262032461ed7698bcb4511f))
- **alacritty:** Initial config ([8ea48ef](https://github.com/azzamsa/dotfiles/commit/8ea48ef46d6b2010e85b67ab12aef7baa50ef25f))
- **scripts:** Systeminfo ([d7692d0](https://github.com/azzamsa/dotfiles/commit/d7692d06d20a47128535b1b4bec723e4dd3d361b))
- Migrate to bombadil ([4c4a613](https://github.com/azzamsa/dotfiles/commit/4c4a6136d953eb083994d9e17486a1677324e770))
- Sync keybindings ([d385c1f](https://github.com/azzamsa/dotfiles/commit/d385c1f52aff4b282e3fd00dd7ab91a8ad794698))
- Use Tokyonight v4 by folke ([6eaf60e](https://github.com/azzamsa/dotfiles/commit/6eaf60e42e6a234a507f0e47ba5b39de420ea321))
- **fish:** Add more helpful commands ([850981f](https://github.com/azzamsa/dotfiles/commit/850981fa2410bf57d68c8216b0a35bf730c2bf83))

  - take: Create a directory, then `cd` into it.
    - gcl: Clone a git repo with a shallow copy, then `cd` into it.

- **scripts:** Tz ([3059c91](https://github.com/azzamsa/dotfiles/commit/3059c9152fc496d12df5c2793adf9dbc53bd41e0))

  Shows the timezones of my friends and companies.

- **scripts:** Age ([9ac0038](https://github.com/azzamsa/dotfiles/commit/9ac0038a79333dc26cc0afdef7c93b5cba975664))
- **fish:** Avoid repeatedly writing `hurl .. | jq` ([e0eeb89](https://github.com/azzamsa/dotfiles/commit/e0eeb8944c0a848775402c0357370cab1d8c4f04))
- **zellij:** Add custom Catpuccin theme ([b83fda1](https://github.com/azzamsa/dotfiles/commit/b83fda108e763ddf3f96520d1fc1679153696dc3))
- **fish:** Turn more knobs ([72ab089](https://github.com/azzamsa/dotfiles/commit/72ab089de794f80474ce62556a93f080ac5e6f8b))
- **bash:** Support rye ([b864e6f](https://github.com/azzamsa/dotfiles/commit/b864e6f6b90d3f800732caa0db91234da6f27561))
- **bash:** Enable starship prompt ([28ead92](https://github.com/azzamsa/dotfiles/commit/28ead92ddc027b0a0461abb48871b6a20399e250))
- **tridactyl:** Migrate from `mnei` to `neio` ([aec0918](https://github.com/azzamsa/dotfiles/commit/aec09185ae236869acb1f6539539a82ada699cd1))
- **starship:** I use so many shell ([2c85eb9](https://github.com/azzamsa/dotfiles/commit/2c85eb98e238f3f070464108350861a9497a04b3))
- **zsh:** Bring it back ([97ebd9b](https://github.com/azzamsa/dotfiles/commit/97ebd9bccdff628ff1c42480c4fdadc0b91373f1))
- **yazi:** Yazi 0.2 doesn't require a copy of entire config ([90996db](https://github.com/azzamsa/dotfiles/commit/90996db4ceee3b10729256da085ae519298ce8e0))

  This version has `prepend` and `append` keybinds feature.

- **wezterm:** Faster pane navigation ([ca2007c](https://github.com/azzamsa/dotfiles/commit/ca2007ccdd8049c78714c55d6077ee444b6ed807))
- **scripts:** Add 'nip' script ([d7ad53e](https://github.com/azzamsa/dotfiles/commit/d7ad53eeb4e963d2d1eb12d26da435b8da192d9c))

  Enables easy retrieval of my public IP address.

- **hyprland:** Match GNOME keymaps ([9f193be](https://github.com/azzamsa/dotfiles/commit/9f193be49943fb554057e6d908bf25421e052353))
- **scripts:** Add more ([559980c](https://github.com/azzamsa/dotfiles/commit/559980ce9af340ca3ad7cbdb0b7dc072415d9d64))
- **scripts:** Custom Flameshot scripts ([e544206](https://github.com/azzamsa/dotfiles/commit/e5442068a07d8c1c80fb6f0a1ebf7caa24b39239))

  In GNOME, Flameshot only works when started from the shell.

- **yazi:** Themes ([0143f7a](https://github.com/azzamsa/dotfiles/commit/0143f7afd6f7c9d82018eb768dd1bb498ef2bb1e))
- **scripts:** Remove merged branches in Git ([9946008](https://github.com/azzamsa/dotfiles/commit/994600815399059cc69b203c1773624bac3a98f5))
- Catppuccin mocha theme ([fea290f](https://github.com/azzamsa/dotfiles/commit/fea290ffb1a316f8672cfd62d1c584c1c89d7708))
- Tokyonight day theme ([40f4b94](https://github.com/azzamsa/dotfiles/commit/40f4b948993573eab6574476d7269c43744f06d6))
- **hyprland:** Turn more Hyprland knobs ([52bde4c](https://github.com/azzamsa/dotfiles/commit/52bde4c0e3c352e5ae5e9bdb50575b1447dff739))
- Choose more contrast color for Kanagawa ([dc61fb2](https://github.com/azzamsa/dotfiles/commit/dc61fb25fd3e4b24334fd3a555349b29fcb1e6ca))
- Kanagawa theme ([2ac1fde](https://github.com/azzamsa/dotfiles/commit/2ac1fde5060bd497a97fc2803cc4030ad651a4d5))
- **hyprland:** Turn more Hyprland knobs ([2fe2860](https://github.com/azzamsa/dotfiles/commit/2fe2860fb26cd3acdd4b568ac63da514cf8b8432))
- **hyprland:** New hyprland theme ([41cf7b5](https://github.com/azzamsa/dotfiles/commit/41cf7b50065c6c81a129fdadf9d6aa9b848df695))
- **hyprland:** Use Hyprland 🎉 ([219b3f4](https://github.com/azzamsa/dotfiles/commit/219b3f4803b629cfeb2a5141c9e18e22517e87cf))

  In an attempt to distance myself from the uncertainties of GNOME,
  I tried switching to Hyprland back on June 26, 2023.
  I desired something over which I could have full control.
  Unfortunately, it wasn't installable on Fedora due to numerous errors and missing dependencies,
  leading me to revert back to GNOME.

  Last week, I was disappointed to learn that GNOME wasn't included in SteamVR for Linux support.
  It seemed like GNOME's development was lagging behind compared to others.

  ```
  Some compatible window managers/compositors include:

      All X11 Window Managers and Compositors
      KDE Plasma Wayland
      Most wlroots based compositors:
          Sway
          LabWC
          Hyprland
  ```

  Upon seeing that announcement, I thought, "It's time to give Hyprland another shot."

  Back then and even now,
  my mission remains the same - I don't want someone or a company to force me to change my workflow.
  GNOME is always evolving, and I worry that someday GNOME 5.x might change everything,
  similar to the shift from GNOME 2.x to 3.x.

  The installation was smooth,
  thanks to someone packaging everything for Fedora. Everything worked seamlessly.

- **yazi:** Use Github color for files ([e317547](https://github.com/azzamsa/dotfiles/commit/e317547e42f57cef5e1449ca6851632dc18b0bf6))
- **nushell:** Nushell 🎉 ([6684a82](https://github.com/azzamsa/dotfiles/commit/6684a82e4f1ba3acb4246a1c6ff60d7b8595fb1c))

  Welcome to the club!

  However, after several hours of setup. Nushell is not ready for daily usage.

  - [nushell: atuin should not always trigger on ⬆️ · Issue #1025 · atuinsh/atuin](https://github.com/atuinsh/atuin/issues/1025)
  - [`column_not_found` in Nushell · sxyazi/yazi · Discussion #501](https://github.com/sxyazi/yazi/discussions/501)
  - [Generated .zoxide.nu has incorrect syntax · Issue #661 · ajeetdsouza/zoxide](https://github.com/ajeetdsouza/zoxide/issues/661)
  - [Nushell support · Issue #463 · Schniz/fnm](https://github.com/Schniz/fnm/issues/463)
  - Syntax highlighting still requires manual setup.
    - https://github.com/nushell/tree-sitter-nu/blob/main/installation/neovim.md#manual-installation
  - nufmt is still very much in beta.

- **wezterm:** Use `wezterm` as a replacement for `zellij`. ([20e5147](https://github.com/azzamsa/dotfiles/commit/20e51477af2eb388dceeeba04d0d984f0bed8a78))

  - Some emojis in Zellij fallback to symbols.
    - Wezterm already has all the features I need from Zellij.
    - Wezterm has `key_tables` to mimic `zellij` leader keys, so I don't have to memorize new keys.
    - Thanks to Lua, I can customize Wezterm _however_ I want.

    I always run Zellij on top of Wezterm, and I find it redundant.

- **copyq:** Add `Tokyo Night Moon` theme ([e035f62](https://github.com/azzamsa/dotfiles/commit/e035f625ff399628d686992f506be71df6f4936e))
- **yazi:** Add more bookmarks ([8cd07ae](https://github.com/azzamsa/dotfiles/commit/8cd07aeea5d573ceddf5f22ec73efc9f04b4566c))
- Migrate to Tokyo Night ([bb09176](https://github.com/azzamsa/dotfiles/commit/bb09176b09c73fc2916e794cc3e5f268d685bb17))
- **yazi:** Add more bookmarks ([eae05c0](https://github.com/azzamsa/dotfiles/commit/eae05c0015991fc8a04a2f98ceaf5ee903cf4d03))
- **helix:** Initial support ([953bec5](https://github.com/azzamsa/dotfiles/commit/953bec5eed63068e0dc3ff78755eb2b84b388c0f))
- **fish:** Integrate `toor` ([acc29aa](https://github.com/azzamsa/dotfiles/commit/acc29aa7225a7d3658041eb1688bc04c686b0cd8))
- **tridactyl:** Copy link as markdown ([84e679a](https://github.com/azzamsa/dotfiles/commit/84e679aa7faa243bf4fd00ee687e308a5812662f))
- Migrate to Catppuccin Mocha ([7cd0ab7](https://github.com/azzamsa/dotfiles/commit/7cd0ab7f4fde51c08983bfd13285e273f620dbe2))

  I wanted a Dracula theme with orange colors reminiscent of the fall season.
  I had tried Kanagawa and Gruvbox themes, but I fell in love with Catppuccin.
  It's more accessible and widely available, so I don't need to port it myself.

- Port Dracula to Dracufall ([9625e74](https://github.com/azzamsa/dotfiles/commit/9625e7467a8b9d1f1f17dfe07fc884314dfab0bc))

  Dracufall is my customized version of Dracula.
  It emphasizes the colors of the fall season.

- **wezterm:** Welcome ([1b6f5fe](https://github.com/azzamsa/dotfiles/commit/1b6f5fe8a07b0c27cf64b33b6103d2500e5e2f10))
- **xtool:** Calculate import tax ([da4de31](https://github.com/azzamsa/dotfiles/commit/da4de3104382948a8831489b023def36bb1c1ea5))
- **tridactyl:** Avoid pain from constantly holding Ctrl for scrolling ([9a21d4b](https://github.com/azzamsa/dotfiles/commit/9a21d4b22e27fd4489f6d2e2ffb4c28740e0fdad))
- **fish:** Use common key to delete word ([a3c2b30](https://github.com/azzamsa/dotfiles/commit/a3c2b300746ed857915b59f0ec559b2d0c8dffc0))

  I prefer to use Ctrl+Backspace to delete word backward.
  Most app use this instead of Alt-Backspace.

- **tridactyl:** Initial ([3a8d1e2](https://github.com/azzamsa/dotfiles/commit/3a8d1e2df9bccc5c819e2a57e8d7055465cf3758))

  It is better and has better vim emulation than Vimium-FF.

- **git:** Add absolute date ([a1ab553](https://github.com/azzamsa/dotfiles/commit/a1ab553ca224adac552e6a369369f0299b074541))

### 🐛 Bug Fixes

- **scripts:** Wrong scripts location ([d470bc9](https://github.com/azzamsa/dotfiles/commit/d470bc915b45dfcd7b8f532d522504978d917676))
- Wrong starship config location ([282097c](https://github.com/azzamsa/dotfiles/commit/282097cdaa4bd00b63885b4ce6c987b569f6a642))
- **fish:** My fish tokyonight was merged upstream ([c176358](https://github.com/azzamsa/dotfiles/commit/c17635859c7d17bf29694053c30a3bfbbf63434a))
- **zellij:** Use `k` to close a pane/window ([0b64c9f](https://github.com/azzamsa/dotfiles/commit/0b64c9f9e057a7a6fdcdc41b465da2fcbf6dc0ce))

  I am familiar with `k` due to my old muscle memory of `(k)ill buffers`.

- **scripts:** Don't show compiling progress ([2df8b86](https://github.com/azzamsa/dotfiles/commit/2df8b862c33019958e34956b78c007c5a8a8556e))
- **zellij:** Use the same background color as terminal ([29457a0](https://github.com/azzamsa/dotfiles/commit/29457a0b8150a2e6f5506b78db9b577a2c7a7dfe))
- **wezterm:** Go back to Zellij ([065d3dc](https://github.com/azzamsa/dotfiles/commit/065d3dce716b873ae437ac6cd5120dba4a2e2089))

  - My Wezterm keys are hard to access and remember, so I always resort to using the mouse to navigate the tabs.
    - I almost always forget about the keys because I don't have hints similar to Zellij or Which-Key.
    - In Wezterm, it is `Ctrl-SPC t <nav key>` (mine), compared to Zellij's `Ctrl-t <nav key>`.
    - I could mimic Zellij's keys, but what I miss the most is the visual feedback Zellij gives me. All I have in Wezterm is just echoing the current key status in the top bar.

- **scripts:** Fail to remove merged-branch because of leading whitespace ([83d38f5](https://github.com/azzamsa/dotfiles/commit/83d38f5b9ae35fac459e748940b6b1740e8de8a1))
- **wezterm:** Use distinguishable name for custom theme ([9270b2c](https://github.com/azzamsa/dotfiles/commit/9270b2cf0934600b271d2b61580f5fcec58c103a))
- **zellij:** Adopt new navigation keys ([7b88e24](https://github.com/azzamsa/dotfiles/commit/7b88e24334fe8b934628094078d5d2b11c848d4a))
- **scripts:** Remove `office` to private repo ([1bbaef2](https://github.com/azzamsa/dotfiles/commit/1bbaef2637b0f89a44a8ba87d1202e3176856322))
- **wezterm:** Fallback to Nerd font ([666e030](https://github.com/azzamsa/dotfiles/commit/666e0301b1dd43751e8a8e2231e2f1bfb1516f9a))

  My intention to use non-Nerd font is so that the
  emoji fallback to Noto first than Nerd. Turns out it doesn't work.

- **fish:** Nyazi code is outdated ([135589e](https://github.com/azzamsa/dotfiles/commit/135589edbbc99ac6d4390cfe40b4e4c4b826ece4))
- **fish:** Old habit die hard ([3e9e45a](https://github.com/azzamsa/dotfiles/commit/3e9e45ad59904afbaaaed15bed15fefc058e8f4a))

  I always mistype `g` for `git`

- **wezterm:** Wezterm doesn't need Nerd font ([3ee2d3b](https://github.com/azzamsa/dotfiles/commit/3ee2d3b45287805cdcc14ee21baa6ee90b068a77))
- **xtool:** Prevent automatic installation of `@antfu/nu` when installing `@antfu/taze` ([c4ad62d](https://github.com/azzamsa/dotfiles/commit/c4ad62d5597d2c757f080d54997079409b51a746))

  This package is consistently installed automatically whenever `@antfu/taze` is installed.

- **hyprland:** CopyQ is not reliable in Hyprland ([5d50a95](https://github.com/azzamsa/dotfiles/commit/5d50a95b3d8d9a29c136d86611c84e5f8f335076))

  Most of the time, I need to press the copy key multiple times before it
  registers in CopyQ, and sometimes I need to move the cursor to the top
  in the CopyQ 'show history' to make it work.

  The combination of 'cliphist' and 'wl-clipboard' works well here. It is
  very reliable in Hyprland. However, I can't find a runner that is able to
  show a clipboard history with an image preview feature.

  I use audio feedback for both of them. That's why I know when my text has
  not landed in the primary clipboard.

- **fish:** Neovide uses different color in built-in Terminal ([ef18dad](https://github.com/azzamsa/dotfiles/commit/ef18dad949f1bc2f8bace25f8f4fd48744d33cc0))

  Force true-color support; otherwise, the Neovim Terminal inside Neovide
  (not the case with Neovim inside the Terminal) will use slightly different colors,
  which is sometimes annoying and hard to read. I've been having a hard time solving this issue,
  ranging from setting `vim.g.terminal_color_n` and other approaches.
  It turns out it's an issue with the Fish shell.
  All credits due to fredizzimo (Neovide maintainer) for finding this solution.

- Place formatter and linter configs in the root directory ([cf854bd](https://github.com/azzamsa/dotfiles/commit/cf854bd11958583b40432768a023532c18a4cead))

  Otherwise, we would have to deal with a custom `--config-path` for every possible formatter on Earth.
  It's okay to let them clutter the directory (check out the Neovim repo).
  Even if they are visible on the GitHub repo, locally they are hidden by your favorite editor.

- **zellij:** Enable border frames ([8e853e6](https://github.com/azzamsa/dotfiles/commit/8e853e682891bec427ff3fcafd2c4e84e75319b3))

  Without the frames, it is hard to distinguish the boundary between the content (command output)
  and the footer tooltip. I need some space between them.

- **bash:** Nvim complaints about missing $TERM variable ([c5c4a4e](https://github.com/azzamsa/dotfiles/commit/c5c4a4e03e14eef293b23c4cb64e6e8ce645a8f4))
- **zellij:** Adopt `wbolster/colemak` mappings ([0ac6599](https://github.com/azzamsa/dotfiles/commit/0ac659913524005cfdfb931fbc743149a7083787))
- **bash:** Change $EDITOR to `neovide` ([d98c1d5](https://github.com/azzamsa/dotfiles/commit/d98c1d58199fb3eb5c653e3f658de919349f2d88))
- **bash:** Emacs can't find `node` ([25c180a](https://github.com/azzamsa/dotfiles/commit/25c180a612568722453e56e7fcde956a42a54de7))
- **wezterm:** `__bp_install: command not found` ([33c51a4](https://github.com/azzamsa/dotfiles/commit/33c51a450628ad00612bb71c1848066112543690))

  I removed the `fish` hook in my bash config and set `zellij` as the default
  program in Wezterm. My default shell in `zellij` is `fish`. So, the problem is solved!

  Now, I get the bonus of not having to type `zellij` every time I open `wezterm`.

- **fish:** Unreadable theme in pager page ([6ebab6f](https://github.com/azzamsa/dotfiles/commit/6ebab6f6e0bfccd0c876ace9cd66d7734ceceaee))
- Revert back to Dracula. ([6354ca2](https://github.com/azzamsa/dotfiles/commit/6354ca24143e223b36e4356701ab5dfad0538809))

  I am lost, help!

- **yazi:** Upgrade to v0.1.5 ([437b43f](https://github.com/azzamsa/dotfiles/commit/437b43f742750019163132daf8d35bbba67bf0dc))
- **yazi:** Go to description is too long ([e72a3f8](https://github.com/azzamsa/dotfiles/commit/e72a3f80f0d319410bc65266d1502d3f78d1c17a))
- **xtool:** `tmp` is replaced by `Downloads` ([1aa46af](https://github.com/azzamsa/dotfiles/commit/1aa46af521b8261837e0df27da9f688866b68c8e))
- **fish:** Autoload doesn't work reliably ([11e9ac5](https://github.com/azzamsa/dotfiles/commit/11e9ac5ed97172fb98eca539fb3243990e726c0e))
- **zellij:** Don't quit accidentally ([99b364a](https://github.com/azzamsa/dotfiles/commit/99b364a93378f2b2ed83c9870b3f0471fe40ce8e))
- **fish:** `exa` is unmaintained ([6699f0a](https://github.com/azzamsa/dotfiles/commit/6699f0a8ffff7d9ee3516b57d9de9fdb72f55ba7))
- **xtool:** It's dnf! ([86b7438](https://github.com/azzamsa/dotfiles/commit/86b7438460d418d3fe2c47d7109a7f9260c8a49a))
- **xtool:** Remove the 'flatpak' and 'package-manager' upgrade steps ([bf4a6c9](https://github.com/azzamsa/dotfiles/commit/bf4a6c9c5f6583b01ad14668e9e3e9a9c8b9f8fa))

  Nowadays, I have an optical cable connection and no longer need to worry about internet quotas.

- **xtool:** `newsflash` id changed ([cab96fd](https://github.com/azzamsa/dotfiles/commit/cab96fd9f350770aab6cff575a1da3deae802834))

### ⚡ Performance

- **bash:** Use `plists` for `lsp-mode` deserialization. ([6bb05eb](https://github.com/azzamsa/dotfiles/commit/6bb05eb04c31953a1fa87ca86501fc621035fe95))
- **fish:** Load `fnm` only on node project ([4e181e9](https://github.com/azzamsa/dotfiles/commit/4e181e9e984255fab0181d102e88db017528302a))

### 🧹 Cleanup

- **joshuto:** I prefer single pane layout ([dbabf44](https://github.com/azzamsa/dotfiles/commit/dbabf44d0080357a93cb58c5d6c2d5906ad66a0c))
- **gnome-terminal:** I want to give wezterm a chance ([5a58430](https://github.com/azzamsa/dotfiles/commit/5a58430e6ceaf2af0fb6ad779a7c7c6442ad4437))
- **vi:** I never use any vi related app anymore ([490cb4e](https://github.com/azzamsa/dotfiles/commit/490cb4ea236cae6fac239ace35afded0c87a07ee))

## [5.0.0] - 2023-08-09

### 🚚 Migrations

- Fedora 🎩 ([f09550c](https://github.com/azzamsa/dotfiles/commit/f09550c399e67f223fa41c4517b15b1772e56847))

  Unfortunately, I haven't come across any Linux distribution that offers a desktop experience as polished as Fedora.

### ⛰️ Features

- **xtool:** Don't hardcode package manager name ([8a22458](https://github.com/azzamsa/dotfiles/commit/8a22458688fa5af15e4935d56479af0c9f77214f))
- **xtool:** Support cleaning multiple directories ([77af30f](https://github.com/azzamsa/dotfiles/commit/77af30f2f05972e3e318167fe4e90ff8256767d3))
- **bash:** Drop into fish automatically ([908bbc9](https://github.com/azzamsa/dotfiles/commit/908bbc9fa30b29af91fc706d17479acc00891789))
- **fish:** Use both `cargo-machete` and `cargo-udeps` ([a2ad88a](https://github.com/azzamsa/dotfiles/commit/a2ad88a22b5df8f7e5a69066eb1a4e26187f741c))
- **xtool:** Add shell completions for `in` and `out` ([95422b8](https://github.com/azzamsa/dotfiles/commit/95422b82ef97dd88d6db69dbfcab36257c9444ee))
- **xtool:** Install & uninstall ([8699908](https://github.com/azzamsa/dotfiles/commit/8699908b1b55296ea61d757c294e64713fc6da5e))
- **fish:** Bookmark ([9679743](https://github.com/azzamsa/dotfiles/commit/9679743ca3d3c206b0551fa8a518be582cd8866f))
- **bash:** Fish has so many issue with EMACS PATH ([24af137](https://github.com/azzamsa/dotfiles/commit/24af13782be37582cd451f428d46f7281d406e8f))

  Now, Bash is the default $SHELL. Fish only plays as interactive shell.

- **xtool:** Add lotr name ([331b525](https://github.com/azzamsa/dotfiles/commit/331b52521e166baa17f39caa8c1d90a76b6dc496))
- **fish:** Don't pollute my home directory ([b2561d2](https://github.com/azzamsa/dotfiles/commit/b2561d252cdd2a83e6bdc954dae069c086ecd887))
- **fish:** Switch back to fish ([9c06bdb](https://github.com/azzamsa/dotfiles/commit/9c06bdb530520b74d0d057bd52c2a9996802c5ad))

  I want simple thing.
  Fish just need couple lines of config.

- **xtool:** Use more suitable emoji ([e4ac444](https://github.com/azzamsa/dotfiles/commit/e4ac44433d58aee840492fe2b36c2720ae110f8c))
- **starship:** New prompt icon! ([656b2bb](https://github.com/azzamsa/dotfiles/commit/656b2bb44fd6048c86cf9299ad3a76d791c81aa4))
- **zellij:** Colemak-dhm keybindings ([b60ed0a](https://github.com/azzamsa/dotfiles/commit/b60ed0aa0b954e27a893a0ab8d37c28fbf225b1d))
- Arrived at home. Tired after long journey 🌀 ([6151396](https://github.com/azzamsa/dotfiles/commit/61513966e5b6c1697af94e68e22a6caffb0c64dc))
- Joshuto ([af7b76f](https://github.com/azzamsa/dotfiles/commit/af7b76f51fc0f52b5929d0b0c2d72d41fe2009f0))
- **git:** Ignore more project.el files ([f00e4d4](https://github.com/azzamsa/dotfiles/commit/f00e4d49334aeb0d2f46229029018f1936e77193))

### 🐛 Bug Fixes

- **xtool:** Use shorter argument name ([44016b8](https://github.com/azzamsa/dotfiles/commit/44016b894185dbbc22a8104a949b203bacf046f4))
- **xtool:** Remove `install` and `uninstall` ([8a8f842](https://github.com/azzamsa/dotfiles/commit/8a8f8423d2f394c9c78591169d27eec05b8264b5))

  I can't get apt/dnf autocomplete of package name

- **xtool:** Write fish completions manually ([5044a15](https://github.com/azzamsa/dotfiles/commit/5044a15125211a6f450019d8c411770ad45978ea))

  I want a simple API for my CLI commands. I want to type them quickly.

- **xtool:** Missing `--no-related` argument ([da10236](https://github.com/azzamsa/dotfiles/commit/da10236530b3f559663e5a5127393f55794002d4))
- **xtool:** Upgrade only specified `flatpak` apps ([884fb9b](https://github.com/azzamsa/dotfiles/commit/884fb9b92d04313fa1b814893592830fd5c21ad8))

  Their download size is very huge.

- **fish:** Old habit die hard ([dc5a1dc](https://github.com/azzamsa/dotfiles/commit/dc5a1dc295455f71b94b0121d971135acd407893))
- **bash:** Source meta env ([539cd27](https://github.com/azzamsa/dotfiles/commit/539cd279cee4763a950b4c40f786a6fff2b5b957))
- **git:** I am back at using mutable distro. ([0ceeb43](https://github.com/azzamsa/dotfiles/commit/0ceeb43c0ad6202fdf2469cb6920a29d4f3b622f))
- **fish:** Setting it to default shell breaks Emacs ([52f9dbd](https://github.com/azzamsa/dotfiles/commit/52f9dbd86432843f28dee68b7af788f811aedad3))
- **fish:** Warning about cargo and rustup directory ([bad66db](https://github.com/azzamsa/dotfiles/commit/bad66db5e93802a7c4a31e9cac64d16063684d93))
- **xtool:** Wrong `nala` command ([46c89d8](https://github.com/azzamsa/dotfiles/commit/46c89d8a944710f90a36041ff2537580f112c23a))
- Remove wezterm ([8b1f7e1](https://github.com/azzamsa/dotfiles/commit/8b1f7e1929e5f481d98b8b87dbc55caaf5245d4f))

  It has so many issue.
  - Can't find the config file. Unless executed from terminal.
  - Can't display correct emoji out of the box.

- **zsh:** Remove unused alias ([df31c82](https://github.com/azzamsa/dotfiles/commit/df31c827bf890a8924c638cfab32daf97b846f71))
- **zsh:** Bring back `ls` alias. ([c50db12](https://github.com/azzamsa/dotfiles/commit/c50db1288dea3a42340d2032a673204efa35a89a))

  Old habit die hard.

- **zsh:** `up` should be used by xtool `upgrade` ([1d7aac9](https://github.com/azzamsa/dotfiles/commit/1d7aac94dce4a8ad689de5e7097cf304583af7ec))

## [4.0.0] - 2023-07-07

### ⛰️ Features

- **xtool:** Choose any module to run ([e911209](https://github.com/azzamsa/dotfiles/commit/e9112092815cf0bafe661a1928b8bbfe733f02f0))
- **zellij:** Colemak-dhm key ([b6d9570](https://github.com/azzamsa/dotfiles/commit/b6d957047f10029efe4a014923384cf958a7ae36))
- **xtool:** Tell `kondo` to ignore `nodebin` ([9172aed](https://github.com/azzamsa/dotfiles/commit/9172aed4cd27a7f097adeb3561d0496f0ac2a84b))
- Welcome again, Fedora! 🏆 ([d2d3d2e](https://github.com/azzamsa/dotfiles/commit/d2d3d2e0b4f83362488a407155149d581122d361))
- **xtool:** Exclude some file ([c2bf35b](https://github.com/azzamsa/dotfiles/commit/c2bf35bddb5bd63f92490c25042f2e5d965ce032))
- **zsh:** I have one primary container ([ad5cbe4](https://github.com/azzamsa/dotfiles/commit/ad5cbe462149867f959b5b7a740bb71f3410dd58))

### 🐛 Bug Fixes

- **zsh:** Emacs always rebuild the Cargo project ([f2df26e](https://github.com/azzamsa/dotfiles/commit/f2df26e6f211f4782938edc0a39e56419017c9e5))

  Emacs eglot-mode and lsp-mode always rebuild the entire Rust/Cargo project upon
  changes. I assume that Emacs uses different Rust tooling (`rust-analyzer`, `cargo`, etc)
  compared to the one that I use from the terminal. Because `rustup` install both tools in `~/.cargo`
  and `rustup/<target>` directory. `This force`cargo` to rebuild the entire project.

  After resetting the `cargo` and `rustup` path to default. The issue is solved.

  This doesn't apply to VSCodium, because it uses its own rust-analyzer.

- **xtool:** Migrate to lexopt from pico-args ([f4bb103](https://github.com/azzamsa/dotfiles/commit/f4bb10389c29b190818d58c79ae31bfb6af8f0cb))
- **git:** GitHub is okay with 7 commit hash ([213d3d3](https://github.com/azzamsa/dotfiles/commit/213d3d3939fa97b2556658bfbb04c8706b97b749))
- **zellij:** Zellij themes now included in the release ([a581e1c](https://github.com/azzamsa/dotfiles/commit/a581e1c168965adb046391221041e570773ec8a5))
- **zsh:** Emacs doesn't reliably able to read the env var. ([4b8fb77](https://github.com/azzamsa/dotfiles/commit/4b8fb77a33de840b336b514a163846fc74be0b6a))

  Because it started from container.

- **zsh:** I don't use Doom anymore. ([3b8c8d9](https://github.com/azzamsa/dotfiles/commit/3b8c8d99d46e54163e2000253cdbbef38b1ae2ee))

  I hate when doing `doom upgrade` and it breaks.
  It breaks in critical times, and I don't get help in Discrod.
  Yes, it is silly to run upgrade during critical times.

- **starship:** Increase command timeout ([6460bf4](https://github.com/azzamsa/dotfiles/commit/6460bf49b750affabd74a751e89d5ceb494f1e4b))
- **age:** It should be private ([a84d968](https://github.com/azzamsa/dotfiles/commit/a84d96872a0d91639c58eb532b1310668b66a9eb))

  I need to add more names

- **zsh:** Source Cargo env ([6e2b07c](https://github.com/azzamsa/dotfiles/commit/6e2b07c276a974fd704fc00fcac8f4d7f3b71eb7))
- **zsh:** I always forget the name of GNOME file manager ([b184048](https://github.com/azzamsa/dotfiles/commit/b184048359076c4e6a7cfb7a74c894b8bdb32b72))
- **xtool:** Only remove image without a name ([48bb3c5](https://github.com/azzamsa/dotfiles/commit/48bb3c57ddceac1f297d23dd400e4fdb94061738))
- **xtool:** Ports ([4be89aa](https://github.com/azzamsa/dotfiles/commit/4be89aa07e95d47f2056297971811f17c3b9d1b8))
- **xtool:** Update names ([9992275](https://github.com/azzamsa/dotfiles/commit/9992275e5d11ca3a211a20c6a54a3baf4f9c2ac0))

  - Use adjectives that are positive, motivating, inspirational, and wise
    - Add more description of each schoolar

- **zsh:** Use `rye` to manage python ([956e510](https://github.com/azzamsa/dotfiles/commit/956e510b8476732c2a142ae3a2a7c97909add6f1))

## [3.1.0] - 2023-06-05

### ⛰️ Features

- **xplr:** Initial commit ([cefb978](https://github.com/azzamsa/dotfiles/commit/cefb97829e7a227d89a5df1addffbf059a402cd9))
- **zsh:** Support xplr ([605eb7b](https://github.com/azzamsa/dotfiles/commit/605eb7bf7018ced35961af439f0effa41c841e67))
- **zsh:** New aliases ([c7c6abe](https://github.com/azzamsa/dotfiles/commit/c7c6abecbcb5f019d00c13f2c9d4c71c2ca06719))
- **zellij:** Custom theme ([7a9b867](https://github.com/azzamsa/dotfiles/commit/7a9b8670383fe455bf16177e784897c38ff5f7c8))
- **zellij:** Hide session name ([31a1a2e](https://github.com/azzamsa/dotfiles/commit/31a1a2eec3327da70e8b666ea9b13d5d582b5f7a))
- **xtool:** Names ([e577885](https://github.com/azzamsa/dotfiles/commit/e577885f23ac2fe88a260914a22184277e1a9b07))
- **zsh:** Add more aliases ([d402a11](https://github.com/azzamsa/dotfiles/commit/d402a11e740169afc34957d718070f78177ae876))
- **zsh:** Source meta env automatically ([ebf63ad](https://github.com/azzamsa/dotfiles/commit/ebf63ad75fea80c3ec278d692290ebf045a288b9))
- **docs:** Add yt-dlp ([1baaf21](https://github.com/azzamsa/dotfiles/commit/1baaf21798bdba29cb38c1d880a8a8db91210433))
- **docs:** Setup dns ([883f785](https://github.com/azzamsa/dotfiles/commit/883f78528dbee974fb815d35e64e113f3eab230a))
- **zsh:** More aliases ([9452797](https://github.com/azzamsa/dotfiles/commit/94527975b92af1dc8494332f5a0f8b4777fd251d))
- **docs:** Setup dns ([df6930f](https://github.com/azzamsa/dotfiles/commit/df6930f36d91bf7c315ca32d2fcb8f2e606feb06))
- **docs:** Brave just for emergency ([4f2f1db](https://github.com/azzamsa/dotfiles/commit/4f2f1db02b124b46bb83cb19b01f12dda4c4f7e6))
- **docs:** More apps ([fe811f0](https://github.com/azzamsa/dotfiles/commit/fe811f0fcda267b8201626d6821486619fec53de))

### 🐛 Bug Fixes

- **zsh:** Root prompt failed to find zsh entrypoint ([17f93e9](https://github.com/azzamsa/dotfiles/commit/17f93e9924a5cff881af4cd0131606c928412b14))
- **git:** It is `connect-proxy` on Fedora ([18fe78d](https://github.com/azzamsa/dotfiles/commit/18fe78da1e99cf3eba5aa0b08fd72ff66795945b))
- **zsh:** Now rust-analyzer is managed by rustup ([1bf0b67](https://github.com/azzamsa/dotfiles/commit/1bf0b6758893137295e910e86b1be52977f99218))
- **xtool:** Don't fail if no OS upgrade ([b1a8ea2](https://github.com/azzamsa/dotfiles/commit/b1a8ea29c78c44c99c66720cb5d9710c1747dffc))
- **docs:** Workrave icon doesn't shows up ([a39805c](https://github.com/azzamsa/dotfiles/commit/a39805cbf86a57e63801bed95c47680fcae7523d))
- **xtool:** Don't check for exit status on some commands ([e41c913](https://github.com/azzamsa/dotfiles/commit/e41c913f2a725bef6a15473313ee1fb85a39b8ff))
- **xtool:** Don't accept unknown flag ([f8ad9df](https://github.com/azzamsa/dotfiles/commit/f8ad9df07ef84f5108a286bbb0d38f96313806d9))
- **xtool:** Disable prompting to a user ([5f28927](https://github.com/azzamsa/dotfiles/commit/5f28927e1cddc19dacc350ea26c4e1a1a28472b3))

## [3.0.0] - 2023-04-02

### ⛰️ Features

- **xtool:** Age ([03f6b15](https://github.com/azzamsa/dotfiles/commit/03f6b15d761bca238f090abe9fb08f426fe7b2b5))
- **xtool:** Backup ([d393a94](https://github.com/azzamsa/dotfiles/commit/d393a9454715f416db018cfe74409868c2555b45))
- **bin:** Xtool ([19dedfe](https://github.com/azzamsa/dotfiles/commit/19dedfe592d2ee630a08386afbeda4dc91027317))
- **docs:** Add more apps ([210a4fc](https://github.com/azzamsa/dotfiles/commit/210a4fcf260421926e510994a6a7a18093638472))
- **docs:** I use Rust as scripting tool ([8b25a34](https://github.com/azzamsa/dotfiles/commit/8b25a344a0eb97071f642a400e1bbad3257db22b))
- **docs:** Setup icons ([d2b15c1](https://github.com/azzamsa/dotfiles/commit/d2b15c18a84e30dcc1bc9e201327f9a2b0c68c44))
- **docs:** Setup poetry ([302e53b](https://github.com/azzamsa/dotfiles/commit/302e53b81b8dbbc386a50e9e3cbfda69b6376f8a))
- **docs:** Setup credentials ([44be206](https://github.com/azzamsa/dotfiles/commit/44be206472bf31e89a9c7e002aa6fdc32f1bf4b8))
- **docs:** Setup terminal ([12d9da4](https://github.com/azzamsa/dotfiles/commit/12d9da4fd8aea2c78b3eabff0d5cd2bc6f57bba4))
- **docs:** Add more apps ([ae71c04](https://github.com/azzamsa/dotfiles/commit/ae71c041e3da45d37ecfbb52343f7aeb7fa75c41))
- **docs:** Remove bash configs ([b9b14cb](https://github.com/azzamsa/dotfiles/commit/b9b14cb3b8c91ceacbc0eb99ef275ca4edcc9731))
- **docs:** Support proselint ([644785c](https://github.com/azzamsa/dotfiles/commit/644785cd7539d9ab7282066a699c83f996d19157))
- **docs:** Vpn ([b49460b](https://github.com/azzamsa/dotfiles/commit/b49460bb1a2630496187432b8025691b0e963859))
- **docs:** Gnome settings ([81dd382](https://github.com/azzamsa/dotfiles/commit/81dd382cb2592ab1a62467cc01a1d3c905b8994a))
- **docs:** Use `copyq` ([54b1c47](https://github.com/azzamsa/dotfiles/commit/54b1c478e0a0875574b6d0f0e5cdaa03803fb29a))

  Pano is buggy and requires ostree level library as dependency.

- **docs:** Move post-install ([98c9fcd](https://github.com/azzamsa/dotfiles/commit/98c9fcdbcd826be98433673fdc92cc6afd63c4f9))
- **bin:** Setup flatpak permission ([e95b526](https://github.com/azzamsa/dotfiles/commit/e95b52674b0f310ee1ef859f6f4dcd6d4e694aab))

  Using `flatseal`

- **bin:** Add more packages ([a9a7e19](https://github.com/azzamsa/dotfiles/commit/a9a7e194cef53367b7cfc710e99b6d6dd3f9429c))
- **bin:** Toolbox apps can be launched from host ([e10ef10](https://github.com/azzamsa/dotfiles/commit/e10ef10faa4da1f35c4fb3eca1b402f9d2709de1))

  I don't need zellij layout and command anymore

- **zsh:** `toolbox` alias ([ac0d973](https://github.com/azzamsa/dotfiles/commit/ac0d973e56fe4e6b2385255a18d0930d7a9a3377))
- **bin:** Add stow ([bf7d4b4](https://github.com/azzamsa/dotfiles/commit/bf7d4b43cb7b0c5845ab66d0ae00b47dc67f5dd7))
- **zellij:** Add common layout ([cc00afb](https://github.com/azzamsa/dotfiles/commit/cc00afba8f94c8db6a03f5bb2980ac08b0334187))

  I am very amazed by its `command`.

- **bin:** Maximize the use of container ([914f1d3](https://github.com/azzamsa/dotfiles/commit/914f1d35eb795be3658b7e8fea6393cee7316be8))
- **zsh:** New alias ([74c1ed0](https://github.com/azzamsa/dotfiles/commit/74c1ed02270b28eaeae5181f0a2733f87cf18424))
- **starship:** Bring it back! ([7f689e9](https://github.com/azzamsa/dotfiles/commit/7f689e9c2a3a9d5a6f609b7759f8ec4fd62253ce))
- **bin:** Add more packages ([71a7e68](https://github.com/azzamsa/dotfiles/commit/71a7e68ff8da29b88d14a9f030dc2d470fcb939d))
- **bin:** Add more packages ([1329da9](https://github.com/azzamsa/dotfiles/commit/1329da9daa2aaf653e2602b0d16ce53f0f53c11e))
- Migrate to Fedora Silverblue ([d6d75df](https://github.com/azzamsa/dotfiles/commit/d6d75df3c967a2bf19d87df937aa7499bf01172f))

  I don't want to break my machine again.

- **vimium:** Initial ([f542c92](https://github.com/azzamsa/dotfiles/commit/f542c924c5bcb4ddabc5d6fcfee72f14c768ee69))
- **bin:** Cleans dependencies and build artifacts ([15fc65c](https://github.com/azzamsa/dotfiles/commit/15fc65c34ac01ae2ab1c1abfca3577d8c505967f))
- **bin:** Use mold as default linker ([0473d60](https://github.com/azzamsa/dotfiles/commit/0473d60f8f8a5d656083f50e89b569b49bf1b3ea))
- Respect XDG specifications ([a7ea6a5](https://github.com/azzamsa/dotfiles/commit/a7ea6a5037331852f18a546b9bf44c685b2dd4fd))
- **bin:** Only clean `tmp` ([7040c1d](https://github.com/azzamsa/dotfiles/commit/7040c1d5d5cbd4f2bc6539b3990c61be81185722))
- **bin:** Gnome-calculator ([a592ebe](https://github.com/azzamsa/dotfiles/commit/a592ebe1e9f1d8bc0601539fe716923e04ecd142))
- **bin:** Support aspell ([e848078](https://github.com/azzamsa/dotfiles/commit/e848078ab740cbe118f5ab81987e0c3c41bcebcb))
- **bin:** More app to install ([b9e729c](https://github.com/azzamsa/dotfiles/commit/b9e729c224ccb96df058e1f6d3483920aefe7359))
- **zsh:** `cargo binstall` alias ([0f1db03](https://github.com/azzamsa/dotfiles/commit/0f1db03fe6a6298a191df245f0908f85bf0cac84))

### 🐛 Bug Fixes

- **docs:** Rust tools are now compiled ([a54011d](https://github.com/azzamsa/dotfiles/commit/a54011dffb0e75ebaa91201aba2b7345181cc4c5))
- **bin:** Can't remove directory content ([82ff52f](https://github.com/azzamsa/dotfiles/commit/82ff52fe70e7e67491eb7503d7e4d64929bc6d32))
- **docs:** Flameshot can't copy to clipboard ([2c6602e](https://github.com/azzamsa/dotfiles/commit/2c6602e86081103d06c74a13a95253a9d42d7efd))
- **docs:** Minimize layering apps by not using `nnn` ([573cef4](https://github.com/azzamsa/dotfiles/commit/573cef467492d0a6da7a7d3843b0aedac004fe51))
- **bin:** Use `pw-play` in Wayland ([ae76094](https://github.com/azzamsa/dotfiles/commit/ae76094bb184bace2636786e2383e23e02c1ed89))
- **bin:** `printf` is more pridictable ([a1f3e80](https://github.com/azzamsa/dotfiles/commit/a1f3e80bb376eecb13a76bcb68348bf846a8f9a4))
- **bin:** Vlc is enough ([6e81174](https://github.com/azzamsa/dotfiles/commit/6e81174c71d11f462f2172c485e8676fd33a946e))
- **bin:** Base image must be very minimal ([72839d3](https://github.com/azzamsa/dotfiles/commit/72839d39737873323845f7f2ecdadc5ec0b26bdd))
- **bin:** Flatpak apps unable to reliably read system root directory ([4f8e86d](https://github.com/azzamsa/dotfiles/commit/4f8e86d8786ad8eb8a39fef0bfc91a8489846916))
- **zellij:** Use daily image ([d9fddb5](https://github.com/azzamsa/dotfiles/commit/d9fddb51438e2c95e90d5fa8ef4fd5bc66593028))
- **bin:** Markdown is more readable ([a41cb70](https://github.com/azzamsa/dotfiles/commit/a41cb70daf1164cadf137925145a4b805ffa1174))
- **zsh:** `starship` is not found ([91ab1e4](https://github.com/azzamsa/dotfiles/commit/91ab1e4c3c55b59bb1cae1660135356672a9a68e))
- **bin:** `preview` is better ([69ebc20](https://github.com/azzamsa/dotfiles/commit/69ebc20507daa80dd437a8e12615e2c16b89fa28))
- **bin:** Don't remove important images ([290c4d3](https://github.com/azzamsa/dotfiles/commit/290c4d358f34415f5b301b3a3554a75151bea3ca))
- **git:** Increase cache ([bafe08d](https://github.com/azzamsa/dotfiles/commit/bafe08d2d489422616d92c7512c483da1453e53f))
- **git:** Bash variable is not expanded it git config ([8ef9782](https://github.com/azzamsa/dotfiles/commit/8ef9782494be003beb4dec1d2394619cd24e9676))
- **zsh:** Avoid unintended app removal ([c48633d](https://github.com/azzamsa/dotfiles/commit/c48633d999a755c467cc884d6a7b5a500c0e5fb8))

## [2.3.0] - 2023-01-04

### ⛰️ Features

- **bin:** Open `zellij` from other application ([b5f718e](https://github.com/azzamsa/dotfiles/commit/b5f718e5c0215611656f0d9bf6d745ac7fb6a61c))
- **zellij:** Unbind default exit key ([249b026](https://github.com/azzamsa/dotfiles/commit/249b026902d74322ead4915c1988ae969d2affee))

  It it easy to hit accidentally

- **zsh:** Add `port` alias ([cf7e19d](https://github.com/azzamsa/dotfiles/commit/cf7e19d479651fc492abdc4305528be981c8296e))
- **bin:** Support Emacs everywhere ([7b123c4](https://github.com/azzamsa/dotfiles/commit/7b123c49dfeeac20384a73e5dd9b38b57ed82ddd))
- Support `evcxr` ([53ba2d6](https://github.com/azzamsa/dotfiles/commit/53ba2d68e539dc7450320e4784f3b897fe1d7744))
- **bin:** Add gnome-clocks ([813d934](https://github.com/azzamsa/dotfiles/commit/813d9341710e780320fc1d1735adfb5e7f6ca2e4))
- **zellij:** Initial support ([cd7b307](https://github.com/azzamsa/dotfiles/commit/cd7b30733b8577a71fff3062320748970bb7dfb3))
- **zsh:** Bring back zoxide ([5f41642](https://github.com/azzamsa/dotfiles/commit/5f416420197b4c2ea18af95443c6a1149c3af83a))
- **zsh:** Add more alias ([e333032](https://github.com/azzamsa/dotfiles/commit/e333032de51569da274a551d9883016ee5fec50e))
- **bin:** Add more apps to post-install ([44d7f48](https://github.com/azzamsa/dotfiles/commit/44d7f4834380f21a9c7c8e000cb8ccf82c50ba2b))
- **bin:** Install starship using `cargo-binstall` ([d069644](https://github.com/azzamsa/dotfiles/commit/d069644ba61a45212dd998d0021ea7a817dda74e))
- **bin:** Muslim figure for names ([310d6b1](https://github.com/azzamsa/dotfiles/commit/310d6b1ddbc7bd94ddccf8b3973026f075cf3892))
- **zsh:** `dnf install` alias ([d12cbf0](https://github.com/azzamsa/dotfiles/commit/d12cbf0a0baf51a2d5d86020cab9ae92266fc7fe))
- **zsh:** Support `nnn` ([427d590](https://github.com/azzamsa/dotfiles/commit/427d59052ea03930a77d6c5c0ac7dfcf0d525010))
- **bin:** Install `Thunderbird` ([3db1729](https://github.com/azzamsa/dotfiles/commit/3db1729ae8f6c4637143d4d0199890816f22f51b))
- **zsh:** `just` alias ([2f1700b](https://github.com/azzamsa/dotfiles/commit/2f1700b080a7d4023a867c99fbfea9b4690d6dbb))

### 🐛 Bug Fixes

- **zsh:** Update exclude zoxide directory ([22e9336](https://github.com/azzamsa/dotfiles/commit/22e93368308cce58e064cbca5a1886d04cdfd93a))
- **bin:** Install update directly ([b3dafaf](https://github.com/azzamsa/dotfiles/commit/b3dafaf366eb1f3384fb0f1036242a7c35d45fa2))
- **bin:** Hide `opt` directory ([6665aa5](https://github.com/azzamsa/dotfiles/commit/6665aa5fd821c6bf15b9a7217dd2399e5298b1b3))
- **bin:** `cargo-update` now supports `cargo-binstall` ([918205a](https://github.com/azzamsa/dotfiles/commit/918205ae64d586507d1a3e7cfbd2fb8df38faf62))
- **zellij:** Nvidia needs to run under x11 ([d48d042](https://github.com/azzamsa/dotfiles/commit/d48d042af474a094f6e61a80e3f25ac6aa05d138))
- **bin:** Update post-install ([1bffdc2](https://github.com/azzamsa/dotfiles/commit/1bffdc216746eacb16db9ef6a50f1b223cbc1e2e))
- **bin:** Only keep unique distinguishable name ([e00e5dc](https://github.com/azzamsa/dotfiles/commit/e00e5dcec77f3fe03212bff62e801c81ce9f039c))
- **zsh:** Enable `Ctrl-D` to exit ([a238b9d](https://github.com/azzamsa/dotfiles/commit/a238b9d0cc91b79d4641ab1d2beed27137e852f7))
- **bin:** App name typo ([63becd9](https://github.com/azzamsa/dotfiles/commit/63becd927ed09acebf9efd232945b562dbcc03bd))
- **zsh:** Double keypress on `ssh` hostname ([0a33781](https://github.com/azzamsa/dotfiles/commit/0a33781b1432b665f8b72800e39edb711d5f8846))
- **bin:** Don't check installed rust binaries ([028c7fc](https://github.com/azzamsa/dotfiles/commit/028c7fc903acb7f866fff61dc474f6b256ea69c7))

  I installed them using binstall which will not synchronize with cargo install.

- **bin:** Binstall doesn't need project URL anymore ([56c04dd](https://github.com/azzamsa/dotfiles/commit/56c04ddbb11bc95339283e020148cd15ac24a4a4))

  It is now smart enough

- Remove unused git config ([b95c3de](https://github.com/azzamsa/dotfiles/commit/b95c3deac00fff050995b739a0100fc880aae671))

## [2.2.0] - 2022-09-28

### ⛰️ Features

- **bin:** List supported packages if package name missing ([b1b246b](https://github.com/azzamsa/dotfiles/commit/b1b246ba0a2a783cf2f54eae7761ad34833596bb))
- **bin:** Update post install ([10d985d](https://github.com/azzamsa/dotfiles/commit/10d985dadfa0210fa136f58755334cb53683c661))
- **bin:** Check rust updates ([bec4cb1](https://github.com/azzamsa/dotfiles/commit/bec4cb1ee32a32be80796f53b9fdc0d504baf1b5))
- **bin:** Add more package to install ([011c3fc](https://github.com/azzamsa/dotfiles/commit/011c3fcb2aee4af32091895f17e4777058454295))
- **bin:** Clean unused flatpak packages ([a6d4ae8](https://github.com/azzamsa/dotfiles/commit/a6d4ae8ac665fd5a95aecb228ec4447d5679584a))
- **bin:** `update` ([79cc4a1](https://github.com/azzamsa/dotfiles/commit/79cc4a1cafdda5e1bda080290442dec89946126b))
- **bin:** Tmsu installations ([a007967](https://github.com/azzamsa/dotfiles/commit/a00796715cd66bb67e838f9438fdbed9c9c48216))
- **zsh:** Migrate to `atuin` ([62fb45e](https://github.com/azzamsa/dotfiles/commit/62fb45e5c21a88605abba10fcd51970e30161ca3))

  I need more context in the history. Such:
  - PWD
  - Exit status

- **bin:** `clean` ([15348f3](https://github.com/azzamsa/dotfiles/commit/15348f32defb9a8c3247885e6e2476716a91b86e))
- **bin:** `up` rust-analyzer ([e104eea](https://github.com/azzamsa/dotfiles/commit/e104eea720941f982da747fd74f950de2cc440b0))
- **bin:** Use `binstall` to install frequently updated Rust package ([e75f7ab](https://github.com/azzamsa/dotfiles/commit/e75f7abb5963a17e6fb8fa1e89a1e491fd4493df))
- **bin:** Shfmt `--write` alias ([590e15d](https://github.com/azzamsa/dotfiles/commit/590e15d14fa3aa7232888173c857a4702c3200fb))
- **bin:** Binstall `fnm` ([8e6a064](https://github.com/azzamsa/dotfiles/commit/8e6a064967746e9cdb1b3731bfe569df28538d09))
- **zsh:** Add `cargo` alias ([42d1625](https://github.com/azzamsa/dotfiles/commit/42d16251798c76f6b83bfbcf0a07bd230ced017d))
- **bin:** Names ([1745649](https://github.com/azzamsa/dotfiles/commit/1745649285964730c3ef392882273fb0d52c531e))
- **bin:** Use `lld` as default linker ([d9aa922](https://github.com/azzamsa/dotfiles/commit/d9aa922fe722e5015c42d2b2679363e59d887373))
- **bin:** Ding ([14c7367](https://github.com/azzamsa/dotfiles/commit/14c73676a3191f4574a7e430d8179e1761687642))

  Play sound with a command.

### 🐛 Bug Fixes

- **bin:** Update post-install ([61f08e5](https://github.com/azzamsa/dotfiles/commit/61f08e5592247e934c679727d2be7fe9c1989708))
- **zsh:** Some vars are not set ([7875c5f](https://github.com/azzamsa/dotfiles/commit/7875c5f17a70c6b9e31b5831de9d9a3dd4b6acef))

  This cause the third-party completions in ~/.config/zsh/completions/*
  are not loaded. Thus `TAB` for completions didn't work.

- **zsh:** Don't highlight paste ([8286600](https://github.com/azzamsa/dotfiles/commit/82866001242ce5c735a27008a7464f07fcdf82a1))

  I can't see my cursor.

- **bin:** Remove some names ([e0fe2ea](https://github.com/azzamsa/dotfiles/commit/e0fe2ea7ced2cb1011377dd7f2855bff26a8fa98))
- **bin:** Download binary manually ([f5def44](https://github.com/azzamsa/dotfiles/commit/f5def443e11c19f185d56873af8549802a5ce0c9))
- **bin:** Migrate to Fedora ([4c5ccdc](https://github.com/azzamsa/dotfiles/commit/4c5ccdc51e63a552c73113753687e6d9aa5e70fd))
- **zsh:** Bring back starship ([e0e9059](https://github.com/azzamsa/dotfiles/commit/e0e905900a9e69265295009fd7b87e7297b009f2))

  I prefer Starship looks than Powerlevel10k.

  - Starship has "medium" icon set. Powerlevel10k only have "many" and
    "few" options. I love to have "some" icons.

- **zsh:** Add more paths ([e246627](https://github.com/azzamsa/dotfiles/commit/e2466276b85e66ceae3f5aa6bc2f5c5fa6e16e4c))
- **zsh:** Weird behavior without explicit `HISTFILE` location ([9e30167](https://github.com/azzamsa/dotfiles/commit/9e30167efdf361bb55eac7fe23e93c5937774ce7))
- **zsh:** Use `menu` instead of blind `completer` ([79435c2](https://github.com/azzamsa/dotfiles/commit/79435c2e423c0fdeed89c1713191b488e7c259f0))
- **zsh:** I don't use tmux ([605f48f](https://github.com/azzamsa/dotfiles/commit/605f48f2843d4b68572b8ee7e3e29dc5ecbddb7b))

  Wezterm has built-in panes.

- **zsh:** Broot is better than fasd ([27ba423](https://github.com/azzamsa/dotfiles/commit/27ba423360bff70f06ce8b12d9af9f2624b2ede9))

### ⚡ Performance

- **zsh:** Remove unused code ([6beb1a4](https://github.com/azzamsa/dotfiles/commit/6beb1a47b2a76be5f1ce3d0dc66a2d1dbd10224e))

## [2.1.0] - 2022-09-12

### 🐛 Bug Fixes

- Update .gitignore ([74a50d5](https://github.com/azzamsa/dotfiles/commit/74a50d5e2e56e53ba8265abfd2c47a248060846a))
- **mpv:** Remove its configuration ([fe52ba5](https://github.com/azzamsa/dotfiles/commit/fe52ba59ba0ad70ead19dc3698ecb5e44c928ed7))

  I take a deep breath and move to VLC.

- **zsh:** Remove fish and starship ([c83ef14](https://github.com/azzamsa/dotfiles/commit/c83ef146d195c982059915e2716a21577649b82b))

  Most ZSH configuration use Powerlevel10k by default.

## [2.0.0] - 2022-09-12

### ⛰️ Features

- **zsh:** Initial configuration ([bfb9686](https://github.com/azzamsa/dotfiles/commit/bfb9686a6bbd8c46010dac0c0505432dcc4fef12))

  Why migrate to ZSH?

  I think NuShell is not ready. Or maybe, it is not suitable for my current workflow 🤷.

  - freeze in some pnpm commands
  - `&&` command not implemented
  - I got a very weird bug because of the different behavior of `echo` in the NuShell
    - I got very ashamed because pasting the result in the crowd and it have a different result.
    - I need to be always aware that "everyone" assumes your shell is POSIX compliant.
  - I don't have any completions at all. The `nu_scripts` completions don't accept additional args. So you have to switch between `^cmd` and `cmd`
  - I need to come back to my rule of picking software. I need the "most" used one. So I don't have to do any of these by myself: debugging between releases, thinking about how to integrate to my existing tool, and building configs.

- **wezterm:** Enable `switch to last active tab when closing tab` ([1c3caef](https://github.com/azzamsa/dotfiles/commit/1c3caefa8beb9b6a6bef7ee08809ecad1b162695))
- **wezterm:** More shortcut ([ff7460c](https://github.com/azzamsa/dotfiles/commit/ff7460cd4fe24a5a9d4442a3bc038092378954a1))
- **nushell:** Enable command completions ([5be6210](https://github.com/azzamsa/dotfiles/commit/5be6210607d4c6ca8271be868b7cddefc056a0ea))
- **vi:** Initial config ([f83182b](https://github.com/azzamsa/dotfiles/commit/f83182bf6b4382b6ae617fa0c444bfb373cbb7dc))
- **nushell:** More aliases ([04a2d78](https://github.com/azzamsa/dotfiles/commit/04a2d78297ee0a7dc384447e92cc7cf87c08dd0d))
- **nushell:** Support fnm ([f0398f9](https://github.com/azzamsa/dotfiles/commit/f0398f915bf0204ba593b766adcef7d802f5d6d9))
- **wezterm:** Use Nushell as login shell ([6f88e0d](https://github.com/azzamsa/dotfiles/commit/6f88e0dde544ff7dcfbfdec1db0df602f96ab74c))
- **nushell:** Add external executable path ([586b513](https://github.com/azzamsa/dotfiles/commit/586b513b2721707ef11f03cc81685315dfcfe535))
- **nushell:** Use menu to avoid having multiple prompt in custom history ([7b398f6](https://github.com/azzamsa/dotfiles/commit/7b398f67c81f333c521a147d6db8c60fb6d31848))
- **nushell:** Exclude failed command ([4bfb518](https://github.com/azzamsa/dotfiles/commit/4bfb518ae41a59a8b734085b96b02eb6948679a8))
- **nushell:** Always remove to trash ([972f3e5](https://github.com/azzamsa/dotfiles/commit/972f3e57381cae621086146ed28cb4f77fcedff0))
- **bin:** Add wepb to post-install ([76622ac](https://github.com/azzamsa/dotfiles/commit/76622ac02d30e510b1f38bf1e2df7778cc448559))
- **nushell:** Use keybinding for history ([e6c43af](https://github.com/azzamsa/dotfiles/commit/e6c43af0f900d59b0fb7615951dd30c3275f0f4f))
- **nushell:** Initial commit ([b46551b](https://github.com/azzamsa/dotfiles/commit/b46551b0c5e997ad6debce8c057c9e898017bb1d))
- Play well both in ligth and dark mode ([272c16a](https://github.com/azzamsa/dotfiles/commit/272c16a14b99c5be1eba7d8f5a22c2401857e1f9))
- **fish:** Broot file manager ([72e25f8](https://github.com/azzamsa/dotfiles/commit/72e25f83b455f4d2118f7aa574e6ce747e65a3d1))
- **wezterm:** Visual feedback after copy ([12235e8](https://github.com/azzamsa/dotfiles/commit/12235e80debe2409df34badc54a677c7355fb07c))
- **wezterm:** Use layers for keybindings ([672b0bc](https://github.com/azzamsa/dotfiles/commit/672b0bc550d81263e88894856229f14a62f355d9))
- Support atuin ([fc3bdf9](https://github.com/azzamsa/dotfiles/commit/fc3bdf939594570c5dc677521873f6a49017c9e9))
- **bin:** Add more utilities package ([f438be2](https://github.com/azzamsa/dotfiles/commit/f438be220b16ae62d6328bc8ad48aee5f5dbca3d))
- **fish:** Support poetry ([0febe07](https://github.com/azzamsa/dotfiles/commit/0febe07483c9ac15f98e9aed05e4cc739c195095))
- **bspwm:** Add rule for thunar ([688aa6a](https://github.com/azzamsa/dotfiles/commit/688aa6a8b7a5506e1f02ca9c3931464970e8a1a0))
- **bin:** Add fd-find to post installation ([55162bf](https://github.com/azzamsa/dotfiles/commit/55162bf3f92efbb56fc71e7579f4860280a6dcc7))
- **git:** Pre-push hooks that protect a branch from being pushed into ([f0ad749](https://github.com/azzamsa/dotfiles/commit/f0ad749b67acd8ae43bc2fb7a083f3fadece2983))
- **bin:** Kernel info in sfetch ([e199ec7](https://github.com/azzamsa/dotfiles/commit/e199ec7e62885eb2035176c4fb1e0eeecb37c518))
- **fish:** Fdfind is too long ([ff03362](https://github.com/azzamsa/dotfiles/commit/ff03362fec5f9bf77a3c36ebc43a0e79db9c69af))
- **bin:** Setup lightdm ([1a74aa5](https://github.com/azzamsa/dotfiles/commit/1a74aa50dbda0e8d75b76d4115fac7f843640384))
- **bin:** Add credentials to keyring app ([5e9b0a7](https://github.com/azzamsa/dotfiles/commit/5e9b0a7751d5c917aa1ee6294e1b87f1279d1727))
- **bin:** Updating rust-analyzer made easy ([b388a54](https://github.com/azzamsa/dotfiles/commit/b388a5416b85b63e8e0570f8fe50ea3a3cee6afb))
- **bin:** Make it easier for family members to use this machine ([20ea4c6](https://github.com/azzamsa/dotfiles/commit/20ea4c6b78f735f4809814fc790821b09fe77f66))

  This machines is shared among family members
  It is hard for them to memorize bunch of window manager keybindings

- **bin:** Add more package to nodebin ([891834f](https://github.com/azzamsa/dotfiles/commit/891834f786d64f11b19690dbe8c6a944dd57591e))
- **fish:** Show tree in current directory ([ca130c5](https://github.com/azzamsa/dotfiles/commit/ca130c54005de802c124bd94c3635e14cbfa6d71))

  With additional features such respecting project's gitignore file.

- **wezterm:** Toggle next/prev movement on pane direction ([ed036f2](https://github.com/azzamsa/dotfiles/commit/ed036f226f906a12baf24d1f92e7a4ab73306da5))
- **vimium:** Initial config ([529cba4](https://github.com/azzamsa/dotfiles/commit/529cba497037245a893c6b3af7c49534ca1f8fe5))
- **polybar:** Manage volume level from the bar ([5bd85c9](https://github.com/azzamsa/dotfiles/commit/5bd85c996241b092996976f65585cade225a22a1))
- **bin:** Add more package to post-install ([f4545d9](https://github.com/azzamsa/dotfiles/commit/f4545d99a295168e18d893aa1f296698cad483e1))
- **polybar:** Brighten and dim screen from bar ([5156895](https://github.com/azzamsa/dotfiles/commit/5156895498a182783c3915b58a84e42190df6d47))
- **bin:** Dim and brighten the screen ([aa82492](https://github.com/azzamsa/dotfiles/commit/aa824928b04ea42f7eab41c9a6d57ba0b6cfec9b))
- **sxhkd:** Enable more fn keys ([7b2017a](https://github.com/azzamsa/dotfiles/commit/7b2017a81d1a0abc1117d04a1c5925d581411139))

  I am not the only user in my machines.
  These buttons enable them to do some operation without touching the terminal.

- **polybar:** Toggle speaker status from the bar ([1aed542](https://github.com/azzamsa/dotfiles/commit/1aed542eaf67ed8ae42cfe0f8f15667381c7c33b))
- **polybar:** Toggle mic status from the bar ([51d3692](https://github.com/azzamsa/dotfiles/commit/51d3692a011e455bfe7eff063076df2888cfd517))

  I do online meetings frequently, and I want to know
  the current status of my mic without opening AlsaMixer.

  The same thing applies to toggling the mic.

- **bin:** Emacs pgtk supports ([cd84b80](https://github.com/azzamsa/dotfiles/commit/cd84b80bbe801240fa1dbd5ddf0a99e2b8fad9dc))
- **bin:** Auto brightness ([664fe31](https://github.com/azzamsa/dotfiles/commit/664fe31fcbcf0cb39a8699813fae4e8081a3c035))
- **bin:** Auto suspend ([9710185](https://github.com/azzamsa/dotfiles/commit/97101855ceb9628a7cc74b3690db5a6d0bbea11d))

  This will check your current battery precentage, When the battery in critical level, it will hibernate your machine

  Before the critical state, auto-suspend will give you fancy warning.

- **bspwm:** Load the desired autorandr mode based on connected monitors ([5084ece](https://github.com/azzamsa/dotfiles/commit/5084ece59f1c3abc59766e7ad7eb6b6b698be163))
- **polybar:** Use env variable for wlan interface name ([2dead77](https://github.com/azzamsa/dotfiles/commit/2dead77cf86361a1fa633faf6864685fe908d1eb))
- **bin:** Bluetooth support in installation ([e61f734](https://github.com/azzamsa/dotfiles/commit/e61f734cefab946cd82c9f629d059e73c140df60))
- **bspwm:** Fully support automatic monitor switching ([95c00ef](https://github.com/azzamsa/dotfiles/commit/95c00ef483b7d263413601c01249249bd4672747))

  feat(bin): use autorandr in post-install

- **bspwm:** Move all workspace to internal monitor when HDMI turned off ([7ea5702](https://github.com/azzamsa/dotfiles/commit/7ea57023dec5c981f3e9e29890e20b496905d106))
- **picom:** Intial commit ([065097e](https://github.com/azzamsa/dotfiles/commit/065097e23afff287de69337c6d8cd56dc33debd4))
- Strip any credentials from window title ([9e38fc6](https://github.com/azzamsa/dotfiles/commit/9e38fc694213373d9febd614843d21010a88933a))

  Currently supports: Wezterm, Emacs, and Polybar.

- **wezterm:** Support fallback fonts ([24c9f0e](https://github.com/azzamsa/dotfiles/commit/24c9f0eeb60ceeb45a73463aafe4ab1402fd4ff3))
- Sfetch ([f4af5e5](https://github.com/azzamsa/dotfiles/commit/f4af5e52fda74cd82b60f23f4a0971bdd3e3d78d))

  It is a simple fetch that written in pure Python without any external dependencies.

  I tend to use it to copy and paste my sistem information for bug reporting.

- **wezterm:** Use the similar keymap with the current window manager ([ec33cfa](https://github.com/azzamsa/dotfiles/commit/ec33cfaf671bd318a67f0c5089df77b042319bd2))
- **starship:** Nordify ([b23aa98](https://github.com/azzamsa/dotfiles/commit/b23aa98ec5a6f296c2dc4573a85e4d2fccb4e803))
- **sxhd:** Focus to previous node ([5b9f933](https://github.com/azzamsa/dotfiles/commit/5b9f933b4639ab75936aa9565787bbd823d1ae8f))
- **sxhkd:** Resize window ([1d376f9](https://github.com/azzamsa/dotfiles/commit/1d376f9b3688cf81751097d6d1659b9540990929))
- I3 like window split ([3194977](https://github.com/azzamsa/dotfiles/commit/319497786bddacd3487ff01fc3751ab055c559f6))
- Group keys to have more free keys ([c77fd3f](https://github.com/azzamsa/dotfiles/commit/c77fd3fad70059b77b9e8c5ddcc7f3d349d00fe3))
- I need `notify-send` to notify things ([b26a5ab](https://github.com/azzamsa/dotfiles/commit/b26a5abfda47605810f03bdac628f282012b6fea))
- Language servers installations ([604e6e2](https://github.com/azzamsa/dotfiles/commit/604e6e2a44a171ac2ac24e308ba5471359e5b37a))
- Add bspwm steps to post install ([3a66a30](https://github.com/azzamsa/dotfiles/commit/3a66a307bc74ed00d5183666af19893238c7fc8e))
- Merge most used script here ([d0d4df6](https://github.com/azzamsa/dotfiles/commit/d0d4df63a3106c3be4e98cae3a756e87c3373830))
- Use homerow for workspace number ([47c64d4](https://github.com/azzamsa/dotfiles/commit/47c64d459bc45983df5b15905d83094c99ffa2df))
- Move move all the workspace to second montior ([74e3768](https://github.com/azzamsa/dotfiles/commit/74e3768dcf2d791240d90a999c48b95ab3a26cda))

  Otherwise, I can't invoke `super-4` to get to workspsace 1.
  credits: https://github.com/ericmurphyxyz/archrice/blob/6e85165338a6e35503ece16025850412bc4768b2/.local/bin/startup

- Brightness based on monitors and time ([4949354](https://github.com/azzamsa/dotfiles/commit/4949354f0b974f10d73548c08659244ece5a18e6))
- Hide empty workspaces ([2378ff0](https://github.com/azzamsa/dotfiles/commit/2378ff0206c25c62088b3627e014b24f12cd137e))
- Support external monitors ([e567199](https://github.com/azzamsa/dotfiles/commit/e56719975389c8cf6065788b39f3c4e56f19aad7))
- Use nord theme ([0ba9278](https://github.com/azzamsa/dotfiles/commit/0ba9278f245a32c95f99dbefcfefddfcffaf5eda))

  Love its simplicity.

### 🐛 Bug Fixes

- **nushell:** Migrate some alias to `dnf` instead of `apt` ([697ee87](https://github.com/azzamsa/dotfiles/commit/697ee87943d8d5ca3e68cb4d9937f4549a2bf9e1))

  Yes. I migrated to fedora.

- **nushell:** Custom completion can't accepts custom arguments ([b59063b](https://github.com/azzamsa/dotfiles/commit/b59063b4b8b198c8678b6a79aaaee96557e547c9))
- **wezterm:** Swap `tab relative` keybinding ([7837fb8](https://github.com/azzamsa/dotfiles/commit/7837fb897d011976026958bd2c9f02b3a86b997e))
- **nushell:** Replace built-in history keybinding ([536cfc7](https://github.com/azzamsa/dotfiles/commit/536cfc7d96c240c0c530c1b890754f73d8f3e269))
- **nushell:** Enable showing $PWD in Terminal title ([5d5461d](https://github.com/azzamsa/dotfiles/commit/5d5461da069257d6e01a365b1558af3557f4d2cd))
- Revert wezterm-here ([47440e6](https://github.com/azzamsa/dotfiles/commit/47440e60d3cf64dcf1bb3553ebb97ad1b9a01a93))

  I am using wezterm again!

- **nushell:** Auto-type the history command ([f78506e](https://github.com/azzamsa/dotfiles/commit/f78506e387d044fe4c46a95b57022daabb4d27a4))
- **nushell:** Wrong zoxide setup ([c2f431f](https://github.com/azzamsa/dotfiles/commit/c2f431f9a19fd5ec6c904a0f403f99af9640ab7d))
- **nushell:** Zoxide support Nushell out of the box ([e475bb5](https://github.com/azzamsa/dotfiles/commit/e475bb59926c60cf615909adc30393cf5dccb71c))
- Some package need bleeding edge version ([eccbd48](https://github.com/azzamsa/dotfiles/commit/eccbd48f9f098cf9259c0a34af493c3cb0bdab60))
- **wezterm:** Avoid accidental quit ([e68ad08](https://github.com/azzamsa/dotfiles/commit/e68ad08998931de13ffcc775f0b09d8d20b4f86f))
- **fish:** Don't hardcode themes ([35ab794](https://github.com/azzamsa/dotfiles/commit/35ab79453d5b6e3cf156af9e2276092bb6a74d6c))

  I will cycle themes based on the light source.

- **bin:** Use latest packages ([6f83b2a](https://github.com/azzamsa/dotfiles/commit/6f83b2a4efccf616235303ded78dc10b9382ec04))
- **bin:** Use gnome defaults ([02f2677](https://github.com/azzamsa/dotfiles/commit/02f26779ad567664110682009d178896204c7ec4))
- **fish:** Remove abbrev ([e0c9462](https://github.com/azzamsa/dotfiles/commit/e0c94627fb1d737cc43bd62762deb6d96cbee238))
- **git:** Avoid f5 hiccup ([18a15ed](https://github.com/azzamsa/dotfiles/commit/18a15ede25b466fddf5c168664248efe908c359b))
- **fish:** Maximum recursion depth reached ([b10a1a7](https://github.com/azzamsa/dotfiles/commit/b10a1a7083e62054c380359cabcfb38ae7330d4e))
- **wezterm:** Key layer slows my workflow ([6c7fa87](https://github.com/azzamsa/dotfiles/commit/6c7fa8786e9369a4de012a27b2cc54594c182457))
- **wezterm:** Remove unused config ([e904984](https://github.com/azzamsa/dotfiles/commit/e9049842aacd4976a152bba9a94be13679ac8e32))
- GNOME doesn't need GTK config ([25ad9ef](https://github.com/azzamsa/dotfiles/commit/25ad9ef21cff28ee15a7e766000d55e96a244531))
- X config is not needed anymore ([afa36b5](https://github.com/azzamsa/dotfiles/commit/afa36b5413275f5dc2a4190c69aef793c264b21d))
- Migrate to flatpak ([d6f9c33](https://github.com/azzamsa/dotfiles/commit/d6f9c331ac535226e1416e97245c1c7c3e8733a2))
- Migrate to GNOME ([376e667](https://github.com/azzamsa/dotfiles/commit/376e66797cc6cc9914af727f0a8f2396286d4e10))
- **picom:** Opacity in browser is a bad idea ([59c6e48](https://github.com/azzamsa/dotfiles/commit/59c6e48ca7024aa810a9c892d55d4dfcb758a989))
- **bspwm:** Now I use Emacs in non-specified workspace ([c45cb27](https://github.com/azzamsa/dotfiles/commit/c45cb27a4b586cb149b0208f35f144d0e6a76cec))
- **sxhkd:** Use sticky key for switching workspace ([2b39439](https://github.com/azzamsa/dotfiles/commit/2b39439a06a1adf3efd176184fd9eec3fc1464cc))

  I use it tons of the time daily.
  I want to avoind pressing to many keys at the same time.

- Migrate to dracula dark theme ([20a2605](https://github.com/azzamsa/dotfiles/commit/20a260574f8e58986cfeedc77bb547c7c41c7f35))
- **polybar:** Brightness text should use `foreground` color ([9d54f2b](https://github.com/azzamsa/dotfiles/commit/9d54f2bda468555a1b269ed4c0c23558a622a797))
- Move everything to Fira Code ([3a3319f](https://github.com/azzamsa/dotfiles/commit/3a3319f211f837d96e8fee1855a79b384fe4f567))
- Migrate to dark theme ([9b8925c](https://github.com/azzamsa/dotfiles/commit/9b8925c38036a76912569588c2a9b39cd060ec35))

  Gruvbox theme.

- **polybar:** Mic is not reliable ([ad0d30d](https://github.com/azzamsa/dotfiles/commit/ad0d30d118a3a5ef2814d35bb540bf4464a94935))

  So I remove the speaker too.

- **bspwm:** Enable `follow` for mpv ([6274675](https://github.com/azzamsa/dotfiles/commit/6274675f061f69781a07ffa6b5e80b2c92682c9e))
- **bspwm:** Picom won't start at startup ([5b6b484](https://github.com/azzamsa/dotfiles/commit/5b6b484210e338d4d13440a2c43da53c055c8728))

  This is a long standing bug. Picom won't start from bspmrc file.

- **polybar:** Suddenly it can't find script custom path ([71665a3](https://github.com/azzamsa/dotfiles/commit/71665a3e08e44e8f360108e97215fa43b075c572))
- **wezterm:** Adjust hue for inactive pane in newer version ([e7d2bb0](https://github.com/azzamsa/dotfiles/commit/e7d2bb06745c388673722e56c5fb0a9fd4eafa8f))
- **bin:** Use smaller increment/decrement in brightness ([e734969](https://github.com/azzamsa/dotfiles/commit/e7349697facf1fd09c964df7d03e754e9ad1a85a))
- **polybar:** Wrong foreground color in battery module ([0507b24](https://github.com/azzamsa/dotfiles/commit/0507b243f2cd98a96469eae5cd832504e040de38))
- **bspwm:** Don't daemonize picom ([af86384](https://github.com/azzamsa/dotfiles/commit/af863842ceeca1cac5469776bde06dcf675d86cc))

  I don't know. Picom still won't start at bspwm startup

- **bspwm:** Workrave applet should be sticky ([b2660a7](https://github.com/azzamsa/dotfiles/commit/b2660a784b21ca3301559bfd49134ade1f61244c))
- **bin:** Install more app to venv ([31d9bb7](https://github.com/azzamsa/dotfiles/commit/31d9bb7fc3fd7b8ae584f24f78e31b2038ee9ee0))
- **starship:** No space after python version ([1e8850a](https://github.com/azzamsa/dotfiles/commit/1e8850aa0943186b06c2ab32c3ed88b49cf0f41a))
- **wezterm:** I don't need fancy tab-bar ([666d182](https://github.com/azzamsa/dotfiles/commit/666d182a5995e121826b60f3663d3b0a9b970d4b))
- **git:** Use full name in office ([7a2cf41](https://github.com/azzamsa/dotfiles/commit/7a2cf41c1b0e322f01625f9b87792dfd463270b8))
- **bin:** Wrong function name ([e8b1baf](https://github.com/azzamsa/dotfiles/commit/e8b1baf3f0a7649a697bd609c358e24176946c91))
- **bspwm:** Daemonize picom ([0e683e2](https://github.com/azzamsa/dotfiles/commit/0e683e24373ce00c3b060e526cf9c2463332a2b2))
- **bin:** Handle day night in brighten/dim ([0e1d990](https://github.com/azzamsa/dotfiles/commit/0e1d9907d7f420900a14a77622fe25076015bd11))
- **polybar:** Use initial in IPC to avoid state changes in restart ([65dc940](https://github.com/azzamsa/dotfiles/commit/65dc9406b1fac32996759f6d1fedd944c84d7ae7))
- **fish:** Typo ([31808c0](https://github.com/azzamsa/dotfiles/commit/31808c05964a62652dd2b7e5602fb46a643ec609))
- **bin:** Update-alternatives need sudo rights ([415584f](https://github.com/azzamsa/dotfiles/commit/415584f27c0c5fff0e81d38499b467bd80072e27))
- **bspwm:** Java applications menus immediately closing after the click ([edaabcd](https://github.com/azzamsa/dotfiles/commit/edaabcd71cf4824707ab5a15af858bd73d122f40))
- **sxhkd:** Skip sticky windows when switching window ([0d865f6](https://github.com/azzamsa/dotfiles/commit/0d865f6c5f2b6c7b3e19f8b752f387539847f152))

  I don't bspwm to focus to Workrave's applet
  It is floating in every desktop and I don't want to
  trip over it while switching windows
  Using `manage=off` disables everything. So I can't easily move it around.

- **bin:** Put lockscreen image back to wallpapers directory ([d027b5b](https://github.com/azzamsa/dotfiles/commit/d027b5b0b46b8b489670118532f03e8a7c21ce5b))

  For easier future installation steps

- **polybar:** Use full percentage for CPU ([0bd28cf](https://github.com/azzamsa/dotfiles/commit/0bd28cf7aaa2a8a15fa190480557ced3b444729a))
- **bspwm:** Running the monitor.sh in bspwmrc cause it to restart indefinitely ([a8292be](https://github.com/azzamsa/dotfiles/commit/a8292be95c62967e28f24b3de04414eb96a69df4))

  The solution is to run it from xinitrc and wait until bspwm settled
  before loading autorandr profile.

- **polybar:** Missing percentage in label ([4ab15b9](https://github.com/azzamsa/dotfiles/commit/4ab15b99f60fc9239bfb97fee1ac62de7599e6fe))
- **bin:** Remove maildir-utils and friends ([81c8872](https://github.com/azzamsa/dotfiles/commit/81c8872e5f84cbb1fb64ab067e7d953a2378075b))

  Nowadays, I am using web browser to read the emails.

- **bin:** Use dunstify instead ([04428b5](https://github.com/azzamsa/dotfiles/commit/04428b59dcf26fb297f118b341dddc7f9c2157cc))

  It is already installed

- **bin:** It has been dark before 5 pm ([69f4e28](https://github.com/azzamsa/dotfiles/commit/69f4e2895ccc55bbacb3b1e4af7b31083f176350))
- **wezterm:** Darken the inactive pane ([771b58a](https://github.com/azzamsa/dotfiles/commit/771b58aa441e174e3996c5e586adf328a2dfc696))

  To make it easier to spot

- **polybar:** Remove unused module ([e2f02b0](https://github.com/azzamsa/dotfiles/commit/e2f02b0240b649b6458077fb7a515d63013979f5))
- **polybar:** Can't set foreground color on ramp ([bbf9e9e](https://github.com/azzamsa/dotfiles/commit/bbf9e9ee690c6bc362ffc4a89227def71ee56df3))
- **polybar:** Use native xwindow module ([76bcc42](https://github.com/azzamsa/dotfiles/commit/76bcc426f954c4829e74a6ae0f906861ec58d7c5))

  Now all app title is free from hostname and username

- **gnupg:** `pinentry-gtk2` took ages to load ([3ee741c](https://github.com/azzamsa/dotfiles/commit/3ee741c2771b7f077c8eda69d3757441c6efcf68))

  `pinentry-gtk2` has a nice show password feature
  But it took ages to load after switching from gentoo-keychian
  to gnome-keyring-agent. Saying `Default font does not have a positive size`

- **bspwm:** Must start with desktop number 1 ([e7c1569](https://github.com/azzamsa/dotfiles/commit/e7c1569cb5d172762c3d4d3ce34dd18f17f44d88))
- **fish:** Use darker color for `pager_color_prefix` ([46e2a40](https://github.com/azzamsa/dotfiles/commit/46e2a40d276c09be31659c3abb9cf15f3a45847c))
- **gpg:** Use pinentry-gtk2 ([d598b60](https://github.com/azzamsa/dotfiles/commit/d598b60a4b74020e8b46da7e0db273c061de7e96))

  I prefer this. It has view password feature.

- **starship:** Node prompt has no whitespace at the end ([5ab8c45](https://github.com/azzamsa/dotfiles/commit/5ab8c45347980bdc2a91011295f69e7e8b251e6c))
- **bspwm:** Improve day/night detection ([f9cd75c](https://github.com/azzamsa/dotfiles/commit/f9cd75c90b7b96423a0c87c55366487fda84acbf))
- **polybar:** Use xwindo again to show title ([d13fc7b](https://github.com/azzamsa/dotfiles/commit/d13fc7bdc0f6f6ccd7d1b6637e69b53007407fba))

  Now Emacs issue is solved: https://github.com/azzamsa/emacs.d/commit/62e8b6dc7786a190d3284bc13e7822c70d3880d0

- **sxhkd:** Swap the main key with emacs ([2d48171](https://github.com/azzamsa/dotfiles/commit/2d48171243d7bf0f966055bf110f4998c9e7d4fa))

  I use Emacs more than my Window Manager.

- Delete old unused configs ([a5c95b0](https://github.com/azzamsa/dotfiles/commit/a5c95b0e2d098ef8bd4eac49d973a6376e73724d))

  They are still preserved in `archive` branch

- **bspwm:** Doesn't use bitmap font ([4bc1d8f](https://github.com/azzamsa/dotfiles/commit/4bc1d8f5ec4440cef920d3f8c3dccfb7d3026ba0))
- **starship:** Use more modern icon sets ([4ea00cd](https://github.com/azzamsa/dotfiles/commit/4ea00cde3dcab144250cad4f7ec322c8a860ecec))
- **sxhkd:** Avoid conflicting keys with emacs ([602d10f](https://github.com/azzamsa/dotfiles/commit/602d10ff1cc41353f2e1f7f3847f386bc950013e))
- **bin:** Picom binary is missing ([f0ae534](https://github.com/azzamsa/dotfiles/commit/f0ae534db77f70d47c4ad7b27b5cbc58a4b84a31))
- **bin:** Wezterm now installed via deb files ([de661c0](https://github.com/azzamsa/dotfiles/commit/de661c04c0a9649caa6fb012cec53c87e8ae45a2))

  Which provides all the neccessary .desktop files

- **polybar:** 12 hour format is more redable for merge ([90456e1](https://github.com/azzamsa/dotfiles/commit/90456e11c6a25699f8babb6bde29d311fd22882f))

  It also has alternative 24 hour format if clicked.
  It help to know both time without manual calculation.

- **wezterm:** Revert the top margin ([8837716](https://github.com/azzamsa/dotfiles/commit/88377164e7420e3c60ed81dd2d24a4a84ff5c430))
- **bin:** Use gnome-keyring instead of keychain ([cd1b47e](https://github.com/azzamsa/dotfiles/commit/cd1b47eb5368196420414a31c5e524390f051f09))

  Now gnome-keyring has a very few dependencies.
  Independent from gnome.

  Setting up `ssh-agent` in fish shell is nightmare.
  I can use plain `eval (ssh-agent -c)` or `systemd --user`

  gnome-keyring ease everything.

- **polybar:** Use regular date module. `interval` not supported in ipc module ([fae7e98](https://github.com/azzamsa/dotfiles/commit/fae7e98dbb484383ace8329c1a5580c14c1ad07d))

  Wait until `internal` supported in ipc module
  https://github.com/polybar/polybar/issues/1127

- **bspwm:** Don't focus to empty node ([ad71061](https://github.com/azzamsa/dotfiles/commit/ad710614e628ba51f83a950c7a2426d2b4209734))
- **bspwm:** Start Emacs in tiled by default ([754f5dc](https://github.com/azzamsa/dotfiles/commit/754f5dcd4c723ca0abc7e3ce50a448533d8ca735))
- **bspwm:** Can't change focus with active mouse hovering on other windor ([316a793](https://github.com/azzamsa/dotfiles/commit/316a793d6a3eb9a39e1749497d0e5cba1506c44b))
- `--no-folding` solves the cluttered symlink directories ([29c5428](https://github.com/azzamsa/dotfiles/commit/29c54289d8dd5e11811e0d6f8ccc803fb156447e))
- Use a more brightner version of foreground color ([fdb22d9](https://github.com/azzamsa/dotfiles/commit/fdb22d952bcbe614de82d7cdd38cce661aed2fd8))

  It looks more nordy.

- Try using homerow for workspaces ([2668a5f](https://github.com/azzamsa/dotfiles/commit/2668a5ffe2b93801cdf6a08aff9043baf5d1ab62))
- Using chain in bspwm is hard ([4ff6c26](https://github.com/azzamsa/dotfiles/commit/4ff6c26a80e273be8206fb8ef2079cd2ec717515))

  It has no visible mode feedback such i3.

- Migrate to bspwm ([52aa44b](https://github.com/azzamsa/dotfiles/commit/52aa44bca349cc575aba6dc22cafc6f50e5f4d31))

  I want to have a dynamic configuration.
  I have a lot of machines and screen.

### ⚡ Performance

- **nushell:** History menu ([4b3e456](https://github.com/azzamsa/dotfiles/commit/4b3e456b5871695bec0903981c5109faf51a164a))
- **polybar:** Use IPC for toggle mic status ([e940236](https://github.com/azzamsa/dotfiles/commit/e940236e8dd415b6345b4bb907a1c571ba67c23f))

  It doesn't run the script in each interval, thus
  avoiding CPU penalty.

## [1.0.0] - 2021-12-03

### ⛰️ Features

- Abbrev in fish shell ([b7e79ed](https://github.com/azzamsa/dotfiles/commit/b7e79ed8879bc16cad6e8214a906ec4687f7f78d))
- Add abbrev ([765f7d8](https://github.com/azzamsa/dotfiles/commit/765f7d85cc2a79f5ed17745e91206079668c0cd2))
- **wezterm:** Dim inactive panes ([54b74b5](https://github.com/azzamsa/dotfiles/commit/54b74b56d8c5ae1a09a804b9821c880fab68a44c))
- **wezterm:** Linkify any URL with port ([3f04ab9](https://github.com/azzamsa/dotfiles/commit/3f04ab97605c6d86ad5fb8760202dd94ce36bd0f))
- Add scroll page wezterm ([5e0c0d5](https://github.com/azzamsa/dotfiles/commit/5e0c0d52460d11421276185c350f4e2e6f475aba))
- Search mode in wezterm ([b6eefac](https://github.com/azzamsa/dotfiles/commit/b6eefac91dfd295466d9f310eb5369bdef54918b))
- Support xinitrc ([05df13e](https://github.com/azzamsa/dotfiles/commit/05df13ef8b04108c8e33236fc95542fa4f7f4a7a))
- Show icons in dmenu ([1ca7aef](https://github.com/azzamsa/dotfiles/commit/1ca7aef763ac18fe67a46f9372c88056ebf79cb5))

  I love it!

- Support moving tab in wezterm ([7a54e67](https://github.com/azzamsa/dotfiles/commit/7a54e670c49d9332d8083b70605d5ce7bf2fa643))
- Tell fisher not to put a mess in ~/.config ([880dbcc](https://github.com/azzamsa/dotfiles/commit/880dbcc622c690ff50a38d7157b66788e4b09827))
- Enable copy-mode and quickselect in wezterm ([77cf49a](https://github.com/azzamsa/dotfiles/commit/77cf49aa1dd3d07e67562e2357922c44afdd28a8))
- Migrate to wezterm ([ac02a59](https://github.com/azzamsa/dotfiles/commit/ac02a59882a27a106375088e721b6d9099efbaac))

  - Migrate from tmux to wezterm
    tmux 3.x always failed to send `C-r` in ssh session. Preventing me to use
    bash interactive feature.

    zellij has issue during copy-paste in ssh session.

    the last choice is wezterm. I fell right at home in the first try.
    I don't need to learn any new keybinding. It is customizable in every aspect.
    I can't even tell is it wezterm or my pervious tmux.

- Add 🥗 to greenclip ([7d73e9c](https://github.com/azzamsa/dotfiles/commit/7d73e9cf4c88b3cc6c660e16ead024732603bae1))
- Add tmux-jump and tmux-fingers ([c1ed420](https://github.com/azzamsa/dotfiles/commit/c1ed420ef782ece8a5e5cec579a9e11ea5e13464))

  I want to use less mouse

- Set default workspace for common app ([6cb7d3b](https://github.com/azzamsa/dotfiles/commit/6cb7d3b5c9d69387bf6d10587b4f389f1f4c7cc0))

  I always used them in those workspace.
  This will avoid me to move them manually again.

- Make space as super on hold ([5febdc5](https://github.com/azzamsa/dotfiles/commit/5febdc5dada9c7e59a954f00310fab44f06718d4))

  Super is hard to reach makes my hand in awkward form.
  This become a habit and now it hurts.

- Map menu to super ([f0cab72](https://github.com/azzamsa/dotfiles/commit/f0cab721ad20540b0eab479dc63cd02d4b77953b))

  I want to avoid hitting multiple key with one hand

- New greenclip config ([e37363a](https://github.com/azzamsa/dotfiles/commit/e37363ad3b09d2e02a0f6873a9abc8a10fac9523))
- Adopt to new zaman & bilal interface ([6ab5bc0](https://github.com/azzamsa/dotfiles/commit/6ab5bc0d88f41910d1c801bad6ade8ee9fa5e3eb))
- Make workrave notification float ([3fa52ef](https://github.com/azzamsa/dotfiles/commit/3fa52ef297607f908d7987b0c906a0b29c85d988))
- Do it all on big screen ([39fa105](https://github.com/azzamsa/dotfiles/commit/39fa1055b6a656178d4f3da02719e3851d7dd548))

  Close the laptop lid. Go with the big screen.

- More aliases ([fb0f530](https://github.com/azzamsa/dotfiles/commit/fb0f530a43a2040114ed36d0f9abe18f81c106e2))
- Enable stowing .gitignore ([d5ae19c](https://github.com/azzamsa/dotfiles/commit/d5ae19c343fd2ed33f2a82b7d5a24638c2289e0a))

  GNU stow ignore .gitignore files by default

- Global .gitignore ([4361200](https://github.com/azzamsa/dotfiles/commit/4361200cb69adcb188ff9271ed4cab4a260f0ad4))

  Avoid adding unnecessary ignore in the local git repository.
  Such as editor related files.

- Install from backports alias ([cfc7480](https://github.com/azzamsa/dotfiles/commit/cfc748068325fab91e065ccc4a4c7d335c1bbd07))
- Support scratchpad ([db6824e](https://github.com/azzamsa/dotfiles/commit/db6824e10a61cf5e7be83ec27bb942f3da91874d))
- Support activity watcher ([2b705fd](https://github.com/azzamsa/dotfiles/commit/2b705fd484bc0e15fe13a7adff58a8bd288ce289))
- Support `bat` ([04359c0](https://github.com/azzamsa/dotfiles/commit/04359c065ce5c9d8e4b1f3a488b5bdecd62c2dd5))
- Add more path to fish_user_path ([57bb230](https://github.com/azzamsa/dotfiles/commit/57bb230ab3088e67eee57e46101bfc08ac5c6717))
- Add fisher to fish ([f77d455](https://github.com/azzamsa/dotfiles/commit/f77d455e5ff2e97d4f9f5ea224b66968bd505cbf))
- Add `zman` to status bar ([307f84e](https://github.com/azzamsa/dotfiles/commit/307f84ea8fd4a4126ce83f33526486968d14806c))
- Add lava and zenburn color scheme fish shell ([3b19309](https://github.com/azzamsa/dotfiles/commit/3b1930974f03ac992f1691a7abcbfc6fcb16f313))
- Add more fish utilites ([154c843](https://github.com/azzamsa/dotfiles/commit/154c8436bf932d45a398674eeb5c5ee08531470d))
- Add `docker_ip` function ([35093b3](https://github.com/azzamsa/dotfiles/commit/35093b331ca318c13cfbf1dba13d788c5d240e9c))
- Use JSON version of ~bilal~ output in status bar ([fa0d18e](https://github.com/azzamsa/dotfiles/commit/fa0d18e3a845a06afb0c1ca21c54549854f5306a))
- Add default $EDITOR ([e56d03d](https://github.com/azzamsa/dotfiles/commit/e56d03df2b4ee361326010025d5dec40a5cbbf0a))
- Add `clear` alias ([cd51fcc](https://github.com/azzamsa/dotfiles/commit/cd51fccb2b788e99bdc9ffd0bb910bdc78b8db2d))
- Display salah time (bilal) in status bar ([504eca1](https://github.com/azzamsa/dotfiles/commit/504eca1bddf6e9c2ca402280613779a58a67db0e))
- Migrate from py3status to i3status-rs ([f67e2cc](https://github.com/azzamsa/dotfiles/commit/f67e2cc32a10439a048f897e6d61dd9decd640b1))

  No specific reason. Nothing wrong with py3status.
  I just want to integrate my tooling into Rust ecosystem.

  I love it to be single binary.

- Support window animations using compton ([f2b137a](https://github.com/azzamsa/dotfiles/commit/f2b137ad416bd91cce75e385dab495f77aa8e89d))

  - Window border, transparency, animations, etc.

- Change programming tools font to fira code ([37e8b15](https://github.com/azzamsa/dotfiles/commit/37e8b15474d13364b4dddfe0a443931b8303e92c))
- Change system font to fira sans ([1952b49](https://github.com/azzamsa/dotfiles/commit/1952b495cd1019c386b789b36024a4dd31651954))
- Hide nextcloud tray window border ([9dda472](https://github.com/azzamsa/dotfiles/commit/9dda472d2c24df63113d27f46af0c5db2ef4e73a))
- Get docker ip ([37a4c3d](https://github.com/azzamsa/dotfiles/commit/37a4c3d9106ac18a934d032c17fb802ee3b6dbec))
- Support go111module ([3a55b89](https://github.com/azzamsa/dotfiles/commit/3a55b894e569b472a5e70497e2014b486950bb24))
- New signing key ([743d2a8](https://github.com/azzamsa/dotfiles/commit/743d2a836a4e8613c73e66261dac3f064849d726))
- Support resizing images ([70d922b](https://github.com/azzamsa/dotfiles/commit/70d922bb8d2cfebf3794b04a00c4e0d86de2d80b))
- Add keychain support ([179f41b](https://github.com/azzamsa/dotfiles/commit/179f41b7d725e401356be79f70818ed67fd958f5))

  Removed gnome-keyring

- Completion for obs-cli ([a5ae7c2](https://github.com/azzamsa/dotfiles/commit/a5ae7c24afb50129cd1700e0b7942c36d8ce3b1e))

### 🐛 Bug Fixes

- **wezterm:** Use arrow key for pane and window direction ([05a44e6](https://github.com/azzamsa/dotfiles/commit/05a44e6699f67a0a2a6bb928a415c24de87a0079))

  It's more consistent and accessible

- **wezterm:** Use more accessible keys ([3086931](https://github.com/azzamsa/dotfiles/commit/3086931af3bd33c16a33f8707eed84e2a2b43ea5))
- **wezterm:** Use more accessible leader key ([d66dd7d](https://github.com/azzamsa/dotfiles/commit/d66dd7d15d6b931627c493aa029c8437387b19d1))

  After moving to 40% layout

- Remove unused virtualfish prompt config ([07d9797](https://github.com/azzamsa/dotfiles/commit/07d9797ded53cece2ec1bcab5f96f6d30a431ec3))
- Use the arrow key again in i3wm ([2774b52](https://github.com/azzamsa/dotfiles/commit/2774b52374691cf0d2885c1274047ed488311e98))

  Now the arrow keys are more accessible.
  They are in the home row.

- Use the number at the home-row position ([e183622](https://github.com/azzamsa/dotfiles/commit/e1836225e63e87abc839af5d3b9d848483a2b168))
- Use more accesible menu key in i3wm ([9a7f5de](https://github.com/azzamsa/dotfiles/commit/9a7f5deb88deb72bfbe1618360390bd363b908ee))

  Now, I use 40% keyboard

- Wezterm doesn't need any fallback font ([0f75bdb](https://github.com/azzamsa/dotfiles/commit/0f75bdb762f138e7a38ef1e3e694e6ce9c143bc3))

  It will search the matching one automatically

- Nodejs character positioned incorrectly ([230d177](https://github.com/azzamsa/dotfiles/commit/230d177eacf7a7bd2a0851eb457add3f43015ecf))
- Remove battery in status bar ([feafd15](https://github.com/azzamsa/dotfiles/commit/feafd15d7325b9b3a1488703277c131c0c61240b))

  My laptops are always charged. Managed using TLP

- Set fallback font in wezterm ([d004330](https://github.com/azzamsa/dotfiles/commit/d004330f2f0778525d7cd114ff52c7b8353ae84c))
- Use `fira code` for all text ([e07b6f1](https://github.com/azzamsa/dotfiles/commit/e07b6f193e0a01956996ca8c299b0c0a12392f7b))
- Stretchly is too huge ([f9791cb](https://github.com/azzamsa/dotfiles/commit/f9791cb6810af9a4f65693368cf31f82e2d17f89))

  It is an electron app.

- Old rofi config is deprecated ([de5be82](https://github.com/azzamsa/dotfiles/commit/de5be82724b4a92a830bed7c23bc00de2f702a70))
- Wezterm background shouldn't be pure white ([f7b9ec2](https://github.com/azzamsa/dotfiles/commit/f7b9ec28549f95b3d7e2a02accb6a2a4c6c81fe1))

  Hard on the eyes and doesn't match current theme

- Make rofi match current indigo theme ([d265c7f](https://github.com/azzamsa/dotfiles/commit/d265c7f1fb16f610d62022e4fa171fb4d7c0e800))
- Light theme should have light as base color. ([98729b4](https://github.com/azzamsa/dotfiles/commit/98729b4f170555d8b8c8a5c145d8c5926d226c59))

  Indigo on white is better than the other way around.
  More over the icons is set to dark color.

- Too much space between icon and text i3status ([a4dfe9f](https://github.com/azzamsa/dotfiles/commit/a4dfe9f358921b5e49b35c7ad806e997c57278c9))
- Match the background with the window title color. ([ccac8c2](https://github.com/azzamsa/dotfiles/commit/ccac8c2bacd2073a0122d47fbd1f0e40123f76ac))

  Putting zman and bilal here is too much.

- Don't use value from Xresources anymore. ([c6e3277](https://github.com/azzamsa/dotfiles/commit/c6e3277d1bdd24aa4d0469c6dbdc6de217edab85))

  I have removed them, as there is no other app using it.

- Removed bash, sbcl, tmux, next ([2d84904](https://github.com/azzamsa/dotfiles/commit/2d84904363672c50e34c7fc835ad0435ef8ae7d1))

  I don't use them anymore in my machines.

  For xrandr, now I set it from GUI.
  My other laptop can't work with these script.

  1

- Use more reachable keys ([52a48d2](https://github.com/azzamsa/dotfiles/commit/52a48d24e5541189d3099958812f7772668fc4cc))

  1 and 2 is too far

- Auto-start terminai ([28519ba](https://github.com/azzamsa/dotfiles/commit/28519ba94a9102bbbc47fc84652239adbb059cb6))
- Adjust i3 key to colemak ([8b8ceed](https://github.com/azzamsa/dotfiles/commit/8b8ceed1938aea59c4c5559c58645429d26b67b1))
- Don't start heavy app in startup ([47b6f63](https://github.com/azzamsa/dotfiles/commit/47b6f63ead4dd40625e57ef094eb722060ab0f89))

  - Migrate from workrave to strecthly
    Sometimes workrave reminders are stuck.

    - Migrate from tmux to wezterm
      tmux 3.x always failed to send `C-r` in ssh session. Preventing me to use
      bash interactive feature.

    zellij has issue during copy-paste in ssh session.

    the last choice is wezterm. I fell right at home in the first try.
    I don't need to learn any new keybinding. It is customizable in every aspect.
    I can't even tell is it wezterm or my pervious tmux.

- Hide username in Wezterm title ([db00eac](https://github.com/azzamsa/dotfiles/commit/db00eac98ad45fc79fd3242666083a8972e0bb2a))
- `mousedragend1pane` fixed in 3.3 ([280b191](https://github.com/azzamsa/dotfiles/commit/280b191ae422a87c5949b0513f3668ecbdce3959))

  It's by default, no need for additional config.
  but I leave my config as is nevertheless

- Remove auto move window based on the title ([85b766e](https://github.com/azzamsa/dotfiles/commit/85b766eef50945d1fa4b10262976123b6d9fc6ed))

  It's very annoying, i3wm doesn't know anything about the app process.
  It just purely greps the window title. If match it will be moved to x workspace.
  If your firefox app has telegram word on its title, then it will be moved to
  the telegram workspace.

- Copied word using a mouse not sent to clipboard ([6a25653](https://github.com/azzamsa/dotfiles/commit/6a2565324ea0f800a15717bdb33d4cec665ef9f4))
- Tmux keybindings is wierd ([65595eb](https://github.com/azzamsa/dotfiles/commit/65595eb6d69e645931cfbe6463118e908a409515))

  Let's have a sane one.

- Change floating window keybinding ([5847de3](https://github.com/azzamsa/dotfiles/commit/5847de33bc9b131c5c79f36ba9265ede703fde5a))
- Add missing default layout in menu ([dfc6e1d](https://github.com/azzamsa/dotfiles/commit/dfc6e1d8ed2484d3508211fc792539abbaf09772))
- Remove unused colors ([054e8be](https://github.com/azzamsa/dotfiles/commit/054e8be3903c96fb2ddf57e37ac44e91e1113210))
- Set workspace in startup program ([0f2efd0](https://github.com/azzamsa/dotfiles/commit/0f2efd0f2663441fc2d3ab1d092e66e4061a9609))

  The special app rule for workspace doesn't work here

- For emacs-style `copy-mode` is enough ([af43c13](https://github.com/azzamsa/dotfiles/commit/af43c13baf43e86cad8a3cd258d4efb9a4741f96))
- Don't rever to default mode after floating window toggle ([e15fc27](https://github.com/azzamsa/dotfiles/commit/e15fc27ca3e9d3283475618312af4f84cb26440d))

  Sometimes it need twice.

- Recent version of st terminal doesn't send selection correctly to clipboard ([2bf69db](https://github.com/azzamsa/dotfiles/commit/2bf69db1de080c60fe9ad1edda3993c05824340a))

  I am able to make paste, but greenclip (the clipboard manager) are not able to
  see it. Now it needs a help from tmux-yank

- Grenclip doesn't accept copy selection from tmux ([5bdcb77](https://github.com/azzamsa/dotfiles/commit/5bdcb77c5d7dfa59168000565ce393694290dea9))
- Remove unused tmux custom keymap ([adbf9c7](https://github.com/azzamsa/dotfiles/commit/adbf9c70ca444283f29d1f223d8d5f0d7cd70530))

  The defaults already fine

- Use `st` instead of `stterm` ([5727f3a](https://github.com/azzamsa/dotfiles/commit/5727f3a5a600c0a7f7869006af81c6b09f90b9b4))

  No `st` is only reserved to st terminal. Don't worry

- Remove hibernate from `i3-exit` ([c165451](https://github.com/azzamsa/dotfiles/commit/c165451b423a86369b46f1993787e467f6f0bf27))

  I never use it.

- `workrave` typo ([bef770a](https://github.com/azzamsa/dotfiles/commit/bef770a714e1301e772b83e3942da36853b8beb7))
- Remove keymap modification ([6558128](https://github.com/azzamsa/dotfiles/commit/655812841696a9252dea2c689bce3d4a56c4dd0f))

  Thankfully, I use custom keyboard now.
  It's modified directly through its firmware.

- Strive to use sticky key all the way down ([a4a5642](https://github.com/azzamsa/dotfiles/commit/a4a5642cd82e09368ccaf129b3e8c87e68a9780f))

  - Move all rarely used command into `Menu 1` and `Menu 2`
    - Keep frequently used command in top level menu
    - Use icon for command. It's easier on eyes.
    - Avoid using key-chord inside menu

    This way, I can avoid pressing multiple keys simoltanously, thus decrease the
    stress in my hand. And frees a lot of super-* key to use in other
    App. Especially Emacs. Other app only acts as complement to Emacs in my workflow.

- Firefox logo does not shown correcly after migration to bullseye ([d37f580](https://github.com/azzamsa/dotfiles/commit/d37f5800908eeb8dc99fef8ff1dc891bce2b5569))
- Remove i3-gaps config ([602c73a](https://github.com/azzamsa/dotfiles/commit/602c73a42409fa996fa43e662f69e8cb6ae231e0))

  I am tired of recompiling each time I upgrade debian.
  I also strive for minimal config.
  Besides, I mostly work in stacked mode

- Make emacs keybinding consistent in rofi ([b6285b3](https://github.com/azzamsa/dotfiles/commit/b6285b3039e6108819a277eed38a45757150cc7d))
- Emoji without space doesn't work in some social app ([085be33](https://github.com/azzamsa/dotfiles/commit/085be3353ac94f1c796cbde55d55e8ca188ab02b))
- Remove unused i3wm keybindings ([f38ee47](https://github.com/azzamsa/dotfiles/commit/f38ee472f44cf13b727fa92c548530fca6a6adf2))

  - I almost never use focus left, right, up, down, as I always in stacked mode
    - I also never split horizontally nor vertically
    - Never have more than 4 workspace
    - Never adjust gaps on the fly

- Move dmenu, clipboard, and kill window under the same command. ([6c48d21](https://github.com/azzamsa/dotfiles/commit/6c48d2163b3ac8ad2c8a460d8107e2a3ca2d9cb3))

  To avoid pressing shift.

- Rrun ([1e4970a](https://github.com/azzamsa/dotfiles/commit/1e4970a71f916a5df9b09b541dbb1dfdbcf54c81))
- Move long command to bash script ([a3f0c5a](https://github.com/azzamsa/dotfiles/commit/a3f0c5a6f4bdb28ece26b1f03cc3420952b58faf))
- Rrun.fish ([8ec2f19](https://github.com/azzamsa/dotfiles/commit/8ec2f1991222236b23ec0f3ef478e3db1831fef7))

  wrong substring logic

- No need fish plugins ([7e77df5](https://github.com/azzamsa/dotfiles/commit/7e77df5c2a858c0faa7e71d5de63d9a89e90ff79))

  I use fnm instead of fish nvm

- Disable compton and xautolock ([bd6025c](https://github.com/azzamsa/dotfiles/commit/bd6025ce10b79c6940f98b0d7611042ed2e71a5d))

  compton doesn't add any value
  I don't need xautolock anymore, my laptop now is always charging.

- A change to zman and bilal interface ([a3778e3](https://github.com/azzamsa/dotfiles/commit/a3778e3b5da07e904f08f791f2f98fedde703056))
- Migrate to fnm ([b98576b](https://github.com/azzamsa/dotfiles/commit/b98576b5cd2df86b62800f7fd64035539b6c63f5))

  Faster, and less footprint.

- Remove all custom screenshot commands ([dd3dde8](https://github.com/azzamsa/dotfiles/commit/dd3dde8ed90aff100350a05d6bf70db36c3d8183))

  Most of the time, I just use flameshot.
  I love the on-fly annotations.

- Don't make shadow in `peek` ([eb885d2](https://github.com/azzamsa/dotfiles/commit/eb885d2c494a95425e27f747fdc39eeb9bf6fe13))

  The shadow around `peek` window make the produced GIF has a strange result.

- Disable insert key ([75a1078](https://github.com/azzamsa/dotfiles/commit/75a107875fb1eb6df0b13ae0358dbe1ccb533d64))

  I keep hitting it accidentally on my external keyboard, and it is very annoying.

- Increase default brightness ([a7646b7](https://github.com/azzamsa/dotfiles/commit/a7646b73c810082c99df087e89414f36cba66a63))
- Use manually installed emacs. ([952e2a0](https://github.com/azzamsa/dotfiles/commit/952e2a00d384cc4c582b0b0cae5695748c78acd2))

  I am using Emacs 28.0 native-comp branch

- Update .stow-local-ignore ([33639f0](https://github.com/azzamsa/dotfiles/commit/33639f0965a8dd0cc37a3c7cdd7dc9cd5fd77669))

  remove `.directory`. I don't use Thunar anymore.

- 15 is less bright for my eyes ([f641fb4](https://github.com/azzamsa/dotfiles/commit/f641fb4899b4ffdf22084324ed8341078e1d838a))
- Disable Telegram auto-start ([82af193](https://github.com/azzamsa/dotfiles/commit/82af193581bb32cfab0340793db666a863d8f89e))

  My team now move to discord

- Workrave is better than activity-watch ([8b45f75](https://github.com/azzamsa/dotfiles/commit/8b45f752aa1362bea18b7db0f277060ca133cd20))

  I want a program that able to warn my screen time.
  To track my time spent, I use daily-success

- Adjust mpv key to a common pattern ([783977a](https://github.com/azzamsa/dotfiles/commit/783977ae39ce466f2323a8e8842edf4321953115))
- Don't prevent xautolock to do its job ([211bd2a](https://github.com/azzamsa/dotfiles/commit/211bd2ad3bc67d4dffbb947951657100955fe593))
- Change cursor to brighter color ([786efb1](https://github.com/azzamsa/dotfiles/commit/786efb1832596d94e78353b4807ab9c0bd7e8223))
- `LS_COLORS` doesn't work in Emacs ([80b76f5](https://github.com/azzamsa/dotfiles/commit/80b76f59a9717d68c4faca241895985fbbf6301b))

  Now I used dired-rainbows

- Override up and down icon in network i3status ([43763df](https://github.com/azzamsa/dotfiles/commit/43763df44276ef1c8bf5347d95fee848d3618d9e))
- Emacs tramp hang over fish prompt ([3831315](https://github.com/azzamsa/dotfiles/commit/3831315c191b05806a152453892c365073e5907b))
- Utilities path not found ([312193e](https://github.com/azzamsa/dotfiles/commit/312193e90ef4f653a9fcba167abf973d3a6320fa))
- Disable transparancy in st terminal ([3b04b6a](https://github.com/azzamsa/dotfiles/commit/3b04b6a645457ca6b1aad90c327a9feb7019b14a))

  White color scheme looks bad with it.

- Color warning on tmux ([fce5f32](https://github.com/azzamsa/dotfiles/commit/fce5f328a6679fb65dacc3db6bdb6eb780192752))
- Switch to light theme. ([29fd2b9](https://github.com/azzamsa/dotfiles/commit/29fd2b99cc617e045734c2fe4b381d0d37e58e07))

  Put it under the test.
  A challenge from: https://stitcher.io/blog/why-light-themes-are-better-according-to-science

- Drop lava color scheme. Prefers Zenburn. ([5d3ed3e](https://github.com/azzamsa/dotfiles/commit/5d3ed3ea63f18a9c3efe234b6471fb636ed0cc36))
- Drop duplicate config ([b544fe1](https://github.com/azzamsa/dotfiles/commit/b544fe1e31da93988b275c5a9d4752fd9e66cc4c))
- Remove sdkman, gvm, and rvm ([8a504c6](https://github.com/azzamsa/dotfiles/commit/8a504c68c1bc39754d879881972504569ea69527))

  I don't use them anymore

- Use ISO format in status bar date time ([46a7dd0](https://github.com/azzamsa/dotfiles/commit/46a7dd04f776981e4d87163deaeab8816231a737))
- Critical battery level is too high ([0c5fb9d](https://github.com/azzamsa/dotfiles/commit/0c5fb9dec37a218605fb04124aed82b0ea185fa3))
- Brighten `binding_mode` color ([7a74235](https://github.com/azzamsa/dotfiles/commit/7a742357f75480dba529d1cf01e36563536751d1))
- Don't draw shadow in i3 title bar ([753ba80](https://github.com/azzamsa/dotfiles/commit/753ba80a682b6cb3cfb124ebb62433e962e1e1cd))
- Increase terminal font size ([b85fe1a](https://github.com/azzamsa/dotfiles/commit/b85fe1a78bf80e2a60b787f34a6b511468987df2))
- Path for work gitconfig ([b5e8612](https://github.com/azzamsa/dotfiles/commit/b5e861242669e844dff545a997e09edb3ff36764))
- Start mpv at lower volume ([9ea99dd](https://github.com/azzamsa/dotfiles/commit/9ea99dd99327a1c8beda2fba546a139fe7f25fa5))
- Start `aza-login` manually ([44c3f5d](https://github.com/azzamsa/dotfiles/commit/44c3f5d6830eb8fc75c5530f583add322edada44))
- Remove silientcast config ([c6cfc27](https://github.com/azzamsa/dotfiles/commit/c6cfc276476914b7b4c88ce3f128c6f105f324ad))

  I am using peek now
