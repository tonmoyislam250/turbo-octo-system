FROM ubuntu:22.04
RUN apt update -y && DEBIAN_FRONTEND="noninteractive" && apt install -y wget tar build-essential binutils lintian debhelper dh-make devscripts \
    gnupg2 && gpg --batch --passphrase '' --quick-gen-key tiktikimelbo7@gmail.com default default && mkdir -pv /home/package
FROM apt install -y libc-ares-dev libsqlite3-dev zlib1g-dev pkg-config libssh2-1-dev libssl-dev
WORKDIR /home/package
RUN chmod 777 /home/package
RUN wget https://github.com/aria2/aria2/releases/download/release-1.36.0/aria2-1.36.0.tar.gz && tar -xf aria2-1.36.0.tar.gz \
    && cd aria2-1.36.0 && export DEBEMAIL="tiktikimelbo7@gmail.com" && export DEBFULLNAME="Tonmoy Islam" && export LOGNAME="Tonmoy" \
    && echo $LOGNAME && echo $DEBFULLNAME \
    && dh_make -s -y --copyright=gpl3 --createorig && ls -a \
    && dpkg-buildpackage && ls -a && ls -a ../
