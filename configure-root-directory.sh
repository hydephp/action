# If the directory input is not the root directory, we replace the current working directory files with the directory
# input files. This way is more reliable, as GitHub does not support setting a working directory on a job level.

# Get directory from CLI input
directory=$1

if [ "$directory" != "." ]; then
  # Create a temporary directory outside of the current working directory.
  mkdir ../tmp
  # Copy the directory input files recursively to the temporary directory.
  cp -r "$directory"/* ../tmp
  # Remove the current working directory files.
  rm -rf ./*
  # Copy the temporary directory files to the current working directory.
  cp -r ../tmp/* .

  # Remove the temporary directory.
  rm -rf ../tmp
fi
