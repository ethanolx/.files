#!/usr/bin/env bash
if [[ $(nmcli networking) =~ ^disabled$ ]]; then
    nmcli networking on
else
    nmcli networking off
fi
