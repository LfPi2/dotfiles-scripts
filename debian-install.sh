#!/bin/bash

if [ $(id -u) = "0" ]; then
	echo "You should not run the script as root"
	exit
fi

cd ~

sudo apt-get -y update
sudo apt-get -y install git gcc make man-db
sudo apt-get -y install xorg pulseaudio
sudo apt-get -y install libx11-dev libxft-dev libxinerama-dev dbus-x11
sudo apt-get -y install neofetch firefox-esr thunar neovim pavucontrol xdg-user-dirs curl feh htop mpv kitty acpi unzip

xdg-user-dirs-update

mkdir ~/repos
cd ~/repos

git clone https://github.com/LfPi2/dwm
git clone https://github.com/LfPi2/dmenu
git clone https://github.com/LfPi2/dwmblocks

cd dwm
make
sudo make clean install
cd ../dmenu
make
sudo make clean install
cd ../dwmblocks
make
sudo make clean install

cd ~

echo "setxkbmap pt &" >> .xinitrc
echo "feh --bg-scale /home/$USER/Pictures/wallpaper.png &" >> .xinitrc
echo "dwmblocks &" >> .xinitrc
echo "exec dbus-launch --exit-with-x11 dwm" >> .xinitrc

sudo shutdown -h now
