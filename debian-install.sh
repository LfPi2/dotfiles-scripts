#!/bin/bash

if [ $(id -u) = "0" ]; then
	echo "You should not run the script as root"
	exit
fi

repoPath="$(pwd)"

cd ~

sudo apt-get -y update
sudo apt-get -y install git gcc make man-db unzip curl wget
sudo apt-get -y install xorg pulseaudio
sudo apt-get -y install libx11-dev libxft-dev libxinerama-dev dbus-x11
sudo apt-get -y install xdg-user-dirs feh acpi picom htop
sudo apt-get -y install neovim kitty node npm flatpak
sudo apt-get -y install firefox-esr thunar pavucontrol mpv
sudo apt-get -y install neofetch cowsay cmatrix cbonsai lolcat cava

xdg-user-dirs-update

mkdir ~/repos
cd ~/repos

git clone https://github.com/LfPi2/dwm
git clone https://github.com/LfPi2/dmenu
git clone https://github.com/LfPi2/dwmblocks
git clone https://github.com/EliverLara/Nordic

cd dwm
make
sudo make clean install
cd ../dmenu
make
sudo make clean install
cd ../dwmblocks
make
sudo make clean install
cd ..
sudo cp -r Nordic /usr/share/themes

cd ~

echo "setxkbmap pt &" >> .xinitrc
echo "picom &" >> .xinitrc
echo "feh --bg-scale /home/$USER/Pictures/wallpaper.png &" >> .xinitrc
echo "dwmblocks &" >> .xinitrc
echo "exec dbus-launch --exit-with-x11 dwm" >> .xinitrc

sudo remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

cd Downloads

curl -sS https://starship.rs/install.sh | sudo sh -y
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Monoid.zip
sudo unzip Monoid.zip -d /usr/share/fonts
wget -O wallpaper.png https://initiate.alphacoders.com/images/107/cropped-1920-1080-1072283.png?9377
cp wallpaper.png ../Picutres

cd $repoPath

./copy.sh
