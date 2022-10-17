#!/bin/bash

# This should be on the same subnet as your docker host.
AIX_IP="10.1.1.8"
DOCKER_HOST_INTERFACE="ens160"

# We want to configure networking before starting the AIX container, so we create
# the tap0 interface, otherwise gemu will solve this.
ip tuntap add tap0 mode tap

# UP the tap0 interface and tell the host that it can find the IP on tap0.
ip link set tap0 up
ip route add $AIX_IP dev tap0

# Now we should be able two ping the IP after these two
echo 1 > /proc/sys/net/ipv4/conf/tap0/proxy_arp
arp -Ds $AIX_IP $DOCKER_HOST_INTERFACE pub

# We need this to actually be able to SSH into the AIX container and talk outbound.
iptables -I FORWARD 1 -i tap0 -j ACCEPT
iptables -A FORWARD -d $AIX_IP -j ACCEPT
###################################################################
# Why don't you have anything to drink?
# Choose one making you better feeling

# Run interactively
#docker run -it --name AIX72 -v /opt/dockerdata/AIX72:/disk --cap-add=NET_ADMIN --network host telefax/docker-qemu-aix72:1.0

# or...

# Run detached, or attach later on or just connect over network when you have configured your settings in AIX.
#docker run -d --name AIX72 -v /opt/dockerdata/AIX72:/disk --cap-add=NET_ADMIN --network host telefax/docker-qemu-aix72:1.0
