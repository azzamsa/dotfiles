#!/bin/sh

# capture the control numeber id `1`
capture_numid=$(amixer controls |  awk -F , '/Master Playback Switch/ {print $1}' | awk -F = '{print $2}')
# capture the status `on` or `off`
speaker_status=$(amixer cget numid="$capture_numid" | awk '/:/ {print $2}' |  awk -F = '{print $2}')

if [ "$speaker_status" = "on" ]; then
    echo ""
else
    echo ""
fi
