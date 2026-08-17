#!/bin/bash
TARGET_IP="$1"
nmap -Pn -p 21,22,80,443,3389,8080 "$TARGET_IP" -oG - | grep "Ports:"