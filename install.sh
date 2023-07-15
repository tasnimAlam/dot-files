#!/bin/bash

# Install packages
sudo pacman -S --noconfirm --needed - <pacman.txt
yay -S --noconfirm - <yay.txt

# Npm packages
cat npm.txt | xargs -L1 npm i -g

# install fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# install awesome widgets
cd ~/.config/awesome
gh repo clone streetturtle/awesome-wm-widgets
cd ~/

# Add new config folder here
config_folders=("bspwm" "dunst" "fish" "kitty" "nvim" "picom" "polybar" "rofi" "sxhkd" "zathura" "starship.toml")
base_dir="${HOME}/.config/"

for folder in ${config_folders[@]}; do
	fd $folder -d1 $base_dir -x cp -r {} ./.config
done

# nnn plugins install
sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"

# Set zathura as default pdf reader
xdg-mime default org.pwmt.zathura.desktop application/pdf

fish
