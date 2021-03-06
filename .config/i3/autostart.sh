#!/usr/bin/bash

# Display external by default
if xrandr --listmonitors | grep HDMI; then xrandr --output eDP --off; fi

# Set wallpaper
BG_IMAGE_PATH=~/Pictures/wallpaper.jpg
if [ -f $BG_IMAGE_PATH ]; then
	feh --bg-center --bg-fill $BG_IMAGE_PATH
fi

# Set keyboard layout
setxkbmap us -variant intl

# Execute compton
compton --backend glx --paint-on-overlay --vsync opengl-swc --no-fading-openclose &
