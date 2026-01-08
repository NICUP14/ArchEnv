#!/bin/bash

# ANSI color codes
GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

# Safe file replace utility
replace() {
    local src="$1"
    local dest="$2"

    if [[ -d "$src" && -d "$dest" ]]; then
        echo -e "$dest: ${RED}ERROR(replace)${RESET}"
	return 1
    fi

    if [ -d "$dest" ]; then
        dest="$dest/$(basename $src)"
    fi

    if [ -e "$dest" ]; then
        if cmp -s "$src" "$dest"; then
	    # Identical => fake replace
	    echo -e "$dest: ${GREEN}Replaced${RESET}"
        else
	    # Different => not replaced
	    echo -e "$dest: ${RED}Not replaced${RESET}"
            echo "Cannot replace $dest"
        fi
    else
	# Inexistent => replace
        echo -e "$dest: ${GREEN}Replaced${RESET}"
        cp "$src" "$dest"
    fi
}

# Safe directory replace utility
replace_dir() {
    local src="$1"
    local dest="$2"

    if [[ ! -d "$src" || ! -d "$dest" ]]; then
        echo -e "$dest: ${RED}ERROR(replace_dir)${RESET}"
	return 1
    fi

    local item
    for item in "$src"/*; do
        local target="$dest/$(basename "$item")"

        if [ -d "$item" ]; then
	    mkdir -p "$target"
            replace_dir "$item" "$target"
        else
	    replace "$item" "$target"
        fi
    done
}


#---------
# Binaries
#---------

#--------------------
# Configuration Files
#--------------------

# bash
replace ./config/bash/bashrc ~/.bashrc
replace ./config/bash/bash_aliases ~/.bash_aliases
replace ./config/bash/bash_functions ~/.bash_functions

# zsh
replace ./config/zsh/zshrc ~/.zshrc
replace ./config/zsh/zsh_aliases ~/.zsh_aliases
replace ./config/zsh/zsh_functions ~/.zsh_functions

# vim
mkdir -p ~/.vim/colors
replace ./config/vim/vimrc ~/.vimrc
replace ./config/vim/colors/dracula.vim ~/.vim/colors

# xorg
replace ./config/xorg/xinitrc ~/.xinitrc

# dunst
mkdir -p ~/.config/dunst
replace ./config/dunst/dunstrc ~/.config/dunst

# sxhkd
mkdir -p ~/.config/sxhkd
replace ./config/sxhkd/sxhkdrc ~/.config/sxhkd

# nvim
mkdir -p ~/.config/nvim
replace_dir ./config/nvim ~/.config/nvim

# zathura
mkdir -p ~/.config/zathura
replace_dir ./config/zathura ~/.config/zathura

#--------
# Scripts
#--------

mkdir -p ~/.local/scripts
replace_dir ./scripts ~/.local/scripts
chmod +x ~/.local/scripts/*

#--------------------------
# Service Files
# NOTE: Cannot be symlinked
#--------------------------

