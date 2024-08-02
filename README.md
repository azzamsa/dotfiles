<div align="center">
<h1>.dotfiles</h1>

<img src='_assets/logo.png' width=150px/>

My personal .dotfiles 🗃️

<a href="https://github.com/azzamsa/dotfiles/actions/workflows/ci.yml">
    <img src="https://github.com/azzamsa/dotfiles/actions/workflows/ci.yml/badge.svg" alt="Build status" />
</a>

</div>

---

## Current Machine

- Fedora + GNOME

Refer to [local.toml](.dotter/local.example.toml) to see the tools I'm currently using.

## Usage

```bash
$ # Clone the repository
$ git clone https://github.com/azzamsa/dotfiles ~/dotfiles/

$ # cd ~/dotfiles
$ dotter deploy
```

## Uh Oh! Where is Your Old Configuration?

tl;dr

- Ubuntu, 2013 - 2017
- [Debian][debian-i3], 2017 - 2023
- [Fedora Workstation][fedora-gnome], 2023.
- [Fedora Silverblue][fedora-silverblue], 2023.
- [Debian][current-os], 2023.
- [Fedora Workstation][current-os], 2023.
- [cargo-scripts][cargo-scripts].

<div align="center">
-== ❧ ==-
</div>

I have been using Debian since 2017 until 2021. Throughout that time, I have been using the [i3 window manager][debian-i3], specifically from 2017 to 2019.

In 2021, I landed a job, and I have to manage both my personal laptop and office laptop. The static nature of the i3 configuration forces me to use multiple branches for my dotfiles. Hence, in 2022 I migrated to a WM that has a dynamic configuration, [bspwm][debian-bspwm].

After watching some YouTube videos that praise Fedora, I took my plunge and reinstalled both of them to [Fedora Workstation][fedora-gnome] in 2023.

Several months passed and I break it. I migrate to [Fedora Silverblue][fedora-silverblue] for obvious reasons. Turns out I can't flash my custom keyboard using a containerized environment. At the same time, my office requires me to install an app that writes to `/usr`.

Last week, RedHat goes "closed source" and Fedora attempted to have a telemetry for its user. I go back to where I am from, [Debian][debian-gnome].

Unfortunately, I haven't come across any Linux distribution that offers a desktop experience as polished as [Fedora][current-os].

## Contribution

I won't be accepting any functionality or behavior changes. But it is OK for fixes and refinement.
I don't recommend using this repository directly. Instead, use it as a source of inspiration.

## See Also

Nvim Configuration

- [Vanilla Nvim](https://github.com/azzamsa/roof), 2023.

Emacs Configuration

- [Vanilla Emacs (Evil Mode)](https://github.com/azzamsa/camp.d), 2023.
- [MineEmacs (Evil Mode)](https://github.com/azzamsa/minemacs.d), 2023
- [Doom Emacs (Evil Mode)](https://github.com/azzamsa/doom.d), 2022-2023
- [Vanilla Emacs](https://github.com/azzamsa/emacs.d), 2017-2022

## Credits

- [Noto Emoji](https://github.com/googlefonts/noto-emoji) by Google

[debian-i3]: https://github.com/azzamsa/dotfiles/tree/f395081a1c0372aa10737f104640da3049a5a8b2
[debian-bspwm]: https://github.com/azzamsa/dotfiles/tree/59c6e48ca7024aa810a9c892d55d4dfcb758a989
[fedora-gnome]: https://github.com/azzamsa/dotfiles/tree/6dc9d319cae13f79db0a8b1004aa87b103520415
[fedora-silverblue]: https://github.com/azzamsa/dotfiles/tree/4543ab38b5834cd1e4ba549436220c02310264dd
[debian-gnome]: https://github.com/azzamsa/dotfiles/tree/241d0c322a1511daa7253fea934c072cd05e68c5
[current-os]: https://github.com/azzamsa/dotfiles
[cargo-scripts]: https://github.com/azzamsa/dotfiles/tree/d385c1f52aff4b282e3fd00dd7ab91a8ad794698
