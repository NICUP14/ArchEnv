#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo "$0: Install script must be run as root!"
    exit 1
fi

############
# Binaries #
############

for file in $PWD/bin/*; do
    cp -v "$file" /bin
    chown root:root "/bin/$(basename $file)"
done

#######################
# Configuration Files #
#######################

# bash
cp -v $PWD/config/bash/bashrc ~/.bashrc
cp -v $PWD/config/bash/bash_aliases ~/.bash_aliases
cp -v $PWD/config/bash/bash_functions ~/.bash_functions

# vim
cp -v $PWD/config/vim/vimrc ~/.vimrc

# xorg
mkdir -p /etc/X11/xorg.conf.d
cp -v $PWD/config/xorg/40-libinput.conf /etc/X11/xorg.conf.d
cp -v $PWD/config/xorg/xinitrc ~/.xinitrc

# iwd
cp -v $PWD/config/iwd/main.conf /etc/iwd

# sysctl hardening
mkdir -p /etc/sysctl.d
cp -v $PWD/config/sysctl/99-security.conf /etc/sysctl.d

###########
# Scripts #
###########

# Required by dwmblocks
mkdir -p ~/.local/scripts
cp -v $PWD/scripts/battery.sh ~/.local/scripts

#############################
# Service Files             #
# NOTE: Cannot be symlinked #
#############################

cp -v ./services/powertop.service /etc/systemd/system/powertop.service
