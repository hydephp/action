echo "Running unit tests"

# Track time in milliseconds
start=$(date +%s%3N)

exit_code=0

for test in tests/unit/*.sh; do
  if ! bash "$test"; then
    echo -e "\033[0;31mTest failed:\033[0m $test";
    exit_code=1
  else
    echo -e "\033[0;32mTest passed:\033[0m $test";
  fi
done

# Display time in milliseconds
end=$(date +%s%3N)
echo "Time: $((end - start))ms"

echo "Unit tests complete. Exiting with code $exit_code"
exit "$exit_code"
