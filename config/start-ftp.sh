#!/bin/sh

set -ex

if [ ! $(getent passwd $user) ] ; then
    adduser -D -s /sbin/nologin -h /ftp-data $FTP_USER
fi

echo "${FTP_USER}:${FTP_PASS}" | chpasswd

chown -R ${FTP_USER}:${FTP_USER} /ftp-data

echo "${FTP_USER}" > /etc/vsftpd.allowed_users

while true; do
    vsftpd /etc/vsftpd/vsftpd.conf
done