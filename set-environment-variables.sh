#!/bin/bash

# Get JSON string from input
json_string=$1

# Parse JSON and set environment variables
if command -v jq >/dev/null 2>&1; then
  # Use jq if available
  while IFS="=" read -r key value; do
    if [ ! -z "$key" ]; then
      echo "$key=$value" >> .env
    fi
  done < <(echo "$json_string" | jq -r 'to_entries | .[] | "\(.key)=\(.value)"')
else
  # Fallback to basic string manipulation if jq is not available
  json_string="${json_string#\{}"
  json_string="${json_string%\}}"
  
  IFS=',' read -ra PAIRS <<< "$json_string"
  for pair in "${PAIRS[@]}"; do
    key=$(echo "$pair" | cut -d':' -f1 | tr -d '"' | tr -d ' ')
    value=$(echo "$pair" | cut -d':' -f2- | tr -d '"' | tr -d ' ')
    if [ ! -z "$key" ]; then
      echo "$key=$value" >> .env
    fi
  done
fi
