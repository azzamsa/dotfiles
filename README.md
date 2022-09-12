<div align="center">
<h1>.dotfiles</h1>

<img src='assets/logo.png' width=150px/>

My personal .dotfiles 🗃️

<a href="https://github.com/azzamsa/dotfiles/workflows/ci.yml">
    <img src="https://github.com/azzamsa/dotfiles/workflows/ci/badge.svg" alt="Build status" />
</a>

</div>

---

## Uh Oh! Where is Your Old Configuration?

- [i3 configuration](https://github.com/azzamsa/dotfiles/tree/i3). 2017 - 2021
- [bspwm configuration](https://github.com/azzamsa/dotfiles/tree/bspwm). 2022
- [NuShell configuration](https://github.com/azzamsa/dotfiles/tree/nushell). 2022

## Features

- Keep your anonymity. No credential is shown anywhere.
- More ...

## Usage

``` bash
$ # clone the repository
$ git clone https://github.com/azzamsa/dotfiles ~/dotfiles/

$ # let GNU stow handle the symlink
$ for d in ~/dotfiles/*/ ; do
    stow "$d" --no-folding
done
```

## Contribution

I don't plan to accept any contribution that adds new functionality. But it is OK for fixes and improvement. I don't recommend using this repository directly. Instead, use it as a source of inspiration.

## See Also

- [azzamsa/doom.d: 📜 My personal Doom Emacs configuration](https://github.com/azzamsa/doom.d)
- [azzamsa/emacs.d: 📜 My personal Emacs configuration](https://github.com/azzamsa/emacs.d)

## Credits

- [Henrik Lissner's dotfiles](https://github.com/hlissner/dotfiles/config/zsh) for ZSH configurations
- [Noto Emoji](https://github.com/googlefonts/noto-emoji) by Google
