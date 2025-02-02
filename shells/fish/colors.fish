#
# Bookmarks
# - https://github.com/azzamsa/dotfiles/tree/925cf2f92360a3132291230e8054ac755aacc6d7/shells/fish/themes

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

end

# All the colors below are kept across theme.
set -g selection 313244 #, #313244 (Catpuccin surface0)
set -g comment 989898 # 7.27:1, #989898 (modus-vivendi fg-dim)
set -g foreground ffffff # 21:1, #ffffff
