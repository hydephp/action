<?php

declare(strict_types=1);

write('Running Yaml Linter!', '33');

$errors = [];

$files = glob(__DIR__ . '/../.github/workflows/*.yml');

foreach ($files as $file) {
    write('Linting file '.basename($file), '32');

    lint($file);
}

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
