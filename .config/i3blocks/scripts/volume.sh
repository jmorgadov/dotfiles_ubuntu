#!/usr/bin/bash

# Prints the current master volume level
VOL=$(($(amixer -D pulse get Master \
	     | grep "Front.*:" \
		 | awk '{print $5}' \
		 | sed "s/\[\(.*\)%\]/\1/" \
		 | paste -sd "+")))
VOL=$(echo "$VOL / 2" | bc)
printf "%s" "$VOL" && pkill -RTMIN+10 i3blocks
# printf "VOL"
# Print the 
