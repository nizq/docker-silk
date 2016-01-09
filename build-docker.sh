#!/bin/bash

docker build -t nizq/silk-build .
docker run --rm -ti \
       --net host \
       -v `pwd`:/source \
       nizq/silk-build /source/build-silk.sh

cp Dockerfile.final final/Dockerfile
cd final
docker build -t nizq/silk .
