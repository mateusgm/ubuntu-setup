#!/usr/bin/env bash

# repositories

sudo apt-get --quiet update && sudo apt-get upgrade

sudo wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list && sudo apt-get --quiet update && sudo apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring',
  'sudo apt-add-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | tee -a /etc/apt/sources.list.d/google.list

sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E && echo "deb http://linux.dropbox.com/ubuntu/ precise main" | tee -a /etc/apt/sources.list.d/dropbox.list

wget -O - http://www.bchemnet.com/suldr/suldr.gpg | sudo apt-key add - && echo "deb http://www.bchemnet.com/suldr/ debian extra" | tee -a /etc/apt/sources.list.d/bchemnet.list

sudo apt-get --quiet update

# ppas

for ppa in $(<pkgs/ppas.lst); do
  sudo add-apt-repository -y $ppa
done 

sudo apt-get --quiet update

# packages

PKGS=$(sed 's/==.*==//g' pkgs/packages.lst)
sudo apt-get install -y $PKGS

# ruby

curl -L https://get.rvm.io | bash -s stable --ruby
source ~/.rvm/scripts/rvm
gem install bundler
{ cd pkgs && bundle install; }

# config

sudo usermod -G lp -a $USER
sudo -u postgres createuser --superuser $USER && sudo -u postgres psql postgres -tAc "ALTER user $USER with PASSWORD '$USER'"
passenger-install-apache2-module && sudo a2enmod passenger

VERSION=$(gem list passenger | sed 's/[^0-9.]*\([0-9.]*\).*/\1/')
echo "LoadModule passenger_module $GEM_HOME/gems/passenger-$VERSION/ext/apache2/mod_passenger.so" > tmp
echo "  PassengerRoot $GEM_HOME/gems/passenger-$VERSION" >> tmp
echo "  PassengerRuby $rvm_path/wrappers/$rvm_ruby_string/ruby" >> tmp
sudo mv tmp /etc/apache2/mods-available/passenger.load
sudo a2enmod passenger

echo "address=/`hostname`/127.0.0.1" | sudo tee -a /etc/dnsmasq.conf
echo "default-storage-engine = myisam" | sudo tee -a /etc/mysql/my.cnf

sudo service apache2 restart
sudo service dnsmasq restart
sudo service mysql restart

rm tmp

sudo rm /var/www

sudo ln -s ~/public/shared /var/www

