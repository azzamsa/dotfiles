#!/usr/bin/bash

#
# workspaces
#

# Need to move all the workspace to second montior
# Otherwise, I can't invoke `super-4` to get to workspsace 1.
# credits: https://github.com/ericmurphyxyz/archrice/blob/6e85165338a6e35503ece16025850412bc4768b2/.local/bin/startup
move_workspace_to_external_monitor() {
    internal_monitor=eDP-1
    external_monitor=HDMI-1

    desktops=1 # How many desktops to move to the second monitor

    for desktop in $(bspc query -D -m $internal_monitor | sed "$desktops"q)
    do
        bspc desktop $desktop --to-monitor $external_monitor
    done

    # Remove "Desktop" created by bspwm
    bspc desktop Desktop --remove
}


#
# brightness
#

is_night(){
    hour=`date +%H`

    if [ $hour -lt 18 ]; then
        echo "::: It is a day time"
        return 1
    else
        echo "::: It is a night time"
        return 0
    fi
}



#
# monitors
#
# credits: https://github.com/criswell/meh/blob/0745d064c2219d22d98f8a6502846698938156ff/bijaz-theme/.config/bspwm/monitor.sh

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

    if  is_night; then
        light -S 15
    else
        light -S 30
    fi
}

layout_external_hdmi_only() {
    # bspc monitor HDMI-1 -d 4 5 6 7
    # TODO How to start at specific monitor?
    bspc monitor HDMI-1 -d 1 2 3 4 5 6 7

    if is_night; then
        xrandr --output HDMI-1 --brightness 0.60 --gamma 1.1:0.8:0.7
    else
        xrandr --output HDMI-1 --brightness 0.75 --gamma 0:0:0
    fi
}

layout_external_all() {
    # bspwm always assing to source monitor first
    bspc monitor eDP-1 -d 1
    bspc monitor HDMI-1 -d 2 3 4 5 6 7

    # TODO avoid duplication
    if  is_night; then
        light -S 15
    else
        light -S 30
    fi

    if is_night; then
        xrandr --output HDMI-1 --brightness 0.60 --gamma 1.1:0.8:0.7
    else
        xrandr --output HDMI-1 --brightness 0.75 --gamma 0:0:0
    fi
}

if [ -n "$DISPLAY_LAPTOP" ] && [ -n "$DISPLAY_HDMI" ]; then
    echo "::: All monitors are active"
    layout_external_all
elif [ -n "$DISPLAY_HDMI" ]; then
    echo "::: Only HDMI is active"
    layout_external_hdmi_only
    move_workspace_to_external_monitor
else
    echo "::: Only LAPTOP is active"
    layout_laptop_only
fi
