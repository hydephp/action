# With input: deploy-to

# Get value from CLI input
value=$1

if [[ "$value" != "artifact" ]] && [[ "$value" != "pages" ]]; then
  echo "Invalid input for deploy-to: $value"
  exit 1
fi
