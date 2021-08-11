#!/bin/bash

sudo pacman -S xorg xorg-server xorg-xinit base-devel ttf-jetbrains-mono

git clone https://github.com/notSharux/dotfiles
git clone https://github.com/notSharux/st-xrdb
git clone https://github.com/notSharux/dmenu-A
git clone https://github.com/notSharux/dwm-xrdb
git clone https://aur.archlinux.org/yay

rm -rfv .config

cd dotfiles
cp .xinitrc ~
cp -r .config ~
cp .Xresources ~
cd

cd st-xrdb
sudo make clean install
cd

#cd dmenu-A
#sudo make clean install
#cd

cd dwm-xrdb
sudo make clean install
cd

cd yay
makepkg -si
