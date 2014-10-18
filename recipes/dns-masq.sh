
echo "address=/localhost/`hostname`/127.0.0.1" | sudo tee -a /etc/dnsmasq.conf
sudo service dnsmasq restart