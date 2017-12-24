#!/bin/bash
set -e

source ./prio_config.sh
source ./nic_select.sh

  eval "cat <<EOF
$(</keepalived.conf.templ)
EOF
  " > /keepalived/keepalived.conf



/config_watch.sh &

##CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]

keepalived --dump-conf --log-console --log-detail --log-facility 7 --vrrp -f /keepalived/keepalived.conf

haproxy -f /haproxy/haproxy.cfg

#CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"] 
