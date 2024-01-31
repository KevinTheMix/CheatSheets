# Prism

Prism is a framework combining the following components:

* MvvM
* An [Event Aggregator](https://prismlibrary.com/docs/event-aggregator.html)
* A Region Manager (à la ASP Master Page)
* Navigation (from/to) via **INavigationAware** methods
* DI via either **MEF** (see below) or Unity

* [Prism - Using the ViewModelLocator](https://www.youtube.com/watch?v=I_3LxBdvJi4) (naming convention-based)

## MEF (Microsoft Extensibility Framework)

Decentralized (no container), plugin-based (extension via interface implementations), configurable (via app config file & _[attribute]_ metadata) DI engine with runtime discoverability (live DLL assemblies scanning).

The namespace of MEF Nuget Package is _System.Composition_.
