#!/usr/bin/env bash

# Shortcuts
alias g="git"

colorflag="--color=auto"

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -AltGhF --group-directories-first ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# Enable aliases to be sudo’ed
alias sudo="sudo "

# more sudo problem
alias psudo='sudo env PATH="$PATH"'

#apt-get stuff
alias in="sudo apt install"
alias inn="sudo apt-get --no-install-recommends install"

. /etc/os-release
codename=$VERSION_CODENAME
alias inb="sudo apt install -t ${codename}-backports"

#programming stuff
alias rsbcl="rlwrap sbcl"

#emacsclient
alias e="emacsclient -t"
alias ec="emacsclient -c"

# mc
alias mc=". /usr/share/mc/bin/mc-wrapper.sh"

# hledger
alias hld="hledger"
alias hlde="/usr/bin/mousepad .hledger.journal"
alias hldf="hledger -f- -I print"

# yt
alias ytaudio="youtube-dl -f bestaudio[ext=m4a]"
alias ytvideo="youtube-dl -f 18"

# more
alias du="du -h"
alias lgh="light -S "
alias rmd="rm -rdf"
alias pwdc="/bin/pwd | /usr/bin/xclip -selection clipboard"
