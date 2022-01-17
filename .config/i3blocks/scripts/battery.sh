#!/usr/bin/bash

# Battery status
STATUS=$(acpi -b | awk '{print $3}')

# Battery percentage
POWER=$(acpi -b | awk '{print $4}' | cut -d ',' -f 1)
ADAPTER=$(acpi -a | awk '{print $3}')

# Remove % sign
POWER=${POWER%?}

PLUGGED_ICON=""

if [ "$ADAPTER" = "on-line" ]; then
	PLUGGED_ICON="  "
fi

if [ "$POWER" -lt "10" ]; then
	STATUS_ICON=" "
elif [ "$POWER" -lt "20" ]; then
	STATUS_ICON=" "
elif [ "$POWER" -lt "30" ]; then
	STATUS_ICON=" "
elif [ "$POWER" -lt "40" ]; then
	STATUS_ICON=" "
elif [ "$POWER" -lt "50" ]; then
	STATUS_ICON=" "
elif [ "$POWER" -lt "60" ]; then
	STATUS_ICON=" "
elif [ "$POWER" -lt "70" ]; then
	STATUS_ICON=" "
elif [ "$POWER" -lt "80" ]; then
	STATUS_ICON=" "
elif [ "$POWER" -lt "90" ]; then
	STATUS_ICON=" "
elif [ "$POWER" -lt "101" ]; then
	STATUS_ICON=" "
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
elif [ "$STATUS" == "Charging," ]; then
	COLOR="#00ff00"
fi

TEXT=$(echo "$PLUGGED_ICON$STATUS_ICON$POWER")
printf "<span foreground=\"$COLOR\">%s</span>\\n" "$TEXT"
