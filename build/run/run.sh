#!/bin/bash

source .env || exit 1

timeStamp=$(date +'%Y%m%d%H%M%S')
pkg_name="UBUNTU16_64-F9TEAMS-890-"$timeStamp"-FOSS-1000"

sed \
-i.bak "s/--build-ts=[0-9]*/--build-ts="$timeStamp"/g" \
docker-compose.yml 

docker-compose up
docker-compose down

cd $BUILD
cd ..
cd _conf

sed \
-i.bak "s/[0-9]\{14\}/"$timeStamp"/g" \
pkg-list

