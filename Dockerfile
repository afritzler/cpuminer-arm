FROM arm32v7/ubuntu:17.04

# update raspbian
RUN apt-get update -y
# install build dependencies
RUN apt-get install -y autoconf \
    autogen \
    libcurl4-openssl-dev \
    libjansson-dev \
    openssl \
    libssl-dev \
    gcc \
    gawk \
    git \
    apt-utils \
 && rm -rf /var/lib/apt/lists/*

# clone and build
RUN git clone https://github.com/lucasjones/cpuminer-multi.git
RUN cd cpuminer-multi && ./autogen.sh && ./configure && make

# copy binary
RUN cp cpuminer-multi/minerd /minerd

# cleanup
RUN rm -rf cpuminer-multi

# start minerd
CMD /minerd -a $ALGO -o $URl -u $EMAIL -p x -t $THREADS