if [ $theme = snazzy ]
    # License: MIT
    # Source:
    # - https://github.com/doomemacs/themes/blob/master/themes/doom-snazzy-theme.el
    # - https://github.com/sindresorhus/hyper-snazzy/blob/main/index.js
    # - https://github.com/chawyehsu/base16-snazzy-scheme/blob/main/snazzy.yaml

    set -g red ff5c57 # 6.92:1 (AA), #ff5c57
    # from doom-snazzy
    # set -g orange ffb86c # 12.32:1, #ffb86c
    # from chawyehsu/base16
    set -g orange ff9f43 # 10.29:1, #ff9f43
    set -g yellow f3f99d # 18.84:1, #f3f99d
    set -g green 5af78e # 15.12:1, #5af78e
    set -g purple 57c7ff # 11.01:1, #57c7ff
    set -g cyan 9aedfe # 15.91:1, #9aedfe
    set -g pink ff6ac1 # 8.08:1, #ff6ac1

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

else if [ $theme = modus_vivendi ]
    # License: GPL 3.0
    # Source:
    # - https://github.com/miikanissi/modus-themes.nvim/blob/master/extras/fish/modus_vivendi.fish
    # - https://github.com/protesilaos/modus-themes/blob/main/modus-vivendi-theme.el

    #
    # Default

    # set -g red ff5f59 # 7.03:1, #ff5f59
    # set -g yellow d0bc00 # 10.87:1, #d0bc00
    # set -g green 44bc44 # 8.52:1, #44bc44
    # set -g blue 2fafff # 8.69:1, #2fafff
    # set -g orange fec43f # 13.18:1, #fec43f

    # set -g red ff7f86 # 8.63:1, #ff7f86 (red cooler)
    # set -g green 88ca9f # 10.99:1, #88ca9f (green faint)
    # set -g green 00c06f # 8.76:1, #00c06f (green cooler)
    # set -g orange 00bcff # 9.63:1, #00bcff (blue cooler)
    # set -g pink feacd0 # 12.02:1, #feacd0 (magenta)
    # set -g cyan 6ae4b9 # 13.41:1, #6ae4b9 (cyan cooler)

    set -g red ff7f86 # 7.48:1, #ff6b55 (red warmer)
    set -g green 6ae4b9 # 13.41:1, #6ae4b9 (cyan cooler)
    set -g yellow dfaf7a # 10.55:1, #dfaf7a (yellow cooler)
    set -g orange 79a8ff # 8.85:1, #79a8ff (blue warmer)
    set -g purple b6a0ff # 9.46:1, #b6a0ff (magenta cooler)
    set -g pink f78fe7 # 10.03:1, #f78fe7 (magenta warmer)
    set -g cyan 00d3d0 # 11.22:1, #00d3d0
else if [ $theme = material ]
    # License: Apache-2.0
    # Source:
    # - https://github.com/ntpeters/base16-materialtheme-scheme/blob/master/material-palenight.yaml
    # - https://github.com/kaicataldo/material.vim/blob/main/colors/material.vim
    # - https://github.com/drewtempelmeyer/palenight.vim/blob/master/autoload/palenight.vim
    # - https://github.com/t3dotgg/vsc-material-but-i-wont-sue-you

    set -g red ff5370 # 6.72:1 (AA), #ff5370
    set -g orange f78c6c # 8.92:1, #f78c6c
    set -g yellow ffcb6b # 14:1, #ffcb6b
    set -g green c3e88d # 15.24:1, #c3e88d
    set -g purple c792ea # 8.72:1, #c792ea
    # set -g cyan 89ddff # 13.85:1, #89ddff
    # use OG accent, blue.
    set -g cyan 89ddff # 8.85:1, #79a8ff
    set -g pink f07178 # 7.33:1, #f07178

else if [ $theme = monokai_pro ]
    # Source:
    # - https://github.com/doomemacs/themes/blob/master/themes/doom-monokai-pro-theme.el

    set -g red ff6188 # 7.31:1, #ff6188
    set -g orange fc9867 # 9.82:1, #fc9867
    set -g yellow ffd866 # 15.26:1, #ffd866
    set -g green a9dc76 # 13.18:1, #a9dc76
    set -g purple ab9df2 # 8.83:1, #ab9df2
    set -g cyan 78dce8 # 13.2:1, #78dce8
    set -g pink 81a2be # 7.84:1, #81a2be
end

# All the colors below are kept across theme.
# Mostly taken from https://catppuccin.com/palette mocha.
set -g selection 313244 #, #313244 (surface0)
# OG Catppuccin Mocha uses overlay0
# set -g comment 7f849c # 5.68:1, #7f849c (overlay1)
set -g comment 9399b2 # 7.43:1, #9399b2 (overlay2)
set -g foreground ffffff # 21:1, #ffffff
