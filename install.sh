#!/bin/bash

# Install packages
sudo pacman -S --noconfirm --needed - <pacman.txt
yay -S --noconfirm - <yay.txt

