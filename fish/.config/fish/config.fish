set fish_greeting # no greeting

# Utilities
zoxide init fish | source
starship init fish | source

# Exports
set -g fish_user_paths ~/.cargo/bin ~/bin $fish_user_paths
set -gx EDITOR emacs

if test -n "$INSIDE_EMACS"
    set -x LS_COLORS (vivid generate molokai)
else
    set -x LS_COLORS (vivid generate molokai)
end


# Alias
alias in "sudo apt install"
alias inn "sudo apt-get --no-install-recommends install"

alias c 'clear'
alias rmd 'rm -rdf'

set colorflag "--color"
alias l "ls -lF $colorflag"
alias la "ls -AltGhF --group-directories-first $colorflag"
alias lsd "ls -lF $colorflag | grep --color=never '^d'"
alias ls "command ls $colorflag"

## expand !! such `sudo !!` bash equivalent
function sudobangbang --on-event fish_postexec
    abbr !! sudo $argv[1]
end

