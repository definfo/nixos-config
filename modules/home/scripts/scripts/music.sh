#!/usr/bin/env bash

if (ps aux | grep audacious | grep -v grep > /dev/null) then
    pkill audacious
    pkill lyricer
    rm /tmp/lyrics
else
    hyprctl dispatch exec "[workspace 5 silent] audacious -t"
    sleep 0.5
    audtool playlist-repeat-status | grep "on" || audtool playlist-repeat-toggle
    # audtool playlist-shuffle-status| grep "on" || audtool playlist-shuffle-toggle
    hyprctl dispatch exec lyricer
fi