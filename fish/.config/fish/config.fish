set fish_greeting # no greeting

set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_STATE_HOME "$HOME/.local/state"
set -x XDG_CACHE_HOME "$HOME/.cache"

set -U EDITOR emacs

#
# Paths
#

fish_add_path -g ~/opt/bin ~/.local/bin ~/.cargo/bin
fish_add_path -g ~/.rye/shims opt/bin ~/.local/bin ~/.cargo/bin
fish_add_path -g ~/opt/nodebin/node_modules/.bin

#
# Aliases
#

alias .. 'cd ..'
alias ... 'cd ../..'

alias g 'git'
alias q 'exit'
alias c 'clear'
alias sudo 'sudo '

alias in 'sudo nala install'
alias out 'sudo nala purge'

alias cin 'cargo binstall --no-confirm --no-symlinks'
alias cout 'cargo uninstall'

# Safe Versions of rm, cp, mv, and mkdir
alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'
alias mkdir 'mkdir -pv'

# Display PATH with each directory on a new line
alias path 'echo -e $PATH | tr ":" "\\n"'

alias j 'just'
alias pip 'pip --default-timeout=1000'
alias x 'joshuto'

abbr --add crg cargo

#
# Apps
#
zoxide init fish | source
starship init fish | source
fnm env | source
atuin init fish | source


# Fix Emacs TRAMP hangs
if test "$TERM" = "dumb"
  function fish_prompt
    echo "\$ "
  end

  function fish_right_prompt; end
  function fish_greeting; end
  function fish_title; end
end
