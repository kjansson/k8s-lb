FROM alpine:3.6
MAINTAINER Kim Jansson <kumpe82@gmail.com>

ENV SHELL /bin/bash 

RUN set -e; \
	apk update; apk add --no-cache bash inotify-tools haproxy keepalived haproxy-systemd-wrapper; 
RUN mkdir /haproxy; mkdir /keepalived

COPY scripts/config_watch.sh /
COPY scripts/nic_select.sh /
COPY scripts/prio_config.sh /
COPY keepalived.conf.templ /
COPY entrypoint.sh /

# FOR DEV ONLY
ENV POD_NAME test-0
ENV POD_IP 0.0.0.0

CMD ["/entrypoint.sh"]
