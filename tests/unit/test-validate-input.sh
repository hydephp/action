#!/bin/bash

# Test case with valid input for deploy-to
test_valid_input() {
  base_dir="$(pwd)"

  GITHUB_OUTPUT="$base_dir/output.txt"
  touch "$GITHUB_OUTPUT"
  export GITHUB_OUTPUT;

  value="pages"
  chmod +x "$base_dir/validate-input.sh"
  "$base_dir/validate-input.sh" "$value"

  # Assert that nothing is written to the output file, indicating success
  assertTrue "Expected no output to be written to $GITHUB_OUTPUT" "[ ! -s $GITHUB_OUTPUT ]"
}

# Test case with invalid input for deploy-to
test_invalid_input() {
  base_dir="$(pwd)"

  GITHUB_OUTPUT="$base_dir/output.txt"
  touch "$GITHUB_OUTPUT"
  export GITHUB_OUTPUT;

  value="invalid"
  chmod +x "$base_dir/validate-input.sh"
  "$base_dir/validate-input.sh" "$value"

  # Assert that the error message is written to the output file, indicating failure
  grep -q "Invalid input for deploy-to: $value" "$GITHUB_OUTPUT"
  assertTrue "Expected 'Invalid input for deploy-to: $value' to be written to $GITHUB_OUTPUT" $?
}

# Define assertTrue function
assertTrue() {
  if [ "$2" -ne 0 ]; then
    echo "$1"
    exit 1
  fi
}

# Run the tests
test_valid_input
test_invalid_input

# Clean up
rm -f output.txt
