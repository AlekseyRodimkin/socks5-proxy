FROM alpine:latest

RUN apk add --no-cache dante-server shadow libc6-compat

COPY sockd.conf /etc/sockd.conf
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 1080

CMD ["/entrypoint.sh"]
