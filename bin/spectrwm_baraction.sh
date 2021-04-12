#!/bin/sh
# baraction.sh for spectrwm status bar

PKGS="$(pkg info | wc -l | sed -e 's/^[ \t]*//')"
KERNEL="$(uname -v)"

echo "$KERNEL "   "|"   "   $PKGS   "   
sleep 10	

while true; do

	KERNEL="$(uname -v | awk '{print $2}')"
	UPTIME="$(uptime | awk -F, '{sub(".*up ",x,$1);print $1}' | sed -e 's/^[ \t]*//')"
	VOL="$(mixer vol | awk -F ":" '{print $1}' | awk '{print $7}')"
	MEM="$(freecolor -m -o | awk 'NR==2{print $3}')"
	cpustat="$(ps -o %cpu -p `pgrep -S idle` | tail -1)"
	CPU=`awk "BEGIN {print 400-$cpustat}"` 
	CPUTEMP=`sysctl dev.cpu.2.temperature | awk '{print $2}'`
	echo "  $VOL%  |    $MEM"M"  |   " "$CPU"% - "$CPUTEMP |    $UPTIME  "
#  $KERNEL  |  
	sleep 2
done
exit 0
