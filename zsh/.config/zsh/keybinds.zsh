#!/usr/bin/env zsh

# Enable emacs keybindings
# VI is default. Maybe because my $EDITOR
bindkey -e

# Delete word with common keybindings
bindkey -e '^H' backward-kill-word # Ctrl+backspace
bindkey -e '^[^?' backward-kill-word # Alt+backspace

# Navigation with common keybindings
bindkey -e "^[[H" beginning-of-line # HOME
bindkey -e "^[[F" end-of-line # END

