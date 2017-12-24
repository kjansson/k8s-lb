#!/bin/bash

if [ -z "$VIRTUAL_ROUTER_ID" ]
then
	VIRTUAL_ROUTER_ID=66
fi

if [[ "$POD_NAME" =~ -([0-9]+)$ ]]
then
        ordinal=${BASH_REMATCH[1]}
fi

let "prio = 150 - $ordinal"

if [ $ordinal -eq 0 ]
 then
        STATE="MASTER"
        PRIORITY=$prio
else
        STATE="BACKUP"
        PRIORITY=$prio
fi

