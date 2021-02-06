#!/bin/bash

CMD=$(which mpg321)
if [ -z ${CMD} ]; then
  echo "ERROR: mpg321 command not found."
  exit 1
fi
DIR=${1}
if [ -z ${DIR} ] || [ ! -d ${DIR} ]; then
  echo "Usage: ${0} ROOTDIR_TO_MP3"
  exit 1
fi

IFS=$'\n'
while true; do
  LIST=($(ls -1 -R ${DIR} | grep -i mp3 | shuf)) 
  for f in "${LIST[@]}"; do
    echo "mp3 file: ${DIR}/${f}"
    ${CMD} "${DIR}/${f}"
  done
done
