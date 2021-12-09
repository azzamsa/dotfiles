set fish_greeting # no greeting

# Exports
set -g fish_user_paths ~/bin/private ~/bin/public ~/.local/bin ~/.cargo/bin ~/.nodebin/node_modules/.bin ~/localbin $fish_user_paths
set -gx EDITOR emacs
set -gx QT_QPA_PLATFORMTHEME qt5ct
set -gx SXHKD_SHELL sh

# Utilities
zoxide init fish | source
starship init fish | source
fnm env | source

set -x LS_COLORS (vivid generate nord)

# Alias
alias in "sudo apt install"
alias inn "sudo apt-get --no-install-recommends install"
alias inb "sudo apt install -t bustera-backports"

alias c 'clear'
alias rmd 'rm -rdf'
alias g "git"
alias ytdl "youtube-dl"
alias rrepl "evcxr" # I can't remember evcxr

set colorflag "--color"
alias l "ls -lF $colorflag"
alias la "ls -AltGhF --group-directories-first $colorflag"
alias lsd "ls -lF $colorflag | grep --color=never '^d'"
alias ls "command ls $colorflag"

# Abbrev
abbr crg "cargo"
abbr js "just"
abbr mk "make"
abbr pn "pnpm"

## expand !! such `sudo !!` bash equivalent
function sudobangbang --on-event fish_postexec
    abbr !! sudo $argv[1]
end

# Fix Emacs TRAMP hangs
if test "$TERM" = "dumb"
  function fish_prompt
    echo "\$ "
  end

  function fish_right_prompt; end
  function fish_greeting; end
  function fish_title; end
end

# Color scheme
set -U fish_color_error               81a1c1 # #81a1c1 default color when typing suggestion
set -U fish_color_autosuggestion      6B7280 # #6B7280 suggestion
set -U fish_color_command             5e81ac # #5e81ac binary command
set -U fish_color_quote               a3be8c # #a3be8c text color inside the quote
set -U fish_color_comment             a3be8c # #a3be8c comment color
set -U fish_color_valid_path          --underline # attribute for a valid path
set -U fish_color_param               88c0d0 # #88c0d0 paremeter color such `--version`
set -U fish_color_cancel              bf616a # #bf616a
set -U fish_color_end                 0087af # #0087af
set -U fish_color_escape              444444 # #444444
set -U fish_color_history_current     d08770 # #d08770
set -U fish_color_match               bf616a # #bf616a
set -U fish_color_normal              eceff4 # #eceff4
set -U fish_color_operator            b48ead # #b48ead
set -U fish_color_redirection         005faf # #005faf
set -U fish_color_search_match        5e81ac # #5e81ac
set -U fish_color_selection           'white' '--bold' '--background=brblack'
set -U fish_color_status              red
set -U fish_pager_color_completion    0087af # #0087af
set -U fish_pager_color_description   yellow
set -U fish_pager_color_prefix        d08770 # #d08770 # completion color such when doing `cd dotfiles/bspwm/.`
set -U fish_pager_color_progress      'brwhite' '--background=cyan'


# tell fisher not to put a mess in ~/.config
set -g fisher_path /opt/fisher

set -p fish_function_path fish_function_path[1] $fisher_path/functions
set -p fish_complete_path fish_complete_path[1] $fisher_path/completions

for file in $fisher_path/conf.d/*.fish
    builtin source $file 2>/dev/null
end
