# Testing

## Quick Tips

* [Overview](https://docs.flutter.dev/testing)
* [Cookbook](https://docs.flutter.dev/cookbook/testing)
* [Codelab](https://codelabs.developers.google.com/codelabs/flutter-app-testing)

## Glossary

* **Binding** = test environment setup singleton object, connects test code to Flutter engine & framework internals (rendering pipeline, frames pump, I/O events)
* **Golden Test** = compares appearance of app over time and on different platforms against a reference "golden" (source of truth) image
* **Integration Test** = end-to-end (with GUI showing) testing of combined individual parts as a whole (similar to Earl Gray, Espresso, Protractor, Selenium, WebDriver)
  * **Performance Test** = integration test with (high speed) stress testing & performance profiling/tracing (see <https://docs.flutter.dev/cookbook/testing/integration/profiling>)
* **Target Device** = device on which an integration test is run (ie mobile, browser or desktop)
* **Unit Test** = test on a single entity (eg a class)
* **Widget Test** = pump one widget & run I/O on it (with/without GUI, eg `flutter run {test_file}` runs on device/emulator)

### Packages

* **alchemist** (_@betterment.dev_) = provides functions, extensions, documentation to support golden tests
* **flutter_driver** (_deprecated_) = integration testing ([use **integration_test** instead](https://docs.flutter.dev/release/breaking-changes/flutter-driver-migration))
* **flutter_test** = widget testing library built on top of **test** (adds class `testWidgets()`, a **WidgetTester** class with pump methods, finders & matchers, setup & teardown)
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
  * `flutter test integration_test` = runs all integration tests located in _integration\_test_ folder (located at app root-level, ie same level as _lib_ & _test_)
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

## [Debugging](https://docs.flutter.dev/testing/code-debugging)

Run apps actually without debugging (unless intended) for faster development/execution cycles.

* [DevTools](https://docs.flutter.dev/development/tools/devtools) = debugging & performance tools
  * [Flutter Inspector](https://docs.flutter.dev/development/tools/devtools/inspector) = visualize & explore widget trees
    * **Layout Explorer** = debug/inspect/edit layout properties in real-time
* Use special variable _kDebugMode_ is true in Debug mode
* Use `toStringDeep()` = a string representation of this node and its descendants
* Use _dart:convert_ `jsonEncode(…)` to encode & pass whole objects
* For custom widgets, override `debugFillProperties()` to add custom information (**DiagnosticsProperty**) into Flutter widget tree inspector (especially when publishing packages)
* Toggle Repaint Rainbow tool to identify superfluous repaints (via **DevTools** or setting _debugRepaintRainbowEnabled_ in main by importing _rendering.dart_)
* **DevTools**: add log to Logging view (or system console)
  * Print to _sdout_ & _stderr_ via `print(…)` or `stderr.writeln(…)` (from _dart:io_)
  * Use `debugPrint()` to wrap `print(…)` and avoid Android throttling log lines due to too high a volume
  * Use _dart:developer_ `log(…)`, eg with object as error `developer.log(…, name: …, error: jsonEncode(koko)`
  * Use Inspector (with mouse) to locate both widget in tree and also widget location in source code file
  * View Network Response tab to investigate API HTTP calls (instead of printing them to terminal)
* Set breakpoints (programmatic breakpoints via _dart:developer_ `debugger(when: condition)` statement)
* Print widget tree via `debugDumpApp()` (from _package:flutter/rendering.dart_) from within `runApp()` (calls `toStringDeep()` recursively)
* Print render tree via `debugDumpRenderTree()` not during layout/paint (in a callback/event handler), displays all constraints
* Print layer tree via `debugDumpLayerTree()`
* Print focus tree via `debugDumpFocusTree()`
* Print semantics tree via `debugDumpSemanticsTree()`
* Highlight layout issues via `debugPaintSizeEnabled` from _package:flutter/rendering.dart_ set to true (boxes, padding, alignment, spacers)
* Slow down animations via **DevTools** Inspector view, or set `timeDilation` from _scheduler.dart_ to number greater than 1.0
* Tracing = **Timeline** utilities in _dart:developer_ (`startSync(…)` & `finishSync()`)
* Performance overlay = `MaterialApp { showPerformanceOverlay: true }` (look for spikes in second graph, while running app in profile mode ie `flutter run --profile`)
* Alignment grid = `MaterialApp { debugShowMaterialGrid: true }` or use a **GridPaper** (inside a **Stack** to use as overlay)
* Before `runApp(…)`, set `ErrorWidget.builder` to a callback returning a custom (Material) widget to display in place of error default red screens, and taking in **FlutterErrorDetails** as parameters
* **leak_tracker** package to identify memory issues in Dart & Flutter

## [Troubleshooting](https://docs.flutter.dev/testing/common-errors)

* Red text with yellow double underline = a Material Design based widget (eg **Text**, **Slider**, etc) does not have an ancestor providing default styling (eg **DefaultTextStyle**)
  * Usually, that ancestor is included in another widget (eg **Scaffold** which adds a **Material** widget that applies that styling)
  * Same goes for widgets that require a **MediaQuery** ancestor (provided via **MaterialApp**)

* _Vertical viewport was given unbounded height_
  * A space-hungry misbehaving **ListView** is inside an unbounded constraints permissive (**Flex**) **Column**
  * Read [Column class Troubleshooting](https://api.flutter.dev/flutter/widgets/Column-class.html#troubleshooting)
  * Watch [Decoding Fluter: Unbounded height/width](https://www.youtube.com/watch?v=jckqXR5CrPI)
  * Solution = be specific as possible in intended layout and bounds given to ListView
    * => wrap the ListView in either flex-space-sharing-friendly **Expanded**/**Flexible**, or a **SizedBox** with a pre-fixed height
  * [shrinkWrap](https://api.flutter.dev/flutter/widgets/ScrollView/shrinkWrap.html) fixes the error, but do not use it with **Nested ListViews**
    * _shrinkWrap_ forces (sub-)lists to render upfront instead of lazily, which is costly performance-wise
    * Watch [Decoding Flutter: ShrinkWrap vs Slivers](https://www.youtube.com/watch?v=LUqDNnv_dh0)
    * => to handle nested lists, replace them instead with a **CustomScrollView** with **SliverList** children

* _RenderFlex children have non-zero flex but incoming height constraints are unbounded_
  * Caused when a (non-zero flex) **Flexible** child ask to take all of remaining available space in an unbounded (ie infinite) context (eg **Expanded** within a **Column** within a **Column**)
  * There are two related but distinct notions associated with this error: **Flex** & **Flexible**
  * Outer Column receives bounded constraints from its parent (eg screen/Scaffold)
  * Inner Column receives unbounded constraints, as Columns are fixed size: they are (**Flex** but) not **Flexible** (ie no flex-factor property)
  * Inner Expanded now has unbounded constraints and wants all of infinity, which is bad
  * Solution = either wrap inner Column inside an(other) **Expanded**, or set inner **Expanded**'s _flex_ factor to zero, thereby making it non-flex (_tested & confirmed_)
  * Read [Column > Column > Expanded Explanation](https://stackoverflow.com/a/66718208/3559724)
  * Read [Column class Troubleshooting](https://api.flutter.dev/flutter/widgets/Column-class.html#troubleshooting)

* Virtual keyboard causing yellow/black pattern
  * When the keyboard comes up, it adds some height padding at the bottom of the screen with the goal of keeping the target input field in view. But if the height is fixed and there no scrollable parent wraps the input field, this just pushes that padding outside the view
  * => Set **Scaffold**'s _resizeToAvoidBottomInset_ property to _false_ (and possibly wrap some areas with **SingleChildScrollView**)
  * `Scaffold(resizeToAvoidBottomInset: false` = [fix virtual keyboard overflow](https://stackoverflow.com/a/57441971/3559724)

* _Incorrect use of ParentDataWidget Error in Flutter_
  * **Flexible**, **Expanded**, **Positioned** & **TableCell** each require a specific type of parent (namely: **Column/Row**, **Flex**, **Stack**, **Table**)
  * <https://www.fluttercampus.com/guide/229/incorrect-use-of-parentdatawidget-error/#solution-of-the-error>

* Lazy GridView.builder() or ListView.builder() does not update properly even with keys
  * This occurs because lazy loading makes it impossible to refresh references at build time (builder does not know which items will get built).
  * Use keys with `findChildIndexCallback` to help Flutter update the widget references upon rebuild.

* _SizedBox for whitespace_
  * Problem: a **Container** is used, but we only use its _height_/_width_ properties
  * Solution: it could be advantageously replaced with the leaner **SizedBox** widget, which also has the benefit of a _const_ constructor
  * See <https://www.flutteroverflow.dev/sized-box-for-whitespace/>

* Faint border lines above/below some widgets
  * **DrawerHeader** = set **Divider** `color` (to _transparent_) or `width` (to _0_) via (global/local) themeing
  * **Material/Card** = set the _shape_'s _side_'s `color` (to _transparent_) or `width` (to _0_)

* Web
  * Hack: set `<base href>` manually to _./_ relative path to deploy in a (non-root) subfolder
    * note that _index.html_ contains a unique service worker version ID changing at each build so don't replace the whole file
  * run `flutter clean` then rebuild if _flutter.js_ is not regenerated each time (see <https://stackoverflow.com/a/73780022/3559724>)
