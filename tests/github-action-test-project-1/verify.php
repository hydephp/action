<?php

echo assert(is_dir('debug')) ? 'passed' : 'failed';
echo assert(is_file('build/index.html')) ? 'passed' : 'failed';
echo assert(is_file('build/404.html')) ? 'passed' : 'failed';
echo assert(is_file('build/sitemap.xml')) ? 'passed' : 'failed';
echo assert(is_dir('build/media')) ? 'passed' : 'failed';
echo assert(is_file('build/media/app.css')) ? 'passed' : 'failed';

echo assert(false) ? 'passed' : 'failed'; // Test it fails build
