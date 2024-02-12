#!/bin/bash

sudo pacman -S hyprland xdg-desktop-portal-hyprland-git waybar mako wofi pipewire wireplumber grim slurp pipewire-audio pipewire-pulse wl-clipboard

yay -S keyd

cargo install hyprsome

config_folders=("hypr" "waybar" "keyd" "mako")
base_dir="${HOME}/.config/"

for folder in "${config_folders[@]}"; do
	find "$base_dir$folder" -maxdepth 1 -mindepth 1 -exec cp -r {} "$base_dir" \;
done

sysemctl --user enable pipewire wireplumber
sysemctl --user start pipewire wireplumber
