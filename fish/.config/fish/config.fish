set fish_greeting # no greeting

# Exports
set -g fish_user_paths ~/bin/private ~/bin/public ~/.local/bin ~/.cargo/bin ~/.nodebin/node_modules/.bin ~/.poetry/bin ~/.local/share/pnpm $fish_user_paths
set -gx EDITOR emacs
# Java applications menus immediately closing after the click
set -gx _JAVA_AWT_WM_NONREPARENTING 1
set -gx PNPM_HOME ~/.local/share/pnpm

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
alias g "git"
alias ytdl "youtube-dl"
alias rrepl "evcxr" # I can't remember evcxr

# fd in debian is `fdfind` which is too long
alias fd "fdfind"

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


# tell fisher not to put a mess in ~/.config
set -g fisher_path /opt/fisher

set -p fish_function_path fish_function_path[1] $fisher_path/functions
set -p fish_complete_path fish_complete_path[1] $fisher_path/completions

for file in $fisher_path/conf.d/*.fish
    builtin source $file 2>/dev/null
end
