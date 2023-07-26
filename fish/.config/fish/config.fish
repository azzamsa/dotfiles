set fish_greeting # no greeting

#
# Aliases
#

alias .. 'cd ..'
alias ... 'cd ../..'

alias g 'git'
alias q 'exit'
alias c 'clear'
alias sudo 'sudo '

# Safe Versions of rm, cp, mv, and mkdir
alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'
alias mkdir 'mkdir -pv'

# Display PATH with each directory on a new line
alias path 'echo -e $PATH | tr ":" "\\n"'

alias j 'just'
alias x 'joshuto'
alias b 'bookmarks'

abbr --add crg cargo

#
# Apps
#
zoxide init fish | source
starship init fish | source
fnm env | source
atuin init fish | source

