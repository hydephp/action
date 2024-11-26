#!/bin/bash

test_site_url_warnings() {
    base_dir="$(pwd)"
    temp_dir=$(mktemp -d)
    cd "$temp_dir"

    # Test case 1: No SITE_URL set anywhere
    touch .env
    output=$(bash "$base_dir/src/check-site-url.sh")
    expected="::warning::No SITE_URL environment variable found. It's recommended to set a production URL for your site. You can set it using the 'env' input with 'SITE_URL=https://example.com'"
    
    if [[ "$output" != "$expected" ]]; then
        echo "Test 1 failed: Warning not shown when SITE_URL is missing"
        echo "Expected: $expected"
        echo "Got: $output"
        cd "$base_dir"
        rm -rf "$temp_dir"
        exit 1
    fi

    # Test case 2: SITE_URL is set in .env
    echo "SITE_URL=https://example.com" > .env
    output=$(bash "$base_dir/src/check-site-url.sh")
    
    if [[ -n "$output" ]]; then
        echo "Test 2 failed: Warning shown when SITE_URL is set"
        echo "Expected empty output"
        echo "Got: $output"
        cd "$base_dir"
        rm -rf "$temp_dir"
        exit 1
    fi

    # Test case 3: SITE_URL set in config with non-localhost value
    rm .env
    mkdir -p config
    echo "'url' => env('SITE_URL', 'https://example.com')," > config/hyde.php
    output=$(bash "$base_dir/src/check-site-url.sh")
    
    if [[ -n "$output" ]]; then
        echo "Test 3 failed: Warning shown when SITE_URL is set in config"
        echo "Expected empty output"
        echo "Got: $output"
        cd "$base_dir"
        rm -rf "$temp_dir"
        exit 1
    fi

    # Test case 4: SITE_URL in config but with localhost
    echo "'url' => env('SITE_URL', 'http://localhost')," > config/hyde.php
    output=$(bash "$base_dir/src/check-site-url.sh")
    
    if [[ "$output" != "$expected" ]]; then
        echo "Test 4 failed: Warning not shown when SITE_URL is localhost"
        echo "Expected: $expected"
        echo "Got: $output"
        cd "$base_dir"
        rm -rf "$temp_dir"
        exit 1
    fi

    cd "$base_dir"
    rm -rf "$temp_dir"
}

# Run the tests
test_site_url_warnings
