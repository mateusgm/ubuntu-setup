#!/usr/bin/env bash

#FORCE=""
FORCE="--force-yes"

sudo apt-get install python-gpgme
mkdir tmp -f

# ppas

if [ ! -f  tmp/ppas ]
then
  echo "============== PPAS ==============="
  for ppa in $(<lists/ppas.lst); do
    sudo add-apt-repository -y $ppa
  done
  touch tmp/ppas
fi

# repos

if [ ! -f  tmp/repos ]
then
  echo "============== REPOS ==============="
  for repo in `ls repos`; do
    echo "=== $repo"
    source repos/$repo
  done 
  touch tmp/repos
fi

# packages

if [ ! -f  tmp/update ]
then
  echo "============== UPDATE ==============="
  sudo apt-get --quiet update
  touch tmp/update
fi

# if [ ! -f  tmp/packages ] && [ -f tmp/repos ] && [ -f tmp/ppas ]
# then
#   echo "============== PKGS ==============="
#   PKGS=$(sed 's/==.*==//g' lists/packages.lst)
#   sudo apt-get install -y $PKGS $FORCE && \
#     sudo apt-get upgrade -y && \
#     touch tmp/packages
# fi

# # recipes

# if [ ! -f tmp/recipes ] && [ -f tmp/packages ]
# then
#   echo "============== RECIPES ==============="
#   for recipe in `ls recipes`; do
#     echo "=== $recipe"
#     source recipes/$recipe
#   done 
#   touch tmp/recipes
# fi

