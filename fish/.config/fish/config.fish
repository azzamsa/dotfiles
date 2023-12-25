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

set -l fg dcd7ba #dcd7ba  # fg in completion page,
set -l selection 2d4f67 #2d4f67 # selection

set -l cow ffa066 #ffa066 # command, prefix
set -l elk ff5d62 #ff5d62 # error, invalid command,
set -l puma e6c384 #e6c384 # params, (~, *), 
set -l duck 727169 #727169 # suggestion, comment
set -l owl 98bb6c #98bb6c # string
set -l bear 7e9cd8 #7e9cd8 # options
# set -l <foo> 957fb8 #957fb8 # params

# Syntax Highlighting Colors
set -g fish_color_normal $fg
set -g fish_color_redirection $fg
set -g fish_pager_color_completion $fg

set -g fish_pager_color_description $comment
set -g fish_pager_color_progress $comment

set -g fish_color_autosuggestion $duck
set -g fish_color_comment $duck

set -g fish_color_quote $owl
set -g fish_pager_color_prefix $cow

set -g fish_color_selection --background=$selection
set -g fish_pager_color_selected_background --background=$selection
set -g fish_color_search_match --background=$selection

set -g fish_color_param $puma
set -g fish_color_operator $puma

set -g fish_color_command $cow
set -g fish_color_option $bear
