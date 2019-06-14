#!/bin/sh

if test "$1" = ""; then
	echo "usage: ./devel path-to-zenroom-source"
	return 1
fi

src=$1

if test -r "$src/src/redis_zenroom.so-x86_64.so"; then
	shift 1
	docker run -p 6379:6379 --mount type=bind,source="$src",destination=/app/zenroom \
		   -it dyne/zenroom-redis:latest $*
else
	echo "redis module not found in $src/src/redis_zenroom.so-x86_64.so"
	exit 1
fi
