#!/bin/bash

# Get environment variables string from input
env_string="$1"

# Process each line
echo "$env_string" | while IFS= read -r line || [ -n "$line" ]; do
  # Skip empty lines
  if [ -z "$line" ]; then
    continue
  fi
  
  # Append to .env file
  echo "$line" >> .env
done
