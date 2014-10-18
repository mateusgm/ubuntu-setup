curl -L https://get.rvm.io | bash -s stable --ruby
source ~/.rvm/scripts/rvm
gem install bundler
{ cd lists && bundle install; }
