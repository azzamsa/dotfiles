#!/usr/bin/sh

# gnome keyring
eval $(gnome-keyring-daemon --start --daemonize)
export SSH_AUTH_SOCK

# Tell sxhd to use `sh`. Otherwise it will use `fish
export SXHKD_SHELL=/usr/bin/sh

dbus-run-session bspwm
