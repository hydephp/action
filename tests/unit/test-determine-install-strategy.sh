#!/bin/bash

# Test case when composer.json file exists
test_composer_strategy() {
  base_dir="$(pwd)"

  touch composer.json
  GITHUB_OUTPUT=output.txt
  touch "$GITHUB_OUTPUT"
  export GITHUB_OUTPUT;

  chmod +x "$base_dir"/determine-install-strategy.sh
  "$base_dir"/determine-install-strategy.sh

  # Assert that the expected string is written to the output file
  grep -q "install-strategy=composer" "$GITHUB_OUTPUT"
  assertTrue "Expected 'install-strategy=composer' to be written to $GITHUB_OUTPUT" $?
}

# Test case when composer.json file doesn't exist
test_archive_strategy() {
  base_dir="$(pwd)"

  rm -f composer.json

  GITHUB_OUTPUT=output.txt
  touch "$GITHUB_OUTPUT"
  export GITHUB_OUTPUT;

  chmod +x "$base_dir"/determine-install-strategy.sh
  "$base_dir"/determine-install-strategy.sh

  # Assert that the expected string is written to the output file
  grep -q "install-strategy=archive" "$GITHUB_OUTPUT"
  assertTrue "Expected 'install-strategy=archive' to be written to $GITHUB_OUTPUT" $?
}

# Define assertTrue function
assertTrue() {
  if [ "$2" -ne 0 ]; then
    echo "$1"
    exit 1
  fi
}

# Run the tests
test_composer_strategy
test_archive_strategy

# Clean up
rm -f composer.json output.txt
