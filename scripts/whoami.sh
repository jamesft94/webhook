#!/bin/bash
CLIENT_ADDR="$1"
EXPECTED_IP="$2"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

if [[ "$CLIENT_ADDR" =~ ^\[(.+)\]:[0-9]+$ ]]; then
  CLIENT_IP="${BASH_REMATCH[1]}"
else
  CLIENT_IP="${CLIENT_ADDR%%:*}"
fi

if [ "$CLIENT_IP" = "$EXPECTED_IP" ]; then
  MATCH="true"
else
  MATCH="false"
fi

echo "{\"timestamp\":\"$TIMESTAMP\",\"source_ip\":\"$CLIENT_IP\",\"remote_ip\":\"$EXPECTED_IP\",\"ip_matched\":$MATCH}"