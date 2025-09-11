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
alias gcl 'git clone --depth 1'
alias sudo 'sudo '

alias cat bat

# I don’t want to replace my commands each time I move to a different Linux distro.
alias in '{{ install }}'
alias out '{{ uninstall }}'

alias cin "cargo binstall --no-confirm --no-symlinks --secure"
alias cout "cargo remove"

# Safe Versions of rm, cp, mv, and mkdir
alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'
alias mkdir 'mkdir -pv'

alias j just
alias x nyazi

abbr --add crg cargo
abbr --add hld hledger

#
# Apps
#
zoxide init --cmd cd fish | source
starship init fish | source
fnm env --use-on-cd | source
atuin init fish | source
jj util completion fish | source

#
# Functions
#

#
# ls
function l
    eza --icons --git $argv
end

function ls
    l $argv
end

function la
    eza --icons --git --all --octal-permissions --long $argv
end

function tree
    eza --icons --tree $argv
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
# Create and cd to new dir
function take
    mkdir -p "$argv[1]"
    cd "$argv[1]"
end

#
# Clone any repo then cd into it.
function clone
    if test (count $argv) -ne 1
        echo "Usage: gcl <repository-url>"
        return 1
    end

    set repo_url $argv[1]
    set repo_name (basename $repo_url)

    git clone --depth 1 $repo_url
    cd $repo_name
end

#
# Theme
#

set -g theme "{{ theme }}"
source ~/.config/fish/colors.fish

# Syntax Highlighting Colors
# See https://fishshell.com/docs/current/interactive.html#syntax-highlighting-variables

# The colors below are kept across theme.
set -g fish_color_normal $foreground
set -g fish_color_comment $comment
set -g fish_color_redirection $foreground
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection
set -g fish_pager_color_progress $comment

set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_option $pink
set -g fish_color_param $purple
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_prefix $cyan
