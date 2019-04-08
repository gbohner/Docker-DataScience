#!/bin/bash

# Create a user group on host that will be used for access rights management 
# between host and the container

# Ensure that the group has been created with the given gid and name, otherwise throw error

if groupadd -g $(cat users.group.gid) $(cat users.group.name)
then
	echo "Data safe haven users group successfully created"
	
	# Add the users from "users.list" to the group
	cat users.list | xargs -L1 usermod -aG $(cat users.group.name) 

else
	echo "ERROR: Data safe haven user group creation FAILED!"
	echo "Edit the users.group.gid and users.group.name files"
fi


