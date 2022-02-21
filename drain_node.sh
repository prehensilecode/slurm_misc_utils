#!/bin/bash
### Drains a node
###    scontrol update nodename=foo state=drain reason=maint

if [[ $# -ne 1 ]]
then
    echo "$0: requires one argument - nodename"
    exit 1
fi

scontrol update nodename=$1 state=drain reason=maint

