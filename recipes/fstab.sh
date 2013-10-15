#!/bin/bash

mkdir /media/arquivos
echo "UUID=52e510b0-7aab-4614-97bb-cfca71569189 /media/arquivos ext4    defaults        0       2" | sudo tee -a /etc/fstab 
