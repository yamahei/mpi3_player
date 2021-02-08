#!/bin/bash

PIN=14
gpio -g mode ${PIN} in
gpio -g read ${PIN}

SW="0000"#プルダウン抵抗で安定したけど念の為4回一致すること
MODE="0"

while :; do

  SW="${SW: -3:3}$(gpio -g read ${PIN})"
  #echo "SW=${SW}, MODE=${MODE}"

  if [ $SW = "0000" ]; then
    if [ $MODE = "1" ]; then
      #echo "up"
      sudo /opt/mpi3/bin/mpi3_skip.sh /home/pi/Music #離してて押した時
    fi
    MODE="0"
  elif [ $SW = "1111" ]; then
    if [ $MODE = "0" ]; then
      #echo "down"
      #sudo /opt/mpi3/bin/mpi3_skip.sh /home/pi/Music #押して離した時
    fi
    MODE="1"
  fi
done

