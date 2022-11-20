#!/bin/bash

if [ $(id -u) = "0" ]; then
	echo "You should not run the script as root"
	exit
fi

cp copy.sh ~
cp -r .config ~
