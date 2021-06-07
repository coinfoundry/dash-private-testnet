FROM ubuntu:xenial
MAINTAINER oliver@weichhold.com

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.17.2.0/s6-overlay-amd64.tar.gz \
    https://github.com/dashpay/dash/releases/download/v0.17.0.2/dashcore-0.17.0.2-x86_64-linux-gnu.tar.gz /tmp/

RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && \
    cd /tmp && tar xvf dashcore*.tar.gz && cp -r /tmp/dashcore*/bin/* /usr/bin && \
    rm -rf /usr/share/man/* /usr/share/groff/* /usr/share/info/* /var/cache/man/* /tmp/* /var/lib/apt/lists/*

EXPOSE 16001 16002 16003

ENTRYPOINT ["/init"]
VOLUME ["/data"]
ADD rootfs /
