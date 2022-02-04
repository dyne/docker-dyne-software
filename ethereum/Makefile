
# SOLC version 0.8.11

SOLC_VERSION   := 0.8.11
GETH_VERSION   := 1.10.14
ALPINE_VERSION := 3.15
GO_VERSION     := 1.17

all: solidity geth


solc:
	docker build . -f Dockerfile.solc -t dyne/solc:${SOLC_VERSION} \
		--build-arg SOLC_VERSION=${SOLC_VERSION} \
		--build-arg ALPINE_VERSION=${ALPINE_VERSION}

geth:
	docker build . -f Dockerfile.geth -t dyne/geth:${GETH_VERSION} \
		--build-arg GETH_VERSION=${GETH_VERSION} \
		--build-arg ALPINE_VERSION=${ALPINE_VERSION} \
		--build-arg GO_VERSION=${GO_VERSION}

