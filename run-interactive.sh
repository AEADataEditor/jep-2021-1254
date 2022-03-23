#!/bin/bash

if [[ -f config.txt ]]
then 
   configfile=config.txt
else 
   configfile=init.config.txt
fi

# name of the file to run
file=code/main.do


echo "================================"
echo "Pulling defaults from ${configfile}:"
cat $configfile
echo "--------------------------------"

source $configfile

echo "================================"
echo "Running docker:"
set -ev

DOCKEROPTS=" --rm -u 0 "
DOCKERIMG=$(echo $MYHUBID/$MYIMG | tr [A-Z] [a-z])

# ensure that the directories are writable by Docker

# this might work locally

#-e DISABLE_AUTH=true \

# This is used for Codespaces, and can work elsewhere
DOCKEROPTS="$DOCKEROPTS -e PASSWORD=testing"

# run the docker 

time docker run $DOCKEROPTS \
  -v ${STATALIC}:/usr/local/stata/stata.lic \
  -v $(pwd):/home/rstudio/project \
  -p 8787:8787 \
  --entrypoint /init \
  $DOCKERIMG:$TAG "$@"
