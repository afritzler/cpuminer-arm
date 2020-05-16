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
RUN git clone https://github.com/lucasjones/cpuminer-multi.git
RUN cd cpuminer-multi && ./autogen.sh && ./configure && make

# copy binary and startup script
RUN cp cpuminer-multi/minerd /usr/bin/minerd
COPY /scripts/minerd.sh /usr/local/bin/minerd.sh

# start minerd
CMD ["minerd.sh"]