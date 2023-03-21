<?php

declare(strict_types=1);

final class TestCase
{
    private array $contents;
    private int $exitCode;

    private static self $instance;

    public static function boot(string $file, int &$exitCode): void
    {
        self::$instance = new self($file, $exitCode);
    }

    private function __construct(string $file, int &$exitCode)
    {
        $this->contents = file($file);
        $this->exitCode = &$exitCode;
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
