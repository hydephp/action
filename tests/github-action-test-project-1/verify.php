<?php

echo (assert(is_dir('build')) ? 'passed' : 'failed') . "\n";
echo (assert(is_file('build/index.html')) ? 'passed' : 'failed') . "\n";
echo (assert(is_file('build/404.html')) ? 'passed' : 'failed') . "\n";
echo (assert(is_file('build/sitemap.xml')) ? 'passed' : 'failed') . "\n";
echo (assert(is_dir('build/media')) ? 'passed' : 'failed') . "\n";
echo (assert(is_file('build/media/app.css')) ? 'passed' : 'failed') . "\n";

echo (assert(false) ? 'passed' : 'failed') . "\n"; // Test it fails build
