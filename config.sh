#!/bin/bash
apps_pacman=("hyprland" "waybar" "kitty" "dolphin" "wofi" "rofi" "neovim")
apps_aur=("matugen-bin" "nerd-fonts")
echo start installing aur
sudo pacman -S --needed base-devel git #aur install
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
echo aur setup finished
cd ~
echo installing reqired stuff
sudo pacman -Syu #updating system to make shure everythings up to date
sudo pacman -S "${apps_pacman[@]}"
yay -S "${apps_aur[@]}"
git clone https://github.com/LGFae/swww.git #swww install
cargo build --release
git clone https://github.com/LazyVim/starter ~/.config/nvim #lazyvim install
rm -rf ~/.config/nvim/.git
echo reqirement instalantion should be finished
echo starting file configuration
rm -rf /.config/hypr/
cp -r ~/dotshome/hypr ~/.config/
rm -rf /.config/waybar/
cp -r ~/dotshome/waybar ~/.config/
rm -rf /.config/matugen/
cp -r ~/dotshome/matugen ~/.config/
cp -r ~/dotshome/Wallpapers ~/Pictures/
matugen image Pictures/Wallpapers/wall1.jpg
echo file configuration should be finished in case of something not working fix it yourself
