#!/bin/bash

# Usage: print-deprecation-warning.sh "old_input" "new_input"
# Example: print-deprecation-warning.sh "env-site-name" "env: SITE_NAME=value"

old_input=$1
new_input=$2

echo "::warning::The '$old_input' input is deprecated and will be removed in `hydephp/action` v2.0. Please use '$new_input' instead. See https://github.com/hydephp/action/pull/46"
