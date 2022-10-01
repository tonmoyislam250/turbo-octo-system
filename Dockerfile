FROM ubuntu:22.04
RUN apt update -y && apt install -y build-essential binutils lintian debhelper dh-make devscripts \
    gnupg2 && gnupg -- version && gpg --generate-key && mkdir /home/package
