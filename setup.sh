#!/bin/sh

# This setup is for Centos Stream

sudo dnf install -y \
		xorg-x11-xinit \
		xorg-x11-server-Xorg \
		python3-nodeenv \
		podman \
		neovim \
		git \
		i3 \
		st \
		htop

sudo dnf remove -y \
		rxvt-unicode

curl -O https://downloads.vivaldi.com/stable/vivaldi-stable.x86_64.rpm
sudo dnf install ./vivaldi-stable.x86_64.rpm -y

# Setup Node.js

nodeenv ~/node

echo "alias n='source ~/node/bin/activate'" >> ~/.bashrc

# Execute i3 on 'startx' command

echo "exec i3" >> $HOME/.xinitrc
