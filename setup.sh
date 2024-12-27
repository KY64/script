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

echo "exec i3" >> $HOME/.xinitrc
