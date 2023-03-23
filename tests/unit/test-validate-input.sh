#!/bin/bash

# Test 1: Valid input - should pass
output=$(bash deploy.sh artifact)
if [[ $output != "" ]]; then
  echo "Test 1 Failed"
  exit 1
fi

# Test 2: Invalid input - should fail
output=$(bash deploy.sh invalid-input)
if [[ $output != "Invalid input for deploy-to: invalid-input" ]]; then
  echo "Test 2 Failed"
  exit 1
fi

echo "All tests passed!"
exit 0
