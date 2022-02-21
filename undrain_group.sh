#!/bin/bash
### Undrains a group of nodes. Typically, a chassis containing multiple
### nodes. For 1U servers, some group of nodes defined in /etc/genders
###    scontrol update nodename=foo1,foo2,... state=resume

if [[ $# -ne 1 ]]
then
    echo "$0: requires one argument - groupname"
    exit 1
fi

nodes=$( grep $1 /etc/genders | awk '{print $1}' )

if [[ -z "${nodes}" ]]
then
    echo "$0: groupname is not defined in /etc/genders"
    exit 3
fi

echo "Undraining ${nodes} ..."
scontrol update nodename=${nodes} state=Resume

