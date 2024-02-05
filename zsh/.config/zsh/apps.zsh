#!/usr/bin/env zsh

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd)"
eval "$(atuin init zsh)"
source "$HOME/.cargo/env"


