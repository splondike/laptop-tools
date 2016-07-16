#!/bin/bash

THRESHOLD=5

get_state() {
   acpi -b | sed 's/Battery [0-9]: \([^,]\+\), \([0-9]\+\).\+/\1/'
}

get_percentage() {
   acpi -b | sed 's/Battery [0-9]: \([^,]\+\), \([0-9]\+\).\+/\2/'
}


while true;do
   state=$(get_state)
   if [ "x$state" = "xDischarging" ];then
      percent=$(get_percentage)
      if [ $percent -lt $THRESHOLD ];then
         echo -e "Battery power low\nLaptop will be suspended in 30\nseconds. Click to cancel for 2\nminutes." | dzen2 -w 300 -x 1300 -y 850 -l 4 -e 'onstart=uncollapse;button1=exit:2' -p 30 -bg '#aa3333'
         rtn=$?
         if [ $rtn = 0 ];then
            state=$(get_state)
            if [ "x$state" = "xDischarging" ];then
               systemctl suspend
            fi
         elif [ $rtn = 2 ];then
            sleep 110
         fi
      fi
   fi
   sleep 10
done
