# Dockerfile to build a small system image with gitzone
# mostly used for testing, do not use in production
# by jaromil - Nov.2018

FROM dyne/devuan:ascii
ENV  debian stretch
LABEL maintainer="Denis Roio <jaromil@dyne.org>" \
	  homepage="https://github.com/dyne/gitzone"

expose 2222
expose 5353/udp

ENV  U gitzone
ENV  H /home/$U

RUN apt-get -y -q update
RUN apt-get -y -q install bind9 openssh-server make

run useradd $U && mkdir -p  $H/.ssh

run ssh-keygen -t ed25519 -f $H/.ssh/id_ed25519 \
	&& chown -R $U:$U $H/.ssh && chmod -R go-rwx $H/.ssh/

RUN git clone https://github.com/dyne/gitzone /app
WORKDIR /app


# copy bin/gitzone-install gitzone-install
run make install

run mkdir -p /etc/bind/repos
run gitzone-install $U $H/.ssh/id_ed25519.pub
run echo "zone 'gitzone.local' { type master; notify yes; file '/var/cache/bind/gitzone/gitzone.local'; allow-transfer { transfer; }; };" > /etc/bind/repos/gitzone.conf

workdir $H
user $U
cmd /bin/bash

# cmd /bin/bash -c '/etc/init.d/ssh start && /etc/init.d/named start'
