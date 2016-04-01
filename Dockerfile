FROM ubuntu:latest
MAINTAINER Kelvin Chen <kelvin@kelvinchen.org>

VOLUME /root/.bitcoin
EXPOSE 8332 8333

# Install dependencies.
RUN apt-get install --no-install-recommends -y software-properties-common \
    && add-apt-repository -y ppa:bitcoin/bitcoin \
    && apt-get update \
    && apt-get install --no-install-recommends -y \
        curl \
        git \
        ca-certificates \
        build-essential \
        libtool \
        autotools-dev \
        automake \
        pkg-config \
        libssl-dev \
        libevent-dev \
        bsdmainutils \
        libboost-system-dev \
        libboost-filesystem-dev \
        libboost-chrono-dev \
        libboost-program-options-dev \
        libboost-test-dev \
        libboost-thread-dev \
        libdb4.8-dev \
        libdb4.8++-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV BITCOIN_VER=v0.12.0

# Build and install bitcoind.
RUN git clone https://github.com/bitcoin/bitcoin.git /tmp/bitcoin \
    && cd /tmp/bitcoin \
    && git checkout $BITCOIN_VER \
    && ./autogen.sh \
    && ./configure --disable-tests --without-miniupnpc \
    && make -j $(nproc) && make install \
    && rm -rf /tmp/bitcoin

COPY bitcoin.conf bitcoind.sh /

CMD ["/bitcoind.sh"]
