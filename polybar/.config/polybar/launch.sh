#!/usr/bin/sh

# Terminate already running bar instances
pkill polybar

# Wait until the processes have been shut down
# while pgrep -u "$(UID)" -x polybar >/dev/null; do sleep 1; done

# https://wiki.archlinux.org/title/xrandr
active_monitors=$(xrandr | awk '/ connected/ && /[[:digit:]]x[[:digit:]].*+/{print $1}')

if type "xrandr"; then
    for monitor in $active_monitors; do
        echo "::: setup monitor: $monitor"
        MONITOR="$monitor" polybar --reload bar1 &
    done
else
    polybar --reload bar1 &
fi

echo "Bars launched..."