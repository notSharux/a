

#!/bin/bash

# Xorg
sudo pacman -S xorg-xrandr xorg-server xorg-xinit libxft libxinerama

# Font
sudo pacman -S ttf-jetbrains-mono ttf-font-awesome ttf-joypixels gnu-free-fonts noto-fonts ttf-hack

# Drivers
sudo pacman -S nvidia nvidia-settings

# Audio
sudo pacman -S pulseaudio pavucontrol

# Other
sudo pacman -S zsh-syntax-highlighting zsh-autosuggestions zsh zsh-completions starship xplr neovim base-devel alacritty  fuse ntfs-3g

cd ~
# dotfiles
git clone https://github.com/notSharux/dotfiles

# Suckless Builds
git clone https://github.com/notSharux/st-xrdb
git clone https://github.com/notSharux/dmenu-xrdb
git clone https://github.com/notSharux/dwm-xrdb

# AUR helper
git clone https://aur.archlinux.org/yay

# icons an theme
git clone https://github.com/vinceliuice/ChromeOS-theme
git clone https://github.com/vinceliuice/Tela-icon-theme

# Fixing time zone
cd dotfiles/random
sudo chmod +x time.sh
./time.sh
cd

rm -rfv .config

cd dotfiles
cp .xinitrc ~
cp -r .config ~
cp .Xresources ~
cp .Xresources2 ~
cp .zshrc ~
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
cd

cd st-xrdb
sudo make clean install
cd

cd dmenu-xrdb
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
