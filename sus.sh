

#!/bin/bash

# Update
yes | sudo pacman -Syyu

# Xorg
sudo pacman -S xorg-xrandr xorg-server xorg-xinit libxft libxinerama

# Font
sudo pacman -S ttf-jetbrains-mono ttf-font-awesome ttf-joypixels gnu-free-fonts noto-fonts ttf-hack powerline-fonts

# Drivers
sudo pacman -S nvidia nvidia-settings

# Audio
sudo pacman -S pulseaudio pavucontrol

# Other
sudo pacman -S zsh-syntax-highlighting zsh-autosuggestions zsh zsh-completions starship xplr neovim base-devel alacritty  fuse ntfs-3g firefox nodejs
nitrogen fzf ripgrep the_silver_searcher fd

cd ~
# dotfiles
git clone https://github.com/notSharux/dotfiles

# Suckless Builds
mkdir Suckless-Builds
cd Suckless-Builds
git clone https://github.com/notSharux/st-xrdb
git clone https://github.com/notSharux/dmenu-xrdb
git clone https://github.com/notSharux/dwm-xrdb
git clone https://github.com/notSharux/slstatus
cd

# AUR helper
git clone https://aur.archlinux.org/yay

# icons an theme
git clone https://github.com/vinceliuice/ChromeOS-theme
git clone https://github.com/vinceliuice/Tela-icon-theme



rm -rfv .config

cd dotfiles
cp .xinitrc ~
cp -r .config ~
cp -r .x ~
cp -r wallpapers ~
cp .bashrc ~
cp .Xresources ~
cp .zshrc ~
cp -r dwmblocks ~/Suckless-Builds/
cd

# Dmenu scripts
cd dotfiles
mv dmscripts ~
cd

cd dmscripts/scripts
sudo chmod +x *
cd

# Suckless builds
cd Suckless-Builds/.config/dwmblocks
sudo chmod +x *
cd

cd Suckless-Builds/st-xrdb
sudo make clean install
cd

cd Suckless-Builds/dmenu-xrdb
sudo make clean install
cd

cd Suckless-Builds/dwm-xrdb
sudo make clean install
cd

cd Suckless-Builds/dwmblocks
sudo make clean install
cd

cd Suckless-Builds/slstatus
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

# picom
git clone https://github.com/jonaburg/picom
cd picom
makepkg -si
cd

# Fixing time zone
cd dotfiles/random
sudo chmod +x time.sh
./time.sh
cd

rm -rfv a ChromeOS-theme dotfiles yay Tela-icon-theme picom

