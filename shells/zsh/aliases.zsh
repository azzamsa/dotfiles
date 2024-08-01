#!/usr/bin/env zsh

alias ..='cd ..'
alias ...='cd ../..'

alias c='clear'
alias g='git'
alias sudo='sudo '

alias in='{{ install }}'
alias out='{{ uninstall }}'

# Safe Versions of rm, cp, mv, and mkdir
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -pv'

# Display PATH with each directory on a new line
alias path='echo -e ${PATH//:/\\n}'

alias j='just'
alias x='nyazi' # x means xplore

#
# toolbox
box() {
  if [ -z "$1" ]; then
    toolbox enter daily
  else
    toolbox enter "$1"
  fi
}

#
# toor
r() {
    local project_root
    project_root=$(toor 2>/dev/null)

    if [[ -n "$project_root" ]]; then
        # If successful, change to the project root directory
        cd "$project_root"
        echo "Changed to project root: $project_root"
    else
        echo "Project root not found. I don't go anywhere 📍"
    fi
}

nyazi() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Create and cd to new dir
function take {
  mkdir "$1" && cd "$1";
}; compdef take=mkdir

#
# exa
#
function l() {
    eza --group-directories-first --git $argv
}
function ls() {
    eza --group-directories-first --git $argv
}
function la() {
    eza --group-directories-first --git --all $argv
}
function tree() {
    eza --tree $argv
}

