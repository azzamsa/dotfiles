#
# Bookmarks
# - https://github.com/azzamsa/dotfiles/tree/925cf2f92360a3132291230e8054ac755aacc6d7/shells/fish/themes
# - https://github.com/azzamsa/dotfiles/blob/ae4be03241dabb9daa8b8f4ee68bf4025cf40c54/shells/fish/colors.fish

if [ $theme = modus_vivendi ]
    # License: GPL 3.0
    # Source:
    # - https://github.com/miikanissi/modus-themes.nvim/blob/master/extras/fish/modus_vivendi.fish
    # - https://github.com/protesilaos/modus-themes/blob/main/modus-vivendi-theme.el

    set -g red ff5f59 # 7.48:1, #ff5f59
    set -g green 44bc44 # 13.41:1, #44bc44
    set -g yellow fec43f # 10.05:1 #fec43f
    set -g orange 2fafff # 8.85:1, #2fafff
    set -g purple b6a0ff # 9.46:1, #b6a0ff
    set -g pink feacd0 # 12.02:1, #feacd0
    set -g cyan 00d3d0 # 13.42:1, #00d3d0

else if [ $theme = modus_vivendi_deep ]
    # Opinionated color choice

    set -g red ff6b55 # 7.48:1, #ff6b55
    set -g green 6ae4b9 # 13.41:1, #6ae4b9
    set -g yellow f78fe7 # 10.05:1 #f78fe7
    set -g orange 79a8ff # 8.85:1, #79a8ff
    set -g purple b6a0ff # 9.46:1, #b6a0ff
    set -g pink feacd0 # 12.02:1, #feacd0
    set -g cyan 4ae2f0 # 13.42:1, #4ae2f0

else if [ $theme = tokyonight_moon ]
    # License: Apache 2.0
    # Source:
    # - https://github.com/folke/tokyonight.nvim/blob/main/extras/fish/tokyonight_moon.fish

    set -g red ff757f # 8.1:1, #ff757f
    set -g orange ff966c # 9.83:1, #ff966c
    set -g yellow ffc777 # 13.68:1, #ffc777
    set -g green c3e88d # 15.24:1, #c3e88d
    set -g purple fca7ea # 11.85:1, #fca7ea
    set -g cyan 86e1fc # 14.18:1, #86e1fc
    set -g pink c099ff # 9.24:1, #c099ff

else if [ $theme = tokyonight_night ]

    set -g red ff757f # 8.1:1, #f7768e
    set -g orange ff966c # 9.83:1, #ff9e64
    set -g yellow ffc777 # 13.68:1, #e0af68
    set -g green c3e88d # 15.24:1, #9ece6a
    set -g purple fca7ea # 11.85:1, #9d7cd8
    set -g cyan 86e1fc # 14.18:1, #7dcfff
    set -g pink c099ff # 9.24:1, #bb9af7

else if [ $theme = material_palenight ]
    # Material Palenight HC
    #
    # Source:
    # - https://github.com/kaicataldo/material.vim/blob/main/colors/material.vim
    # - https://github.com/t3dotgg/vsc-material-but-i-wont-sue-you/blob/main/scripts/generator/settings/specific/palenight-hc.ts

    set -g red f07178 # 7.33:1, #f07178
    set -g orange f78c6c # 8.92:1, #f78c6c
    set -g yellow ffcb6b # 14:1, #ffcb6b
    set -g green c3e88d # 15.24:1, #c3e88d
    set -g purple c792ea # 8.72:1, #c792ea
    set -g cyan 89ddff # 13.85:1, #89ddff
    set -g pink ff9cac # 10.6:1, #ff9cac

else if [ $theme = dracula ]
    # License: MIT
    # Source:
    # - https://github.com/dracula/fish/blob/master/themes/Dracula%20Official.theme

    set -g red ff5555 # 6.68:1 (AA), #ff5555
    set -g orange ffb86c # 12.32:1, #ffb86c
    set -g yellow f1fa8c # 18.79:1, #f1fa8c
    set -g green 50fa7b # 15.3:1, #50fa7b
    set -g purple bd93f9 # 8.7:1, #bd93f9
    set -g cyan 8be9fd # 15.17:1, #8be9fd
    set -g pink ff79c6 # 8.8:1, #ff79c6

else if [ $theme = catppuccin_mocha ]
    # License: MIT
    # Source:
    # - https://catppuccin.com/palette

    set -g red f38ba8 # 9.06:1, #f38ba8
    set -g orange fab387 # 11.86:1, #fab387
    set -g yellow f9e2af # 16.52:1, #f9e2af
    set -g green a6e3a1 # 14.12:1, #a6e3a1
    set -g purple cba6f7 # 10.33:1, #cba6f7
    set -g cyan 94e2d5 # 14.09:1, #94e2d5
    set -g pink f5c2e7 # 13.75:1, #f5c2e7

else if [ $theme = cyberdream ]

    set -g red ff6e5e # 9.06:1, #ff6e5e
    set -g orange ffbd5e # 11.86:1, #ffbd5e
    set -g yellow f1ff5e # 16.52:1, #f1ff5e
    set -g green 5eff6c # 14.12:1, #5eff6c
    set -g purple bd5eff # 10.33:1, #bd5eff
    set -g cyan 5ef1ff # 14.09:1, #5ef1ff
    set -g pink ffaecf # 13.75:1, #ffaecf

