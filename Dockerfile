FROM ubuntu:18.04 AS builder

# update raspbian
RUN apt-get update -y && apt-get install -y --no-install-recommends autoconf \
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
WORKDIR /cpuminer-multi
RUN ./autogen.sh && ./configure && make

FROM ubuntu:18.04
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    libcurl4 \
    libjansson4 \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/bin
COPY --from=builder /cpuminer-multi/minerd .
COPY /scripts/minerd.sh .

# start minerd
CMD ["minerd.sh"]
