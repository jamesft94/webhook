#!/bin/bash
set -euo pipefail

QUESTION="${1:-"(No question asked)"}"

ANSWERS=(
  "It is certain."
  "It is decidedly so."
  "Without a doubt."
  "Yes – definitely."
  "You may rely on it."
  "As I see it, yes."
  "Most likely."
  "Outlook good."
  "Yes."
  "Signs point to yes."
  "Reply hazy, try again."
  "Ask again later."
  "Better not tell you now."
  "Cannot predict now."
  "Concentrate and ask again."
  "Don't count on it."
  "My reply is no."
  "My sources say no."
  "Outlook not so good."
  "Very doubtful."
)

RANDOM_INDEX=$(( RANDOM % ${#ANSWERS[@]} ))
ANSWER="${ANSWERS[$RANDOM_INDEX]}"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

cat <<EOF
{
  "timestamp": "$TIMESTAMP",
  "STATUS": "OK",
  "question": "$QUESTION",
  "answer": "$ANSWER",
  "endpoint": "/8ball"
}
EOF