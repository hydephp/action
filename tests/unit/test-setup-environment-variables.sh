#!/bin/bash

test_copy_env_example() {
  base_dir="$(pwd)"

  # Create a temporary directory and navigate to it
  temp_dir=$(mktemp -d)
  cd "$temp_dir" || exit

  # Create an example file
  echo "foo" > .env.example

  # Make the script executable
  chmod +x "$base_dir"/setup-environment-variables.sh

  # Call the script
  "$base_dir"/setup-environment-variables.sh

  # Assert that the .env file was created
  if [[ ! -f .env ]]; then
    echo "Test failed: .env file not created"
    exit 1
  fi

  # Assert that the .env file is identical to the .env.example file
  if ! cmp -s .env .env.example; then
    echo "Test failed: .env file not identical to .env.example"
    exit 1
  fi

  # Clean up the temporary directory
  rm -r "$temp_dir"
}

# Run the test
test_copy_env_example

# Clean up
cd "$base_dir" || exit
