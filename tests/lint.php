<?php

declare(strict_types=1);

write('Running Yaml Linter!', '32');

$files = glob(__DIR__ . '/../.github/workflows/*.yml');
$exitCode = 0;

foreach ($files as $file) {
    write('  Linting file '.basename($file), '33');

    try {
        lint($file);
    } catch (RuntimeException $exception) {
        write('    '.$exception->getMessage(), '31');
        $exitCode = 1;
    }
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
    $contents = file_get_contents($file);
    $filename = basename($file);

    if (false === $contents) {
        throw new RuntimeException("Could not read file: $filename");
    }

    if (empty(trim($contents))) {
        throw new RuntimeException("File is empty: $filename");
    }

    foreach (explode(PHP_EOL, $contents) as $line) {
        if (str_contains($line, "\t")) {
            throw new RuntimeException("File contains tabs: $filename");
        }

        if ($line !== rtrim($line)) {
            throw new RuntimeException("File contains trailing whitespace: $filename");
        }
    }
}

write("\nLinting complete!", '32');

exit($exitCode);
