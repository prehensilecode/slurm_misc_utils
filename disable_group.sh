#!/bin/bash
### Disables all users in a given group by setting maxsubmitjobs=0
###    sacctmgr update user someone set maxsubmitjobs=0

group_entry=$(getent group $1)
if [ "x$group_entry" = "x" ]
then
    echo "ERROR: group $1 does not exist"
    exit 1
fi

for u in $( getent group $1 | cut -f4 -d: | sed -e 's/\,/ /g' )
do
    sacctmgr update user $u set maxsubmitjobs=0
done