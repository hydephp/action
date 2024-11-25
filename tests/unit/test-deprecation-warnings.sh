#!/bin/bash

test_deprecation_warnings() {
  base_dir="$(pwd)"
  
  # Test case 1: Basic deprecation warning
  output=$(bash "$base_dir/print-deprecation-warning.sh" "old-input" "new-input")
  expected="::warning::The 'old-input' input is deprecated and will be removed in v2.0. Please use 'new-input' instead."
  
  if [[ "$output" != "$expected" ]]; then
    echo "Test 1 failed: Deprecation warning not formatted correctly"
    echo "Expected: $expected"
    echo "Got: $output"
    exit 1
  fi
}

# Run the tests
test_deprecation_warnings