FROM ubuntu:rolling

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
    make \
 && rm -rf /var/lib/apt/lists/*

# clone and build
WORKDIR /
RUN git clone https://github.com/lucasjones/cpuminer-multi.git
RUN cd cpuminer-multi && ./autogen.sh && ./configure && make

FROM ubuntu:rolling
RUN apt-get update -y
RUN apt-get install -y \
    libcurl4 \
    libjansson4 \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/bin
COPY --from=0 /cpuminer-multi/minerd .
COPY /scripts/minerd.sh .

# start minerd
CMD ["minerd.sh"]
