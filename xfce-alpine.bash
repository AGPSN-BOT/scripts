#!/bin/bash

#SCRIPT TO ADD XFCE GUI

clear; set -eu

USERADD=test

[ -z "${USERADD}" ] && echo "Username not set. Edit script and add a username to 'USERADD='" && exit 1

[ ! -f "/sbin/apk" ] && echo "apk not found. Are you running Alpine?" && exit 1

apk update
adduser $USERADD
setup-xorg-base
apk add xfce4 xfce4-terminal xfce4-screensaver lightdm-gtk-greeter
rc-service dbus start && rc-update add dbus
rc-update add lightdm && rc-service lightdm start
