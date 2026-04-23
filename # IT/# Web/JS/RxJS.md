# RxJS (Reactive X for JavaScript)

RxJS is a JavaScript library for working with asynchronous data using Observables (à la _Lodash_ for events).
It helps handling things like events, HTTP requests, timers, streams of values over time.

## Quick Tips

* [ReactiveX](https://reactivex.io) = cross-platform asynchronous programming (eg debounce) with observable streams API (for eg .NET, Java, JavaScript)
* `BehaviorSubject('')` always emits its current value immediately to any new subscriber, which happens upon creation so a `skip(1)` is warranted

## Glossary

* **Emitting** (an event) = when an observable emits a value
* **Observable** = a thing that can produce **values over time** (ie an observable stream you can subscribe to that emits value whenever)
  * Inner = observable getting piped (haem)
  * Outer = observable returned by lambda inside map
  * Cold = no activity until you subscribe, each subscription creates its own execution, subscribing starts it
  * Hot = produces values independently of subscriptions, exists before you subscribe, subscribing does not start it (eg a Subject)
* **Observer** = built-in shape with three optional callbacks (next, error, complete)
* **Subject** (extends both _Observable_ & _Observer_) = observable that you can also feed using Observer methods

## API

* _variable$_ = naming convention (not required) indicating that variable is an **Observable**

### Observable

* `from(<object>)` = creation function turning things (ie objects) into observables (eg `from('ABC')` emits characters _A_, _B_, _C_)
* `pipe()` = builds a new observable stream obtained by chaining applied operators (does not run anything by itself)
* `subscribe(next: …, error: …, complete: …)` or `subscribe(<observer>)` = terminally listens to a stream
  * On an Observable, activates it (ie execute it)
  * On a Subject, attaches an observer and consumes the Subject

### Observer/Subject

* `complete()` = signal that an observable has finished successfully
* `error(<err>)` = signal that an observable has failed
* `next(<value>)` = emit a value to its subscribers

### Operators (inside a pipe)

* `debounceTime(<ms>)` = emit only after silence of X ms
* `distinctUntilChanged()` = ignore new term if same as previous
* `filter()` = where condition
* `map()` = transforms values, not observables
* `pairwise()` = emits previous & current values together as a tuple, nothing is emitted until two values exist (eg for tracking scroll direction, value deltas, state transitions)
* `skip(n)` = skips first n emitted values from an observable
* `takeUntil(<observable>)` = automatically unsubscribe from an observable when another observable (eg `this.destroy$`) emits (usually in `ngOnDestroy()`)
* `tap(fn)` = runs code without modifying emitted data passing through stream (eg for logging, debugging, metrics)
* Higher-order mapping operators (return an inner observable)
  * `concatMap()` = run inner observables one after another (queue)
  * `exhaustMap()` = ignore new values while current inner observable is running
  * `mergeMap()` = run all inner observables at same time
  * `switchMap(…)` = cancels previous inner subscriptions when new value arrives, emits value only from most recent/latest inner observable
