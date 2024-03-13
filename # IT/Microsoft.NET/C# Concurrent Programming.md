# Concurrent Programming

Concurrent programming is handling the fact that multiple threads can run through the same portions of code.
**Threads** are the basic building block of concurrent programming in C#.

## Glossary

* `lock` = renders a portion of code atomic, providing thread-safety for sets of indivisible operations in a _concurrent_ context (or usually more complex shared memory configuration)
* **Concurrency** = having multiple operations progress together (or one after the other), usually either by sharing their CPU time on the same unit, or running in parallel on multiple cores
* **Multitasking** = concurrent (but not necessarily parallel) execution of multiple tasks over a certain period of time
* **Parallel computing** = when multiple operations can be executed at the exact same instant, enabled by multi-core CPUs (& supercomputers), impossible on a single core CPU
  * Can be used to speed up a treatment that can be neatly broken down into parts, or even perform **speculative multithreading**
* **Parallel programming** = a subset of concurrent programming focused on executing tasks simultaneously, enabled by the rise of modern CPUs with multiple cores
* **Process** = a program in execution with its own memory space
* **Preemption** = the act of temporarily interrupting a task being carried out by a computer system, without requiring its cooperation, and with the intention of resuming the task at a later time
  * **Time slice/ing** = allotted amount of time for which a process is allowed to run in a preemptive multitasking system
* **Speculative multithreading** = a technique used to anticipate a user's action and preload parts of the application as s/he navigates, only to discard those paths not taken
* **Thread** = smaller unit of execution within a **process**, sharing memory with other threads

## API

* `Interlocked.Add(int, int)` = adds two integers and replaces the first integer with their sum as an atomic operation
* `Parallel.ForEach()`
* `Thread.Start()`
* `Thread.Sleep(0)`
* `Thread.Join()`
