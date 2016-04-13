A self-sufficient Docker mini container to run ftp over the folder with custom user and password. The container size is <10MB.

## Usage

```
$ docker run -d \
    -p 2100:21 \
    -e FTP_USER=testuser \
    -e FTP_PASS=testpass \
    -v $PWD/data:/ftp-data \
    designeo/ftp

```

## Parameters

Configuration is done through environment variables that you can change with `docker run`' s `-e` switch:

* `FTP_USER`, Ftp user
* `FTP_PASS`, Password for ftp user



