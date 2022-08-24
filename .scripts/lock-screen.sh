#!/usr/bin/env bash
if [[ -x '/usr/bin/betterlockscreen' ]]; then
    betterlockscreen -l
elif [[ -x '/usr/bin/i3lock' ]]; then
    sleep 0.5
    i3lock \
        -B 0.1 \
        -n \
        --radius 100 \
        --ring-width 8.0 \
        --inside-color=00000000 \
        --ring-color=81a1c1aa \
        --insidever-color=ebcb8baa \
        --ringver-color=ebcb8baa \
        --insidewrong-color=e06c75aa \
        --ringwrong-color=e06c75aa \
        --line-color=00000000 \
        --keyhl-color=a3b8efaa \
        --bshl-color=de98fdaa \
        --separator-color=282c34aa \
        --verif-color=282c34ff \
        --wrong-color=282c34ff \
        --modif-color=282c34ff \
        --verif-text="..." \
        --wrong-text="!" \
        --noinput-text="~" \
fi
