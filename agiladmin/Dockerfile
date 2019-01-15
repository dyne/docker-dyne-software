#
# Build this image with the command
#   docker build -f docker/build -t dyne/clojure/agiladmin:latest
#
# Then run with the command
#   docker run -p 3000:3000 -it dyne/clojure/agiladmin:latest
#

FROM dyne/clojure
LABEL maintainer="Denis Roio <jaromil@dyne.org>" \
	  homepage="https://github.com/dyne/agiladmin"
# ENV VERSION=AUTO_STRICT

EXPOSE 3000

# COPY . /app
RUN git clone https://github.com/dyne/agiladmin /app
WORKDIR /app

RUN  mkdir -p /usr/share/man/man1/ \
	 && apt-get update \
	 && apt-get install -y -q --allow-downgrades --no-install-recommends \
	 		 mongodb \
	 && apt-get clean \
	 && lein deps

# 	 && rm -rf /var/lib/apt/lists/* \

CMD /etc/init.d/mongodb start \
	&& lein ring server-headless
