#!/usr/bin/env bash

set -euo pipefail

monitors_json=$(hyprctl monitors all -j)

menu=$(echo "$monitors_json" \
  | jq -r '.[] | "\(.name)  \(.description // "no description")\(if .disabled then "  [disabled]" else "" end)"')

selected=$(echo "$menu" | fuzzel --dmenu --prompt "Monitor > ")
[ -z "$selected" ] && exit 0
monitor=$(echo "$selected" | awk '{print $1}')

action=$(printf "Auto (left of others)\nMirror\nDisable" \
  | fuzzel --dmenu --prompt "Action > ")
[ -z "$action" ] && exit 0

case "$action" in
  "Auto (left of others)")
    hyprctl dispatch "hl.monitor({
      output = \"$monitor\",
      mode = \"preferred\",
      position = \"auto-left\",
      scale = 1,
    })"
    ;;
  Mirror)
    sources=$(echo "$monitors_json" \
      | jq -r --arg m "$monitor" '.[] | select(.name != $m and .disabled == false) | "\(.name)  \(.description // "no description")"')
    src=$(echo "$sources" | fuzzel --dmenu --prompt "Mirror source > ")
    [ -z "$src" ] && exit 0
    src_name=$(echo "$src" | awk '{print $1}')

    hyprctl dispatch "hl.monitor({
      output = \"$monitor\",
      mode = \"preferred\",
      position = \"auto\",
      scale = 1,
      mirror = \"$src_name\",
    })"
    ;;
  Disable)
    hyprctl dispatch "hl.monitor({
      output = \"$monitor\",
      disabled = true,
    })"
    ;;
esac