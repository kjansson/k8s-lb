#!/bin/sh
INTERFACE=$(ip route | grep -e $POD_IP | sed -r 's/.+ dev (\S+).*/\1/g') 
