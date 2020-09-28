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

# Color Scheme (Zenburn)
# https://github.com/jnurmine/Zenburn/blob/master/colors/zenburn.vim
set -U fish_color_autosuggestion      f0dfaf
set -U fish_color_cancel              dfdfdf
set -U fish_color_command             f0dfaf
set -U fish_color_comment             7f9f7f
set -U fish_color_end                 brmagenta
set -U fish_color_error               brred
set -U fish_color_escape              brcyan
set -U fish_color_history_current     --bold
set -U fish_color_match               b8bb26
set -U fish_color_normal              normal
set -U fish_color_operator            cyan
set -U fish_color_param               83a598
set -U fish_color_quote               cc9393
set -U fish_color_redirection         bryellow
set -U fish_color_search_match        dca3a3
set -U fish_color_selection           'white' '--bold' '--background=brblack'
set -U fish_color_status              red
set -U fish_color_valid_path          --underline
set -U fish_pager_color_completion    normal
set -U fish_pager_color_description   yellow
set -U fish_pager_color_prefix        'white' '--bold' '--underline'
set -U fish_pager_color_progress      'brwhite' '--background=cyan'
