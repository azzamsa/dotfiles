#!/usr/bin/env zsh

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'

alias g='git'
alias q='exit'
alias c='clear'
alias sudo='sudo '

alias fm='nautilus'
alias ed='flatpak run org.gnome.TextEditor'

alias in='sudo nala install'
# `remove` doesn't remove app config files
alias out='sudo nala purge'
alias cin='cargo binstall --no-confirm --no-symlinks'
alias cout='cargo uninstall'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -pv'
alias path='echo -e ${PATH//:/\\n}'

alias j='just'
alias shf='shfmt --list --write --indent 2'
alias pip='pip --default-timeout=1000'
# x means xplore
alias x='joshuto'

# toolbox alias
box() {
  if [ -z "$1" ]; then
    toolbox enter daily
  else
    toolbox enter "$1"
  fi
}

# An rsync that respects gitignore
rcp() {
  # -a = -rlptgoD
  #   -r = recursive
  #   -l = copy symlinks as symlinks
  #   -p = preserve permissions
  #   -t = preserve mtimes
  #   -g = preserve owning group
  #   -o = preserve owner
  # -z = use compression
  # -P = show progress on transferred file
  # -J = don't touch mtimes on symlinks (always errors)
  rsync -azPJ \
    --include=.git/ \
    --filter=':- .gitignore' \
    --filter=":- ~/.config/git/ignore" \
    "$@"
}; compdef rcp=rsync
alias rcpd='rcp --delete --delete-after'
alias rcpu='rcp --chmod=go='
alias rcpdu='rcpd --chmod=go='

# exa
alias ls="exa --group-directories-first --git";
alias ll="exa --all --binary --group --header --inode --long --modified --accessed";
alias llm='ll --sort=modified'
alias tree='exa --tree --git-ignore'

autoload -U zmv

function take {
  mkdir "$1" && cd "$1";
}; compdef take=mkdir


# Create a reminder with human-readable durations, e.g. 15m, 1h, 40s, etc
function r {
  local time=$1; shift
  sched "$time" "notify-send --urgency=critical 'Reminder' '$@'; ding";
}; compdef r=sched
