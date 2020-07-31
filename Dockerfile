FROM alpine:3.7


ENV PROXYCHAINS_CONF=/etc/proxychains/proxychains.conf \
    TOR_CONF=/etc/tor/torrc \
    TOR_LOG_DIR=/var/log/s6/tor \
    DNSMASQ_CONF=/etc/dnsmasq.conf \
    DNSMASQ_LOG_DIR=/var/log/s6/dnsmasq

RUN echo '@edge http://dl-cdn.alpinelinux.org/alpine/edge/main' >> \
      /etc/apk/repositories && \
    echo '@edge http://dl-cdn.alpinelinux.org/alpine/edge/community' >> \
      /etc/apk/repositories && \
    apk add --update \
      dnsmasq \
      openssl \
      proxychains-ng \
      s6 \
      tor@edge && \
    rm -rf /var/cache/apk/*

COPY etc/torrc $TOR_CONF
COPY etc/proxychains/proxychains.conf $PROXYCHAINS_CONF
COPY etc/dnsmasq.conf $DNSMASQ_CONF
COPY etc/s6 /etc/s6
COPY bin/tor_boot /usr/bin/tor_boot
COPY bin/tor_wait /usr/bin/tor_wait
COPY bin/proxychains_wrapper /usr/bin/proxychains_wrapper

RUN mkdir -p "$TOR_LOG_DIR" "$DNSMASQ_LOG_DIR" && \
    chown tor $TOR_CONF && \
    chmod 0644 $PROXYCHAINS_CONF && \
    chmod 0755 \
      /etc/s6/*/log/run \
      /etc/s6/*/run \
      /usr/bin/tor_boot \
      /usr/bin/tor_wait \
      /usr/bin/proxychains_wrapper

RUN update-rc.d -f polipo remove

RUN gem install excon -v 0.44.4

ADD start.rb /usr/local/bin/start.rb
RUN chmod +x /usr/local/bin/start.rb

ADD newnym.sh /usr/local/bin/newnym.sh
RUN chmod +x /usr/local/bin/newnym.sh

ADD haproxy.cfg.erb /usr/local/etc/haproxy.cfg.erb
ADD uncachable /etc/polipo/uncachable

EXPOSE 5566 4444

CMD /usr/local/bin/start.rb