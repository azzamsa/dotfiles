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

# preferred_background: 1e1e2e
set -g fish_color_normal cdd6f4
set -g fish_color_command 89b4fa
set -g fish_color_param f2cdcd
set -g fish_color_keyword f38ba8
set -g fish_color_quote a6e3a1
set -g fish_color_redirection f5c2e7
set -g fish_color_end fab387
set -g fish_color_comment 7f849c
set -g fish_color_error f38ba8
set -g fish_color_gray 6c7086
set -g fish_color_selection --background=313244
set -g fish_color_search_match --background=313244
set -g fish_color_option a6e3a1
set -g fish_color_operator f5c2e7
set -g fish_color_escape eba0ac
set -g fish_color_autosuggestion 6c7086
set -g fish_color_cancel f38ba8
set -g fish_color_cwd f9e2af
set -g fish_color_user 94e2d5
set -g fish_color_host 89b4fa
set -g fish_color_host_remote a6e3a1
set -g fish_color_status f38ba8
set -g fish_pager_color_progress 6c7086
set -g fish_pager_color_prefix f5c2e7
set -g fish_pager_color_completion cdd6f4
set -g fish_pager_color_description 6c7086
