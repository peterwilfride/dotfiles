#!/bin/bash

echo "creating directories ..."

if [ ! -d $HOME/.config ]; then
  mkdir $HOME/.config
fi

if [ ! -d $HOME/.local ]; then
  mkdir -p $HOME/.local/share/
fi

if [ ! -d $HOME/docs ]; then
	mkdir $HOME/docs
fi

if [ ! -d $HOME/vid ]; then
	mkdir $HOME/vids
fi

if [ ! -d $HOME/pics ]; then
	mkdir -p $HOME/pics/wallpapers
fi

if [ ! -d $HOME/songs ]; then
	mkdir $HOME/songs
fi

echo "finished."
echo "coping files ..."

cp -f teste.jpg $HOME/pics/wallpapers

cp -f songs-test/* $HOME/songs/

cp -rf .local/bin/ $HOME/.local
cp -rf fonts $HOME/.local/share
fc-cache -f

cp -rf bspwm $HOME/.config
cp -rf dunst $HOME/.config
cp -rf eww $HOME/.config
cp -rf kitty $HOME/.config
cp -rf polybar $HOME/.config
cp -rf rofi $HOME/.config
cp -rf sxhkd $HOME/.config

#cp .xinit $HOME
cp $HOME/.bashrc $HOME/.bashrc.old
cp .bashrc $HOME
cp .bash_aliases $HOME
cp .vimrc $HOME

echo "finished."
echo "configuring mpd"

cp -rf mpd $HOME/.config

if [ ! -d $HOME/.mpd ]; then
  mkdir $HOME/.mpd
fi

touch $HOME/.mpd/database
touch $HOME/.mpd/log
touch $HOME/.mpd/pid
touch $HOME/.mpd/state

cp -rf ncmpcpp $HOME/.config

echo "finished."

echo "Sucessfully completed!"
