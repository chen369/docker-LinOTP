FROM debian:latest
MAINTAINER Chen Chiu <docker-maintainer@blitzcorp.org>
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update && \
	apt-get install -y wget gpg python-ldap && \
	echo 'deb http://www.linotp.org/apt/debian jessie linotp' >> /etc/apt/sources.list && \
	gpg --search-keys 913DFF12F86258E5 && \
  gpg --keyserver keys.gnupg.net --recv-keys 913DFF12F86258E5 && \
  gpg --export 913DFF12F86258E5 | apt-key add - && \
	apt-get update && \
	apt-get -y install linotp linotp-useridresolver && \
  apt-get -y install linotp-smsprovider linotp-adminclient-cli linotp-adminclient-gui libpam-linotp && \
	apt-get clean

EXPOSE 80 443 5347
