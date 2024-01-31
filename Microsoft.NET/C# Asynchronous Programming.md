# Asynchronous Programming

Asynchronous programming enables lower-level methods performing I/O-bound operations to yield control back up their call stack, up to any parent caller that does not require their immediate result and can continue running in the meantime.
That design is especially instrumental in keeping the GUI responsive and not freezing.
Those time-consuming operations can be a low-level (web) service or Windows I/O call, or some DB data fetching.
Note that [in Windows, all I/O is asynchronous; synchronous APIs are just a convenient abstraction](https://stackoverflow.com/a/12484535).

It is achieved by breaking the synchronicity of the flow via a _fire, forget & callback_ mechanism, with a spoon of synctactic sugar.
The `async` & `await` keywords abstract much of the complexity of giving control up one level at an await and later resuming **synchronously**.

Note that it all happens **synchronously** (it is not concurrent):

* The passing of control back to the parent is performed **synchronously** (so was calling the `async` child method)
* The resuming of control is performed via **synchronous** event callback (or various mechanisms eg CPU interrupt, OS Proc Call to notify completion)
  * Since we use callbacks, we may no longer be in the same original thread, so we need to address **thread affinity**
* => Contrary to popular belief, [async-await does not create any additional threads](https://stackoverflow.com/q/37419572)

## Glossary

* `async` = defines an asynchronous method which returns a `Task<T>` immediately but whose actual result will be available later
  * The entire call stack must be marked `async`, up to an (`async void`) event handler, _main_/Domain, `Task.Run()`, a WebAPI controller
  * Never define `async void` methods, unless [subscribing to events](https://stackoverflow.com/a/38241969/3559724)
* `await` = suspends current context & non-blockingly yields control back to caller whilst waiting for an asynchronous operation to conclude (a Task result)
  * If the awaited task is already completed (or is _extremely fast_), the current context is not captured and the execution continues immediately/synchronously
  * When the task completes, the captured context is restored and the remaining code is executed within that context
  * There may be no statements left in the method, but it **still needs execution time to exit**, hence potential deadlocks if the captured context is blocking  
  * [A method with multiple await statements will pause itself and resume its caller multiple times](https://stackoverflow.com/a/18445829)
* **AggregateException** = multiple exceptions into a single exception instance
* **Context (capture)** = context is (essentially information about) a thread
* **Deadlock** = when multiple threads are waiting for each other to release a resource
  * Can occur in a UI setting when a blocking calls (`task.Wait()`/`task.Result`) prevents the child task from resuming in the caller's blocked captured context
* **Multitasking** = perform multiple tasks concurrently (but not in parallel) without blocking the execution of the main thread
* **SynchronizationContext** = accesses & captures (eg when encountering an `await`) contextual information on the current execution/thread
  * Can be saved and made to execute delegates it via `Send(delegate)` (sync) & `Post(delegate)` (async)
  * Unlike Console applications who use a threadpool as SynchronizationContext, GUIs employ **a single thread** as SynchronizationContext
  * This can cause unexpected deadlock issues with the same code that would actually work in a (console) unit test
  * [What does SynchronizationContext do?](https://stackoverflow.com/a/18098557/3559724)
* **Task** = optimized Thread, it represents the (immediately returned) promise that some result is going to arrive in the future
* **Thread Affinity** = UI elements can only be accessed/modified from the thread that created them
  * In WPF, `Dispatcher.BeginInvoke(delegate)` queues a (possibly non-UI) delegate for execution on the UI thread
  * IN .NET, `SynchronizationContext` send/post methods forward the execution of a delegate to a specific SynchronizationContext
* **Thread Pool** = a set of usable & recyclable threads usable within a process
* **UI Thread**
  * In Winform, the thread on which the first form is created is known as the UI thread
  * UI-based applications (WinForms, WPF, Silverlight) all place restriction on which threads can access/modify UI controls (ie the ones that created them)
  * Not a 'special' thread (although not in the pool) but is dedicated to reacting to UI events (by reading a message loop infinitely) & repaint stuff accordingly

## Links

* [Microsoft - Asynchronous programming scenarios](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/concepts/async)
* [Microsoft - Best Practices in Asynchronous Programming](https://msdn.microsoft.com/en-us/magazine/jj991977.aspx)
  * **Avoid async void**, **Async all the way**, `ConfigureAwait(false)`, _A Common Deadlock Problem When Blocking on Async Code_
* [Stephen Cleary - There is no thread](http://blog.stephencleary.com/2013/11/there-is-no-thread.html)
* [Stephen Cleary - Don't block on async code](http://blog.stephencleary.com/2012/07/dont-block-on-async-code.html)
* [Stephen Toub - Deadlocks](https://devblogs.microsoft.com/pfxteam/await-and-ui-and-deadlocks-oh-my)
* [Use ConfigureAwait(false)](https://medium.com/bynder-tech/c-why-you-should-use-configureawait-false-in-your-library-code-d7837dce3d7f)
  * **Deadlocks**, `SynchronizationContext`, `ConfigureAwait(false)`

## API

* `await task.Delay(1000)` = resume after one second in the capture context
* `await Task.Delay(0)` = [not actually asynchronous](https://stackoverflow.com/a/33407181/3559724) as it resolves immediately
* `await Task.FromResult(koko)` = call _sync_ code (or already available async data) from _async_ method
  * Eg: getting a value from a **ConcurrentDictionary** in an _async_ method, if the key is already present, _return_ `Task.FromResult()` immediately
* `await Task.Yield()` = voluntarily yields control to the calling thread's scheduler

* `task.ConfigureAwait(continueOnCapturedContext: true|false)` = controls the context in which the continuation/resuming of a task is executed
  * `task.ConfigureAwait(false)` is often used in UI applications to avoid deadlocks, letting the framework know it is safe to execute the continuation on any available thread from the pool rather than the original context (hence _not capturing_ the UI context)
  * Configuring this in the callee does not affect the caller (the two methods' contexts are independant)
  * It can also be useful when gradually converting an application from synchronous to asynchronous
  * It won't actually be called if the task completes too quickly
  * Don't use it if the remaining code needs the UI thread e.g. to update some control value
* `task.Wait()` = blocking call making the completion of a task _synchronous_ (and returns its result), throws **AggregateException**
* `task.Result` = blocking call only if the task is not already completed, otherwise return immediately without blocking

* `await foreach (var item in asyncSequence)`
