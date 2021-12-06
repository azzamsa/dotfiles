#!/usr/bin/bash
# credits:  criswell/meh

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
else
    echo "::: Only LAPTOP is active"
    layout_laptop_only
fi
