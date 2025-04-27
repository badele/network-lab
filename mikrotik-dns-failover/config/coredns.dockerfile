# vim: set filetype=dockerfile :

FROM ubuntu:24.04

# Install CoreDNS
RUN apt update && apt install -y wget iproute2 dnsutils iputils-ping
RUN wget https://github.com/coredns/coredns/releases/download/v1.12.1/coredns_1.12.1_linux_amd64.tgz && \
  tar -xzf coredns_*_linux_amd64.tgz && \
  mv coredns /usr/local/bin/coredns && \
  chmod +x /usr/local/bin/coredns && \
  rm -f coredns_linux_amd64.tgz

# CoreDNS config
COPY config/coredns/Corefile /etc/coredns/Corefile
COPY config/coredns/lab.local.zone /etc/coredns/lab.local.zone

EXPOSE 53/udp 53/tcp

# Entrypoint
COPY config/coredns/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
