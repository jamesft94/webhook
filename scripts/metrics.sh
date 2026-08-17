#!/bin/bash
PAYLOAD="$1"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Append incoming payload to data directory
echo "{\"timestamp\": \"$TIMESTAMP\", \"payload\": $PAYLOAD}" >> /opt/webhook/data/telemetry.jsonl

echo "Saved at $TIMESTAMP"