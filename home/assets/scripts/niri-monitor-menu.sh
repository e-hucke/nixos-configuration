#!/usr/bin/env bash

set -euo pipefail

# List outputs via the niri IPC.
outputs_json=$(niri msg --json outputs)

# One row per output: "<connector>  <make> <model>[  (off)]"
menu=$(echo "$outputs_json" | jq -r '
  to_entries[]
  | "\(.key)  \(.value.make // "?") \(.value.model // "?")\(if .value.logical == null then "  (off)" else "" end)"
')

selected=$(echo "$menu" | fuzzel --dmenu --prompt "Monitor > ")
[ -z "$selected" ] && exit 0
monitor=$(echo "$selected" | awk '{print $1}')

action=$(printf "Enable\nDisable\nToggle" | fuzzel --dmenu --prompt "Action > ")
[ -z "$action" ] && exit 0

# niri does not support output mirroring, so the old "Mirror" action is gone.
# `niri msg output <name>` also supports: mode <WxH@R>|auto, scale <n>|auto,
# transform <t>, position set <x> <y> | position auto, vrr on|off — extend as needed.
case "$action" in
  Enable)  niri msg output "$monitor" on ;;
  Disable) niri msg output "$monitor" off ;;
  Toggle)  niri msg output "$monitor" toggle ;;
esac
