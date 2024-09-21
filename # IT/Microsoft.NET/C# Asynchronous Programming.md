# Asynchronous Programming

Asynchronous programming enables I/O-bound operations to yield control, up to any parent caller that does not require their immediate result and can continue running in the meantime.
**Tasks** are the basic building block of concurrent programming in C#.

## Explanation

The `async` & `await` keywords abstract much of the complexity of breaking the synchronicity of the flow and resuminging it eventually **synchronously** via callback.
Note that it all happens **synchronously** (it is not concurrent):

* The passing of control back to the parent is performed **synchronously** (so was calling the `async` child method)
* The resuming of control is performed via **synchronous** event callback (or various mechanisms eg CPU interrupt, OS Proc Call to notify completion)
  * Since we use callbacks, we may no longer be in the same original thread, so we need to address **thread affinity**
* => Contrary to popular belief, [async-await does not create any additional threads](https://stackoverflow.com/q/37419572)

That design is especially instrumental in keeping the GUI responsive and not freezing.
Note that [in Windows, all I/O is asynchronous; synchronous APIs are just a convenient abstraction](https://stackoverflow.com/a/12484535).

## Glossary

* `async` = defines an asynchronous method which returns a `Task<T>` immediately but whose actual result will be available later
  * The entire call stack must be marked `async`, up to an (`async void`) event handler, _main_/Domain, `Task.Run()`, a WebAPI controller
  * Never define `async void` methods, unless [subscribing to events](https://stackoverflow.com/a/38241969/3559724)
* `await` = suspends current context & non-blockingly yields control back to caller whilst waiting for an asynchronous operation to conclude (a Task result)
  * If the awaited task is already completed (or is _extremely fast_), the current context is not captured and the execution continues immediately/synchronously
  * When the task completes, the captured context is restored and the remaining code is executed within that context
  * There may be no statements left in the method, but it **still needs execution time to exit**, hence potential deadlocks if the captured context is blocking
  * Any code before first await is executed **synchronously** as (background) asynchrony only starts then (compiler will complain if no awaits are found, making method synchronous instead)
  * [A method with multiple await statements will pause itself and resume its caller multiple times](https://stackoverflow.com/a/18445829)
* `lock` = renders a portion of code atomic, providing thread-safety for sets of indivisible operations in a _concurrent_ context (or usually more complex shared memory configuration)

* **AggregateException** = multiple exceptions into a single exception instance
* **Asynchrony** = occurrence of (concurrent) events independent of the main program flow and ways to deal with such events (asynchronously as to not block the program)
when CPU control can be yielded while a low-level time-consuming operation is being executed, eg to let GUI refresh reactively/responsively during event handling (eg button click)
* **CancellationToken** = enables cooperative cancellation between threads & tasks (eg `TaskFactory.ContinueWhenAll()` raises an (aggregated) `TaskCanceledException` if one of the tasks was cancelled)
* **Concurrency** = having multiple operations progress together (or one after the other), usually either by sharing their CPU time on the same unit, or running in parallel on multiple cores
* **Concurrent Programming** = handling multiple threads running through the same portions of code
* **Context (capture)** = context is (essentially information about) a thread
* **Compute-bound** =  a thread that spends most of its time performing CPU-heavy calculations (or a regular thread stuck in an infinite loop with no exit condition)
* **Deadlock** = when multiple threads are waiting for each other to release a resource
  * Can occur in a UI setting when a blocking calls (`task.Wait()`/`task.Result`) prevents the child task from resuming in the caller's blocked captured context
* **IO-bound** = a thread that spends most of its time waiting for (usually low-level) I/O operations (eg (web) service call, Windows I/O call, DB fetching) to complete
* [Message loop in Microsoft Windows](https://en.wikipedia.org/wiki/Message_loop_in_Microsoft_Windows)
* **Multitasking** = concurrent (but not necessarily parallel) execution of multiple tasks over a certain period of time
* **Multithreading** = concurrent execution of two or more threads (within the same process) _on a single CPU (or CPU core)_, for better responsiveness & resource utilization
* **Parallel computing** = when multiple operations can be executed at the exact same instant, enabled by multi-core CPUs (& supercomputers), impossible on a single core CPU
  * Can be used to speed up a treatment that can be neatly broken down into parts, or even perform **speculative multithreading**
* **Parallel Extensions** = Parallel LINQ (PLINQ) + Task Parallel Library (TPL)
* **Parallel programming** = a subset of concurrent programming focused on executing tasks simultaneously, enabled by the rise of modern CPUs with multiple cores
* **Preemption** = the act of temporarily interrupting a task being carried out by a computer system, without requiring its cooperation, and with intention of resuming it at a later time
  * **Time slice/ing** = allotted amount of time for which a process is allowed to run in a preemptive multitasking system
* **Process** = an isolated executing program instance, running as one (default main launched at startup) or several (created within) threads sharing the same environment and memory space
* **Speculative multithreading** = a technique used to anticipate a user's action and preload parts of the application as s/he navigates, only to discard those paths not taken
* **SynchronizationContext** = accesses & captures (eg when encountering an `await`) contextual information on the current execution/thread
  * Can be saved and made to execute delegates via it ie `Send(delegate)` (sync) & `Post(delegate)` (async)
  * Unlike Console applications who use a threadpool as SynchronizationContext, GUIs employ **a single thread** as SynchronizationContext
  * This can cause unexpected deadlock issues with the same code that would actually work in a (console) unit test
  * [What does SynchronizationContext do?](https://stackoverflow.com/a/18098557/3559724)
* **Task** = a unit of execution/work, in C#: an optimized Thread, it represents the (immediately returned) promise that some result is going to arrive in the future
* **Thread** = a smaller unit of execution started by/within a **process**, sharing memory with other threads
    Threads are the basic building block of concurrent programming in C#
  * **Foreground Thread** = maintains the application alive while it is running
  * **Background Thread** = terminates abruptly as soon as the application closes (default, unless _IsBackground_ property is modified)
* **Thread Affinity** = a constraint placed on UI elements which can only be accessed/modified from the thread that created them
  * In WPF, `Dispatcher.BeginInvoke(delegate)` queues a (possibly non-UI) delegate for execution on the UI thread
  * IN .NET, `SynchronizationContext` send/post methods forward the execution of a delegate to a specific SynchronizationContext
* **Thread Pool** = a set of usable & recyclable threads usable within a process that can be allocated to run incoming queued up operations
  * This design alleviates the need to create and destroy Threads on demand, a costly operation when it's done with too high a frequence, by recycling a collection of usable pre-instantiated Threads
* **UI Thread**
  * In Winform, the thread on which the first form is created is known as the UI thread
  * UI-based applications (WinForms, WPF, Silverlight) all place restriction on which threads can access/modify UI controls (ie the ones that created them)
  * Not a 'special' thread (although not in the pool) but is dedicated to reacting to UI events (by reading a message loop infinitely) & repaint stuff accordingly

## Links

* [Microsoft - Asynchronous programming scenarios](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/concepts/async)
* [Microsoft - Best Practices in Asynchronous Programming](https://msdn.microsoft.com/en-us/magazine/jj991977.aspx)
  * **Avoid async void**, **Async all the way**, `ConfigureAwait(false)`, _A Common Deadlock Problem When Blocking on Async Code_
  * Using `Task.Result/Wait()` in **synchronous** code causes it to fully pause/block its (Synchronization)Context, so when inner **async** await (callback part) resumes, it can't
* [Stephen Cleary - There is no thread](http://blog.stephencleary.com/2013/11/there-is-no-thread.html)
* [Stephen Cleary - Don't block on async code](http://blog.stephencleary.com/2012/07/dont-block-on-async-code.html)
* [Stephen Cleary - SynchronizationContext](https://docs.microsoft.com/en-us/archive/msdn-magazine/2011/february/msdn-magazine-parallel-computing-it-s-all-about-the-synchronizationcontext)
* [Stephen Toub - Deadlocks](https://devblogs.microsoft.com/pfxteam/await-and-ui-and-deadlocks-oh-my)
* [.NET Parallel Programming](https://devblogs.microsoft.com/pfxteam) (@Stephen Toub)
* [Use ConfigureAwait(false)](https://medium.com/bynder-tech/c-why-you-should-use-configureawait-false-in-your-library-code-d7837dce3d7f)
  * **Deadlocks**, `SynchronizationContext`, `ConfigureAwait(false)`

## API

* `await task.Delay(1000)` = resume after one second in the capture context
* `await Task.Delay(0)` = [not actually asynchronous](https://stackoverflow.com/a/33407181/3559724) as it resolves immediately
* `await Task.FromResult(koko)` = call _sync_ code (or already available async data) from _async_ method
  * Eg: getting a value from a **ConcurrentDictionary** in an _async_ method, if the key is already present, _return_ `Task.FromResult()` immediately
* `await Task.Yield()` = voluntarily yields control to the calling thread's scheduler
* `await foreach (var item in asyncSequence)`

* `Task.Run()`

* `task.Wait()` = blocking call making the completion of a task _synchronous_ (and returns its result), throws **AggregateException**
* `task.Result` = blocking call only if the task is not already completed, otherwise return immediately without blocking
* `task.ConfigureAwait(continueOnCapturedContext: true|false)` = controls the context in which the continuation/resuming of a task is executed
  * `task.ConfigureAwait(false)` is often used in UI applications to avoid deadlocks, letting the framework know it is safe to execute the continuation on any available thread from the pool rather than the original context (hence _not capturing_ the UI context)
  * Configuring this in the callee does not affect the caller (the two methods' contexts are independant)
  * It can also be useful when gradually converting an application from synchronous to asynchronous
  * It won't actually be called if the task completes too quickly
  * Don't use it if the remaining code needs the UI thread e.g. to update some control value

### Parallel

* `Interlocked.Add(int, int)` = adds two integers and replaces the first integer with their sum as an atomic operation
* `Parallel.ForEach()`
* `Thread.Start()`
* `Thread.Sleep(0)`
* `Thread.Join()`
