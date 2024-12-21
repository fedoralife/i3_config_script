#!/bin/bash

echo "Welcome to the application installer"
echo "Do you wish to continue"

read -p -r "Enter 1 to contine any key else to exit " num

if [ $num == 1 ]; then
    sudo pacman -Syu
    sudo pacman -S fzf git picom rofi polybar tmux thunar scort neovim neofetch kitty gimp obsidian vlc kdenlive libreoffice obs firefox zsh
    sudo pacman -S i3-wm sddm
    chsh zsh
else
    echo "Not choosen"
fi

echo "Do you want my cofig files"
read -p -r "Enter 1 to contiue" option

if [ $option == 1 ]; then
    cp /config/* ~/.config/
    cp /config/.tmux.conf ~/
else
    echo "Not choosen"
fi

echo "Do you want my wallpapers"
read -p -r "Enter 1 to contiue" option

if [ $option == 1 ]; then
    cp /config/wallpapers/* ~/Pictures/
else
    echo "Not choosen"
fi

echo "Do you want my zsh"
read -p -r "Enter 1 to contiue" option
if [ $option = 1 ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Not selcted"
fi


