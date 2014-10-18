sudo -u postgres createuser --superuser $USER
sudo -u postgres psql postgres -tAc "ALTER user $USER with PASSWORD '$USER'"
