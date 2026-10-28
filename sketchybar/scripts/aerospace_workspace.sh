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

# Each monitor shows only the workspaces assigned to it
# (workspace-to-monitor-force-assignment in aerospace.toml), empty or not.
# The currently visible one is highlighted.
for monitor in $(aerospace list-monitors --format '%{monitor-id}' 2>/dev/null); do
  display=$(sketchybar_display_for_aerospace_monitor "$monitor")
  visible=$(aerospace list-workspaces --monitor "$monitor" --visible --format '%{workspace}' 2>/dev/null)
  assigned=$(aerospace list-workspaces --monitor "$monitor" --format '%{workspace}' 2>/dev/null)

  for workspace in 1 2 3 4 5 6 7 8 9; do
    item="aerospace.workspace.$monitor.$workspace"

    if ! printf '%s\n' "$assigned" | grep -qx "$workspace"; then
      sketchybar --set "$item" drawing=off \
                             background.drawing=off
    elif [ "$visible" = "$workspace" ]; then
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
  done
done
