
BASE1=/media/mateus/52e510b0-7aab-4614-97bb-cfca71569189/mateus
BASE=/media/arquivos/mateus

# cleaning

for dir in `ls ~/`; do
  rm -rf ~/$dir
done


# desktop

ln -sf ~/desktops/work ~/desktop


# folders

for dir in `ls $BASE | grep -v 'configs'`; do
  ln -sf $BASE/$dir ~/$dir
done


# configs

for config in `ls $BASE/configs/home`; do
  ln -sf $BASE/configs/home/$config ~/.$config
done
  
for config in `ls $BASE/configs/config`; do
  ln -sf $BASE/configs/config/$config ~/.config/$config
done  




