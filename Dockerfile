FROM alpine:latest

RUN apk add --no-cache dante-server && \
    adduser -S -s /bin/false socks-user

COPY sockd.conf /etc/sockd.conf

EXPOSE 1080

CMD ["sockd", "-f", "/etc/sockd.conf", "-N", "1"]