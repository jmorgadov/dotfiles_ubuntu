#!/bin/bash

LOG_FILE="${XDG_CACHE_HOME:-$HOME/.cache}/net_usage"

read PREV_RX PREV_TX < "$LOG_FILE"

CURRENT_RX=$(($(cat /sys/class/net/*/statistics/rx_bytes | paste -sd '+')))
CURRENT_TX=$(($(cat /sys/class/net/*/statistics/tx_bytes | paste -sd '+')))

if [ ! -f "$LOG_FILE" ]; then
	echo "$DELTA_RX $DELTA_TX" > "$LOG_FILE"
fi

DELTA_RX="$(((CURRENT_RX-PREV_RX)))"
DELTA_TX="$(((CURRENT_TX-PREV_TX)))"

DELTA_RX_KB="$((DELTA_RX/1024))"
DELTA_TX_KB="$((DELTA_TX/1024))"

# printf "In: %s KiB - Out: %s KiB\\n" "$DELTA_RX_KB" "$DELTA_TX_KB"

rx_color=$GREEN
tx_color=$GREEN
if [ $DELTA_RX_KB -gt "2" ]; then rx_color=$YELLOW; fi
if [ $DELTA_TX_KB -gt "2" ]; then tx_color=$YELLOW; fi

printf "{\"name\":\"id_net_usage_rx\",\"full_text\":\"%s KiB\",\"color\":\"$rx_color\"}," "$DELTA_RX_KB"
printf "{\"name\":\"id_net_usage_tx\",\"full_text\":\"%s KiB\",\"color\":\"$tx_color\"}" "$DELTA_TX_KB"
echo "$CURRENT_RX $CURRENT_TX" > "$LOG_FILE"
