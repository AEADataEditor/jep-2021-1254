#!/bin/bash

if [[ -f config.txt ]]
then 
   configfile=config.txt
else 
   configfile=init.config.txt
fi

# name of the file to run
file=aearep-3116/163061/build_from_source.sh


echo "================================"
echo "Pulling defaults from ${configfile}:"
cat $configfile
echo "--------------------------------"

source $configfile

echo "================================"
echo "Running docker:"
set -ev

# When we are on Github Actions
if [[ $CI ]] 
then
   DOCKEROPTS="--rm"
   DOCKERIMG=$(echo $GITHUB_REPOSITORY | tr [A-Z] [a-z])
   TAG=latest
else
   DOCKEROPTS="-it --rm -u $(id -u ${USER}):$(id -g ${USER}) "
   DOCKERIMG=$(echo $MYHUBID/$MYIMG | tr [A-Z] [a-z])
fi

# a few names
basefile=$(basename $file)
codedir=$(dirname $file)

# run the docker and the Stata file
# note that the working directory will be set to '/code' by default

time docker run $DOCKEROPTS \
  -v ${STATALIC}:/usr/local/stata/stata.lic \
  -v $(pwd)/${codedir}:/home/rstudio/project \
  -w /home/rstudio/project \
  --entrypoint /home/rstudio/project/${basefile} \
  $DOCKERIMG:$TAG "$@"

