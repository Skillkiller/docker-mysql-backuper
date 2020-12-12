FROM alpine:3.1
RUN apk add --update mysql-client && rm -rf /var/cache/apk/*
RUN apk add --update bash && rm -rf /var/cache/apk/*
RUN mkdir /backup
COPY backup.sh /
RUN chmod +x backup.sh
WORKDIR /
ENTRYPOINT ["/backup.sh"]
