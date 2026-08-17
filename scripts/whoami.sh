#!/bin/bash
CLIENT_IP="$1"
EXPECTED_IP="$2"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

if [ "$CLIENT_IP" = "$EXPECTED_IP" ]; then
  MATCH="true"
else
  MATCH="false"
fi

echo "{\"timestamp\":\"$TIMESTAMP\",\"source_ip\":\"$CLIENT_IP\",\"ip_matched\":$MATCH}"