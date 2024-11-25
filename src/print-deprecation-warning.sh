#!/bin/bash

# Usage: src/print-deprecation-warning.sh "old_input" "new_input" "workflow_file"
# Example: src/print-deprecation-warning.sh "env-site-name" "env: SITE_NAME=value" ".github/workflows/build.yml"

old_input=$1
new_input=$2
workflow_file=$3

echo "::warning file=$workflow_file,title=Deprecation Notice::The '$old_input' input is deprecated and will be removed in \`hydephp/action\` v2.0. Please use '$new_input' instead. See https://github.com/hydephp/action/pull/46 for more information."
