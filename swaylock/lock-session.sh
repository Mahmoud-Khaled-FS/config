#!/usr/bin/env bash

source "$HOME"/.local/bin/environment.sh

swaylock \
	--font-size 10 \
	--font "JetBrainsMono" \
	--ignore-empty-password \
	--screenshots \
	--clock \
	--indicator \
	--indicator-radius 100 \
	--indicator-thickness 7 \
	--effect-blur 7x3 \
	--effect-vignette 0.5:0.5 \
	--text-color "$foreground" \
	--ring-color "$purple" \
	--key-hl-color "$background" \
	--line-color "$purple" \
	--inside-color "$background" \
	--separator-color "$background" \
	--fade-in 0.2
