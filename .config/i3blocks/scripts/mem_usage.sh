#!/usr/bin/bash

PERCENT=$(free | grep Mem: | awk '{print ($3*100)/$2}')
F_PERCENT=$(printf "%.1f" $PERCENT)
I_PERCENT=$(printf "%.0f" $PERCENT)

GREEN='#00FF00'
YELLOW='#FFFF00'
RED='#FF0000'

COLOR=$GREEN

if [ "$I_PERCENT" -gt "80" ]; then
	COLOR=$RED
elif [ "$I_PERCENT" -gt "60" ]; then
	COLOR=$YELLOW
else
	COLOR=$GREEN
fi

TEXT="MEM $F_PERCENT %"
printf "<span foreground=\"$COLOR\">%s</span>\\n" "$TEXT"
