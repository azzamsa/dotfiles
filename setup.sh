#!/usr/bin/env bash

bombadil unlink
mkdir -p ~/.config/yazi ~/.config/fish
bombadil link
cp cli/yazi/theme.toml ~/.config/yazi/
