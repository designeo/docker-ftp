FROM alpine:latest

MAINTAINER Tomas Polivka <tomas.polivka@designeo.cz>

ENV FTP_USER ftpuser
ENV FTP_PASS ftppass

RUN set -xe \
    && apk add -U vsftpd \
    && passwd -l root \
    && rm -rf /var/cache/apk/*

COPY config/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY config/start-ftp.sh /start-ftp.sh

VOLUME /ftp-data
WORKDIR /ftp-data

EXPOSE 21

CMD ["/start-ftp.sh"]