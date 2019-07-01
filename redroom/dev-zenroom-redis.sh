#!/bin/sh

if test "$1" = ""; then
	echo "usage: ./devel path-to-redroom-source"
	return 1
fi

src=$1

if test -r "$src/redroom.so"; then
	shift 1
	docker run -p 6379:6379 --mount type=bind,source="$src",destination=/app/redroom \
		   -it dyne/redroom:latest $*
else
	echo "redis module not found in $src/redroom.so"
	exit 1
fi
