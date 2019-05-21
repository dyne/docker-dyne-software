FROM dyne/devuan:beowulf

RUN apt-get update -y -q && apt-get install -y -q zsh cryptsetup gawk steghide make gcc sudo gettext file bsdmainutils
RUN git clone https://github.com/dyne/tomb /Tomb

# WORKDIR /Tomb/extras
# RUN ./install_sphinx.sh
# RUN cp test/sphinx.cfg /etc/sphinx/config

WORKDIR /Tomb
# RUN make -C extras/kdf-keys
# RUN make -C extras/kdf-keys install

CMD cd /Tomb && git log -1 && git status && make -C /Tomb/extras/test
