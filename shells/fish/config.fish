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

alias in '{{ install }}'
alias out '{{ uninstall }}'

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

source ~/.config/fish/themes/catppuccin_mocha.fish
