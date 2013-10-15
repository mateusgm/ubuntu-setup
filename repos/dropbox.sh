sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
echo "deb http://linux.dropbox.com/ubuntu/ $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/dropbox.list
