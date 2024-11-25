#!/bin/bash

test_set_environment_variables() {
  base_dir="$(pwd)"
  
  # Create a temporary directory and navigate to it
  temp_dir=$(mktemp -d)
  cd "$temp_dir" || exit
  
  # Test case 1: Basic key-value pairs
  json='{"FOO":"bar","TEST":"value"}'
  "$base_dir"/set-environment-variables.sh "$json"
  
  if ! grep -q "FOO=bar" .env || ! grep -q "TEST=value" .env; then
    echo "Test 1 failed: Basic key-value pairs not set correctly"
    exit 1
  fi
  
  # Clean up
  rm .env
  
  # Test case 2: Empty input
  json='{}'
  "$base_dir"/set-environment-variables.sh "$json"
  
  if [ -f .env ]; then
    echo "Test 2 failed: .env file should not be created for empty input"
    exit 1
  fi
  
  # Clean up the temporary directory
  rm -r "$temp_dir"
}

# Run the tests
test_set_environment_variables
