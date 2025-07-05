#!/bin/sh

adduser -S -s /bin/false socks-user

for i in 1 2 3 4 5; do
    USER_VAR="PROXYUSER$i"
    PASS_VAR="PROXYPASS$i"

    USERNAME=$(eval echo \$$USER_VAR)
    PASSWORD=$(eval echo \$$PASS_VAR)

    if [ -n "$USERNAME" ] && [ -n "$PASSWORD" ]; then
        adduser -D "$USERNAME"
        echo "$USERNAME:$PASSWORD" | chpasswd
    fi
done

exec sockd -f /etc/sockd.conf -N 1
