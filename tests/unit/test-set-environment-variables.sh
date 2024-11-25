#!/bin/bash

test_set_environment_variables() {
  base_dir="$(pwd)"
  
  # Create a temporary directory and navigate to it
  temp_dir=$(mktemp -d)
  cd "$temp_dir" || exit
  
  # Test case 1: Basic key-value pairs
  env_vars=$'FOO=bar\nTEST=value'
  "$base_dir"/src/set-environment-variables.sh "$env_vars"
  
  if ! grep -q "FOO=bar" .env || ! grep -q "TEST=value" .env; then
    echo "Test 1 failed: Basic key-value pairs not set correctly"
    exit 1
  fi
  
  # Clean up
  rm .env
  
  # Test case 2: Empty input
  env_vars=""
  "$base_dir"/src/set-environment-variables.sh "$env_vars"
  
  if [ -f .env ]; then
    echo "Test 2 failed: .env file should not be created for empty input"
    exit 1
  fi
  
  # Clean up the temporary directory
  rm -r "$temp_dir"
}

# Run the tests
test_set_environment_variables
