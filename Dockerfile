FROM arm32v7/ubuntu:17.04

# update raspbian
apt-get update -y
# install build dependencies
apt-get install autoconf libcurl4-openssl-dev libjansson-dev openssl libssl-dev gcc gawk

# clone and build
git clone https://github.com/lucasjones/cpuminer-multi.git
cd cpuminer-multi
./autogen.sh
./configure
make
