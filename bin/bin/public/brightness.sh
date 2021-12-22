#!/usr/bin/sh

# shellcheck disable=SC2086
ACTIVE_HDMI_MONITOR=$(xrandr --listactivemonitors | grep -v Monitors | awk '/HDMI/ {print $NF}')

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

current_internal_brightness(){
    light -G
}

print_current_hdmi_brightness(){
    echo ": $(current_hdmi_brightness)"
}

print_current_internal_brigthness(){
    current_brightness=$(current_internal_brightness)
    echo ": ${current_brightness%.*}"
}

#
# Default
#

set_hdmi_brightness(){
    if is_night; then
        xrandr --output "$ACTIVE_HDMI_MONITOR" --brightness "$1" --gamma 1.1:0.8:0.7
    else
        xrandr --output "$ACTIVE_HDMI_MONITOR" --brightness "$1" --gamma 0:0:0
    fi
}

set_builtin_brightness_default(){
    if is_night; then
        light -S 15
    else
        light -S 30
    fi
}

#
# Brighten
#

brighten_hdmi_monitor(){
    current_brightness=$(current_hdmi_brightness)
    target_brightness=$(echo "$current_brightness + $1" | bc)
    set_hdmi_brightness "$target_brightness"
}

brighten_internal_monitor(){
    current_brightness=$(current_internal_brightness)
    increment=$(echo "$current_brightness + $1" | bc)
    light -S "$increment"
}
#
# Dim
#

dim_hdmi_monitor(){
    current_brightness=$(current_hdmi_brightness)
    target_brightness=$(echo "$current_brightness - $1" | bc)
    set_hdmi_brightness "$target_brightness"

}

dim_internal_monitor(){
    current_brightness=$(current_internal_brightness)
    decrement=$(echo "$current_brightness - $1" | bc)
    light -S "$decrement"
}


#
# Main
#

brighten(){
    if [ -n "$ACTIVE_HDMI_MONITOR" ]; then
        brighten_hdmi_monitor 0.1
        print_current_hdmi_brightness
    else
        brighten_internal_monitor 5
        print_current_internal_brigthness
    fi
}

dim(){
    if [ -n "$ACTIVE_HDMI_MONITOR" ]; then
        dim_hdmi_monitor 0.1
        print_current_hdmi_brightness
    else
        dim_internal_monitor 5
        print_current_internal_brigthness
    fi
}

default(){
    if [ -n "$ACTIVE_HDMI_MONITOR" ]; then
        set_hdmi_brightness_default
        print_current_hdmi_brightness
    else
        set_builtin_brightness_default
        print_current_internal_brigthness
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
