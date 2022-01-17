#!/usr/bin/bash

# Prints the current master volume level
VOL=$(($(amixer -D pulse get Master \
	     | grep "Front.*:" \
		 | awk '{print $5}' \
		 | sed "s/\[\(.*\)%\]/\1/" \
		 | paste -sd "+")))
VOL=$(echo "$VOL / 2" | bc)
VOL_ICON=" "
if [ $VOL -gt 60 ]; then
	VOL_ICON=" "
elif [ $VOL -gt 30 ]; then
	VOL_ICON="墳 "
elif [ $VOL -gt 0 ]; then
	VOL_ICON="奔 "
fi
printf "%s%s" "$VOL_ICON" "$VOL"
# printf "VOL"
# Print the 
