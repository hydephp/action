<?php

require_once file_exists(__DIR__ . '/../TestCase.php') ? __DIR__ . '/../TestCase.php' : __DIR__ . '/TestCase.php';

$exitCode = 0;
TestCase::boot(__FILE__, $exitCode);

verify(is_dir('build'));
verify(is_file('build/index.html'));
verify(is_file('build/404.html'));
verify(is_file('build/sitemap.xml'));
verify(is_dir('build/media'));
verify(is_file('build/media/app.css'));

exit($exitCode);
