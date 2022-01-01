#!/usr/bin/bash

maim -s -m 10 "$HOME/Pictures/screenshot.jpg" && xclip -selection clipboard -t image/jpg "$HOME/Pictures/screenshot.jpg"

