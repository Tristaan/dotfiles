#!/bin/bash
if [ "$1" == "up" ]
then
    pulsemixer --change-volume +5
    TEXT="Volume: $(pulsemixer --get-volume | cut -d' ' -f 1 | sed 's/\(\[\|\]\)//g')"
elif [ "$1" == "down" ]
then
    pulsemixer --change-volume -5
    TEXT="Volume: $(pulsemixer --get-volume | cut -d' ' -f 1 | sed 's/\(\[\|\]\)//g')"
elif [ "$1" == "mute" ]
then
    pulsemixer --toggle-mute
    TEXT="Mute: $(pulsemixer --get-mute | cut -d' ' -f 1 | sed 's/\(\[\|\]\)//g')"
else
    echo "usage volume_set.sh {up|down|mute}"
fi

dunstify -r 33223 "Volume changed" "$TEXT"
