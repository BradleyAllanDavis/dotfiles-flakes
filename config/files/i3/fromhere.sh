#!/bin/bash

ID=$(xdpyinfo | grep focus | cut -f4 -d " ")
PID=$(($(xprop -id $ID | grep -m 1 PID | cut -d " " -f 3) + 2))
if [ -e "/proc/$PID/cwd" ]
then
    # termite -d $(readlink /proc/$PID/cwd)
    termite -d $(readlink /proc/$PID/cwd) &
    # echo here
else
    termite -d $(readlink /proc/$PID/cwd) &
    # termite -d ~/dotfiles
fi
