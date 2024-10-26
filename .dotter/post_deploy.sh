#!/bin/bash

# Extract the theme value and save it to a variable
theme=$(grep '^theme = ' ~/dotfiles/.dotter/local.toml | cut -d '"' -f2)

# Copy the theme file to the desired location
cp -f ~/dotfiles/utils/yazi/_themes/"$theme".toml ~/.config/yazi/theme.toml
