#!/usr/bin/env bash

swayidle -w \
  timeout 600 'bash -c ~/.config/swaylock/lock-session.sh' \
  timeout 320 'hyprctl dispatch dpms off' \
  resume 'hyprctl dispatch dpms on'
