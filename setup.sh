#!/bin/sh

# This setup is for Centos Stream

sudo dnf install -y \
		xorg-x11-xinit \
		xorg-x11-server-Xorg \
		python3-nodeenv \
		podman \
		git \
		i3 \
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
# Update the configuration file so the settings would persist over reboot by editing /usr/share/X11/xorg.conf.d/40-libinput.conf
# Then add the following configuration on 'touchpad' device configuration
#       Option "Tapping" "on"
#
# 2. Brightness Hotkey
# If brightness hotkey does not work, install 'brightnessctl'
#       sudo dnf install brightnessctl
# After that update the i3 config by adding the following
#       bindsym XF86MonBrightnessUp exec brightnessctl s +10%
#       bindsym XF86MonBrightnessDown exec brightnessctl s 10%-
# If the screen is too bright, there is also another way to set the monitor output
#       xrandr --output <output-name> --brightness <number 0 - 1>
# The output name can be found by running
#       xrandr --listmonitors
# The 'xrandr' configuration change does not persist on reboot so putting it
# on i3 config could be a workaround
