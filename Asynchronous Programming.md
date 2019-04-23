# Asynchronous Programming

Asynchronous programming is not parallel.
See <https://stackoverflow.com/questions/37419572/if-async-await-doesnt-create-any-additional-threads-then-how-does-it-make-appl>

The code is actually run synchronously going deep down the callstack for each Task started.
Going down the hierarchy, we should arrive at a an asynchronous fire & forget treatment that is given back control via an event mechanism.

Then it successively give control back up the callstack, synchronously, to each calling method as an *await* is encountered in its callee.
Going up the hierarchy of async methods, we should always arrive either:

* at a high-level Task.Run() used to fire & forget a Task running on a background thread e.g. loading some data
* at a well-devised blocking call, doing something else in between task creation & waiting
* at an event callback, that we can make async to make the async chain mechanism work

## UI Thread

UI frameworks like WinForms, WPF, and Silverlight all place a restriction on which threads are able to access UI controls, namely that the control can only be accessed from the thread that created it. See <https://devblogs.microsoft.com/pfxteam/await-and-ui-and-deadlocks-oh-my/>

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