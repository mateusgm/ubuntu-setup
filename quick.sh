#!/bin/bash

# repo
sudo add-apt-repository -y ppa:nilarimogard/webupd8
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-add-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee -a /etc/apt/sources.list.d/google.list

# packages
sudo apt-get upgrade -y
sudo apt-get install -y ubuntu-restricted-extras thunderbird libdvdread4 vlc vlc-plugin-pulse p7zip p7zip-full p7zip-rar google-chrome-stable oracle-java8-installer skype gnome-session-fallback preload
sudo /usr/share/doc/libdvdread4/install-css.sh
sudo apt-get autoremove unity-lens-music unity-lens-photos unity-lens-gwibber unity-lens-shopping unity-lens-video

# setup
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop
sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop
sudo /usr/lib/lightdm/lightdm-set-defaults -s gnome-fallback
gsettings set com.canonical.desktop.interface scrollbar-mode normal
echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf