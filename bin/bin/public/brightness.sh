#!/usr/bin/sh

ACTIVE_MONITORS=$(xrandr | awk '/ connected/ && /[[:digit:]]x[[:digit:]].*+/{print $1}')
ACTIVE_HDMI_MONITOR=$(echo "$ACTIVE_MONITORS" |  awk '/HDMI-[[:digit:]]/ {print $1}' )

#
# brightness
#

is_night(){
    hour=$(date +%H)

    if [ "$hour" -gt 6 ] && [ "$hour" -le 17 ];then
        echo "::: It is a day time"
        return 1
    else
        echo "::: It is a night time"
        return 0
    fi
}

set_hdmi_brightness(){
    if is_night; then
        xrandr --output "$ACTIVE_HDMI_MONITOR" --brightness 0.60 --gamma 1.1:0.8:0.7
    else
        xrandr --output "$ACTIVE_HDMI_MONITOR" --brightness 0.75 --gamma 0:0:0
    fi
}

set_builtin_brightness(){
    if is_night; then
        light -S 15
    else
        light -S 30
    fi
}


set_builtin_brightness
set_hdmi_brightness

