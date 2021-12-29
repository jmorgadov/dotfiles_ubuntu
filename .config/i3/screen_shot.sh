#!/usr/bin/bash

scrot -s -o "$HOME/Pictures/screenshot.jpg" && xclip -selection clipboard -t image/jpg "$HOME/Pictures/screenshot.jpg"

