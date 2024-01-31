# Concurrent Programming

Concurrent programming is handling the fact that multiple threads can run through the same portions of code.

## Glossary

* `lock` = renders a portion of code atomic, providing thread-safety for sets of indivisible operations in a _concurrent_ context (or usually more complex shared memory configuration)
* **Multithreading** = concurrent execution of two or more threads within the same process, for better responsiveness & resource utilization
* **Parallel programming** = a subset of concurrent programming focused on executing tasks simultaneously
* **Process** = a program in execution with its own memory space
* **Thread** = a smaller unit of execution within a process, sharing memory with other threads

## API

* `Thread.Start()`
* `Thread.Sleep(0)`
* `Thread.Join()`
* `Interlocked.Add(int, int)` = adds two integers and replaces the first integer with their sum as an atomic operation
