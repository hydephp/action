echo "Running unit tests"

# Track time in milliseconds
start=$(date +%s%3N)

for test in tests/unit/*.sh; do
  echo "Running $test"
  bash "$test"
done

# Display time in milliseconds
end=$(date +%s%3N)
echo "Time: $((end - start))ms"
