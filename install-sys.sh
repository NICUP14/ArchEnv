#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo "$0: Install script must be run as root!"
    exit 1
fi

#---------
# Binaries
#---------

for file in $PWD/bin/*; do
    cp -vi "$file" /bin
    chown root:root "/bin/$(basename $file)"
done

#--------------------
# Configuration Files
#--------------------

# iwd
cp -v $PWD/config/iwd/main.conf /etc/iwd

# systemd-logind
mkdir -p /etc/
cp -v $PWD/config/systemd/logind.conf /etc/systemd
cp -v $PWD/config/systemd/sleep.conf /etc/systemd

# sysctl hardening
mkdir -p /etc/sysctl.d
cp -v $PWD/config/sysctl/99-security.conf /etc/sysctl.d

# modprobe.d
mkdir -p /etc/modprobe.d
cp -v $PWD/config/modprobe/blacklist-mei.conf /etc/modprobe.d

#--------
# Scripts
#--------

#--------------------------
# Service Files             
# NOTE: Cannot be symlinked 
#--------------------------

cp -v ./services/powertop.service /etc/systemd/system/powertop.service
