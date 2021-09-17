#!/bin/bash

#status="$(mpc status)"
status="$(mpc status | awk '(NR == 2) {print $1}')"
isRepeat="$(mpc status | awk '(NR == 3) {print $5, $6}')"
cover="/tmp/mpd_cover.jpg"
music_dir="$HOME/Musics"

get_status() {
	if [[ $status == "[playing]" ]]; then
		echo ""
	elif [[ $status == "[paused]" ]]; then
		echo ""
	fi
}

randomize() {
	if [[ $isRepeat == "random: off" ]]; then
		mpc random on
	elif [[ $isRepeat == "random: on" ]]; then
		mpc random off
	fi
}

get_isRepeat() {
	if [[ $isRepeat == "random: off" ]]; then
		echo "劣"
	elif [[ $isRepeat == "random: on" ]]; then
		echo "咽"
	fi
}

get_song() {
	song=`mpc -f %title% current`
	if [[ -z "$song" ]]; then
		echo "offline"
	else
		echo "$song"
	fi
}

get_artist() {
	artist=`mpc -f %artist% current`
	if [[ -z "$artist" ]]; then
		echo "offline"
	else
		echo "$artist"
	fi
}

get_album() {
	album=`mpc -f %album% current`
	if [[ -z "$album" ]]; then
		echo "offline"
	else
		echo "$album"
	fi
}

get_time() {
	time=`mpc status | grep "%)" | awk '{print $4}' | tr -d '(%)'`
	if [[ -z "$time" ]]; then
		echo 0
	else
		echo "$time"
	fi
}

get_ctime() {
	ctime=`mpc status | grep "#" | awk '{print $3}' | sed 's|/.*||g'`
	if [[ -z "$ctime" ]]; then
		echo "0:00"
	else
		echo "$ctime"
	fi
}

get_ttime() {
	ttime=`mpc -f %time% current`
	if [[ -z "$ttime" ]]; then
		echo "0:00"
	else
		echo "$ttime"
	fi
}

get_cover() {
	ffmpeg -i "${music_dir}/$(mpc current -f %file%)" "${cover}" -y &> /dev/null
	status=$?

	# Check if the file has a embbeded album art
	if [ "$status" -eq 0 ];then
		echo "$cover"
	else
		echo "~/.config/ncmpcpp/ncmpcpp-ueberzug/img/fallback.png"
	fi
}

if [[ "$1" == "-song" ]]; then
	get_song
elif [[ "$1" == "-artist" ]]; then
	get_artist
elif [[ "$1" == "-album" ]]; then
	get_album
elif [[ "$1" == "-status" ]]; then
	get_status
elif [[ "$1" == "-repeat" ]]; then
	get_isRepeat
elif [[ "$1" == "-time" ]]; then
	get_time
elif [[ "$1" == "-ctime" ]]; then
	get_ctime
elif [[ "$1" == "-ttime" ]]; then
	get_ttime
elif [[ "$1" == "-cover" ]]; then
	get_cover
elif [[ "$1" == "-toggle" ]]; then
	mpc -q toggle
elif [[ "$1" == "-next" ]]; then
	{ mpc -q next; get_cover; }
elif [[ "$1" == "-prev" ]]; then
	{ mpc -q prev; get_cover; }
elif [[ "$1" == "-random" ]]; then
	randomize
fi