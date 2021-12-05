#!/usr/bin/sh

# Tell sxhd to use `sh`. Otherwise it will use `fish
export SXHKD_SHELL=/usr/bin/sh

dbus-run-session bspwm
