#!/bin/bash

test_deprecation_warnings() {
  base_dir="$(pwd)"
  
  # Test case 1: Basic deprecation warning
  output=$(bash "$base_dir/src/print-deprecation-warning.sh" "old-input" "new-input" ".github/workflows/build.yml")
  expected="::warning file=.github/workflows/build.yml,title=Deprecation Notice::The 'old-input' input is deprecated and will be removed in \`hydephp/action\` v2.0. Please use 'new-input' instead. See https://github.com/hydephp/action/pull/46 for more information."
  
  if [[ "$output" != "$expected" ]]; then
    echo "Test 1 failed: Deprecation warning not formatted correctly"
    echo "Expected: $expected"
    echo "Got: $output"
    exit 1
  fi
}

# Run the tests
test_deprecation_warnings