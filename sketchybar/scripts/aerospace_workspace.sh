#!/bin/sh

ACTIVE_BG=0xFFeed49f
ACTIVE_FG=0xFF181926
INACTIVE_FG=0xFF8087a2

sketchybar_display_for_aerospace_monitor() {
  case "$1" in
    1) printf '2' ;;
    2) printf '1' ;;
    *) printf '%s' "$1" ;;
  esac
}

windows=$(aerospace list-windows --all --format '%{workspace}|%{monitor-id}' 2>/dev/null)

for monitor in $(aerospace list-monitors --format '%{monitor-id}' 2>/dev/null); do
  display=$(sketchybar_display_for_aerospace_monitor "$monitor")
  visible=$(aerospace list-workspaces --monitor "$monitor" --visible --format '%{workspace}' 2>/dev/null)

  for workspace in 1 2 3 4 5 6 7 8 9; do
    item="aerospace.workspace.$monitor.$workspace"
    active=false

    if [ "$visible" = "$workspace" ]; then
      active=true
    elif printf '%s\n' "$windows" | grep -qx "$workspace|$monitor"; then
      active=true
    fi

    if [ "$active" = true ]; then
      if [ "$visible" = "$workspace" ]; then
        sketchybar --set "$item" drawing=on \
                               display="$display" \
                               icon.color=$ACTIVE_FG \
                               background.drawing=on \
                               background.color=$ACTIVE_BG
      else
        sketchybar --set "$item" drawing=on \
                               display="$display" \
                               icon.color=$INACTIVE_FG \
                               background.drawing=off
      fi
    else
      sketchybar --set "$item" drawing=off \
                             background.drawing=off
    fi
  done
done
