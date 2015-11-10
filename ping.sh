#!/bin/bash
# perform pings to all given ips from hosts
# hosts should have a ssh pubkey authentification set up
# otherwise one has to enter a password multiple times

HOSTS="pc1 pc2 pc3 pc4 pc5 pc6"
IPS=$*

# fill IPS with commandline arguments
echo $IPS

table=""
for host in $HOSTS
do
	echo checking $host
	# test if host is up
	if ssh $host sleep 0.1 2>/dev/null; then
		echo $host up
		table="$table$host"
	else
		echo $host is down
		table="$table$host down\n"
		continue
	fi
	echo trying to ping stuff
	for ip in $IPS; do
		if ssh $host ping -c 1 $ip 2>/dev/null 1>/dev/null; then
			echo ping worked with $ip
			table="$table worked"
		else
			echo not reachable
			table="$table NO"
		fi
	done
	table="$table\n"
done

echo table:
printf "$table" | column -t
