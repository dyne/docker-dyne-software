#!/bin/sh

dowsesrc=${1:-/home/jrml/devel/dowse}
dnscryptsrc=${1:-/home/jrml/devel/dnscrypt-proxy}

# --mount type=bind,source=${dowsesrc},destination=/opt/app/dowse \
# --mount type=bind,source=$(pwd)/dnscrypt-proxy,destination=/opt/app/dnscrypt-proxy \

if test -r "/usr/local/dowse"; then
	docker run -p 8000:8000 -p 19999:19999 -p 5353:5353 -p 1883:1883 \
		   --mount type=bind,source=/usr/local/dowse,destination=/usr/local/dowse \
		   -it dyne/dowse:latest
else
	echo "dowse not found in /usr/local/dowse"
	exit 1
fi


# dlopen quick TEST:
#
# /opt/app/dnscrypt-proxy/src/proxy/dnscrypt-proxy -a 172.17.0.2:53 -l dnscrypt.log -L /opt/app/dnscrypt-proxy/dnscrypt-resolvers.csv -R ipredator -I -X /usr/local/dowse/lib/dnscrypt_dowse.so,debug -m 7 -u dowse
