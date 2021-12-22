#!/usr/bin/sh

# Active monitor example output: `eDP-1 HDMI-2`
ACTIVE_MONITORS=$(xrandr --listactivemonitors | grep -v Monitors | grep -Eo '[^ ]+$')
# Currently active HDMI monitor will always be in the last position of `$ACTIVE_MONITORS` output
# We need to loop over it.
# shellcheck disable=SC2086
ACTIVE_HDMI_MONITOR=$(echo $ACTIVE_MONITORS | awk '{print $NF}')

#
# brightness
#

is_night(){
    hour=$(date +%H)

    if [ "$hour" -gt 6 ] && [ "$hour" -le 16 ];then
        return 1
    else
        return 0
    fi
}

current_hdmi_brightness(){
    xrandr --verbose --current | grep ^"$ACTIVE_HDMI_MONITOR" -A5 | awk '/Brightness:/ {print $2}'
}

current_internal_brigthness(){
    light -G
}

#
# Default
#

set_hdmi_brightness_default(){
    if is_night; then
        xrandr --output "$ACTIVE_HDMI_MONITOR" --brightness 0.60 --gamma 1.1:0.8:0.7
    else
        xrandr --output "$ACTIVE_HDMI_MONITOR" --brightness 0.75 --gamma 0:0:0
    fi

    echo ": $(current_hdmi_brightness)"
}

set_builtin_brightness_default(){
    if is_night; then
        light -S 15
    else
        light -S 30
    fi

    current_brightness=$(current_internal_brigthness)
    echo ": ${current_brightness%.*}"
}

#
# Brighten
#

brighten_hdmi_monitor(){
    current_brightness=$(current_hdmi_brightness)
    increment=$(echo "$current_brightness + $1" | bc)
    xrandr --output "$ACTIVE_HDMI_MONITOR" --brightness "$increment"

    echo ": $(current_hdmi_brightness)"
}

brighten_internal_monitor(){
    current_brightness=$(current_internal_brightness)
    light -S $(("$current_brightness" + $1))

    current_brightness=$(current_internal_brightness)
    echo ": ${current_brightness%.*}"
}

#
# Dim
#

dim_hdmi_monitor(){
    current_brightness=$(current_hdmi_brightness)
    decrement=$(echo "$current_brightness - $1" | bc)
    xrandr --output "$ACTIVE_HDMI_MONITOR" --brightness "$decrement"

    echo ": $(current_hdmi_brightness)"
}

dim_internal_monitor(){
    current_brightness=$(current_internal_brightness)
    light -S $(("$current_brightness" - $1))

    current_brightness=$(current_internal_brightness)
    echo ": ${current_brightness%.*}"
}


#
# Main
#

brighten(){
    if [ -n "$ACTIVE_HDMI_MONITOR" ]; then
        brighten_hdmi_monitor 0.1
    else
       brighten_internal_monitor 5
    fi
}

dim(){
    if [ -n "$ACTIVE_HDMI_MONITOR" ]; then
        dim_hdmi_monitor 0.1
    else
       dim_internal_monitor 5
    fi
}

default(){
    if [ -n "$ACTIVE_HDMI_MONITOR" ]; then
        set_hdmi_brightness_default
    else
        set_builtin_brightness_default
    fi
}


#
# help
#

help () {
    cat << EOF

Usage: make [options]

Options:

    default      Set the default brightness
    dim          Dim the screen
    brighten     Brighten the screen

EOF

}


if [ -z "$1" ]; then
    help
    exit 1
fi

while [ -n "$1" ]; do
    case "$1" in
        default) default ;;
        dim) dim ;;
        brighten) brighten ;;
    esac
    break

done
