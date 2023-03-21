<?php

declare(strict_types=1);

interface ANSI {
    const BLACK = "\033[30m";
    const RED = "\033[31m";
    const GREEN = "\033[32m";
    const YELLOW = "\033[33m";
    const BLUE = "\033[34m";
    const MAGENTA = "\033[35m";
    const CYAN = "\033[36m";
    const WHITE = "\033[37m";
    const RESET = "\033[0m";
}

final class TestCase
{
    private const PASSED = ANSI::GREEN.'passed'.ANSI::RESET;
    private const FAILED = ANSI::RED.'failed'.ANSI::RESET;

    private static self $instance;
    private array $contents;
    private int $exitCode;

    private function __construct(string $file)
    {
        $this->contents = file($file);
        $this->exitCode = 0;
    }

    public static function boot(string $file): void
    {
        echo sprintf("Running tests for %s\n\n", basename(dirname($file)));

        self::$instance = new self($file);
    }

    public static function stop(): int
    {
        return self::getInstance()->exitCode;
    }

    private static function getInstance(): self
    {
        return self::$instance;
    }

    public static function verify(bool|Closure $result): void
    {
        $line = trim(self::getInstance()->contents[debug_backtrace()[1]['line'] - 1]);
        $testName = substr($line, 7, strpos($line, ');') - 7);

        if ($result instanceof Closure) {
            $result = $result();
        }

        if (! $result) {
            self::getInstance()->exitCode = 1;
        }

        echo ($result ? self::PASSED : self::FAILED) . ": $testName\n";
    }
}

function verify(bool|Closure $result): void
{
    TestCase::verify($result);
}
