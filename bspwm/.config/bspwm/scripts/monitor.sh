#!/usr/bin/sh

IS_HDMI_CONNECTED=$(bspc query --monitors --names | grep HDMI)

# If there is the HDMI connection. Load the docked profile
# Most of the time, I don't use my laptop screen.
# For presentation, I can just fire up the `--load demo` command
if [ -n "$IS_HDMI_CONNECTED" ]; then
    autorandr --load docked
fi
