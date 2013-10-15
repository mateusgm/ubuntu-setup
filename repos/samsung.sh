wget -O - http://www.bchemnet.com/suldr/suldr.gpg | sudo apt-key add -
echo "deb http://www.bchemnet.com/suldr/ debian extra" | sudo tee -a /etc/apt/sources.list.d/bchemnet.list