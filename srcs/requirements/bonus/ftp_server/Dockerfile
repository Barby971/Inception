
FROM alpine:3.17

#LABEL "author"="blefebvr"

RUN apk update && apk upgrade && apk add vsftpd

COPY conf/vsftpd.conf /tmp/vsftpd.conf
COPY tools/config.sh /tmp/config.sh

ENTRYPOINT ["sh", "/tmp/config.sh"]