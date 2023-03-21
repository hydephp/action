<?php

declare(strict_types=1);

final class TestCase
{
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

        echo $result ? 'passed' : 'failed' . ": $testName\n";
    }
}

function verify(bool|Closure $result): void
{
    TestCase::verify($result);
}
