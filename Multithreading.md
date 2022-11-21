# Multithreading

[Wikipedia](https://en.wikipedia.org/wiki/Multithreading_(computer_architecture)): _Ability of a single CPU (or CPU core) to provide multiple threads of execution concurrently_.

## Nomenclature

* [Asynchrony](https://en.wikipedia.org/wiki/Asynchrony_(computer_programming)) = when the CPU control is able to be given up to a parent up the callstack while a low-level time-consuming operation is being executed. This enables to free up CPU resource for the GUI to refresh responsively and remain reactive - as opposed to frozen after each button click performing some operation.
* [Concurrency](https://en.wikipedia.org/wiki/Concurrent_computing) = when different operations progress together or one after the other, usually by sharing their CPU time on the same unit.
* [Parallel computing](https://en.wikipedia.org/wiki/Parallel_computing) = when multiple operations can be executed at the exact same instant. This is usually enabled by multi-core CPUs (and/or supercomputers), and is impossible on a single core CPU. Can be used to speed up a treatment that can be neatly broken down into parts, or even perform [speculative multithreading](https://en.wikipedia.org/wiki/Speculative_multithreading), a technique used to anticipate a user's action and preload parts of the application as s/he navigates, only to discard those paths not taken.
* [Multi-core CPU](https://en.wikipedia.org/wiki/Multi-core_processor) = a CPU who possesses multiple computing units. Nowadays, most modern computers ship with 4 cores or more, therefore parallel computing has become a viable solution to consider in order to speed up some computational treatment.
* [Process](https://en.wikipedia.org/wiki/Process_(computing)) = program execution instance un by one or any Threads. Is is an isolated environment within which a program is run. A default main Thread is launched at startup execution, and other Threads that get created within the Process share the same environment and memory.
* [Multitasking](https://en.wikipedia.org/wiki/Computer_multitasking) = concurrent execution of multiple tasks over a certain period of time.
* [Task](https://en.wikipedia.org/wiki/Task_(computing)) = a Process or a Thread.
* [Thread](https://en.wikipedia.org/wiki/Thread_(computing)) = a program execution instance started by a Process.
  * [Thread Pool](https://en.wikipedia.org/wiki/Thread_pool) = a set of Threads that can be allocated to run incoming queued up operations. This design alleviates the need to create and destroy Threads on demand, a costly operation when it's done with too high a frequence, by recycling a collection of usable pre-instantiated Threads.
  * Foreground = maintains the application alive while it is running
  * Background = terminates abruptl as soon as the application closes. By default, new Threads are background Threads; this can be modified using the _IsBackground_ property.
* [Preemption](https://en.wikipedia.org/wiki/Preemption_(computing)) = the act of temporarily interrupting a task being carried out by a computer system, without requiring its cooperation, and with the intention of resuming the task at a later time.
  * Time slice = allotted amount of time for which a process is allowed to run in a preemptive multitasking system.
* Compute-bound = Thread that spends most of its time performing CPU-heavy calculations. Regular Thread can turn into perpetual hungry compute-bound Thread if stuck in an infinite loop with no exit condition.
* IO-bound = Thread that spends most of its time waiting for I/O operations to complete.

## API

* `Parallel.ForEach()`
* `Task.Run()`
