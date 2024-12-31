#!/bin/sh

# This setup is for Centos Stream

sudo dnf install -y \
		xorg-x11-xinit \
		xorg-x11-server-Xorg \
		python3-nodeenv \
		podman \
		git \
		i3 \
		st \
		htop

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo dnf remove -y \
		rxvt-unicode

curl -O https://downloads.vivaldi.com/stable/vivaldi-stable.x86_64.rpm
sudo dnf install ./vivaldi-stable.x86_64.rpm -y

# Setup Node.js

nodeenv ~/node

echo "alias n='source ~/node/bin/activate'" >> ~/.bashrc

# Execute i3 on 'startx' command

echo "exec i3" >> $HOME/.xinitrc

# Next instruction:

# 1. Touchpad
# If touchpad is not working, try check whether libinput is already installed
# Check whether touchpad is detected by running the following command
# 	xinput list
# Check whether 'Tap to click' is already enabled by running
#	xinput list-props <device-id>
# The device ID can be known when running 'xinput list' there will be something like 'id=13' 
# on the right columns
#
# Find "Tapping Enabled" and the most right value should be 1, if not then we can set the value like following
# 	sudo xinput set-prop <device-id> <props-id> 1
# The props ID is a number inside a bracket, for example "libinput Tapping Enabled (319)" has props ID 319
#
