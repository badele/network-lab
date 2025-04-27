#!/bin/sh

if [ -z "$DNS_SERVER" ]; then
    echo "⚠️  DNS_SERVER not defined"
    exit 1
fi

echo "nameserver ${DNS_SERVER}" >/etc/resolv.conf
exec coredns -conf /etc/coredns/Corefile
