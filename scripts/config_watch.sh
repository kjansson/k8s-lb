#!/bin/sh

        while true
        do
                inotifywait -e modify /haproxy/haproxy.cfg | haproxy -f /haproxy/haproxy.cfg -p /run/haproxy.pid -sf $(cat /run/haproxy.pid)
        done

