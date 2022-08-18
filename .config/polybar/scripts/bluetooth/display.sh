#!/usr/bin/env bash
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
    echo "%{F#565c64}"
else
    if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
    then
        echo "%{F#abb2bf}"
    else
        echo "%{F#98c379}"
    fi
fi
