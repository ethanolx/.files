#!/usr/bin/env bash
if [[ $(bluetoothctl show | grep "Powered: yes" | wc -l) -eq 0 ]]; then

    # Bluetooth disabled
    echo "%{F#565c64}"

elif [[ $(bluetoothctl devices Connected | wc -l) -eq 0 ]]; then

    # Not connected to any device
    echo "%{F#abb2bf}"
else

    # Connected to one or more devices
    readarray -t devices < <(bluetoothctl devices Connected)

    device_string=":"

    for index in ${!devices[@]}; do
        # Padding between icons
        device_string+="  "

        # Fetch the current device
        device=${devices[index]}

        # Extract the mac address
        read -r _ mac_address _ <<< $device

        # Extract the type of device
        device_type=$(bluetoothctl info "$mac_address" | grep Icon)

        if [[ $device_type =~ mouse ]]; then
            device_string+=""
        elif [[ $device_type =~ audio ]]; then
            device_string+="蓼"
        elif [[ $device_type =~ phone ]]; then
            device_string+=""
        else
            device_string+=""
        fi
    done

    echo "%{F#98c379}${device_string}"
fi
