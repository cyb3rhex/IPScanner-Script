#!/bin/bash
#Dev: LSDeep
#Telegram: lsd33p

if [ -z "$1" ]
  then
    echo "Please provide an IP address or range"
    exit 1
fi

echo "Scanning ports for $1..."

nmap -p- --min-rate=1000 -T4 $1 | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$// | awk '{print "\
n\nOpen ports: "$0"\n"}'