
BASE1=/media/mateus/52e510b0-7aab-4614-97bb-cfca71569189/mateus

BASE=/media/arquivos

DISK=$BASE/disk
DROPBOX=$BASE/Dropbox
STORAGE=$BASE/storage

DOTFILES=~/tools/dotfiles

# cleaning

# for dir in `ls ~/`; do
#   rm ~/$dir
# done


# desktop

# ln -sf ~/desktops/work ~/desktop


# folders 

# for dir in `ls $DISK | grep -v 'configs'`; do
#   ln -sf $DISK/$dir ~/$dir
# done

# for dir in `ls $DROPBOX`; do
#   ln -sf $DROPBOX/$dir ~/$dir
# done

# # configs

# for config in `ls $DISK/configs`; do
#   ln -sf $DISK/configs/$config ~/.$config
# done

for file in `find $DOTFILES/* -type f | grep -v .git^`; do
  dir=`basename $(dirname $file) | grep -v dotfiles`
  if [ -f $dir ]
  then
    ln -sf $file ~/.`basename $file`
  else  
    ln -sf $file ~/.$dir/`basename $file`
  fi
  echo $file
done

ln -sf $STORAGE ~/storage 


