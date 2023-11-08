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

alias g 'git'
alias q 'exit'
alias c 'clear'
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

alias j 'just'
alias x 'fyazi'

abbr --add crg cargo

#
# Apps
#
zoxide init fish | source
starship init fish | source
fnm env | source
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
# Theme
#

set -l c1 6272a4 #6272a4
set -l c2 bd93f9 #bd93f9
set -l c3 ff79c6 #ff79c6
set -l c4 ffb86c #ffb86c
set -l c5 50fa7b #50fa7b
set -l c6 ff79c6 #ff79c6
set -l c7 f1fa8c #f1fa8c
set -l c8 8be9fd #8be9fd
set -l c9 8be9fd #8be9fd
set -l c10 ff6e6e #ff6e6e
set -l c11 282a36 #282a36

set -g fish_color_normal $c1
set -g fish_color_command $c2
set -g fish_color_param $c3
set -g fish_color_keyword $c4
set -g fish_color_quote $c5
set -g fish_color_redirection $c6
set -g fish_color_end $c7
set -g fish_color_comment $c8
set -g fish_color_error $c4
set -g fish_color_gray $c9
set -g fish_color_selection --background=$c11
set -g fish_color_search_match --background=$c11
set -g fish_color_option $c5
set -g fish_color_operator $c6
set -g fish_color_escape $c10
set -g fish_color_autosuggestion $c9
set -g fish_color_cancel $c4
set -g fish_color_status $c4
set -g fish_pager_color_progress $c9
set -g fish_pager_color_prefix $c6
set -g fish_pager_color_completion $c1
set -g fish_pager_color_description $c9
