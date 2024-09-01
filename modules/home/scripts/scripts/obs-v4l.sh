#!/usr/bin/env bash

if (ps aux | rg obs | rg -v rg > /dev/null) then
    pkill obs
else
    hyprctl dispatch exec "[workspace 8 silent] obs --startvirtualcam"
    sleep 0.5
fi