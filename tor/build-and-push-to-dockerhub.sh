#!/bin/sh

export VER=0.4.6.8

docker pull blockstream/tor:latest
docker build -t blockstream/tor:${VER} . || { echo -e "\nSomething broke"; exit 1; }
docker push blockstream/tor:${VER}
docker tag blockstream/tor:${VER} blockstream/tor:latest
docker push blockstream/tor:latest
SHA=$(docker inspect --format='{{index .RepoDigests 0}}' blockstream/tor:latest)

# armv7 
#docker build -f Dockerfile.armv7 -t blockstream/tor:${VER}-armv7 . || { echo -e "\nSomething broke"; exit 1; }
#docker push blockstream/tor:${VER}-armv7
#SHA=$(docker inspect --format='{{index .RepoDigests 0}}' blockstream/tor:${VER}-armv7)

echo -e "The new image is:\n${SHA}"
