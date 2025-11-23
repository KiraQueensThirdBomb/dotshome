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
echo starting file configuration
sudo rm -r /.config/hypr/
sudo cp -r ~/dotshome/hypr ~/.config/
sudo rm -r /.config/waybar/
sudo cp -r ~/dotshome/waybar ~/.config/
sudo rm -r /.config/matugen/
sudo cp -r ~/dotshome/matugen ~/.config/
sudo cp -r ~/dotshome/Wallpapers ~/Pictures/
matugen image Pictures/Wallpapers/wall1.jpg
echo file configuration should be finished in case of something not working fix it yourself
