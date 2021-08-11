#!/bin/bash

sudo pacman -S xorg xorg-server xorg-xinit ttf-jetbrains-mono

cd ~
git clone https://github.com/notSharux/dotfiles
git clone https://github.com/notSharux/st-xrdb
git clone https://github.com/notSharux/dmenu
git clone https://github.com/notSharux/dwm-xrdb
git clone https://aur.archlinux.org/yay

cd dotfiles/random
./time.sh
cd

rm -rfv .config

cd dotfiles
cp .xinitrc ~
cp -r .config ~
cp .Xresources ~
cp -r dwmblocks ~
cd

cd st-xrdb
sudo make clean install
cd

cd dmenu
sudo make clean install
cd

cd dwm-xrdb
sudo make clean install
cd

cd dwmblocks
sudo make clean install
cd

cd yay
makepkg -si
