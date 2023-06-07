#!/usr/bin/env bash

getHDMI="$(hyprctl monitors | grep -o "HDMI")"

if [ "$getHDMI" = "HDMI" ]; then
	sleep 0.5
    hyprctl keyword monitor "eDP-1, disable"
else
    hyprctl keyword monitor "eDP-1, 1440x900, 0x0, 1"
    sh ~/.config/swaylock/lock-session.sh
fi
