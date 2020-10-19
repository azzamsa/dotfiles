set fish_greeting # no greeting

# Exports
set -g fish_user_paths ~/.cargo/bin ~/bin ~/.local/bin $fish_user_paths
set -gx EDITOR emacs
set -gx QT_QPA_PLATFORMTHEME qt5ct

# Utilities
zoxide init fish | source
starship init fish | source

set -x LS_COLORS (vivid generate ayu)

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

# Fix Emacs TRAMP hangs
if test "$TERM" = "dumb"
  function fish_prompt
    echo "\$ "
  end

  function fish_right_prompt; end
  function fish_greeting; end
  function fish_title; end
end

# Scheme (Paper Color)
# https://github.com/NLKNguyen/papercolor-theme/blob/master/colors/PaperColor.vim
set -U fish_color_autosuggestion      005f87
set -U fish_color_cancel              af0000
set -U fish_color_command             008700
set -U fish_color_comment             5f8700
set -U fish_color_end                 0087af
set -U fish_color_error               878787
set -U fish_color_escape              444444
set -U fish_color_history_current     bcbcbc
set -U fish_color_match               d70000
set -U fish_color_normal              normal
set -U fish_color_operator            d70087
set -U fish_color_param               8700af
set -U fish_color_quote               d75f00
set -U fish_color_redirection         005faf
set -U fish_color_search_match        005f87
set -U fish_color_selection           'white' '--bold' '--background=brblack'
set -U fish_color_status              red
set -U fish_color_valid_path          --underline
set -U fish_pager_color_completion    0087af
set -U fish_pager_color_description   yellow
set -U fish_pager_color_prefix        'white' '--bold' '--underline'
set -U fish_pager_color_progress      'brwhite' '--background=cyan'


# Plugins
set -g fisher_path /opt/fisher

set -p fish_function_path fish_function_path[1] $fisher_path/functions
set -p fish_complete_path fish_complete_path[1] $fisher_path/completions

for file in $fisher_path/conf.d/*.fish
    builtin source $file 2>/dev/null
end
