#!/bin/bash

# Check if SITE_URL is set in .env file
if ! grep -q "^SITE_URL=" .env; then
    echo "::warning::No SITE_URL environment variable found. It's recommended to set a production URL for your site. You can set it using the 'env' input with 'SITE_URL=https://example.com'"
fi
