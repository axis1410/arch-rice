#!/usr/bin/env bash

top_margin_1080=400
bottom_margin_1080=400

if pgrep -x "wlogout" >/dev/null; then
	pkill -x "wlogout"
	exit 0
fi

scaled_height=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .height')

top_margin=$(awk -v m="$top_margin_1080" -v h="$scaled_height" 'BEGIN {printf "%.0f", m * h / 1080}')
bottom_margin=$(awk -v m="$bottom_margin_1080" -v h="$scaled_height" 'BEGIN {printf "%.0f", m * h / 1080}')

wlogout -C "$HOME/.config/wlogout/style.css" \
	-l "$HOME/.config/wlogout/layout" \
	--protocol layer-shell \
	-b 4 \
	-T "$top_margin" \
	-B "$bottom_margin" &
