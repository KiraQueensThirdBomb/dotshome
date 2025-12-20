#!/bin/bash
apps_pacman=("hyprland" "waybar" "kitty" "dolphin" "wofi" "rofi" "neovim" "yazi" "cava" "hyprlock")
apps_aur=("matugen-bin" "nerd-fonts" "cbonsai-git" "swww")
echo start installing aur
sudo pacman -S --needed base-devel git #aur install
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
echo aur setup finished
cd ~
echo installing reqired stuff
sudo pacman -S "${apps_pacman[@]}"
yay -S "${apps_aur[@]}"
sudo pacman -S ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick #yazi dependencies
git clone https://github.com/LazyVim/starter ~/.config/nvim #lazyvim install
rm -rf ~/.config/nvim/.git
git clone https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/DepartureMono.zip #fonts install
git clone https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/ProFont.zip
unzip ~/Downloads/DepartureMono.zip
unzip ~/Downloads/ProFont.zip
sudo cp -r ~/Downloads/DepartureMono/ /usr/share/fonts/
sudo cp -r ~/Downloads/ProFont/ /usr/share/fonts/
echo reqirement instalantion should be finished
echo starting file configuration #cp files to /.config
rm -rf ~/.config/hypr/
cp -r ~/dotshome/hypr ~/.config/
rm -rf ~/.config/waybar/
cp -r ~/dotshome/waybar ~/.config/
rm -rf ~/.config/matugen/
cp -r ~/dotshome/matugen ~/.config/
rm -rf ~/.config/kitty/
cp -r ~/dotshome/kitty ~/.config/
rm -rf ~/.config/rofi/
cp -r ~/dotshome/rofi ~/.config/
rm -rf ~/.config/yazi/
cp -r ~/dotshome/yazi/ ~/.config/
sudo cp -r ~/dotshome/darkblud/ /usr/share/themes/ #cp the gtk theme to the themes directory
gsettings set org.gnome.desktop.interface gtk-theme "darkblud" #apply the "darkblud gtk theme"
cp -r ~/dotshome/Wallpapers ~/Pictures/
matugen image Pictures/Wallpapers/wall1.jpg #set wallpaper and generate colors
chmod +x ~/.config/rofi/launchers/type2/launcher.sh
chmod +x ~/.config/rofi/powermenu/type2/powermenu.sh
chmod +x ~/.config/waybar/scripts/reload.sh
echo file configuration should be finished in case of something not working fix it yourself
echo thinker, play around, and try to fix the problem by experimenting, that's the best way to do it
