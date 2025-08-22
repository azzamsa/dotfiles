# Why I Switched?

- Ubuntu GNOME, Oct 23, 2013 - Dec 18, 2015 (2 years, 1 month, 25 days).
- Debian, Dec 18, 2015 - Sep 13, 2022 (6 years, 8 months, 26 days).
  - i3 -> [BSPWM](https://github.com/azzamsa/dotfiles/commit/52aa44bca349cc575aba6dc22cafc6f50e5f4d31)
  - BSPWM -> [GNOME](https://github.com/azzamsa/dotfiles/commit/376e66797cc6cc9914af727f0a8f2396286d4e10)
- Fedora GNOME, [Sep 13, 2022][fedora-2022-start] - Jul 6, 2023 (9 months, 23 days).
- Fedora Silverblue GNOME, [Jul 6, 2023][fedora-silverblue-start] - Jul 17, 2023 (11 days).
- Debian GNOME, [Jul 17, 2023][debian-2023-start] - Aug 5, 2023 (19 days).
- Fedora GNOME, [Aug 5, 2023][fedora-2023-start] - Aug 21, 2025 (2 years 16 days).
- Debian GNOME, [Aug 21, 2025][debian-2025-start] - now.
- [More...](BOOKMARKS.md)

## Ubuntu (2 years) -> Debian

At some point, I felt proficient enough with Ubuntu. Since it’s a fork of Debian, I read somewhere that Ubuntu users just ‘eat what’s served,’ while Debian users need to take a few extra steps. I was up for that challenge as a way to sharpen my skills. I had no idea what my future job would be, but given that many servers run on Debian, having that experience under my belt felt like a huge win. Besides, I was young then. Young people often want to stand out, and Ubuntu just felt too common.

## Debian (6 years) -> Fedora

They said `dnf` was better than `apt`, and Fedora always seemed to ship the newest shiny things before anyone else. Btrfs, ZRAM, Wayland-only, and so on. So I took the plunge and migrated both of my machines. If I remember correctly, it also had something to do with Steam. It worked fine on Debian, but I recall that installing Nvidia drivers for my laptop’s graphics card was easier at the time on Fedora.

Why not after 6-7 years with Debian?

### Debian I3 -> BSPWM

In 2021, I landed a job, and I have to manage both my personal laptop and office laptop. The static nature of the i3 configuration forces me to use multiple branches for my dotfiles.
Hence, in 2022 I migrated to a WM that has a dynamic configuration.

## Fedora (9 months) -> Fedora Silverblue

I accidentally removed one of NetworkManager’s dependencies, which made the OS useless since it couldn’t connect to Wi-Fi.
I managed to fix it by plugging in a spare Ethernet cable through my little Huawei portable router.
But after that, I decided to switch to an atomic/immutable distro to avoid running into the same problem in the future.

## Fedora Silverblue (11 days) -> Debian

My company uses F5 for authentication, and it’s a pain to get it working on an immutable OS.
It requires a writes to `/usr`.
On top of that, I somehow can’t flash my QMK keyboard anymore, though I still need to investigate further.
In the end, I decided I need a mutable OS with Flatpak and AppImages so I can minimize touching the underlying system.
This week, with RHEL going closed-source and Fedora planning to introduce telemetry, my decision to switch only grew stronger.

## Debian (19 days) -> Fedora

Setting up LUKS/LVM in the Fedora installer was a breeze,
but on Debian I had to endure the pain of manual partitioning with lots of CLI commands.
I told myself it was fine, something you only do once in a lifetime.

The disappointment grew when I saw Debian shipping with an older GNOME desktop,
while I’d already been enjoying newer versions on Fedora. But the straw that broke the camel’s back was the ugly,
bare-bones prompt Debian uses to decrypt the hard disk. Compared to Fedora’s polished one, it felt awful.
Honestly, that alone was 90% of the reason I switched back.

For me, Fedora just feels more polished and focused on desktop users.

## Fedora (2 years) -> Debian

I’m happy with Fedora. latest packages, shiny kernel, cutting-edge GNOME.
Unlike Debian, I don’t need to grab or compile binaries, the repos are always catching up with upstream.

Sadly, there was a time when a system update broke my Ghostty terminal, a kernel bug.
Also, It froze occasionally, and GNOME logged me out for no reason.

I never had issues like that in my ~6 years with Debian.
I guess I’m okay with that ugly LUKS password prompt in Debian 🤷🏼.

[fedora-2022-start]: https://github.com/azzamsa/dotfiles/commit/4c5ccdc51e63a552c73113753687e6d9aa5e70fd
[fedora-2023-start]: https://github.com/azzamsa/dotfiles/commit/f09550c399e67f223fa41c4517b15b1772e56847
[debian-2023-start]: https://github.com/azzamsa/dotfiles/commit/61513966e5b6c1697af94e68e22a6caffb0c64dc
[fedora-silverblue-start]: https://github.com/azzamsa/dotfiles/commit/d2d3d2e0b4f83362488a407155149d581122d361
[debian-2025-start]: https://github.com/azzamsa/dotfiles/commit/1584afb8202e2e2a227ff0daff10c102bee07188
[current-os]: https://github.com/azzamsa/dotfiles
