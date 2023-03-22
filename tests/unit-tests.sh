echo "Running unit tests"

for test in tests/unit/*.sh; do
  echo "Running $test"
  bash "$test"
done
