<?php

declare(strict_types=1);

function write(string $line, string $color = null): void
{
    if ($color) {
        $line = "\033[{$color}m$line\033[0m";
    }

    echo $line . PHP_EOL;
}

function lint(string $file): void
{
    //
}

write('Running Yaml Linter!', '33');

$files = glob(__DIR__ . '/../.github/workflows/*.yml');

foreach ($files as $file) {
    $filename = basename($file);
    write("Linting file $filename", '32');


    lint($file);
}
