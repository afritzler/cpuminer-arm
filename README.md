# cpuminer-arm
CPU Miner (minerd) for Raspberry Pi and other ARM based boards

# Prerequisites
* Docker installed
* make
* Miningpool (e.g. Minergate)

# Run

To run the cpuminer container

```shell
docker run -d \
--name minerd \
-e URL="stratum+tcp://bcn.pool.minergate.com:45550" \
-e EMAIL="youremail@mail.com" \
-e PASSWORD="x" \
-e THREADS="1" \
afritzler/cpuminer-arm:latest
```

You can change the thread count by adjusting the `THREADS=4` variable. Make sure your device doesn't overheat!

```shell
watch vcgencmd measure_temp
```

# Build & Push
Get the github repository first

```shell
git clone https://github.com/afritzler/cpuminer-arm.git
```

To build the Docker image locally

```shell
cd cpuminer-arm
make
```

To publish the image to Dockerhub

```shell
docker login
...
make push-cpuminer
```
