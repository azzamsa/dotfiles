set fish_greeting # no greeting

#
# Bindings
#
bind \cH backward-kill-word

#
# Aliases
#

alias .. 'cd ..'
alias ... 'cd ../..'

alias g git
alias q exit
alias c clear
alias sudo 'sudo '

alias in 'sudo dnf install'
alias out 'sudo dnf remove'

# Safe Versions of rm, cp, mv, and mkdir
alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'
alias mkdir 'mkdir -pv'

# Display PATH with each directory on a new line
alias path 'echo -e $PATH | tr ":" "\\n"'

alias j just
alias n neovide
alias x fyazi

abbr --add crg cargo

#
# Apps
#
zoxide init fish | source
starship init fish | source
fnm env --use-on-cd | source
atuin init fish | source


#
# Functions
#

#
# ls
function l
    eza --group-directories-first --git $argv
end

function ls
    eza --group-directories-first --git $argv
end

function la
    eza --group-directories-first --git --all $argv
end

function tree
    eza --tree $argv
end


#
# yazi
function fyazi
    set tmp (mktemp -t "yazi-cwd.XXXXX")
    yazi --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end


#
# toolbox
function box
    if test -z $argv
        toolbox enter daily
    else
        toolbox enter $argv[1]
    end
end

#
# toor
function r # root
    set project_root (toor 2>/dev/null)

    if test -n "$project_root"
        # If successful, change to the project root directory
        cd "$project_root"
        echo "Changed to project root: $project_root"
    else
        echo "Project root not found. I dont' go anywhere 📍"
    end
end

#
# Theme
#

# See https://fishshell.com/docs/current/interactive.html#syntax-highlighting

set -l bat  1e1e2e #1a1b26 background
set -l swan c0caf5 #c0caf5 foreground
set -l cow  565f89 #565f89 comment
set -l fox  7dcfff #7dcfff
set -l owl  fca7ea #fca7ea
set -l bee  fab387 #ff9e64
set -l elk  a6e3a1 #9ece6a
set -l puma e0af68 #e0af68
set -l duck 9d7cd8 #9d7cd8
set -l ant  f7768e #f7768e

# Syntax highlighting colors
set -g fish_color_normal $swan
set -g fish_color_command $fox
set -g fish_color_keyword $duck
set -g fish_color_param $owl
set -g fish_color_quote $elk
set -g fish_color_redirection $owl
set -g fish_color_end $puma
set -g fish_color_comment $duck
set -g fish_color_error $bee
set -g fish_color_gray $duck
set -g fish_color_selection --background=$bat
set -g fish_color_search_match --background=$bat
set -g fish_color_option $elk
set -g fish_color_operator $owl
set -g fish_color_escape $ant
set -g fish_color_autosuggestion $duck
set -g fish_color_cancel $bee
set -g fish_color_status $bee

# Completion pager colors
set -g fish_pager_color_progress $cow
set -g fish_pager_color_prefix $fox
set -g fish_pager_color_completion $swan
set -g fish_pager_color_description $cow
set -g fish_pager_color_selected_background --background=$fox
set -g fish_pager_color_selected_completion $bat
