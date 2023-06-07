#!/usr/bin/env bash


NUMBER_OF_WORKSPACES=9
ACTIVE_WINDOW=1
#window_class() {
#  `hyprctl activewindow -j | jq --raw-output .class`
#}

#window_title() {
#  echo `hyprctl activewindow -j | jq --raw-output .title`
#}

active_window_id() {
  ACTIVE_WINDOW=$(hyprctl activeworkspace -j | jq .id)
}
active_window_id
workspaces (){
  WORKSPACE_WINDOWS=$(hyprctl workspaces -j | jq 'map({key: .id | tostring, value: .windows}) | from_entries')
  seq 1 $NUMBER_OF_WORKSPACES | jq --argjson windows "${WORKSPACE_WINDOWS}" --slurp -Mc 'map(tostring) | map({id: ., windows: ($windows[.]//0)})'
}

if [[ $1 == 'workspaces' ]]; then
  echo "{ \"workspaces\": $(workspaces), \"active\": \"$ACTIVE_WINDOW\"}"
  socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
  active_window_id

  eww update workspaces="{
  \"workspaces\": $(workspaces),
  \"active\": \"$ACTIVE_WINDOW\"
}"
done
fi

if [[ $1 == 'window' ]]; then
  windowTitle=$(hyprctl activewindow -j | jq --raw-output .title)
  windowClass=$(hyprctl activewindow -j | jq --raw-output .class)
    eww update window="{
     \"class\": \"$windowClass\",
     \"title\": \"$windowTitle\"
   }"
  socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
  windowTitle=$(hyprctl activewindow -j | jq --raw-output .title)
  windowClass=$(hyprctl activewindow -j | jq --raw-output .class)
  eww update window="{
     \"class\": \"$windowClass\",
     \"title\": \"${windowTitle:0:35}\"
   }"
done
fi

