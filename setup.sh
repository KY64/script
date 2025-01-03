#!/bin/sh

# This setup is for Centos Stream

sudo dnf install -y \
		xorg-x11-xinit \
		xorg-x11-server-Xorg \
		python3-nodeenv \
		podman \
		git \
		xfwm4 \
                thunar \
                network-manager-applet \
                xfce4-notifyd \
                xfce4-session \
                xfce4-appfinder \
                xfce4-panel \
                xfce4-power-manager \
                xfce4-settings \
                xfce4-pulseaudio-plugin \
		xfce4-terminal \
		htop

# Enable RPMFusion and EPEL
sudo dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E %rhel).noarch.rpm
sudo dnf install -y https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm

# Download latest Neovim

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo dnf remove neovim -y
sudo tar -C /opt -xzf nvim-linux64.tar.gz

echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo -y

sudo dnf remove -y \
		rxvt-unicode

curl -O https://downloads.vivaldi.com/stable/vivaldi-stable.x86_64.rpm
sudo dnf install ./vivaldi-stable.x86_64.rpm -y

# Setup Node.js

nodeenv ~/node

echo "alias n='source ~/node/bin/activate'" >> ~/.bashrc

# Execute window manager on 'startx' command

echo "exec startxfce4" >> $HOME/.xinitrc

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
# Update the configuration file so the settings would persist over reboot by editing /usr/share/X11/xorg.conf.d/40-libinput.conf
# Then add the following configuration on 'touchpad' device configuration
#       Option "Tapping" "on"
