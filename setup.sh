#!/bin/bash

echo "creating directories ..."

if [ ! -d $HOME/.config ]; then
  mkdir $HOME/.config
fi

if [ ! -d $HOME/.local ]; then
  mkdir -p $HOME/.local/
  mkdir -p $HOME/.local/share/
fi

mkdir $HOME/docs
mkdir $HOME/vids
mkdir $HOME/pics
mkdir $HOME/songs

echo "finished."
echo "coping files ..."

cp -r wallpapers $HOME/pics

cp -r .local/bin/ $HOME/.local
cp -r fonts $HOME/.local/share
fc-cache -f

cp -r bspwm $HOME/.config
cp -r dunst $HOME/.config
cp -r eww $HOME/.config
cp -r kitty $HOME/.config
cp -r polybar $HOME/.config
cp -r rofi $HOME/.config
cp -r sxhkd $HOME/.config

cp $HOME/.bashrc $HOME/.bashrc.old
cp .bashrc $HOME
cp .bash_aliases $HOME
cp .vimrc $HOME

echo "finished."
echo "configuring mpd"

cp -r mpd $HOME/.config

if [ ! -d $HOME/.mpd ]; then
  mkdir $HOME/.mpd
  touch $HOME/database
  touch $HOME/log
  touch $HOME/pid
  touch $HOME/state
fi

cp -r ncmpcpp $HOME/.config

echo "finished."

echo "Sucessfully completed!"
