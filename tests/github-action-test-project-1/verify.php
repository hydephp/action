<?php

$contents = file(__FILE__);
$exitCode = 0;

function verify(bool $result): void
{
    global $contents;

    // get line calling this function
    $trace = debug_backtrace();
    $line = $trace[0]['line'];
    // extract test name from line
    $testName = trim($contents[$line - 1]);
    // get string between first and second quote
    // $testName = preg_replace('/^.*?\'(.*?)\'.*?$/', '$1', $testName) ?? $testName;
    // get string inside verify( and last );
    $testName = substr($testName, 7, strpos($testName, ');') - 7);

    if ($result) {
        echo 'passed: ';
    } else {
        echo 'failed: ';
        global $exitCode;
        $exitCode = 1;
    }
    echo $testName . PHP_EOL;
}
verify(is_dir('build'));

verify(is_file('build/index.html'));
verify(is_file('build/404.html'));
verify(is_file('build/sitemap.xml'));
verify(is_dir('build/media'));
verify(is_file('build/media/app.css'));

exit($exitCode);
