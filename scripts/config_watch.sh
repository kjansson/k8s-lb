#!/bin/sh

        while true
        do
                inotifywait -e modify /haproxy.cfg | haproxy -f /haproxy.cfg -p /run/haproxy.pid -sf $(cat /run/haproxy.pid)
        done

