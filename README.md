<div align="center">
<h1>.dotfiles</h1>

<img src='assets/logo.png' width=150px/>

My personal .dotfiles 🗃️

<a href="https://github.com/azzamsa/dotfiles/workflows/ci.yml">
    <img src="https://github.com/azzamsa/dotfiles/workflows/ci/badge.svg" alt="Build status" />
</a>

</div>

---

## Current Machine

- 80TU Lenovo ideapad 310-14IKB + NVIDIA GeForce 920MX
- Fedora Workstation

## Uh Oh! Where is Your Old Configuration?

- [Debian - i3](https://github.com/azzamsa/dotfiles/commit/f395081a1c0372aa10737f104640da3049a5a8b2). 2017 - 2021
- [Debian - bspwm](https://github.com/azzamsa/dotfiles/commit/59c6e48ca7024aa810a9c892d55d4dfcb758a989). 2022
- [Debian - NuShell, Fish, MPV](https://github.com/azzamsa/dotfiles/commit/bfb9686a6bbd8c46010dac0c0505432dcc4fef12). 2022
- [Fedora - GNOME](https://github.com/azzamsa/dotfiles/commit/6dc9d319cae13f79db0a8b1004aa87b103520415). 2023
- [Fedora Silverblue - GNOME](https://github.com/azzamsa/dotfiles/tree/4543ab38b5834cd1e4ba549436220c02310264dd). 2023

## Features

- Keep your anonymity. No credential is shown anywhere.
- More ...

## Usage

```bash
$ # clone the repository
$ git clone https://github.com/azzamsa/dotfiles ~/dotfiles/

$ # let GNU stow handle the symlink
$ for d in ~/dotfiles/*/ ; do
    stow "$d" --no-folding
done
```

## Contribution

I won't be accepting any functionality or behavior changes. But it is OK for fixes and refinement.
I don't recommend using this repository directly. Instead, use it as a source of inspiration.

## See Also

- [azzamsa/camp.d: 🏕️ I want to go camping....](https://github.com/azzamsa/camp.d)
- [azzamsa/minemacs.d: 📜 My personal MinEmacs configuration](https://github.com/azzamsa/minemacs.d)
- [azzamsa/doom.d: 📜 My personal Doom Emacs configuration](https://github.com/azzamsa/doom.d)
- [azzamsa/emacs.d: 📜 My personal Emacs configuration](https://github.com/azzamsa/emacs.d)

## Credits

- [Henrik Lissner's dotfiles](https://github.com/hlissner/dotfiles/config/zsh) for ZSH configurations
- [Noto Emoji](https://github.com/googlefonts/noto-emoji) by Google
