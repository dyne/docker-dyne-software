#
# Build this image with the command
#   docker build -f docker/build -t dyne/social-wallet-api:latest
#
# Then run with the command
#   docker run -p 3000:3000 -it dyne/social-wallet-api:latest
#

FROM dyne/clojure:ascii
ENV debian stretch

LABEL maintainer="Denis Roio <jaromil@dyne.org>" \
	  homepage="socialwallet.dyne.org"

# CLI arguments
ARG foreground=true

ENV LEIN_VERSION=2.9.3 \
	LEIN_INSTALL=/usr/local/bin/ \
	PATH=$PATH:$LEIN_INSTALL \
	LEIN_ROOT=1


# Nodejs repository
ADD https://deb.nodesource.com/gpgkey/nodesource.gpg.key nodesource.gpg.key
RUN apt-key add nodesource.gpg.key
RUN	echo "deb http://deb.nodesource.com/node_8.x $debian main" \
	>> /etc/apt/sources.list


## needed for update-alternatives to not fail
RUN apt-get update && apt-get upgrade -y -q \
	&& apt-get install -y -q --allow-downgrades --no-install-recommends \
       		   mongodb nodejs supervisor gnupg1 ca-certificates python-pip \
 	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# https://github.com/bendikro/supervisord-dependent-startup
RUN pip install supervisord-dependent-startup

# fix npm - not the latest version installed by apt-get
# RUN npm install -g npm
# RUN npm install -g mongo-express

WORKDIR /swapi

RUN git clone https://github.com/commonfare-net/social-wallet-api /swapi \
	&& git checkout origin/without-apikey
COPY swapi.yml /swapi/resources/social-wallet-api.yaml

# cache build deps
RUN lein deps

WORKDIR /swapp

RUN git clone https://github.com/commonfare-net/social-wallet /swapp \
	&& git checkout feature/stable-2

# cache build deps
RUN lein deps

# ADD https://raw.githubusercontent.com/dyne/docker-dyne-software/master/social-wallet-api/supervisord.conf \ 
# 	/etc/supervisor/supervisord.conf

COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY email-conf.yaml /swapp/email-conf.yaml

RUN sed -i "s/nodaemon=true/nodaemon=$foreground/" /etc/supervisor/supervisord.conf

# supervisor
EXPOSE 9001 9001
# SWAPI
EXPOSE 3000 3000
# mongo-express
EXPOSE 8081 8081

CMD bash -c '/etc/init.d/supervisor start'
