FROM ubuntu:22.04
RUN apt update -y && apt install -y wget tar build-essential binutils lintian debhelper dh-make devscripts \
    gnupg2 && gnupg -- version && gpg --generate-key && mkdir -pv /home/package && export DEBEMAIL="tiktikimelbo7@gmail.com" && export DEBFULLNAME="tiktikimelbo7"
WORKDIR /home/package
RUN chmod 777 /home/package
RUN wget https://github.com/aria2/aria2/releases/download/release-1.36.0/aria2-1.36.0.tar.gz && tar -xf aria2-1.36.0.tar.gz \
    && cd aria2-1.36.0 && dh_make -y -s && ls -a
