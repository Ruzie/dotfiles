###################################################
#### A script to install my dots to Void Linux ####
###################################################

#!/bin/bash

# Check if script was run as superuser
if [ ${UID} !=  0 ]; then
	echo "This script must be run as superuser."
	exit 1
fi

# Synchronize repo and update xbps
sudo xbps-install -Sy && sudo xbps-install -uy xbps

# Update system
sudo xbps-install -Syu

# Install necessary tools
sudo xbps-install -y alsa-utils xtools

# Install some XFCE4 goodies
sudo xbps-install xfce4-whiskermenu-plugin xfce4-pulseaudio-plugin xfce4-screenshooter xfce4-screensaver xfce4-clipman-plugin xfce4-mailwatch-plugin xfce4-netload-plugin

# Install mugshot
sudo xbps-install -y mugshot

# Install goodvibes (lightweight online radio player)
sudo xbps-install -y goodvibes

# Install noto fonts
sudo xbps-install -y noto-fonts-cjk noto-fonts-emoji noto-fonts-ttf noto-fonts-ttf-extra noto-fonts-emoji

# Install other tools (development, image, etc.)
sudo xbps-install -y git zsh net-tools gcc curl wget xz gimp mpv

# Clone icon theme repo and install them
git clone https://github.com/vinceliuice/Tela-icon-theme.git
cd ./Tela-icon-theme && chmod +x install.sh
./install.sh && ./install.sh ubuntu
rm -rf ./Tela-icon-*
tar xf themes/fluent-round-dark.tar.xz
mv themes/fluent-round-dark.tar.xz /usr/share/themes

### Note: If theme or icon don't change according commands, try to change them manually after logout.
xfconf-query -c xsettings -p /Net/ThemeName -s "Fluent-round-dark"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Tela-ubuntu-dark"

# Decompress oh-my-zsh
tar xf oh-my-zsh.tar.xz

echo "done! now rename 'oh-my-zsh' with '.oh-my-zsh' and 'config' with '.config'"
