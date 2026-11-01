FROM debian:stable

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install build-essential

WORKDIR /src
ADD Makefile *.c *.h *.control *.sh .

RUN make deb
RUN dpkg -i sha2wordlist.deb

WORKDIR /
RUN sha2wordlist < /etc/debian_version
