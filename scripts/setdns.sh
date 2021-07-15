#!/bin/bash
if [[ $# -eq 0 ]]
	then
		printf "DNS conf name not supplied.\n"
		exit 1
else if [[ "$1" == "opendns" ]]
	then
		rm /etc/resolv.conf
		cp ./dnsconf/opendns.conf /etc/resolv.conf
		chattr +i /etc/resolv.conf
		exit 0
else if [[ "$1" == "vpn" ]]
	then
		rm /etc/resolv.conf
		cp ./dnsconf/vpn.conf /etc/resolv.conf
		chattr +i /etc/resolv.conf
		exit 0
fi
printf "Invalid argument passed. Allowed arguments:\n1. opendns\n2. vpn"
