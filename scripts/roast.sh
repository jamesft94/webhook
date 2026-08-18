#!/bin/bash

set -euo pipefail

TARGET="${1:-"localhost"}"

ROASTS=(
  "You have something on your chin... no, the third one down."
  "You bring everyone so much joy when you leave the room."
  "You're like a cloud. When you disappear, it's a beautiful day."
  "You're proof that even evolution takes a break sometimes."
  "You're as useless as the 'ueue' in 'queue'."
  "You're like a software update. Whenever I see you, I think, 'Not now.'"
  "is held together with duct tape and cron jobs."
  "has more TODO comments than actual code."
  "still remembers when 'temporary fix' meant temporary."
  "has an uptime longer than its documentation's relevance."
  "runs on hopes, dreams, and a single unmonitored bash script."
  "has a changelog that's just the word 'fixes' forty times."
  "was last rebooted by someone who no longer works here."
  "has a .env file that's basically a museum exhibit."
  "thinks 'it works on my machine' is a valid deploy strategy."
  "has more open tabs than open ports, and that's saying something."
  "is one misplaced semicolon away from a very bad day."
  "still has a README that says 'coming soon'." 
  "has a disaster recovery plan that's just 'pray'."
  "was written by someone who's now, understandably, in witness protection."
  "has more zombie processes than an actual horror movie."
  "still has a Slack status from a company that got acquired twice ago."
  "has commit messages like 'fix' 'fix2' 'fix2_final' 'fix2_final_REAL'."
  "gets more visitors from bots than the actual funeral would."
  "has a test suite that's purely theoretical, like a nice personality."
  "was last documented by a guy who ghosted mid-sentence."
  "has a security policy that boils down to 'nobody knows this exists.'"
  "is legally required to have a warning label, emotionally speaking."
  "has more single points of failure than actual friends."
  "still thinks 'works in prod' is a compliment."
  "has a backup strategy that's just Ctrl+Z and hope."
  "gets deployed on Fridays like it's asking to be forgotten."
  "has an incident report longer than its actual runtime."
  "is the reason the on-call rotation has a therapist on retainer."
  "was 'temporarily' hardcoded during the Obama administration."
  "has fewer users than unresolved GitHub issues, and it shows."
  "runs so many workarounds it forgot what the original bug even was."
  "has a life expectancy shorter than its own onboarding doc."
  "is the human equivalent of a merge conflict nobody wants to resolve."
  "peaked the day the README was created and it's been downhill since."
  "has more inherited tech debt than personality traits."
  "is the reason 'have you tried turning it off and on again' exists as a genre of hope."
)

RANDOM_INDEX=$(( RANDOM % ${#ROASTS[@]} ))
ROAST="${ROASTS[$RANDOM_INDEX]}"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

cat <<EOF
{
  "timestamp": "$TIMESTAMP",
  "STATUS": "OK",
  "roast": "$ROAST",
  "target": "$TARGET",
  "endpoint": "/roast"
}