<?php

declare(strict_types=1);

function write(string $line, string $color = null): void
{
    if ($color) {
        $line = "\033[{$color}m$line\033[0m";
    }

    echo $line . PHP_EOL;
}
