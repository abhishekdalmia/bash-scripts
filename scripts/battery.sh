#!/bin/bash

eval "export $(egrep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u $LOGNAME gnome-session)/environ)";


percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | tr -s ' ' | cut -d' ' -f3 | cut -d'%' -f1)
#echo "$percentage"

state=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | tr -s ' ' | cut -d' ' -f3)
#echo "state: $state"

if [ $percentage -le 40 ] && [ $state = "discharging" ]
then
    /usr/bin/notify-send -t 0 "Charge your laptop."
elif [ $percentage -ge 90 ] && [ $state = "charging" ]
then
    /usr/bin/notify-send -t 0 "Unplug your laptop."
fi

