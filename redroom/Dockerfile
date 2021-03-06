FROM dyne/devuan:beowulf
ENV debian buster

# Metadata params
ARG BUILD_DATE
ARG VERSION
ARG VCS_URL
ARG VCS_REF
# Metadata
LABEL org.label-schema.build-date=$BUILD_DATE \
org.label-schema.name="RedRoom" \
org.label-schema.description="Crypto module for Redis based on Zenroom" \
org.label-schema.url="https://redroom.dyne.org" \
org.label-schema.vcs-url=$VCS_URL \
org.label-schema.vcs-ref=$VCS_REF \
org.label-schema.vendor="Dyne.org" \
org.label-schema.version=$VERSION \
org.label-schema.schema-version="1.0" \
org.dyne.zenroom.docker.dockerfile="/Dockerfile" \
org.dyne.zenroom.license="AGPL-3.0" \
maintainer="Denis Roio <jaromil@dyne.org>" \
homepage=$VCS_URL

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

WORKDIR /app

RUN apt-get update -y -q
RUN apt-get install -y -q cmake gcc zsh xxd patch make libc6-dev

COPY redis_dlmopen.patch .
RUN wget http://download.redis.io/releases/redis-5.0.5.tar.gz && tar xf redis-5.0.5.tar.gz \
	&& cd redis-5.0.5 && patch -p1 < ../redis_dlmopen.patch && make && make install
RUN rm -rf redis-5.0.5*

RUN git clone --recursive https://github.com/DECODEproject/zenroom.git && cd zenroom \
	&& make linux-lib


RUN apt-get -y -q install libevent-dev
RUN git clone git://github.com/nicolasff/webdis.git && cd webdis && make

# use SHA hash of git HEAD to update docker on new commits
ARG SHA=LATEST
RUN SHA=${SHA} \
	git clone https://github.com/decodeproject/redroom.git && cd redroom && make

RUN apt-get -y -q remove --purge cmake gcc xxd patch make libc6-dev perl
RUN apt-get -y -q remove --purge openssl tzdata tmux wget libslang2 bash-completion
RUN apt-get -y -q remove --purge iftop openssh-client
RUN apt-get -y -q autoremove
RUN apt-get -y -q clean
RUN rm -rf /var/lib/apt
RUN rm -rf /usr/share

COPY webdis.sh .
CMD redis-server --protected-mode no --loadmodule redroom/redroom.so
