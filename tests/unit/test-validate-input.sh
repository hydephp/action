#!/bin/bash

base_dir="$(pwd)"

# Test 1: Valid input - should pass
output=$(bash "$base_dir/validate-input.sh" artifact)
if [[ $output != "" ]]; then
  echo "Test 1 Failed"
  exit 1
fi

# Test 2: Valid input - should pass
output=$(bash "$base_dir/validate-input.sh" pages)
if [[ $output != "" ]]; then
  echo "Test 2 Failed"
  exit 1
fi

# Test 3: Invalid input - should fail
output=$(bash "$base_dir/validate-input.sh" invalid-input)
if [[ $output != "Invalid input for deploy-to: invalid-input" ]]; then
  echo "Test 3 Failed"
  exit 1
fi
