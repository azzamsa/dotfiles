#!/usr/bin/bash
# credits:  criswell/meh

active_monitors=$(xrandr | awk '/\ connected/ && /[[:digit:]]x[[:digit:]].*+/{print $1}')

unset DISPLAY_LAPTOP DISPLAY_HDMI || true

for m in $active_monitors
do
    if [[ "$m" == "eDP-1" ]]; then
        DISPLAY_LAPTOP=yes
    elif [[ "$m" == "HDMI-1" ]]; then
        DISPLAY_HDMI=yes
    fi
done

layout_laptop_only() {
    # bspc monitor -d 4 5 6 7
    bspc monitor -d 1 2 3 4 6 7
}

layout_external_hdmi_only() {
    # bspc monitor HDMI-1 -d 4 5 6 7
    # TODO How to start at specific monitor? 
    bspc monitor HDMI-1 -d 1 2 3 4 5 6 7 
}

layout_external_all() {
    # bspwm always assing to source monitor first
    bspc monitor eDP-1 -d 1
    bspc monitor HDMI-1 -d 2 3 4 5 6 7
}

if [ -n "$DISPLAY_LAPTOP" ] && [ -n "$DISPLAY_HDMI" ]; then
    echo "::: All monitors are active"
    layout_external_all
elif [ -n "$DISPLAY_HDMI" ]; then
    echo "::: Only HDMI is active"
    layout_external_hdmi_only
else
    echo "::: Only LAPTOP is active"
    layout_laptop_only
fi
