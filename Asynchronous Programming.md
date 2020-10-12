# Asynchronous Programming

Contrary to popular beliefe, [asynchronous programming is not parallel](https://stackoverflow.com/questions/37419572/if-async-await-doesnt-create-any-additional-threads-then-how-does-it-make-appl).

The code is actually run synchronously as it goes through each async methods down the callstack.
Going down that callstack hierarchy, we always arrive at some kind of low-level asynchronous operation, usually handled by a library, such as a Windows I/O call, some DB data fetching, or a service call.
_Note that in Windows, all I/O is asynchronous; synchronous APIs are just a convenient abstraction_(See <https://stackoverflow.com/a/12484535>).

As a each child method encounters an _await_ call, the control is given back to its parent method up the callstack, **synchronously** as well.

Going up the hierarchy of async methods, we should always arrive either:

* at the UI thread
* at a high-level Task.Run() used to fire & forget a Task performing on a background thread without needing to read the result.
* at a (well-devised) blocking call, doing something else in between task creation & waiting.
* at an event callback, that can be marked async to complete the async chain.

## UI Thread

Frameworks such as WinForms, WPF, and Silverlight all place a restriction on which threads are able to access UI controls, namely that the control can only be accessed from the thread that created it.
This is called [thread affinity](https://dailydotnettips.com/what-is-synchronizationcontext-all-about/).
See <https://devblogs.microsoft.com/pfxteam/await-and-ui-and-deadlocks-oh-my/>

It's not a special thread, just the one dedicated to react to UI events (by reading a message loop infinitely) and repaint stuff accordingly.

## async/await

The *async* & *await* keywords abstract much of the complexity of giving control up one level at an await and later resuming **synchronously**.
The promise that some result is going to arrive is encapsulated in the Task instance itself, that was returned long ago when the Task was created (but not completed).
See <https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/concepts/async/#BKMK_WhatHappensUnderstandinganAsyncMethod>

A special case is if the operation is already completed (or is extremely fast), then the await will not "pause" the method; it will continue executing immediately.
See <https://stackoverflow.com/questions/18445279/multiple-awaits-in-a-single-method>

When encountering an *await*, **if and only if the task isn't completed yet**, the current context (i.e. thread) is captured so it can be resumed when the task completes.
When Task completes, the captured context is restored, and the remaining code is executed within that context.
This can cause an issue if that context is the UI thread, and that it is using a blocking call to this async method: the method cannot resume in that blocked thread.

A method with multiple await statements will pause itself and resume its caller multiple times.
See <https://stackoverflow.com/questions/18445279/multiple-awaits-in-a-single-method>

### Under the hood

The resuming is done via a regular event callback (or various mechanisms e.g. CPU interrupt, OS Proc Call to notify task completion).
See <http://blog.stephencleary.com/2013/11/there-is-no-thread.html>

Since we're using an event callback, we might no longer be in the same thread.
Therefore, we must return to the original thread, using Dispatcher.BeginInvoke() or the SynchronizationContext.Post() - which simply inserts a message like any other in the UI thread loop.

Async/await is the syntactic sugar that handles all of this for us.
See <https://devblogs.microsoft.com/pfxteam/await-and-ui-and-deadlocks-oh-my/>

## Synchronization Context

Unlike Console applications who use a threadpool as SynchronizationContext, GUIs  employ a single thread as SynchronizationContext.
This can cause unexpected deadlock issues with the same code that would actually work in a (console) unit test.
If a (synchronous) blocking call is made in an above method, it will prevent the method below that finishes its await statement to ever complete, because the above context itself is waiting for the method to finish.
To clarify, look at the first exemple of the [following link](https://msdn.microsoft.com/en-us/magazine/jj991977.aspx): the await statement in the child method will eventually complete but that method itself will require the current thread to resume from there and fully return. Problem: in a GUI environment, that thread is the single UI thread that's been stopped by a blocking call in the parent method. Therefore the execution pointer will get stuck between the end of the await and the closing curly brace in the child method.

Access to the currently running thread.
Can be saved, and used to send/post messages.
The context of two methods are independant, i.e. the captured context can be configured using ConfigureAwait() in the callee, and the caller won't get effected.

## ConfigureAwait

This method is used to prevent the remaining code after an await to be run within the original context, which would be the UI thread in case of a GUI.

Using the following instruction, the thread pool (i.e. another random thread) will be used instead of the original calling thread:

  ConfigureAwait(continueOnCapturedContext: false);

This can be useful so that code doesn't block it or worse: cause a deadlock.
It can also be useful when gradually converting an application from synchronous to asynchronous.

Be aware that it will not actually be called if the task completes before the await mechanic intervenes.
Be careful not to use it in methods that require the context i.e. if the remaining code needs the UI thread e.g. to update some control value.

See <https://medium.com/bynder-tech/c-why-you-should-use-configureawait-false-in-your-library-code-d7837dce3d7f>

## Troubleshooting

Deadlocks occur when a blocking call, such as a Task.Wait() or a Task.Result is made instead of a clean async/await, so that the UI thread cannot be resumed and is stuck, and thus the called async operation can never resume in that stuck captured context.
See <http://blog.stephencleary.com/2012/07/dont-block-on-async-code.html>
