FROM dyne/devuan:beowulf
ENV  debian stretch
LABEL maintainer="Denis Roio <jaromil@dyne.org>" \
	homepage="https:dowse.eu" \
	org.label-schema.vendor="Dyne.org" \
	org.label-schema.version=$VERSION \
	org.dyne.zenroom.license="AGPL-3.0"

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN apt-get -y -q update
RUN apt-get -y -q --no-install-recommends install zsh iptables ipset build-essential autoconf automake libhiredis-dev libkmod-dev libjemalloc-dev pkg-config libtool libltdl-dev libsodium-dev libldns-dev libnetfilter-queue-dev uuid-dev zlib1g-dev cmake liblo-dev nmap python3-flask python3-redis xmlstarlet wget libcap2-bin redis libhiredis-dev isc-dhcp-server snooze netdata libwebsockets8 supervisor mosquitto kmod libmosquitto-dev

ENV  U dowse
ENV  H /opt/app

RUN	useradd -d $H -s /bin/nologin $U
RUN	mkdir -p /var/log/dowse

WORKDIR /opt/app

COPY dnscrypt-proxy dnscrypt-proxy
RUN cd dnscrypt-proxy && ./autogen.sh && ./configure --enable-plugins --disable-systemd && make && make install

ARG SHA=LATEST
RUN SHA=${SHA} \
	git clone --recurse-submodules --branch summer-cleanup https://github.com/dyne/dowse /opt/app/dowse

RUN cd dowse && make && make install

# webui
EXPOSE 8000
# netdata
EXPOSE 19999
# dns
EXPOSE 5353/udp
# mosquitto
EXPOSE 1883
RUN echo "source /usr/local/dowse/zshrc" > $H/.zshrc
CMD /bin/zsh
