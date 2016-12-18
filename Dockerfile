FROM debian:latest
MAINTAINER Chen Chiu <docker-maintainer@blitzcorp.org>
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update && \
	echo 'deb http://www.linotp.org/apt/debian jessie linotp' >> /etc/apt/sources.list && \
	gpg --search-keys 913DFF12F86258E5 && \
        gpg --keyserver keys.gnupg.net --recv-keys 913DFF12F86258E5 && \
        gpg --export 913DFF12F86258E5 | apt-key add - && \
	apt-get update && \
	apt-get -y install linotp linotp-useridresolver wget gpg python-ldap && \
        apt-get -y install linotp-smsprovider linotp-adminclient-cli linotp-adminclient-gui libpam-linotp
	

EXPOSE 80 443 5347
