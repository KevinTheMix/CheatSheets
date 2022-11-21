# Prism

Prism = MvvM + Event aggregation + Region Manager (à la ASP Master Page) + INavigationAware methods (From/To) + DI (via either MEF or Unity).

## Components

* [Event Aggregator](https://prismlibrary.com/docs/event-aggregator.html)
* [ViewModelLocator](https://www.youtube.com/watch?v=I_3LxBdvJi4) (naming convention-based)
* MEF (Microsoft Extensibility Framework) = Decentralized (no container), plugin-based (extension via interface implementations), configurable (via app config file & _[attribute]_ metadata) DI engine with runtime discoverability (live DLL assemblies scanning)
  * _System.Composition_ is the namespace of MEF Nuget Package.
