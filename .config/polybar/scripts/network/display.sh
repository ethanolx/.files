#!/usr/bin/env bash
if [[ $(nmcli networking) =~ ^disabled$ ]]; then

    # Wifi disabled
    echo "%{F#565c64}睊"

elif [[ $(nmcli device | grep " connected" | wc -l) -eq 0 ]]; then

    # Not connected to any device
    echo "%{F#abb2bf}直"
else
    readarray -t connections < <(nmcli connection | grep wifi)

    connection_string="直 "

    for index in ${!connections[@]}; do
        # Separator between names
        if [[ index -gt 0 ]]; then
            connection_string+=", "
        fi

        # Fetch the current connection
        connection=${connections[index]}

        # Extract the ssid
        read -r ssid _ <<< $connection

        # Append the ssid
        connection_string+=$ssid
    done

    echo "%{F#98c379}${connection_string}"
fi
