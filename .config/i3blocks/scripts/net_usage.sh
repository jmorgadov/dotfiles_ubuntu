#!/usr/bin/bash

LOW=0
MEDIUM=30
HIGH=150

LOG_FILE="${XDG_CACHE_HOME:-$HOME/.cache}/net_usage"

read PREV_RX PREV_TX < "$LOG_FILE"

CURRENT_RX=$(($( \
	ls -1 /sys/class/net/ \
	| grep -vP "lo" \
	| while read f; do echo "/sys/class/net/$f/statistics/rx_bytes"; done \
	| xargs cat \
	| paste -sd "+")))
CURRENT_TX=$(($( \
	ls -1 /sys/class/net/ \
	| grep -vP "lo" \
	| while read f; do echo "/sys/class/net/$f/statistics/tx_bytes"; done \
	| xargs cat \
	| paste -sd "+")))

if [ ! -f "$LOG_FILE" ]; then
	echo "$DELTA_RX $DELTA_TX" > "$LOG_FILE"
fi

DELTA_RX="$(((CURRENT_RX-PREV_RX)))"
DELTA_TX="$(((CURRENT_TX-PREV_TX)))"

DELTA_RX_KB="$((DELTA_RX/1024))"
DELTA_TX_KB="$((DELTA_TX/1024))"

LIGHT_GRAY="#999999"
GREEN="#00FF00"
YELLOW="#FFFF00"
RED="#FF0000"

RX_COLOR=$LIGHT_GRAY
TX_COLOR=$LIGHT_GRAY

if [ "$DELTA_RX_KB" -gt "$HIGH" ]; then
	RX_COLOR=$RED
elif [ "$DELTA_RX_KB" -gt "$MEDIUM" ]; then
	RX_COLOR=$YELLOW
elif [ "$DELTA_RX_KB" -gt "$LOW" ]; then
	RX_COLOR=$GREEN
fi

if [ "$DELTA_TX_KB" -gt "$HIGH" ]; then
	TX_COLOR=$RED
elif [ "$DELTA_TX_KB" -gt "$MEDIUM" ]; then
	TX_COLOR=$YELLOW
elif [ "$DELTA_TX_KB" -gt "$LOW" ]; then
	TX_COLOR=$GREEN
fi

RX_TEXT=$(printf "<span foreground=\"$RX_COLOR\">▼ %s KiB</span>" "$DELTA_RX_KB")
TX_TEXT=$(printf "<span foreground=\"$TX_COLOR\">▲ %s KiB</span>" "$DELTA_TX_KB")

IP_ADDR=$(ip a | grep -P "\d.*state UP.*" | cut -d ":" -f1 | xargs ip route get | head -n 1 | awk '{print $7}')

if [ ! -z "$IP_ADDR" ]; then
	IP_ADDR=" $IP_ADDR"
fi

echo "  $RX_TEXT $TX_TEXT$IP_ADDR"
echo "$CURRENT_RX $CURRENT_TX" > "$LOG_FILE"
