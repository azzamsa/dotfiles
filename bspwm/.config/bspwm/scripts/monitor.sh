#!/usr/bin/sh

active_monitors=$(xrandr | awk '/ connected/ && /[[:digit:]]x[[:digit:]].*+/{print $1}')
echo "::: active monitors: $active_monitors"

# This will only gets you ONE active HDMI monitor
# I use this becase I have two laptop connected to one monitor
# So they have HDMI-1 and HDMI-2 connection name respectively
# Please change the code below if you have different requirements
active_hdmi_monitor=$(echo "$active_monitors" |  awk '/HDMI-[[:digit:]]/ {print $1}' )
echo "::: active HDMI monitors: $active_hdmi_monitor"

builtin_monitor=eDP-1
workspace_count=1 # How many desktops to move to the second monitor

#
# brightness
#

is_daytime(){
    hour=$(date +%H)
    echo "::: Current hour: $hour"

    if [ "$hour" -gt 6 ] && [ "$hour" -le 17 ];then
        echo "::: It is a day time"
        return 0
    else
        echo "::: It is a night time"
        return 1
    fi
}

set_hdmi_brightness(){
    if is_daytime; then
        xrandr --output "$active_hdmi_monitor" --brightness 0.75 --gamma 0:0:0
    else
        xrandr --output "$active_hdmi_monitor" --brightness 0.60 --gamma 1.1:0.8:0.7
    fi
}

set_builtin_brightness(){
    if is_daytime; then
        light -S 30
    else
        light -S 15
    fi
}


#
# workspaces
#

get_desktops(){
    desktops=$(bspc query --desktops --monitor "$1")
    echo "$desktops"
}

# Need to move all the workspace to second montior
# Otherwise, I can't invoke `super-4` to get to workspsace 1.
# Credit  @ericmurphyxyz/archrice
move_workspace_to_external_monitor() {
    desktops_in_builtin_monitor=$(get_desktops "$builtin_monitor" | sed "$workspace_count"q)

    for desktop in $desktops_in_builtin_monitor; do
        bspc desktop "$desktop" --to-monitor "$active_hdmi_monitor"
    done

    # Remove "Desktop" created by bspwm
    bspc desktop Desktop --remove
}

move_workspace_to_internal_monitor() {
    # Temp desktop because one desktop required per monitor
    bspc monitor "$builtin_monitor" --add-desktops Desktop

	# Move everything to external monitor to reorder desktops
	for desktop in $(get_desktops "$builtin_monitor")
	do
		bspc desktop "$desktop" --to-monitor "active_hdmi_monitor"
	done

	# Now move everything back to internal monitor
	bspc monitor "active_hdmi_monitor" --add-desktops Desktop # Temp desktop

	for desktop in $(get_desktops "active_hdmi_monitor")
	do
		bspc desktop "$desktop" --to-monitor "$builtin_monitor"
	done

	bspc desktop Desktop --remove # Remove temp desktops
}


#
# monitors
#

unset DISPLAY_LAPTOP DISPLAY_HDMI || true

for monitor in $active_monitors
do
    if [ "$monitor" = "eDP-1" ]; then
        DISPLAY_LAPTOP=yes
    elif [ "$monitor" = "HDMI-1" ]; then
        DISPLAY_HDMI=yes
    elif [ "$monitor" = "HDMI-2" ]; then
        # HDMI-2 is when both my laptop connected
        # to one external monitor
        DISPLAY_HDMI=yes
    fi
done

layout_laptop_only() {
    bspc monitor -d 4 5 6 7
    set_builtin_brightness
}

layout_external_hdmi_only() {
    bspc monitor "$active_hdmi_monitor" -d 1 2 3 4 5 6 7
    set_hdmi_brightness
}

layout_external_all() {
    bspc monitor "$builtin_monitor" -d 1
    bspc monitor "$active_hdmi_monitor" -d 2 3 4 5 6 7

    set_builtin_brightness
    set_hdmi_brightness
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


echo "Bars launched..."
