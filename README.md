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
- Debian 12 + GNOME

## Uh Oh! Where is Your Old Configuration?

tl;dr

- Ubuntu, 2013 - 2017
- [Debian][debian-i3], 2017 - 2023
- [Fedora Workstation][fedora-gnome], 2023.
- [Fedora Silverblue][fedora-silverblue], 2023.
- [Debian][current-os], current.

<div align="center">
-== ❧ ==-
</div>

I have been using Debian since 2017 until 2021. Throughout that time, I have been using the [i3 window manager][debian-i3], specifically from 2017 to 2019.

In 2021, I landed a job, and I have to manage both my personal laptop and office laptop. The static nature of the i3 configuration forces me to use multiple branches for my dotfiles. Hence, in 2022 I migrated to a WM that has a dynamic configuration, [bspwm][debian-bspwm].

After watching some YouTube videos that praise Fedora, I took my plunge and reinstalled both of them to [Fedora Workstation][fedora-gnome] in 2023.

Several months passed and I break it. I migrate to [Fedora Silverblue][fedora-silverblue] for obvious reasons. Turns out I can't flash my custom keyboard using a containerized environment. At the same time, my office requires me to install an app that writes to `/usr`.

Last week, RedHat goes "closed source" and Fedora attempted to have a telemetry for its user. I go back to where I am from, [Debian][current-os].

[debian-i3]: https://github.com/azzamsa/dotfiles/commit/f395081a1c0372aa10737f104640da3049a5a8b2
[debian-bspwm]: https://github.com/azzamsa/dotfiles/commit/59c6e48ca7024aa810a9c892d55d4dfcb758a989
[fedora-gnome]: https://github.com/azzamsa/dotfiles/commit/6dc9d319cae13f79db0a8b1004aa87b103520415
[fedora-silverblue]: https://github.com/azzamsa/dotfiles/tree/4543ab38b5834cd1e4ba549436220c02310264dd
[current-os]: https://github.com/azzamsa/dotfiles

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

- [Noto Emoji](https://github.com/googlefonts/noto-emoji) by Google
