set fish_greeting # no greeting

# Force true-color support; otherwise, the Neovim Terminal inside Neovide
# (not the case with Neovim inside the Terminal) will use slightly different colors,
# which is sometimes annoying and hard to read. I've been having a hard time solving this issue,
# ranging from setting `vim.g.terminal_color_n` and other approaches.
# It turns out it's an issue with the Fish shell.
# All credits due to @fredizzimo (Neovide maintainer) for finding this solution.
set -g fish_term24bit 1

#
# Bindings
#
bind \cH backward-kill-word

#
# Aliases
#

alias .. 'cd ..'
alias ... 'cd ../..'

alias c clear
alias g git
alias sudo 'sudo '

alias cat bat

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
alias x nyazi

abbr --add crg cargo

#
# Apps
#
zoxide init --cmd cd fish | source
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
    eza --group-directories-first --git --all --octal-permissions --long $argv
end

function tree
    eza --tree $argv
end


# Changing working directory when exiting Yazi
# https://yazi-rs.github.io/docs/quick-start/#changing-working-directory-when-exiting-yazi
function nyazi
    set tmp (mktemp -t "yazi-cwd.XXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd "$cwd"
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
# Hurl with pretty printed JSON
function hurlj
    hurl $argv | jaq
end


#
# Create and cd to new dir
function take
    mkdir -p "$argv[1]"
    cd "$argv[1]"
end

#
# Clone any repo then cd into it.
# `gcl` stands for `git clone`
function gcl
    if test (count $argv) -ne 1
        echo "Usage: gcl <repository-url>"
        return 1
    end

    set repo_url $argv[1]
    set repo_name (basename $repo_url .git)

    git clone --depth 1 $repo_url
    cd $repo_name
end

#
# Theme
#

# See https://fishshell.com/docs/current/interactive.html#syntax-highlighting

# [1] #cdd6f4 fg in completion page
# [2] #313244 selection
# [3] #89b4fa command, prefix
# [4] #f38ba8 error, invalid command
# [5] #f2cdcd params, (~, *)
# [6] #9399b2 suggestion, comment
# [7] #a6e3a1 string
# [8] #89b4fa options,|
set -l catppuccin_mocha cdd6f4 \
    313244 \
    89b4fa \
    f38ba8 \
    f2cdcd \
    9399b2 \
    a6e3a1 \
    89b4fa

# [1] #c8d3f5 fg in completion page
# [2] #2d3f76 selection
# [3] #86e1fc command, prefix
# [4] #ff757f error, invalid command
# [5] #fca7ea params, (~, *)
# [6] #636da6 suggestion, comment
# [7] #c3e88d string
# [8] #82aaff options,|
set -l tokyonight_moon c8d3f5 \
    2d3f76 \
    86e1fc \
    ff757f \
    fca7ea \
    636da6 \
    c3e88d \
    82aaff

# [1] #3760bf fg in completion page
# [2] #b6bfe2 selection
# [3] #007197 command, prefix
# [4] #f52a65 error, invalid command
# [5] #7847bd params, (~, *)
# [6] #848cb5 suggestion, comment
# [7] #587539 string
# [8] #b15c00 options,|
set -l tokyonight_day 3760bf \
    b6bfe2 \
    007197 \
    f52a65 \
    7847bd \
    848cb5 \
    587539 \
    b15c00

# [1] #dcd7ba fg in completion page
# [2] #2d4f67 selection
# [3] #ffa066 command, prefix
# [4] #e46876 error, invalid command
# [5] #68ad99 params, (~, *)
# [6] #c8c093 suggestion, comment
# [7] #98bb6c string
# [8] #7e9cd8 options, |
set -l kanagawa dcd7ba \
    2d4f67 \
    ffa066 \
    e46876 \
    68ad99 \
    c8c093 \
    98bb6c \
    7e9cd8

set -l colors $catppuccin_mocha

set -l fg $colors[1]
set -l sel $colors[2]
set -l cow $colors[3]
set -l elk $colors[4]
set -l puma $colors[5]
set -l duck $colors[6]
set -l owl $colors[7]
set -l bear $colors[8]

# Syntax Highlighting Colors
set -g fish_color_normal $fg
set -g fish_color_redirection $fg
set -g fish_pager_color_completion $fg

set -g fish_pager_color_description $comment
set -g fish_pager_color_progress $comment

set -g fish_color_autosuggestion $duck
set -g fish_color_comment $duck

set -g fish_color_selection --background=$sel
set -g fish_pager_color_selected_background --background=$sel
set -g fish_color_search_match --background=$sel

set -g fish_color_param $puma
set -g fish_color_operator $puma

set -g fish_color_option $bear
set -g fish_color_end $bear

set -g fish_pager_color_prefix $cow
set -g fish_color_command $cow

set -g fish_color_quote $owl
set -g fish_color_error $elk
