if [[ -f composer.json ]]; then
  echo "install-strategy=composer" >> "$GITHUB_OUTPUT"
else
  echo "install-strategy=archive" >> "$GITHUB_OUTPUT"
fi
