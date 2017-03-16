FROM ubuntu:xenial
MAINTAINER Kelvin Chen <kelvin@kelvinchen.org>

ENV DATA_DIR=/usr/local/bitcoin

VOLUME $DATA_DIR
EXPOSE 8332 8333

COPY container-root/etc/apt /etc/apt

RUN apt-key adv --recv-key --keyserver keyserver.ubuntu.com 8842CE5E \
    && apt-get update \
    && apt-get install -y bitcoind \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY container-root/ /

CMD ["start-bitcoind"]
