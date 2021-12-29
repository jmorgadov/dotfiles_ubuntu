#!/usr/bin/bash

# Battery status
STATUS=$(acpi -b | awk '{print $3}')

# Battery percentage
POWER=$(acpi -b | awk '{print $4}' | cut -d ',' -f 1)

# Remove % sign
POWER=${POWER%?}

STATUS_ICON=""
if [ "$STATUS" == "Charging," ]; then
	# Charging emoji
	STATUS_ICON=""
elif [ "$STATUS" == "Discharging," ]; then
	if [ "$POWER" -lt "20" ]; then
		STATUS_ICON=""
	elif [ "$POWER" -lt "40" ]; then
		STATUS_ICON=""
	elif [ "$POWER" -lt "60" ]; then
		STATUS_ICON=""
	elif [ "$POWER" -lt "80" ]; then
		STATUS_ICON=""
	elif [ "$POWER" -lt "100" ]; then
		STATUS_ICON=""
	fi
elif [ "$STATUS" == "Full," ]; then
	STATUS_ICON=""
fi

COLOR="#ffffff"
if [ "$STATUS" == "Discharging," ]; then
	if [ "$POWER" -lt "20" ]; then
		COLOR="#ff0000"
	elif [ "$POWER" -lt "40" ]; then
		COLOR="#ff9900"
	elif [ "$POWER" -lt "60" ]; then
		COLOR="#ffff00"
	elif [ "$POWER" -lt "80" ]; then
		COLOR="#00ff00"
	elif [ "$POWER" -lt "100" ]; then
		COLOR="#00ffff"
	fi
fi

TEXT=$(echo "$STATUS_ICON $POWER")
printf "<span foreground=\"$COLOR\">%s</span>\\n" "$TEXT"
