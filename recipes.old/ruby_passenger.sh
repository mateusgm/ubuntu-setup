
source ~/.rvm/scripts/rvm

passenger-install-apache2-module

VERSION=$(gem list passenger | sed 's/[^0-9.]*\([0-9.]*\).*/\1/')
echo "LoadModule passenger_module $GEM_HOME/gems/passenger-$VERSION/libout/apache2/mod_passenger.so" > passenger_tmp
echo "  PassengerRoot $GEM_HOME/gems/passenger-$VERSION"                                         >> passenger_tmp
echo "  PassengerDefaultRuby $rvm_path/wrappers/$rvm_ruby_string/ruby"                           >> passenger_tmp
sudo mv passenger_tmp /etc/apache2/mods-available/passenger.load

sudo a2enmod passenger
sudo service apache2 restart
