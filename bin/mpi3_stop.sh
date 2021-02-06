#!/bin/bash

DIR=${1}
if [ -z ${DIR} ] || [ ! -d ${DIR} ]; then
  echo "Usage: ${0} ROOTDIR_TO_MP3"
  exit 1
fi

DIR=${1}
kill -9 $(ps -ef | grep mpi3_start.sh | grep "${DIR}" | awk '{print $2}')
kill -9 $(ps -ef | grep mpg321 |        grep "${DIR}" | awk '{print $2}')

