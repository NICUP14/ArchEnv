#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo "$0: Install script must be run as root!"
    exit 1
fi

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

for file in ./bin/*; do
    replace "$file" /bin
    chown root:root "/bin/$(basename $file)"
    chmod +x "/bin/$(basename $file)"
done

#--------------------
# Configuration Files
#--------------------

# autocpu-freq
replace $PWD/config/auto-cpufreq/auto-cpufreq.conf /etc

# xorg
mkdir -p /etc/X11/xorg.conf.d
replace ./config/xorg/40-libinput.conf /etc/X11/xorg.conf.d

# iwd
replace $PWD/config/iwd/main.conf /etc/iwd

# udev
replace_dir $PWD/config/udev /etc/udev/rules.d


#--------
# Scripts
#--------

#--------------------------
# Service Files             
# NOTE: Cannot be symlinked 
#--------------------------

