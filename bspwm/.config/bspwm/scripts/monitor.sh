#!/usr/bin/sh

# Wait until bspwm settled
sleep 5

# Active monitor example output: `eDP-1 HDMI-2`
ACTIVE_MONITORS=$(xrandr --listactivemonitors | grep -v Monitors | grep -Eo '[^ ]+$')

ACTIVE_HDMI_MONITOR=$(echo "$ACTIVE_MONITORS" | awk '/HDMI/ {print $1}')

# If there is the HDMI connection. Load the docked profile
# Most of the time, I don't use my laptop screen.
# For presentation, I can just fire up the `--load demo` command
if [ -n "$ACTIVE_HDMI_MONITOR" ]; then
    autorandr --load docked
fi
