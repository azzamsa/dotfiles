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

set -l cow  ffa066 #ffa066 # command, prefix
set -l elk  ff5d62 #ff5d62 # invalid command, error
set -l puma 957fb8 #957fb8 # params,
set -l duck 727169 #727169 # suggestion, comment

set -l foreground dcd7ba #dcd7ba
set -l selection  2D4F67 #2D4F67
set -l orange     ff9e64 #ff9e64
set -l yellow     c0a36e #c0a36e
set -l green      76946a #76946a
set -l pink       d27e99 #d27e99

# Syntax Highlighting Colors
set -g fish_color_command $cow
set -g fish_color_error $elk
set -g fish_color_param $puma
set -g fish_color_autosuggestion $duck
set -g fish_color_comment $duck
set -g fish_color_normal $foreground
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink

# Completion Pager Colors
set -g fish_pager_color_prefix $cow

set -g fish_pager_color_progress $comment
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
