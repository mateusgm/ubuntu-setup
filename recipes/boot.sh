sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop
sudo update-rc.d -f postgresql remove
sudo update-rc.d -f virtualbox remove
sudo update-rc.d -f bluetooth remove
sudo update-rc.d -f mongodb remove
sudo update-rc.d -f plexmediaserver remove
sudo /usr/lib/lightdm/lightdm-set-defaults -s ubuntu-2d

