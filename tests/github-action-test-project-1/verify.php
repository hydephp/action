<?php

$contents = file(__FILE__);
$exitCode = 0;

function verify(bool|Closure $result): void
{
    global $contents;
    global $exitCode;

    $line = trim($contents[debug_backtrace()[0]['line'] - 1]);
    $testName = substr($line, 7, strpos($line, ');') - 7);

    if ($result instanceof Closure) {
        $result = $result();
    }

    if ($result) {
        echo 'passed';
    } else {
        echo 'failed';
        $exitCode = 1;
    }
    echo ": $testName\n";
}

verify(is_dir('build'));
verify(is_file('build/index.html'));
verify(is_file('build/404.html'));
verify(is_file('build/sitemap.xml'));
verify(is_dir('build/media'));
verify(is_file('build/media/app.css'));

exit($exitCode);
