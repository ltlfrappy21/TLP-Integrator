#!/bin/bash
# Script to fetch MISP event JSON and attach it to Hive case
MISP_URL=https://misp.local
EVENT_ID=$1
curl -s -H "Authorization: $MISP_API_KEY" "$MISP_URL/events/$EVENT_ID" > misp_event.json