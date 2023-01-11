#!/bin/sh

if [ $(id -u) = "0" ]; then
	echo "You should not run the script as root"
	exit
fi

cp .xinitrc ~
cp .bashrc ~
cp .gitconfig ~
cp -r .config ~
