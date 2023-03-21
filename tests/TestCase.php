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
    private float $startTime;
    private array $contents;
    private int $exitCode;

    private function __construct(string $file)
    {
        $this->startTime = microtime(true);
        $this->contents = file($file);
        $this->exitCode = 0;
    }

    public static function boot(string $file): void
    {
        echo sprintf("%sRunning tests for %s%s\n\n", ANSI::GREEN, basename(dirname($file)), ANSI::RESET);

        self::$instance = new self($file);
    }

    public static function stop(): int
    {
        $stopTimeInMs = number_format((microtime(true) - self::getInstance()->startTime) * 1000, 2);
        echo sprintf("\n%sTests completed in %s with exit code %d %s\n", ANSI::GREEN, $stopTimeInMs . 'ms', self::getInstance()->exitCode, ANSI::RESET);

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
