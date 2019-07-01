#!/bin/sh


if test "$1" = ""; then
	echo "usage: $0 path-to-zenroom-source"
	return 1
fi

src=$1
module=src/redis_zenroom.so-x86_64.so
if test -r "$src/$module"; then
	shift 1
	docker run -p 6379:6379 --mount type=bind,source="$src",destination=/app/zenroom \
		   -it dyne/zenroom-redis:latest zenroom/test/redis_module.sh
else
	echo "redis module not found in $src/$module"
	exit 1
fi
