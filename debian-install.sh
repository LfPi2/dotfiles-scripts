#!/bin/bash

if [ $(id -u) = "0" ]; then
	echo "You should not run the script as root"
	exit
fi

cd ~

sudo apt-get update
sudo apt-get install git gcc make man-db
sudo apt-get install xorg pulseaudio
sudo apt-get install libx11-dev libxft-dev libxinerama-dev dbus-x11
sudo apt-get install neofetch firefox-esr thunar neovim pavucontrol xdg-user-dirs curl

xdg-user-dirs-update

mkdir ~/repos
cd ~/repos

git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/dmenu

cd dwm
make
sudo make clean install
cd ../dmenu
make
sudo make clean install

cd ~

echo "setxkbmap pt" >> .xinitrc
echo "feh --bg-scale /home/$USER/Pictures/wallpaper.png" >> .xinitrc
echo "exec dbus-launch --exit-with-x11 dwm" >> .xinitrc

echo "startx" >> .bash_profile

sudo shutdown -h now
