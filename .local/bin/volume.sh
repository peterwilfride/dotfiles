#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

#path to your volume icons
DIR="~/.local/share/icons/Flat-Remix-Violet-Dark/actions/scalable/"

function get_volume {
    amixer -D pulse get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
    amixer -D pulse get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

function send_notification {
    volume=`get_volume`
    if [ "$volume" = "0" ]; then
        icon_name="$DIR/audio-volume-muted.svg"
        dunstify-i "$icon_name" -t 2000 -u low -h --replace=555 "$volume "
    else
	    if [  "$volume" -lt "10" ]; then
	        icon_name="$DIR/audio-volume-low.svg"
        else
            if [ "$volume" -lt "30" ]; then
                icon_name="$DIR/audio-volume-low.svg"
            else
                if [ "$volume" -lt "70" ]; then
                    icon_name="$DIR/audio-volume-medium.svg"
                else
                    icon_name="$DIR/audio-volume-high.svg"
                fi
            fi
        fi
    fi
    #bar=$(seq -s "─" $(($volume/8)) | sed 's/[0-9]//g')
    bar=$(seq -s "" $(($volume/4)) | sed 's/[0-9]//g')
    
    # Send the notification
    dunstify -i "$icon_name" -u low -t 2000 --replace=555 "$volume $bar"
}

case $1 in
    up) 
	    amixer -D pulse set Master on > /dev/null 
	    amixer -D pulse sset Master 5%+ > /dev/null
	    send_notification
	    ;;
    down)
	    amixer -D pulse set Master on > /dev/null
    	amixer -D pulse sset Master 5%- > /dev/null
	    send_notification
	    ;;
    toggle)
    	# Toggle mute
    	amixer -D pulse set Master 1+ toggle > /dev/null
	    if is_mute ; then
            dunstify -i "$DIR/audio-volume-muted.svg" --replace=555 -u low "Mute" -t 2000
    	else
	        send_notification
	    fi
	    ;;
esac
