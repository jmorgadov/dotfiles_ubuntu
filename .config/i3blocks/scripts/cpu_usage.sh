#!/usr/bin/bash

GREEN='#00FF00'
YELLOW='#FFFF00'
RED='#FF0000'

# CPU Usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

CPU_INT=$(echo $CPU_USAGE | cut -d'.' -f1)

COLOR=$YELLOW
if [ "$CPU_INT" -gt "80" ]; then
	COLOR=$RED
elif [ "$CPU_INT" -gt "60" ]; then
	COLOR=$YELLOW
else
	COLOR=$GREEN
fi

TEXT="龍 $CPU_USAGE %"
printf "<span foreground=\"$COLOR\">%s</span>\\n" "$TEXT"
