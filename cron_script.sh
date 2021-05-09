#!/bin/bash

if [ ! -f /var/log/current_users ]
	then 
		touch /var/log/current_users
fi


if [ ! -f /var/log/user_changes ]
	then 
		touch /var/log/user_changes
fi


NEW_VALUE=$((/root/gitlab/script.sh)|md5sum)
echo $NEW_VALUE 
OLD_VALUE=$(</var/log/current_users)

if [[ "$OLD_VALUE" != "$NEW_VALUE" ]]
	then 
		echo "$NEW_VALUE" > /var/log/current_users
		echo "`date`" "changes occurred" >> /var/log/user_changes
fi
