FROM ubuntu:22.04
RUN apt update -y && DEBIAN_FRONTEND="noninteractive" && apt install -y wget tar build-essential binutils lintian debhelper git dh-make devscripts \
    gnupg2 && gpg --batch --passphrase '' --quick-gen-key tiktikimelbo7@gmail.com default default && mkdir -pv /home/package
RUN apt install -y libc-ares-dev libsqlite3-dev zlib1g-dev pkg-config libssh2-1-dev libssl-dev libcppunit-dev curl rclone
WORKDIR /home/package
RUN chmod 777 /home/package
#RUN wget https://github.com/aria2/aria2/releases/download/release-1.36.0/aria2-1.36.0.tar.gz && tar -xf aria2-1.36.0.tar.gz \
RUN git clone https://github.com/qbittorrent/qBittorrent \
    && mv qBittorrent qBittorrent-4.4.2 && cd qBittorrent-4.4.2 && export DEBEMAIL="tiktikimelbo7@gmail.com" && export DEBFULLNAME="Tonmoy Islam" && export LOGNAME="Tonmoy" \
    && echo $LOGNAME && echo $DEBFULLNAME \
    && dh_make -s -y --copyright=gpl3 --createorig && ls -a \
    && dpkg-buildpackage && ls -a && ls -a ../
#RUN cd ../ && tar -czf package.tar.gz package
RUN mkdir /.config && mkdir /.config/rclone && mkdir /root/.config \
    && mkdir /root/.config/rclone
RUN curl -L https://gist.githubusercontent.com/tonmoyislam250/51987f3eac6963992a8d09debaf9d4d8/raw/ea7a0a0895e1060f8224e4e8950cca064acf25f1/gistfile1.txt >/.config/rclone/rclone.conf
RUN cp /.config/rclone/rclone.conf /root/.config/rclone/
#RUN rclone copy /home/package/ teamdrive:qbit/Sharedlib/
