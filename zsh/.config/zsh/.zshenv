# If this is your first time setting up zsh
# copy the code below to /etc/zshenv
#
# ZDOTDIR=~/.config/zsh
# source -- "$ZDOTDIR"/.zshenv

source "$HOME"/.config/meta/env
ZGEN_DIR=~/.local/share/zgenom

function _cache {
  (( $+commands[$1] )) || return 1
  local cache_dir="~/.cache/${SHELL##*/}"
  local cache="$cache_dir/$1"
  if [[ ! -f $cache || ! -s $cache ]]; then
      echo "Caching $1"
      mkdir -p $cache_dir
      "$@" >$cache
      chmod 600 $cache
  fi
  if [[ -o interactive ]]; then
      source $cache || rm -f $cache
  fi
}

function _source {
  for file in "$@"; do
    [ -r $file ] && source $file
  done
}

# Be more restrictive with permissions; no one has any business reading things
# that don't belong to them.
if (( EUID != 0 )); then
  umask 027
else
  # Be even less permissive if root.
  umask 077
fi
