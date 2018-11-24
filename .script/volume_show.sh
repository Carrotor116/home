#!/bin/bash 

notify-send  " volume" "`amixer -c 1 sget Master | tail  -n 1 `"
