FROM dyne/devuan:beowulf
ENV debian buster

LABEL maintainer="Denis Roio <jaromil@dyne.org>" \
	  homepage="https://github.com/decodeproject/zenroom-tp-python"

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN apt-get update -y -q \
	&& apt-get install -y -q \
    pkg-config \
    python3 \
    python3-pip \
    python3-stdeb \
	python3-dev \
    python3-protobuf \
    python3-cbor \
    python3-colorlog \
    python3-toml \
    python3-yaml \
    python3-zmq \
    && apt-get clean

RUN pip3 install grpcio-tools wheel

RUN mkdir -p /var/log/sawtooth /project

WORKDIR /project

# TODO: make sawtooth's release version an ENV var
# for latest git
# RUN git clone https://github.com/hyperledger/sawtooth-sdk-python.git /project/sawtooth-sdk-python
RUN wget https://github.com/hyperledger/sawtooth-sdk-python/archive/v1.2.1.tar.gz \
	&& tar xf v1.2.1.tar.gz && ln -s sawtooth-sdk-python-1.2.1 sawtooth-sdk-python \
    && /project/sawtooth-sdk-python/bin/protogen \
	&& pip3 install -e /project/sawtooth-sdk-python \
	&& rm -rf v1.2.1.tar.gz sawtooth-sdk-python-1.2.1 sawtooth-sdk-python

# using latest zenroom-tp-python on git
RUN git clone https://github.com/DECODEproject/sawroom /project/zenroom-tp-python \
	&& pip3 install -e /project/zenroom-tp-python

ENV PATH=$PATH:/project/zenroom-tp-python/bin
WORKDIR /project/zenroom-tp-python

CMD zenroom-tp-python
