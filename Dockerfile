FROM alpine:3.7

RUN apk update && apk upgrade
RUN apk add tor
RUN apk add proxychains-ng

ENV PROXYCHAINS_CONF=/etc/proxychains/proxychains.conf \
    TOR_CONF=/etc/tor/torrc \
    TOR_LOG_DIR=/var/log/s6/tor \
    DNSMASQ_CONF=/etc/dnsmasq.conf \
    DNSMASQ_LOG_DIR=/var/log/s6/dnsmasq



ENV OPENSSL_DIR	/openssl
ENV OPENSSL_VERSION  1.0.2-chacha
ENV TERM xterm


RUN \
	# pull and extract module
	mkdir $OPENSSL_DIR /src_openssl		&& \
	wget --no-check-certificate \
		https://github.com/PeterMosmans/openssl/archive/1.0.2-chacha.tar.gz \
		-O openssl.tgz 			&& \
	\
	tar   -xzf openssl.tgz -C /src_openssl --strip-components=1	&& \
	cd    /src_openssl			&& \
	# build openssl {
	# install development tools
	apk add --no-cache musl-dev gcc make zlib-dev	&& \
	./config --prefix=$OPENSSL_DIR --openssldir=$OPENSSL_DIR/ssl \
		enable-zlib enable-ssl3  enable-rc5  enable-rc2  enable-GOST \
		enable-cms  enable-md2   enable-mdc2 enable-ec   enable-ec2m \
		enable-ecdh enable-ecdsa enable-seed enable-idea enable-camellia \
		enable-rfc3779 enable-ec_nistp_64_gcc_128 \
		-static experimental-jpake -DOPENSSL_USE_BUILD_DATE	&& \
	make depend && make && make report && make install	&& \
	# simple test
	echo -e "# number of ciphers $OPENSSL_DIR/bin/openssl: " && \
	$OPENSSL_DIR/bin/openssl ciphers -V ALL:COMPLEMENTOFALL:aNULL|wc -l && \
	# cleanup
	apk del --purge musl-dev gcc make zlib-dev	&& \
	# build openssl }
	cd   /					&& \
	rm   -r /src_openssl openssl.tgz


  
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