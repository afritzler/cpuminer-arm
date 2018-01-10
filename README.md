# cpuminer-arm
CPU Miner (minerd) for Raspberry Pi and other ARM based boards

# Prerequisites
* Docker installed
* make
* Miningpool (e.g. Minergate)

# Run
To start mining run (replace your email address)
```
# mining Monero Dollar
docker run -it afritzler/cpuminer-arm:v1 
/minerd -a cryptonight -o stratum+tcp://xmr.pool.minergate.com:45560 -u youremail@address.com -p x -t 4

# mining ByteCoin
docker run -it afritzler/cpuminer-arm:v1 
/minerd -a cryptonight -o stratum+tcp://bcn.pool.minergate.com:45550 -u youremail@address.com -p x -t 4
```
You can change the thread count via the `-t` flag (default=4). Make sure your device doesn't overheat!
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
