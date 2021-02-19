#!/bin/bash
### Re-enable all users in a given group by clearing the maxsubmitjobs value
###    sacctmgr update user someone set maxsubmitjobs=-1

if [ $# -ne 1 ]
then
    echo "reenable_group.sh : requires one argument - group"
    exit 1
fi

group_entry=$(getent group $1)
if [ "x$group_entry" = "x" ]
then
    echo "ERROR: group $1 does not exist"
    exit 1
fi

for u in $( echo $group_entry | cut -f4 -d: | sed -e 's/\,/ /g' )
do
    sacctmgr update user $u set maxsubmitjobs=10000
done

