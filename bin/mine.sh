#!/bin/bash

echo "Starting up ..."
echo "docker run -it afritzler/cpuminer-arm:v1 /minerd -a $ALGO -o $URL -u $EMAIL -p x -t $THREADS"

docker run -it afritzler/cpuminer-arm:v1 /minerd -a $ALGO -o $URL -u $EMAIL -p x -t $THREADS