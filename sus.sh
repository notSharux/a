

#!/bin/bash

# Update
sudo pacman -Syyu --noconfirm

# Xorg
sudo pacman -S --noconfirm xorg-xrandr xorg-server xorg-xinit libxft libxinerama imlib2

# Font
sudo pacman -S --noconfirm ttf-jetbrains-mono # ttf-joypixels gnu-free-fonts noto-fonts ttf-hack

# Drivers
sudo pacman -S --noconfirm nvidia nvidia-settings

# Audio
sudo pacman -S --noconfirm pulseaudio pavucontrol

# zsh
#sudo pacman -S --noconfirm zsh-syntax-highlighting zsh-autosuggestions zsh zsh-completions

# Other
sudo pacman -S --noconfirm fish starship neovim base-devel alacritty  fuse ntfs-3g firefox nitrogen fzf ripgrep the_silver_searcher fd gvfs lxsession lxappearance nodejs rofi exfat-utils

# Virt-manager
sudo pacman -S virt-manager qemu qemu-arch-extra ovmf vde2 dnsmasq bridge-utils openbsd-netcat
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
git clone https://gitlab.com/eflinux/kvmarch/
cd kvmarch
mv br10.xml ~
cd
sudo virsh net-define br10.xml
sudo virsh net-start br10
sudo virsh net-autostart br10

cd ~
# dotfiles
git clone https://github.com/notSharux/dotfiles
git clone https://github.com/notSharux/font

# Suckless Builds
mkdir Suckless-Builds
cd Suckless-Builds
git clone https://github.com/notSharux/st-xrdb
git clone https://github.com/notSharux/dmenu-xrdb
git clone https://github.com/notSharux/dwm-xrdb
git clone https://github.com/notSharux/dwm
git clone https://github.com/notSharux/slstatus
git clone https://github.com/dylanaraps/pfetch
git clone https://github.com/muennich/sxiv
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
cp .zshenv ~
cp -r dwmblocks ~/Suckless-Builds/
cd .config/
sudo chmod +x *
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

cd Suckless-Builds/pfetch
sudo make install
cd

cd Suckless-Builds/st-xrdb
sudo make clean install
cd

cd Suckless-Builds/sxiv
sudo make clean install
cd

cd Suckless-Builds/dmenu-xrdb
sudo make clean install
cd

cd Suckless-Builds/dwm-xrdb
sudo make clean install
cd

cd Suckless-Builds/dwm
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

# Fonts
cd ~/.local/share/fonts
git clone https://github.com/ryanoasis/nerd-fonts
#cd nerd-fonts
#sudo chmod +x install.sh
cd

git clone https://github.com/powerline/fonts
cd fonts
sudo chmod +x install.sh
cd

#sudo mkdir /usr/share/fonts/custom
#cd font
#mv * /usr/share/fonts/custom/
#cd
#sudo fc-cache -f -fv

rm -rfv a ChromeOS-theme dotfiles yay Tela-icon-theme picom #font kvmarch # nerd-fonts fonts

