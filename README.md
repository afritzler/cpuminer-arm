# cpuminer-arm
CPU Miner (minerd) for Raspberry Pi and other ARM based boards

# Prerequisites
* Docker installed
* make

# Build & Push
Get the github repository first
```
git clone https://github.com/afritzler/cpuminer-arm.git
``` 
To build the Docker image locally
```
cd cpuminer-arm
make
```
To publish the image to Dockerhub
```
docker login
...
make push
```
