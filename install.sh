#!/bin/sh
#installing software
loa='neovim ranger git g++ wget curl firefox'

declare -A osInfo;
osInfo[/etc/redhat-release]=yum
osInfo[/etc/arch-release]=pacman
osInfo[/etc/gentoo-release]=emerge
osInfo[/etc/SuSE-release]=zypp
osInfo[/etc/debian_version]=apt-get
osInfo[/etc/alpine-release]=apk

for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        sudo ${osInfo[$f]} update # updates the latest packages
	sudo ${osInfo[$f]} install -y $loa
    fi
done

# writing configs

mkdir ~/.config/nvim/
mkdir ~/.config/ranger/

curl https://raw.githubusercontent.com/Horrid-code/installscript/main/commands.py > ~/.config/ranger/commands.py
curl https://raw.githubusercontent.com/Horrid-code/installscript/main/commands_full.py > ~/.config/ranger/commands_full.py
curl https://raw.githubusercontent.com/Horrid-code/installscript/main/init.lua > ~/.config/nvim/init.lua
curl https://github.com/Horrid-code/installscript/raw/main/rc.conf > ~/.config/ranger/rc.conf
curl https://github.com/Horrid-code/installscript/raw/main/rifle.conf > ~.config/ranger/rifle.conf
curl https://github.com/Horrid-code/installscript/raw/main/scope.sh > ~/.config/ranger/scope.sh

