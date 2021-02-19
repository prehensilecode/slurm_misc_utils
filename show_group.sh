#!/bin/bash
### Disables all users in a given group by setting maxsubmitjobs=0
###    sacctmgr update user someone set maxsubmitjobs=0

group_entry=$(getent group $1)
if [ "x$group_entry" = "x" ]
then
    echo "ERROR: group $1 does not exist"
    exit 1
fi

user_list=$( echo $group_entry | cut -f4 -d: )
sacctmgr show user $user_list format=User,DefaultAccount,Admin,MaxSubmit

