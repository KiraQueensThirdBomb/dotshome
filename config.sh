#!/bin/bash
apps_pacman=("hyprland" "waybar" "kitty" "dolphin" "wofi" "rofi")
apps_aur=("matugen-bin" "nerd-fonts")
echo start installing aur
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
echo aur setup finished
cd ~
echo installing reqired stuff
sudo pacman -Syu
sudo pacman -S "${apps_pacman[@]}"
yay -S "${apps_aur}"
git clone https://github.com/LGFae/swww.git
cargo build --release
echo reqirement instalantion should be finished
sudo cp ~/dotshome
