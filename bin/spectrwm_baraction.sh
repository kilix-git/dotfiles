#!/bin/bash
# baraction.sh for spectrwm status bar

## DISK
hdd() {
  hdd="$(df -h | awk 'NR==6{print $3,"- "$5}')"
  echo -e "$hdd"
}

## RAM
mem() {
  mem=`free | awk '/Mem/ {printf "%dM\n", $3 / 1024.0}'`
  echo -e "$mem "
}

## CPU
cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  temp=$(sensors | grep Package | awk '{print $4}')
  echo -e "CPU: $cpu% "/" $temp"
}

## VOLUME
vol() {
    vol=`pacmd list-sinks | awk '/^\svolume:/{print $5; exit}'`
    echo -e "VOL: $vol "
}

SLEEP_SEC=2
#loops forever outputting a line every SLEEP_SEC secs

# It seems that we are limited to how many characters can be displayed via
# the baraction script output. And the the markup tags count in that limit.
# So I would love to add more functions to this script but it makes the 
# echo output too long to display correctly.
while :; do
    echo "+@fg=0; +@fn=1;+@fn=2; $(cpu) |" " +@fn=1;+@fn=2; $(mem)|" " +@fn=1;+@fn=2; $(hdd)|" " +@fn=1;  +@fn=2; $(vol)| "

#    echo "$(vol) $(cpu) $(mem)"
	sleep $SLEEP_SEC
done

