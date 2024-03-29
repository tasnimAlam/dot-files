#!/bin/bash

# Add new config folder here 
config_folders=("bspwm" "dunst" "fish" "kitty" "nvim" "picom" "polybar" "rofi" "sxhkd" "zathura" "starship.toml" )
base_dir="${HOME}/.config/"

# Copy files from config directory
for folder in ${config_folders[@]};do
  if [ -d $base_dir$folder ]
  then
    cp -r $base_dir$folder ./.config/
  fi
done;
