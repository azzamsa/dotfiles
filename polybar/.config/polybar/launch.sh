#!/usr/bin/sh

# Terminate already running bar instances
pkill polybar

# Wait until the processes have been shut down
# while pgrep -u "$(UID)" -x polybar >/dev/null; do sleep 1; done

# https://wiki.archlinux.org/title/xrandr
ACTIVE_MONITORS=$(xrandr | awk '/ connected/ && /[[:digit:]]x[[:digit:]].*+/{print $1}')

WLAN_INTERFACE=$(ip -o link show | awk '/wl/ {print substr($2, 0, length($2)-1)}')

if type "xrandr"; then
    for monitor in $ACTIVE_MONITORS; do
        echo "::: setup monitor: $monitor"
        MONITOR="$monitor" WLAN_INTERFACE="$WLAN_INTERFACE" polybar --reload bar1 &
    done
else
    polybar --reload bar1 &
fi

echo "::: bars launched"

