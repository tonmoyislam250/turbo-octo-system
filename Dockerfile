FROM ubuntu:22.04
RUN apt update -y && DEBIAN_FRONTEND="noninteractive" && apt install -y wget tar build-essential binutils lintian debhelper dh-make devscripts \
    gnupg2 && gpg --batch --passphrase '' --quick-gen-key tiktikimelbo7@gmail.com default default && mkdir -pv /home/package
WORKDIR /home/package
RUN chmod 777 /home/package
RUN wget https://github.com/aria2/aria2/releases/download/release-1.36.0/aria2-1.36.0.tar.gz && tar -xf aria2-1.36.0.tar.gz \
    && cd aria2-1.36.0 && DEBEMAIL="tiktikimelbo7@gmail.com" && DEBFULLNAME="Tonmoy Islam" && LOGNAME="Tonmoy Islam" && dh_make -y -s && ls -a