else if [ $theme = tokyodark ]

    set -g red ee6d85 # 9.06:1, #ee6d85
    set -g orange f6955b # 11.86:1, #f6955b
    set -g yellow d7a65f # 16.52:1, #d7a65f
    set -g green 95c561 # 14.12:1, #95c561
    set -g purple a485dd # 10.33:1, #a485dd
    set -g cyan 38a89d # 14.09:1, #38a89d
    set -g pink 7199ee # 13.75:1, #7199ee

else if [ $theme = tomorrow_night_bright ]

    set -g red d54e53 # 9.06:1, #d54e53
    set -g orange e78c45 # 8.23:1, #e78c45
    set -g yellow e7c547 # 12.47:1, #e7c547
    set -g green b9ca4a # 11.6:1, #b9ca4a
    set -g purple c397d8 # 8.73:1, #c397d8
    set -g cyan 70c0b1 # 9.86:1, #70c0b1
    set -g pink 7aa6da # 8.29:1, #7aa6da

else if [ $theme = tomorrow_night ]

    set -g red cc6666 # 5.65:1, #cc6666
    set -g orange de935f # 8.44:1, #de935f
    set -g yellow f0c674 # 13.03:1, #f0c674
    set -g green b5bd68 # 10.44:1, #b5bd68
    set -g purple b294bb # 7.84:1, #b294bb
    set -g cyan 8abeb7 # 10.12:1, #8abeb7
    set -g pink 81a2be # 7.84:1, #81a2be

else if [ $theme = tomorrow_night_eighties ]

    set -g red f2777a # 5.65:1, #f2777a
    set -g orange f99157 # 8.44:1, #f99157
    set -g yellow ffcc66 # 13.03:1, #ffcc66
    set -g green 99cc99 # 10.44:1, #99cc99
    set -g purple cc99cc # 7.84:1, #cc99cc
    set -g cyan 009999 # 10.12:1, #009999
    set -g pink 99cccc # 7.84:1, #99cccc

else if [ $theme = monokai_pro_spectrum ]

    set -g red fc618d # 5.65:1, #fc618d
    set -g orange fd9353 # 8.44:1, #fd9353
    set -g yellow fce566 # 13.03:1, #fce566
    set -g green 7bd88f # 10.44:1, #7bd88f
    set -g purple 948ae3 # 7.84:1, #948ae3
    set -g cyan 5ad4e6 # 10.12:1, #5ad4e6
    set -g pink fc618d # 7.84:1, #fc618d

else if [ $theme = monokai_pro ]

    set -g red ff6188 # 5.65:1, #ff6188
    set -g orange fc9867 # 8.44:1, #fc9867
    set -g yellow ffd866 # 13.03:1, #ffd866
    set -g green a9dc76 # 10.44:1, #a9dc76
    set -g purple ab9df2 # 7.84:1, #ab9df2
    set -g cyan 78dce8 # 10.12:1, #78dce8
    set -g pink fc618d # 7.84:1, #fc618d

else if [ $theme = sonokai_atlantis ]

    set -g red ff6578 # 5.65:1, #ff6578
    set -g orange f69c5e # 8.44:1, #f69c5e
    set -g yellow eacb64 # 13.03:1, #eacb64
    set -g green 9dd274 # 10.44:1, #9dd274
    set -g purple ba9cf3 # 7.84:1, #ba9cf3
    set -g cyan 72cce8 # 10.12:1, #72cce8
    set -g pink ba9cf3 # 7.84:1, #ba9cf3

else if [ $theme = everforest ]

    set -g red e67e80 # 5.65:1, #e67e80
    set -g orange e69875 # 8.44:1, #e69875
    set -g yellow dbbc7f # 13.03:1, #dbbc7f
    set -g green a7c080 # 10.44:1, #a7c080
    set -g purple d699b6 # 7.84:1, #d699b6
    set -g cyan 83c092 # 10.12:1, #83c092
    set -g pink 7fbbb3 # 7.84:1, #7fbbb3

else if [ $theme = oxocarbon ]

    set -g red ee5396 # 5.65:1, #ee5396
    set -g orange 78a9ff # 8.44:1, #78a9ff
    set -g yellow ffe97b # 13.03:1, #ffe97b
    set -g green 42be65 # 10.44:1, #42be65
    set -g purple be95ff # 7.84:1, #be95ff
    set -g cyan 3ddbd9 # 10.12:1, #3ddbd9
    set -g pink ff7eb6 # 7.84:1, #ff7eb6

else if [ $theme = laserwave_high_contrast ]

    set -g red ff5f59 # 6.22:1, #ff5f59
    set -g orange ffb85b # 12.25:1, #ffb85b
    set -g yellow ffe97b # 16.3:1, #ffe97b
    set -g green 3feabf # 13.73:1, #3feabf
    set -g purple d887f5 # 8.7:1, #d887f5
    set -g cyan ed60ba # 14.55:1, #ed60ba
    set -g pink acdfef # 6.98:1, #acdfef
end

# All the colors below are kept across theme.
set -g selection 313244 #, #313244 (Catpuccin surface0)
set -g comment 989898 # 7.27:1, #989898 (modus-vivendi fg-dim)
set -g foreground ffffff # 21:1, #ffffff
