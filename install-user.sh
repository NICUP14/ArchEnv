#!/bin/bash

#---------
# Binaries
#---------

#--------------------
# Configuration Files
#--------------------

# bash
cp -v $PWD/config/bash/bashrc ~/.bashrc
cp -v $PWD/config/bash/bash_aliases ~/.bash_aliases
cp -v $PWD/config/bash/bash_functions ~/.bash_functions

# zsh
cp -v $PWD/config/zsh/zshrc ~/.zshrc
cp -v $PWD/config/zsh/zsh_aliases ~/.zsh_aliases
cp -v $PWD/config/zsh/zsh_functions ~/.zsh_functions

# vim
cp -v $PWD/config/vim/vimrc ~/.vimrc

# nvim
mkdir -p ~/.config/nvim
cp -rv $PWD/config/nvim ~/.config/nvim

# xorg
mkdir -p /etc/X11/xorg.conf.d
cp -v $PWD/config/xorg/40-libinput.conf /etc/X11/xorg.conf.d
cp -v $PWD/config/xorg/xinitrc ~/.xinitrc

#--------
# Scripts
#--------

# Required by dwmblocks
mkdir -p ~/.local/scripts
cp -v $PWD/scripts/battery.sh ~/.local/scripts

#--------------------------
# Service Files            
# NOTE: Cannot be symlinked
#--------------------------

