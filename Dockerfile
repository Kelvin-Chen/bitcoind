FROM kelvinchen/base:latest
MAINTAINER Kelvin Chen <kelvin@kelvinchen.org>

# Install dependencies.
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        build-essential \
        libtool \
        autotools-dev \
        autoconf \
        pkg-config \
        libssl-dev \
        automake \
        libboost-all-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV BITCOIN_VER v0.10.2

# Build and install bitcoind.
RUN git clone https://github.com/bitcoin/bitcoin.git /tmp/bitcoin && \
    cd /tmp/bitcoin && \
    git checkout $BITCOIN_VER && \
    ./autogen.sh && \
    ./configure --disable-wallet --disable-tests --without-miniupnpc && \
    make -j $(nproc) && make install && \
    rm -rf /tmp/bitcoin

# Create the bitcoin user and group.
RUN groupadd bitcoin && \
    useradd -g bitcoin -s /bin/bash -c "User for bitcoind." \
        -d "/home/bitcoin" bitcoin && \
    mkdir -p /home/bitcoin/.bitcoin && \
    chown -R bitcoin:bitcoin /home/bitcoin

USER bitcoin
WORKDIR /home/bitcoin

EXPOSE 8332 8333

COPY bitcoin.conf start.sh /home/bitcoin/

CMD ["/home/bitcoin/start.sh"]
