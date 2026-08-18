#!/bin/bash
PAYLOAD="$1"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
OUTFILE="/opt/webhook/data/metrics.jsonl"

if ! echo "$PAYLOAD" | jq -e . >/dev/null 2>&1; then
  echo "Invalid JSON payload, Discarding." >&2
  exit 1
fi

# Append incoming payload to data directory
jq -c --arg ts "$TIMESTAMP" '{timestamp: $ts, payload: .}' <<< "$PAYLOAD" >> "$OUTFILE"

echo "Saved at $TIMESTAMP"