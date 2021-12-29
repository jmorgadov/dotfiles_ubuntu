#!/bin/bash

# Send the header so that i3bar knows we want to use JSON:
echo '{ "version": 1 }'

# Begin the endless array.
echo '['

# We send an empty first array of blocks to make the loop simpler:
echo '[]'

GREEN='#00FF00'
YELLOW='#FFFF00'


# Now send blocks with information forever:
while :;
do
    echo -n ',['
	echo -n "$(bash $HOME/.config/i3/net_usage.sh),"
    echo -n "{\"name\":\"id_time\",\"full_text\":\"$(date)\"}"
    echo -n "]"
  sleep 1
done
