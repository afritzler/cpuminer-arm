#!/bin/bash

echo "Starting up ..."
echo "minerd -a $ALGO -o $URL -u $EMAIL -p x -t $THREADS"

docker run -d \
--name minerd \
-e ALGO="$AGLO" \
-e URL="$URL" \
-e EMAIL="$EMAIL" \
-e PASSWORD="$PASSWORD" \
-e THREADS="$THREADS" \
afritzler/cpuminer-arm:latest