FROM arm32v7/ubuntu:17.04

# update raspbian
RUN apt-get update -y
# install build dependencies
RUN apt-get install -t autoconf \
    libcurl4-openssl-dev \
    libjansson-dev \
    openssl \
    libssl-dev \
    gcc \
    gawk \
 && rm -rf /var/lib/apt/lists/*

# clone and build
RUN git clone https://github.com/lucasjones/cpuminer-multi.git
RUN cd cpuminer-multi
RUN ./autogen.sh
RUN ./configure
RUN make
