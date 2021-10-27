#!/bin/bash

# Install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Add new config folder here
config_folders=("bspwm" "dunst" "fish" "kitty" "nvim" "picom" "polybar" "rofi" "sxhkd" "zathura" "starship.toml")
base_dir="${HOME}/.config/"

for folder in ${config_folders[@]}; do
  fd $folder -d1 $base_dir -x cp -r {} ./.config
done

# Remove compiled pakcer file
rm ./.config/nvim/packer/packer.nvim
