#!/usr/bin/env zsh

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'

alias g='git'
alias q='exit'
alias c='clear'
alias sudo='sudo '

alias in='sudo dnf install --assumeyes'
alias up='sudo dnf upgrade --assumeyes'
alias out='sudo dnf remove'
alias cin='cargo binstall --no-confirm --no-symlinks'
alias cout='cargo uninstall'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -pv'
alias path='echo -e ${PATH//:/\\n}'
alias ports='netstat -tulanp'

alias j='just'
alias mk='make'
alias crg='cargo'
alias shf='shfmt --list --write --indent 2'
alias pip='pip --default-timeout=1000'
# alias x='xplr'
# x means xplore
alias x='cd "$(xplr --print-pwd-as-result)"'

# Can't remember `evcxr`
alias rrepl='evcxr'

alias box='toolbox enter'
alias keepassxc-cli='toolbox run -c daily keepassxc-cli'

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
alias exa="exa --group-directories-first --git";
alias l="exa -blF";
alias ll="exa -abghilmu";
alias llm='ll --sort=modified'
alias la="LC_COLLATE=C exa -ablF";
alias tree='exa --tree --git-ignore'

# replacement
alias cat="bat"

autoload -U zmv

function take {
  mkdir "$1" && cd "$1";
}; compdef take=mkdir


# Create a reminder with human-readable durations, e.g. 15m, 1h, 40s, etc
function r {
  local time=$1; shift
  sched "$time" "notify-send --urgency=critical 'Reminder' '$@'; ding";
}; compdef r=sched

