#!/bin/bash

FILE="$HOME/.cache/eww_launch.xyz"
EWW="$HOME/.local/bin/eww"

# run eww daemon if is not running
if [[ ! `pidof eww` ]]; then
    ${EWW} daemon
    sleep 1
fi

run_eww() {
    ${EWW} open-many profile weather music poweroff reboot sleep logout calendar date
}

if [[ ! -f "$FILE" ]]; then
    touch "$FILE"
    run_eww
else
    ${EWW} close-all
    rm "$FILE"
fi




