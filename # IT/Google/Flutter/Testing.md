# Testing

## Quick Tips

* [Overview](https://docs.flutter.dev/testing)
* [Cookbook](https://docs.flutter.dev/cookbook/testing)
* [Codelab](https://codelabs.developers.google.com/codelabs/flutter-app-testing)

## Glossary

* **Binding** = test environment setup singleton object, connects test code to Flutter engine & framework internals (rendering pipeline, frames pump, I/O events)
* **Integration Test** = end-to-end (with GUI showing) testing of combined individual parts as a whole (à la Earl Gray, Espresso, Protractor, Selenium, WebDriver)
  * **Performance Test** = integration test with (high speed) stress testing & performance profiling/tracing (see <https://docs.flutter.dev/cookbook/testing/integration/profiling>)
* **Target Device** = device on which an integration test is run (ie mobile, browser or desktop)
* **Unit Test** = test on a single entity (eg a class)
* **Widget Test** = pump one widget & run I/O on it (with/without GUI, eg `flutter run {test_file}` runs on device/emulator)

### Packages

* **flutter_driver** (_deprecated_) = integration testing ([use **integration_test** instead](https://docs.flutter.dev/release/breaking-changes/flutter-driver-migration))
* **flutter_test** = widget testing library built on top of **test** (adds `testWidgets()`, finders & matchers)
* **integration_test** (_@flutter.dev_, now integrated to SDK itself) = automated testing of app UI
* **mockito** (_@dart.dev_) = mock library for Dart inspired by Java's [mockito](https://github.com/mockito/mockito) (mocking framework for unit tests)
* **mocktail** (_@felangel.dev_) = mock library for Dart inspired by mockito (simpler without manual mocks/code generation)
* **riverpod_test** (_@eronsoft.com_) = tests riverpod notifiers/providers state logic (internally, not for mocking them eg in a UI widget test)
* **test** (_@dart.dev_) = Dart standard test library (provides `group()`, `test()`, `expect()`, comparers)

## API

* `flutter drive` = pilot integration test on a real device/emulator
  * `-d {platform}` = eg _chrome_, _edge_, _web-server_, _windows_
  * `--driver={driver_file}`
  * `--target={integration_test}`
  * `--profile` = compile app for 'profile' rather than 'debug' mode, making benchmark closer to user real experience
  * `--no-dds` = disables Dart Development Services (when running on a mobile device/emulator) used to communicate with a Dart VM Service instance
* `flutter test` = run all tests
  * `flutter test integration_test` = runs integration tests located in _integration\_test_ folder located at app root-level (ie same level as _lib_ & _test_)
  * `flutter test {path}` = run a specific test unit/widget/integration file
  * `flutter test --plain-name "{name}"` = runs all specific groups/test whose beginning of description string matches _name_
* `flutter run {path}` = run a specific test file with a live GUI (on a device/emulator), enabling hot reload/Restart

### test

* `expects(expression, result)`
* Matchers = `lessThan()`, `throwsA()` error

### flutter_test

* `binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive` = good for testing animated code
* `TestWidgetsFlutterBinding.ensureInitialized()` (idempotent) = create & initialize binding (default binding installed for Widget tests)
  * Sets up widget test environment: fake clock, fake GPU (does not run on a real device)
* **WidgetTester** = programmatically interact with widgets & test environment
  * `pumpWidget()` = similar to `runApp()`
  * `pump()` = pump one frame
  * `pumpAndSettle()` = repeatedly calls `pump()` within provided/default duration until there are no more frames scheduled (essentially waits for all animations to complete)
* I/O = `drag()`, `enterText()`, `fling()`, `scrollUntilVisible()`, `tap()`
* Finders (`find.`) = `byIcon()`, `byKey()`, `byTooltip()`, `byType()`, `text()`
* Matchers = `findAny`, `findsNothing`, `findsOne(Widget)`

### integration_test

* `IntegrationTestWidgetsFlutterBinding.ensureInitialized()` = returns integration test driver binding instance (creating/initializing it if necessary)
  * Extends **flutter_test**'s `TestWidgetsFlutterBinding` with: running on real device/emulator, reporting results to Flutter tool (`flutter test`), platform channels & real async events
* `traceAction(action)` = records actions & generates a performance timeline, requires a twin driver file to produce a timeline summary (a thousand times smaller, both generated in _build_)
