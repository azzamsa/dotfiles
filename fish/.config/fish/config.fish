set fish_greeting # no greeting

# Exports
set -g fish_user_paths ~/bin/private ~/bin/public ~/.local/bin ~/.cargo/bin ~/.nodebin/node_modules/.bin ~/localbin ~/.poetry/bin $fish_user_paths
set -gx EDITOR emacs
set -gx QT_QPA_PLATFORMTHEME qt5ct
set -gx SXHKD_SHELL sh
# Java applications menus immediately closing after the click
set -gx _JAVA_AWT_WM_NONREPARENTING 1

# Utilities
zoxide init fish | source
starship init fish | source
fnm env | source
atuin init fish | source

set -x LS_COLORS (vivid generate molokai)

# Alias
alias in "sudo apt install"
alias inn "sudo apt-get --no-install-recommends install"
alias inb "sudo apt install -t bullseye-backports"

alias c 'clear'
alias rmd 'rm -rdf'
alias g "git"
alias ytdl "youtube-dl"
alias rrepl "evcxr" # I can't remember evcxr

# fd in debian is `fdfind` which is too long
alias fd "fdfind"

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

#  Color Palette
set -l foreground f8f8f2
set -l selection 44475a
set -l comment 6272a4
set -l red ff5555
set -l orange ffb86c
set -l yellow f1fa8c
set -l green 50fa7b
set -l purple bd93f9
set -l cyan 8be9fd
set -l pink ff79c6

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
# paremeter color such `--version`
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment


# tell fisher not to put a mess in ~/.config
set -g fisher_path /opt/fisher

set -p fish_function_path fish_function_path[1] $fisher_path/functions
set -p fish_complete_path fish_complete_path[1] $fisher_path/completions

for file in $fisher_path/conf.d/*.fish
    builtin source $file 2>/dev/null
end
