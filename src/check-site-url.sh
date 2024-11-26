#!/bin/bash

# Function to check if SITE_URL is effectively set
check_site_url() {
    # Check if SITE_URL is set in .env file
    if grep -q "^SITE_URL=" .env; then
        return 0
    fi

    # Check for hyde.yml or hyde.yaml with any url setting
    if [ -f "hyde.yml" ] && grep -q "^[[:space:]]*url:" hyde.yml; then
        return 0
    fi
    
    if [ -f "hyde.yaml" ] && grep -q "^[[:space:]]*url:" hyde.yaml; then
        return 0
    fi

    # If config/hyde.php exists, check if it has a non-localhost URL
    if [ -f "config/hyde.php" ]; then
        # Look for url configuration line and exclude localhost
        if grep -q "'url' => env('SITE_URL'," config/hyde.php; then
            line_number=$(grep -n "'url' => env('SITE_URL'," config/hyde.php | cut -d: -f1)
            if ! grep -q "'url' => env('SITE_URL', 'http://localhost')," config/hyde.php; then
                return 0
            fi
            echo "::warning file=config/hyde.php,line=$line_number,title=Missing Site URL::The site URL is set to localhost in your configuration file. Consider setting a production URL here or in using the 'env' input with 'SITE_URL=https://example.com'"
            return 0
        fi
    fi

    echo "::warning title=Missing Site URL::No SITE_URL environment variable found. It's recommended to set a production URL for your site. You can set it using the 'env' input with 'SITE_URL=https://example.com'"
    return 0
}

# Show warning if SITE_URL is not properly set
check_site_url
