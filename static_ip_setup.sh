#!/bin/bash

# easier debugging options
set -o nounset
set -o xtrace
 
# setup configuration
ssh pc1 'ip a add 10.0.1.1/24 broadcast 10.0.1.255 dev eth0; ip l set eth0 up'
ssh pc2 'ip a add 10.0.1.2/24 broadcast 10.0.1.255 dev eth0; ip l set eth0 up'
ssh pc3 'ip a add 10.0.2.1/24 broadcast 10.0.2.255 dev eth0; ip l set eth0 up'
ssh pc4 'ip a add 10.0.3.1/24 broadcast 10.0.3.255 dev eth0; ip l set eth0 up'
ssh pc5 'ip a add 10.0.2.254/24 broadcast 10.0.2.255 dev eth0; ip l set eth0 up;'
ssh pc5 'ip a add 10.0.8.1/24 broadcast 10.0.8.255 dev eth1; ip l set eth1 up;'
ssh pc5 'ip a add 10.0.7.2/24 broadcast 10.0.7.255 dev eth2; ip l set eth2 up;'
ssh pc5 'echo 1 > /proc/sys/net/ipv4/ip_forward' 
#ssh pc4 'ip a add <someaddr>/20 broadcast <someaddr> dev eth0; ip l set eth0 up; ip route add via <someaddr>'
#ssh pc5 'ip a add <someaddr>/8 broadcast <someaddr> dev eth0; ip l set eth0 up; ip a add <someaddr> /4 broadcast <someaddr> dev eth1; ip l set eth1 up; ip a add <someaddr>/2 broadcast <someaddr> dev eth2; ip l set eth2 up; echo 1 > /proc/sys/net/ipv4/ip_forward' 
