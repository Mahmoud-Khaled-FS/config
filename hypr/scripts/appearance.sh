#!/usr/bin/env bash

source "$HOME"/.local/bin/environment.sh

hypr_conf="$HOME/.config/hypr/hyprland.conf"
alacritty_conf="$HOME/.config/alacritty/alacritty.yml"
cfg="$HOME/.config/hypr/.appearance_config"

opacity_is_enabled="$(cat "$HOME"/.config/hypr/.appearance_config | grep opacity | awk ' {print $3} ')"
rounding_is_enabled="$(cat "$HOME"/.config/hypr/.appearance_config | grep rounding | awk ' {print $3} ')"
animations_is_enabled=$(cat "$HOME"/.config/hypr/.appearance_config | grep animations | awk ' {print $3} ')
blur_is_enabled="$(cat "$HOME"/.config/hypr/.appearance_config | grep blur | awk ' {print $3} ')"

case "$1" in
    opacity_toggle)
        if [ "$opacity_is_enabled" = true ]; then
            sed -i '5s/^/# /'                    "$hypr_conf"
            sed -i 's/opacity: 0.95/opacity: 1/' "$alacritty_conf"
            sed -i '1s/true/false/'               "$cfg"
        else
            sed -i '5s/# //'                     "$hypr_conf"
            sed -i 's/opacity: 1/opacity: 0.95/' "$alacritty_conf"
            sed -i '1s/false/true/'               "$cfg"
        fi
			hyprctl reload; sleep 0.5; ~/.config/hypr/scripts/lid-open-close.sh
            notify-send -i "$icon_succes" "Done"
        ;;
    rounding_toggle)
        if [ "$rounding_is_enabled" = true ]; then
            sed -i 's/rounding = 5/rounding = 0/' "$hypr_conf"
            sed -i '2s/true/false/'               "$cfg"
        else
            sed -i 's/rounding = 0/rounding = 5/' "$hypr_conf"
            sed -i '2s/false/true/'               "$cfg"
        fi
			hyprctl reload; sleep 0.5; ~/.config/hypr/scripts/lid-open-close.sh
            notify-send -i "$icon_succes" "Done"
        ;;
    i3_mode_toggle)
        if [ "$opacity_is_enabled" = true ]; then
            sed -i '5s/^/# /'                    "$hypr_conf"
            sed -i 's/opacity: 0.95/opacity: 1/' "$alacritty_conf"
            sed -i '1s/true/false/'               "$cfg"
        else
            sed -i '5s/# //'                     "$hypr_conf"
            sed -i 's/opacity: 1/opacity: 0.95/' "$alacritty_conf"
            sed -i '1s/false/true/'               "$cfg"
        fi

        if [ "$rounding_is_enabled" = true ]; then
            sed -i 's/rounding = 5/rounding = 0/' "$hypr_conf"
            sed -i '2s/true/false/'               "$cfg"
        else
            sed -i 's/rounding = 0/rounding = 5/' "$hypr_conf"
            sed -i '2s/false/true/'               "$cfg"
        fi

        if [ "$animations_is_enabled" = true ]; then
            sed -i 's/enabled = yes/enabled = no/' "$hypr_conf"
            sed -i '3s/true/false/'                 "$cfg"
        else
            sed -i 's/enabled = no/enabled = yes/' "$hypr_conf"
            sed -i '3s/false/true/'                 "$cfg"
        fi

        if [ "$blur_is_enabled" = true ]; then
            sed -i 's/blur = 1/blur = 0/' "$hypr_conf"
            sed -i '4s/true/false/'       "$cfg"
        else
            sed -i 's/blur = 0/blur = 1/' "$hypr_conf"
            sed -i '4s/false/true/'       "$cfg"
        fi

			hyprctl reload; sleep 0.5; ~/.config/hypr/scripts/lid-open-close.sh
            notify-send -i "$icon_succes" "Done"
        ;;
esac
