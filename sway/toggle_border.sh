#!/bin/bash

sway_tree="$(swaymsg -t get_tree)"
focused_window_border_mode="$(echo $sway_tree | jq -r '.. | select(.type?) | select(.focused==true).border')"
focused_window_id="$(echo $sway_tree | jq -r '.. | select(.type?) | select(.focused==true).id')"

if [ "$focused_window_border_mode" = "pixel" ]; then
    new_border_mode="normal"
else
    new_border_mode="pixel"
fi

swaymsg [con_id=$focused_window_id] border $new_border_mode 3
