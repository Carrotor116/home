#!/bin/bash

# ---------------------------------------
# `$ script_name` to activate TIM windows
# `$ script_name -i` to init TIM icon location with mouse location
# `$ script_name -l` to display TIM icon location in the script
# ---------------------------------------

X=1364
Y=11

function main(){
  while getopts "il" arg 2>/dev/null; do
      case $arg in
          l)
              tim_icon_location ;;
          i)
              init_tim_icon_location ;;
          *)
              echo "error option"
              return ;;
      esac
  done
}

script_path=$( readlink -f $0)

function init_tim_icon_location(){
  eval $( xdotool getmouselocation --shell)
  sed -i 's/^X=.*$/X='$X'/; s/^Y=.*$/Y='$Y'/' $script_path
  echo "init TIM icon location with ($X, $Y)"
}

function tim_icon_location() {
  echo "TIM icon is ($X, $Y)"
}

function activate_TIM_windows() {
  xdotool mousemove $X $Y click --repeat 2 --delay 15 1 mousemove restore
}

if [ $# == 0 ];then
  activate_TIM_windows
else
  main $@
fi
