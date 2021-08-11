
#!/bin/bash

sudo pacman -S xorg-xrandr xorg-server xorg-xinit ttf-jetbrains-mono ttf-font-awesome fish starship ttf-joypixels nvidia nvidia-settings pulseaudio pavucontrol

cd ~
# dotfiles
git clone https://github.com/notSharux/dotfiles

# Suckless Builds
git clone https://github.com/notSharux/st-xrdb
git clone https://github.com/notSharux/dmenu
git clone https://github.com/notSharux/dwm-xrdb

# AUR helper
git clone https://aur.archlinux.org/yay

# icons an theme
git clone https://github.com/vinceliuice/ChromeOS-theme
git clone https://github.com/vinceliuice/Tela-icon-theme

# Fixing time zone
cd dotfiles/random
./time.sh
cd

rm -rfv .config


cd dotfiles
cp .xinitrc ~
cp -r .config ~
cp .Xresources ~
cp .Xresources2 ~
cp -r dwmblocks ~
cd

# Dmenu scripts
cd dotfiles
mv dmscripts ~
cd

cd dmscripts/scripts
sudo chmod +x *
cd

# Suckless builds
cd .config/dwmblocks
sudo chmod +x *
chmod

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

# icons and themes
cd ChromeOS-theme
./install.sh
cd

cd Tela-icon-theme
./install.sh
cd

# AUR helper
cd yay
makepkg -si
cd
