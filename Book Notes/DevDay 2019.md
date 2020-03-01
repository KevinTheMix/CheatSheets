# DevDay 2019

<https://rating.devday.be/>

## Design Patterns

Don't instantiate HttpClient multiple times; inject it from startup in classes that use it.
Don't forget to apply a ToArray()/ToList() on cached variables.
Use `Task.FromResult()` to call sync code from async methods.

* Decorator
  * Add a behavior, at runtime, without modifying the existing, separation of concerns.
  * Implements the Interface of a decorated object, and receives an instance in its constructor. Then, call the methods of that instance, adding extra features.
* Adapter
  * Adapts interface A into interface B
* Composite
  * Composite class implements interface and manages a collection of instances (or a factory), then dispatchs calls to one of those instances.
* Singleton
  * A Single instance.
  * Hard to test
* Builder
  * Used in .Net Core configuration
* Iterator
  * Cfr .Net GetEnumerator() (well-spred nowadays)

## [.NET Hidden Gems & Quirks](https://github.com/faniereynders/aspnetcore-hidden-gems)

* IStartupFilter
* Startup{Environment} & Configure{Environment}Service
* Kestrel implements IServer (StarAsync() & StopAsync()), and we can implement our own IServer.
* Custom conventions = Specify suffix, routes, etc. by namespace

## Asynchronous Debugging

* procdump -ma {pid}
* sysinternals
* windbg

* <https://labs.criteo.com/>
* <https://medium.com/@kevingosse>
