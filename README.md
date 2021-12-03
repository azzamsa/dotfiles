<div align="center">
<h1>.dotfiles</h1>

<img src='assets/logo.png' width=150px/>

My personal .dotfiles 🗃️

</div>

---

<p align="center"><img src="assets/preview1.png"/></p>
<p align="center"><img src="assets/preview2.png"/></p>

## Features

- Bright, clean, minimalist design.
- Keep your anonymity. No credential is shown anywhere.
- uniformity color of the terminal, window manager, status, and command runner.
- All commands are sticky. Easy for your muscle. No more strain.
- More ...

## Usage

``` bash
$ # clone the repository
$ git clone https://github.com/azzamsa/dotfiles ~/dotfiles/

$ # let GNU stow handle the symlink
$ for d in ~/dotfiles/*/ ; do
    stow "$d"
done
```

## Contribution

I don't plan to accept any contribution that adds new functionality. But it is OK for fixes and improvement. I don't recommend using this repository directly. Instead, use it as a source of inspiration.

### Credits

- [Tom Jobbins](https://github.com/TheBloke) solved many problems and tidies up all the messes.
- [Noam Postavsky](https://github.com/npostavs) solved bash prompt to work with ANSI-term.
- [Noto Emoji](https://github.com/googlefonts/noto-emoji) by Google

