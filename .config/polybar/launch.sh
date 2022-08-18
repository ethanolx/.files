#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Run custom polybar instance
echo '---' | tee -a /tmp/polybar.log
polybar run 2>&1 | tee -a /tmp/polybar.log & disown
