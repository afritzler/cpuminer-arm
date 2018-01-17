# cpuminer-arm
CPU Miner (minerd) for Raspberry Pi and other ARM based boards

# Prerequisites
* Docker installed
* make
* Miningpool (e.g. Minergate)

# Run
Configure your mining environment
```
cp source_me.example source_me
```
Adjust the `source_me` file 
```
export ALGO=cryptonight
export URL=stratum+tcp://bcn.pool.minergate.com:45550
export EMAIL=youremail@address.com
export PASSWORD=x
export THREADS=4
```
Start mining
```
source source_me && ./bin/mine.sh
```
You can change the thread count by adjusting the `THREADS=4` variable. Make sure your device doesn't overheat!
```
watch vcgencmd measure_temp
```

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
