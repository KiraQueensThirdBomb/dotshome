#!/bin/bash
apps_pacman=("hyprland" "")
apps_aur=("matugen-bin")
echo start installing aur
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
echo aur setup finished
