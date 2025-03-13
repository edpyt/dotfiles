#!/usr/bin/env bash

get_volume () {
  wpctl get-volume @DEFAULT_SINK@ | awk '{if($NF=="[MUTED]"){printf"󰝟"}else{printf"%.0f%\n",$NF*100}}';
}

get_volume;
pactl subscribe \
  | grep --line-buffered "Event 'change' on sink " \
  | while read -r evt; 
do get_volume | cut -d " " -f1;
done
