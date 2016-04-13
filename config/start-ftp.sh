#!/bin/sh

set -ex

adduser -D -s /sbin/nologin -h /ftp-data $FTP_USER
echo "${FTP_USER}:${FTP_PASS}" | chpasswd

chown -R ${FTP_USER}:${FTP_USER} /ftp-data

echo "${FTP_USER}" > /etc/vsftpd.allowed_users

while true; do
    vsftpd /etc/vsftpd/vsftpd.conf
done