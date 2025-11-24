# Flutter

Highly performant (close to native) open-source UI **SDK** by Google for cross mobile (Android/iOS) & desktop (Windows, MacOS, Linux) & later Web applications from a single (Dart) codebase.

Flutter was started as an experiment by members of the Chrome team for a new kind of layout/rendering engine.

Features:

* Everything is Dart (no specialized layout HTML/XML language)
* Everything is a widget (including pure layout components eg **Center**, **Padding**), all (visual element) leaves are **RenderObject**
  * Widgets are UI building blocks as app blueprint/recipe, based on (Google) Material & (Apple) Cupertino design
* Flutter is faster than React Native, closer to native performance (see graph Fireship's R vs F)
* Native pixel painting (à la Unity/Unreal) via Skia/Impeller painting libraries
* Advanced 2D/3D morph/transform animations à la PowerPoint transitions (see eg **Transform** widget)
* Access to native features (location, maps, camera), especially wrapped through rich 3rd-party growing plugins ecosystem
* State-based [declarative style](https://docs.flutter.dev/get-started/flutter-for/declarative) with reactive views (ie `UI = f(State)`)
  * UI isn't manually managed (à la WinForm) or even via individual bound mutable properties/viewmodel (à la WPF), only state is managed to rebuild UI parts
  * UI gets updated Flutter granularly/modularly replacing immutable widget(s) in hierarchy with other immutable widgets
    * Components don't get updated, instead old ones get dropped & replaced very quickly with fresh ones
  * Flutter compares old & new widget trees, and updates UI accordingly (if necessary)
  * State is separated from widgets, so as they get replaced, **state persists**

## Quick Tips

* [Medium blogs](https://blog.flutter.dev)
* [Community](https://flutter.dev/community)
* [Stay up to date](https://docs.flutter.dev/release)
* [Flutter samples](https://github.com/flutter/samples)
* [It's All Widgets!](https://itsallwidgets.com) = list of Flutter apps
* [Performance best practices](https://docs.flutter.dev/perf/best-practices)
* [Stack Overflow](https://stackoverflow.com/questions/tagged/flutter) = newest questions
* [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources) = samples & cookbooks
* [@Wm Leler](https://leler.com/wm/bio.html#flutter) = Flutter-promoting articles (eg _what's revolutionary?_, _why Dart?_ UX study with eight developers, _company pitch_)
* [Matthew Smith - Why we chose Flutter and how it's changed our company](https://medium.com/@matthew.smith_66715/why-we-chose-flutter-and-how-its-changed-our-company-for-the-better-271ddd25da60)
* _const_ in front of constructors is very important, making rendering more efficient by skipping most of rebuild
* It's possible to create & assign widgets to variables, then we can access their properties (eg height) down the tree, or add them conditionally in several places
* Break down long widgets into modular widgets rather than helper methods (see Decoding Flutter video on that topic)
* Use `compute()` (similar to Dart `Isolate.run()`) to run a given callback in background, for operations that take longer than a few milliseconds
* `build()` should remain 'pure' ie without side-effects (see <https://stackoverflow.com/a/52249579/3559724>)
* Refactor small widget subtrees subject to frequent change out of large `build()` methods to leverage **more granular & efficient rebuilds**
* Builders are methods that can map data to return widgets dynamically, also enable describing UI declaratively (as `build()` does)

## Glossary

* [Architecture](https://docs.flutter.dev/resources/architectural-overview#anatomy-of-an-app)
  * **Runner** = platform-specific native host shell app package and its main entrypoint (eg an Android Activity/iOS UIViewController), originally generated via `flutter create`, owned/modifiable by app developer
  * **Embedder** = platform-specific C API library used by Runner providing services for rendering surfaces/accessibility/input, event loop (eg `FlutterEngineRun()`, `FlutterEngineShutdown()`)
  * **Engine** = platform-agnostic C/C++ Flutter core, including rendering engine (Skia/Impeller), Dart Runtime (including Dart VM that runs user Dart & framework Flutter code), platform channels, Embedder API
  * **Framework** = platform-agnostic Dart Flutter classes (high-level API in Dart)
  * **Dart App** = platform-agnostic Dart user custom app
  * [Inside Flutter](https://docs.flutter.dev/resources/inside-flutter) = optimized & single pass layouting, onboarding strategies
* [BLoC](https://www.flutterclutter.dev/flutter/basics/what-is-the-bloc-pattern/2021/2084) = state management design pattern using Streams of events (in) & states (out)
* `build(BuildContext context)` = is itself a sort of _builder_ (ie indirect callback)
* [Build Modes](https://docs.flutter.dev/testing/build-modes) = Debug (development, Hot Reload), Profile (performances analysis), Release (release app)
* **BuildContext** = context for current widget, holds a reference to its corresponding Element, handle for widget location in its tree
* [CanvasKit](https://skia.org/docs/user/modules/canvaskit) = lightweight version of Skia compiled to WebAssembly optimized for web browser (paint to HTML canvas/SVG) via WebGL
* [Casual Games Toolkit](https://docs.flutter.dev/resources/games-toolkit) = mobile games development resources
* **Configuration** = refers to a widget's input parameters/properties provided by its parent, or to a Widget in relation to its corresponding Element
* **Element** (implements **BuildContext**) = instantiation of a Widget at a particular location in the _Element Tree_ (that Widget is considered that Element's _configuration_)
  * An elements is very simple, holding just a reference to associated widget (& its original type), its children elements, and potential State
  * Elements are mutable and modified in place to reflect changes in Widgets tree, hence Elements tree is seldom rebuilt & more stable, and acts as a buffer/**cache** between configuration & rendering
  * Element Tree acts as an app skeleton, and is built and handled all automatically by Flutter (based on the Widget Tree), using it to pilot widgets lifecycle, and update/redraw UI
  * (You can think of Elements as association tables, because they hold practically no data and mostly point to other stuff (Widget & State))
  * **StatefulElement** = an **Element** that uses a **StatefulWidget** as its configuration
  * **StatelessElement** = an **Element** that uses a **StatelessWidget** as its configuration
  * **ComponentElement** = container/host for other elements
* [Flutter Create](http://flutter.dev/create) = a one-time coding competition in 2019
* **FVM** (Flutter Version Management) = small CLI tool to manage several Flutter SDK relseases side-by-side
* [Impeller](https://github.com/flutter/flutter/wiki/Impeller) = latest rendering enging replacing Skia (already on iOS since Flutter 3.10), eliminating costly runtime shader compiling
* [Internationalization](https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization)
* **Keys** — see [@Emily Fortuna - Keys! What are they good for?](https://medium.com/flutter/keys-what-are-they-good-for-13cb51742e7d)
  * A way to keep track of States (ie for Stateful Widgets only), useful when adding/reordering widgets on the screen
  * **LocalKey** = match elements in their local tree (ie among its siblings), so put them at top of (sub)tree to preserve
    * **UniqueKey** = à la GUID
    * **ObjectKey** = bases off multiple values (eg address) which aggregated are unique
    * **ValueKey** = bases off a single value (eg TODO item task's text) which is unique amongst its siblings
      * **PageStorageKey** = persists a widget state (including user scroll location) so it can be resumed upon recreation
  * **GlobalKey** = unique across entire app, access/preverves a widget state (ie `GlobalKey<{state}>` eg **AnimatedListState** or **NavigatorState**) from anywhere in tree (via `kokoKey.currentState`)
    * **GlobalObjectKey**
    * **LabeledGlobalKey**
* **Packages**/**Modules** = Dart code **only**; can use plugins (and still qualify as a package); they're published to <https://pub.dev>
* **Platform Channel** = bi-directional communication between Flutter custom code and native platform, with serialization (thus slowser than FFIs) via _codecs_
  * **MethodChannel** = invoke a method on native platform and get back some value
  * **EventChannel** = stream data continuously/unidirectionally from native platform to Flutter
  * **BasicMessageChannel** = send/receive asynchronous messages in both directions
* **Property** = actual value held in a widget eg the _text_ property of a **RichText** widget
* **RenderBox** (extends **RenderObject**) = 2D Cartesian coordinate system (with a _size_ property, and **BoxConstraint** _constraints_ property inherited from parent)
* **RenderObject** = counterpart of **RenderObjectElement** (but not **ComponentElement**) in a **RenderTree**, abstract model for layout and painting
  * Render tree object handling concrete operations (layout, painting, hit testing, accessbility) without child model (undefined child/children/named children) nor coordinate system (Cartesian/polar)
  * Paints UI via dedicated subclasses that can handles size, layout, painting (eg **RenderParagraph** renders text, **RenderImage** an image)
  * Everything that we see displayed on screen is a RenderObject
* **RenderObjectElement** = **Element** that uses **RenderObjectWidget** as configuration, with an associated **RenderObject** in render tree, participates in layout/paint phases (ie a leaf element)
* **RenderObjectWidget** = configuration for **RenderObjectElement**
* **RenderTree** = data structure storing UI geometry (computed at layout, used for painting & hit testing)
* **RenderView** = root of all RenderObjects, it total output of Render Tree (its `compositeFrame()` generates a frame to display)
* **Skia** = open-source cross-platform 2D (3D via Vulkan & Metal) GPU-accelerated graphics library to draw stuff, written in C++ (à la Unity, running in web as WebAssembly), also used by Chrome
  * Native Android apps also use Skia as part of their rendering routine, however Flutter packs its own standalone copy (in the engine layer) to remain decouple from a platform's specific version
* **Slivers** = different parts of a scrollable area that can each react appropriately to the same scroll
* **State** = objects associated with stateful widgets (actually linked **from** their associated Elements)
  * _widget_ = access to its associated widget's properties (usually passed down from parent)
  * _context_ = access to its associated widget's context (ie outside of `build()`, declare `late final` variables to use in an initializer)
  * `build()` = called by Flutter (and never directly!), possibly very often whenever it needs to paint something (ie `setState()` called, or parent input data changes, or once during app creation)
    * Always return a new or cached (tree of) widget(s), ie it constitutes a reactive snapshot of UI
  * `setState()` = [takes in & executes an anonymous method, mostly contains _asserts_, then marks the Element dirty](https://iiro.dev/set-state)
    * State (aka private variables) can be managed in any Dart class really, but `setState()` is what Flutter does need to update UI
  * _Lifting state up_ = moving state up to first common ancestor; basic solution to fix state sharing between multiple widgets
  * State is persistent between widget tree rebuilds (eg a few parts of the screen gets updated), but not navigating to a whole different page, which replaces subtrees
* **State Restoration** = restoring state after app was backgrounded/suspended by OS (**RestorationManager**, `with RestorationMixin` > `restoreState()`)
* **WebGL** = JavaScript API for rendering interactive 2D/3D graphics with GPU-accelerated physics to web browsers (ie HTML canvas) without plugins
* **Widget** = immutable (declarative) description of part of a UI (layout component or behavior: center, pad, rotate)
  * _Everything is a widget_, including app itself
  * All Widgets are @`immutable`, holding only `final` data, so any mutating data has to be outsourced into a dedicated mutable **State**
  * Although already instantiated widgets are immutable, `build()` can return new widgets (subtree) each time as old ones get discarded
  * Widgets - or State -, **not Elements**, hold properties with actual values
  * [Stateless Widget](https://www.youtube.com/watch?v=wE7khGHVkYY) = immmutable widget w/ `final` properties & `const` constructor
    * Those get rebuilt (aka replaced) when the input data from their parent changes, ie when their parent rebuilds
    * A widget tree composed of only _stateless_ widgets therefore never updates
    * All visual elements such as buttons, texts are stateless widgets
  * [Stateful Widget](https://www.youtube.com/watch?v=AqCMFXEmf3w) = (also!) immutable widget associated with a companion class called State that holds changing data, `build()` & `setState()` methods
  * [Inherited Widget](https://www.youtube.com/watch?v=Zbm3hjPjQMk) = DYI DI via _context_
    * Inherited Widget takes at least one parameter: a _child_ (ie its sub-tree that gets notified) which is passed to `super()`
    * Define `of()` shorthand method eg `static InheritedNose of(BuildContext context) => context.inheritFromWidgetOfExactType(InheritedNose)`
    * **Theme**, **MediaQuery** are examples of Inherited Widgets, accessible to all children in their hierarchy
      * Eg `Theme.of(context).primaryColor`
    * Use this to pass DB or service instances down the widget hierarchy
    * For more complex scenarios, use an integrated State Management solution instead
* **Widget Tree** = perhaps counte-intuitively, a widget tree is _contructed_ top-down (this gives child widgets access to their ancestors via BuildContext)

### [Constraints & Layout](https://docs.flutter.dev/get-started/fundamentals/layout)

* [Constraints](https://docs.flutter.dev/ui/layout/constraints) = min/max height/width dimension constraints cascading down widget tree from parents to children
  * **Loose constraints** = constraints allowing a range of possible values (ie **min < max**)
  * **Tight constraints** = constraints defined as a single point (ie **min == max**, eg **App** root widget must fit the whole screen exactly)
  * **Unbounded constraints** = maximum height and/or width is set to _double.infinity_, which is intended for inflexible widgets to define their own size
    * If inflexible children decrease available space too much, first all flex children get compressed to 0 pixels, then inflexible children get clipped at the edge (with a black/yellow warning in debug mode)
    * Flex children appearing in this context cause an error
* **Composition** = overlaying visual elements in draw order (into a single image)
* [Layout](https://docs.flutter.dev/ui/layout) = positioning & sizing elements (_where & how big everything is_)
  * Parent-child layout conversation: _Constraints go down. Sizes go up. Parent sets the position_:
    1. child receives constraints (ie set of 4 doubles: min/max height & width) from parent
    2. child determines its size, passes it back up
    3. parent determines child positionsheila
* **Paint** = converting elements into visual representation (_determining visual appearance_), prepares different layers for compositing, isolates unchanged subtrees
* **Rasterizing** = translates output into GPU render instructions (ie pixels)
* **Rendering** = layout + paint + composition
* [Shrink-wrap](https://flutteragency.com/what-does-the-shrink-wrap-property-does) = force a widget to pre-calculate its total size ~ its items

### Lifecycles

* App
  * **WidgetsBindingObserver** = mixin to observe various lifecycle events affecting overall app/widget tree (eg entering back/foreground, screen orientation/size, text scale factor, Android back button)
    * Set `WidgetsBinding.instance.add|removeObserver(this)` & override `didChangeAppLifecycleState(state)`
  * `WidgetsFlutterBinding.ensureInitialized()` = make sure there is an instance of **WidgetsBinding**, needed to use platform channels to call native code asynchronously (ie if _main_ is `async`)
* Widget = `createState()` = other than that they don't have a lifecycle as they're immutable, they exist or they don't and that's the end of it
* State
  * `initState()` = one-time init
  * `didChangeDependencies()` = when a dependency changes (eg an **InheritedWidget** in `build()` changes), called immediately after `initState()`
  * `didUpdateWidget()` = whenever (associated stateful) widget configuration changes (eg its input values)
    * There's always a rebuild performed after this method
  * `void dispose()` = widget removed from UI (always dispose controllers, focus nodes, streams, etc)
  * _mounted_ (bool) = true if this state is associated with a **BuildContext** (ie after creation/construction, ie before `initState()`, and until `dispose()` gets called)
* StatefulElement = _initial_ (created not mounted/attached), _active_ (mounted to tree), _inactive_ (temporarily removed), _defunct_ (removed permanently)

## Environment

* Flutter Material framework constants are defined in _%USER\_APPDATA%/Local/flutter/packages/flutter/lib/src/material/constants.dart_

### [Install](https://docs.flutter.dev/get-started/install)

* **Android Studio**
  * Install these via _Customize > All settings… > Languages & Frameworks > Android SDK > SDK Tools_:
    * Android SDK Build-Tools (check _Show Package Details_ to install specific/older version)
    * [Android SDK Command-line Tools](https://developer.android.com/studio/intro/update#sdk-manager)
    * (Android Emulator)
    * (Android SDK Platform-Tools)
    * (Google/Samsung USB Driver) (gets downloaded then must be installed manually)
    * Intel Emulator Accelerator
  * (Flutter extension if using as IDE)
* **Flutter SDK**
* (**PowerShell 5.1**, via _Windows Management Framework 5.1_ or along with Visual Studio)
* **Visual Studio** (for developing Windows apps)
* **Visual Studio Code** extensions
  * **Awesome Flutter Snippets** = advanced snippets (mostly integrated into vanilla **Flutter**)
  * **Dart Data Class Generator** = generate Dart classes with equality, JSON serialization, etc
  * **Flutter** (includes **Dart**) = provides dev tools & debugging (via `F5`), and also auto-Hot reload when saving files
  * **Pubspec Assist** = add/update Dart/Flutter dependencies easily
* Any **browser** (Flutter might complain it requires Chrome, but eg Firefox works, even the **Dart DevTools**' live Debugger)
  * Might require closing/restarting the app, closing/reopening/reattaching (while the app is running) the browser tab
* Some apps may require enabling symbolic links (launch Windows Developer Mode via Win + R > `start ms-settings:developers`)

### [CLI](https://docs.flutter.dev/reference/flutter-cli)

Use commands with either long/short names (eg `flutter --option=value` or just `flutter -o value`).

* `flutter --version`
* `flutter analyze` = inspect code and display all infos/warnings/errors
* `flutter build {platform}` = build towards platform (ie _appbundle/apk/ios/web/windows_)
  * `appbundle` = builds an [Android App Bundle (AAB)](../Android.md#glossary)
  * `web` = [Build for web deployment](https://docs.flutter.dev/deployment/web)
    * `--base-href {path}` = [HTML \<base> href](https://www.w3schools.com/Tags/att_base_href.asp)
    * `--web-renderer {canvaskit|html|skwasm}` = specify renderer (ie _CanvasKit_, _HTML_ & _WebAssembly_)
    * _canvaskit_ & _skwasm_ both draw to a single HTML `<canva>`, can handle complex visual games/presentations
    * _html_ maps component to native HTML/CSS/JS elements (eg images as `<img>`), can handle basic CSS animations, better for SEO
  * `--build-name` & `--build-number` = override version & build numbers, respectively
  * `--dart-define={VAR}={value}` = define a local environment variable (eg `BUILD_MS=$(date +%s000)`, read via `int.fromEnvironment('{VAR}', defaultValue: {value})`)
  * `--obfuscate --split-debug-info={symbols_directory}` = obfuscate & save symbols mapping file to directory (for later de-obfuscating eg for debugging & stack trace)
  * `--release` = build in _build/app/outputs/_
  * `--split-per-abi` = produces multiple APK, each optimized to a specific [Application Binary Interface (ABI)](../Android.md#glossary)
  * `--verbose`
* `flutter channel [stable|beta|main]` = by inverse order of finalization (_stable_ = production release, _beta_ = latest finalized/tested release, _main_ = ongoing dev)
* `flutter clean` = clear build & packages cache (very useful before archiving/zipping an app source code)
* `flutter config`
  * `--list` = displays all current settings values
* `flutter create .` = bootstraps a new project, or regenerate all missing platform-specific directories (ie _android_, _ios_, _linux_, _web_)
  * Adding web support to existing app (see <https://docs.flutter.dev/get-started/web#add-web-support-to-an-existing-app>)
* `flutter create kokoapp`
  * `bug` = for bug report submissions
  * `--empty` = generates a (barebone minimal) empty app (without comments)
  * `--org "com.koko"` = organization in reverse domain name notation (used as namespace when developing/publishing plugin packages)
  * `--platforms android,ios,linux,web,windows` = target platforms
  * `--sample=widgets.SingleChildScrollView.1 mysample` = create new app from existing sample code
  * `--template` = specify project type
    * `skeleton` (_deprecated_) = generate a List View / Detail View app that follows community best practices (incompatible with `-e`)
    * `package {name}` = package
    * `plugin(_ffi) {name}` = package plugin
* `flutter devices` = list all connected devices
* `flutter doctor -v(erbose)` (Tip: use PowerShell to get Unicode support)
* `flutter doctor --android-licenses`
* `flutter format {filename}` = Format document
* `flutter install` = install app to attached device
* `flutter logs` = display console logs from target device
* `flutter pub` = manages the _pubspec.yaml_ file, which contains assets & dependencies, downloaded from <pub.dev>
  * `add {package}` = downloads & add package to _pubspec.yaml_
  * `add dev:{package}` = add package under _dev\_dependencies_ section
  * `cache list` = lists cache locations (warning: large string)
  * `cache repair`
    * eg [Install intl](https://stackoverflow.com/a/51706630/3559724)
  * `get` = explicitely pulls packages into the project & generates _pubspec.lock_ (implied with `flutter run`)
    * `flutter packages get` = [alias for the above](https://stackoverflow.com/a/61038022/3559724)
  * `outdated` = display current/upgradable/latest versions for each dependency
  * `run {executable} {options}` = runs a Dart script (with a `main()`) or a package that provides CLI (eg **build_runner**, **flutter_launcher_icons**, **native_splash_screen**)
  * `upgrade` (+ `--major-versions` to force absolute latest)
* `flutter run` = run app (on currently attached device)
  * `r` = Hot reload, `R` = Hot restart (resets state), `h` = List commands, `d` = Detach (terminates run but app lives on), `c` = clrscr, `q` = Quit
  * `-d(evice-id) {device}` = run to chosen device
    * `chrome`
    * `web-server` ([works in any browser](https://stackoverflow.com/a/71518488))
    * `web-server --web-renderer [html|canvaskit]` = same as build
  * `--no-enable-impeller` = force use old Skia rendering engine
  * `--profile` (then `P`) = displays profiling performance metrics overlay (on physical devices, not emulators)
  * `--release` = compile to release mode (removes all debugging directives eg asserts)
  * `--v(erbose)`
  * [Fix "Parameter format not correct"](https://stackoverflow.com/a/69519005/3559724)
* `flutter upgrade` = install latest Flutter version
  * [Upgrade and clean cache](https://stackoverflow.com/a/64515721/3559724)

### Folder Structure

* _.idea/_ = Android Studio (built on JetBrains' IntelliJ **IDEA**) configuration
* _.vscode/_ = Visual Studio configuration (zoom level, etc)
* _android/_ = complete (passive) Android project used by Flutter (we don't need to change it)
  * _app/src/debug/AndroidManifest.xml_ = (eg set internet access via `<uses-permission android:name="android.permission.INTERNET"/>`)
* _build/_ = compile output generated by Flutter SDK
* _ios/_ = same as Android
* _lib_ = source files (everything is a library in Dart)
  * _lib/main.dart_'s `main()` = entry point of a Flutter app (by convention)
* _test_ = automated tests
* _.gitignore_ = Git
* _.metadata_ (managed by Flutter SDK) = version ID
* _{project\_name}.iml_ (managed by Flutter SDK) = project dependencies
* _analysis\_opions.yaml_ = Dart [Linter rules](https://dart.dev/tools/linter-rules)
* _pubspec.lock_ = required, generated automatically based on the _pubspec.yaml_
* _pubspec.yaml_ = project imported 3rd-party dependencies, fonts, images
  * _dependencies_ section = used in app's production code, required for app to function at runtime
  * _dev\_dependencies_ section = used only during development, not included in production builds (eg tests or code generation packages)
* _README.md_ = Git/doc

### Visual Studio Code

* (_File > Preferences >_) **Settings** (`Ctrl + ,`) (_> Extensions > Dart_)
  * Dart: **Dev Tools Browser** = `chrome` or (system) `default` (eg Firefox)
  * Dart: **Dev Tools Location** = `active`/`beside` (VS Code) or `external` (browser)
  * Dart: **Closing Labels** = toggle or change **Closing Labels Prefix** (eg `#`)
* (_View >_) **Command Palette** (`Ctrl + Shift + P`)
  * Dart: **Open DevTools** (`Ctrl + Alt + D`)
  * Dart: **Add Dependency** = add (comma-separated) package(s) in one go
  * Flutter: **Toggle Repaint Rainbow** = highlights repainted areas
  * Flutter: **Toggle Debug Paint** (_deprecated_ was [replaced with DevTools](https://stackoverflow.com/a/55121731))
* Keyboard shortcuts (with _Flutter_ extension installed)
  * `F5` = Start Debugging
  * `Ctrl + F5` = Run Without Debugging (runs without debugging but still in unoptimized JIT)
  * `Ctrl + ;` = Quick Fix… (also displays _Refactor_ options)
  * `Ctrl + I|Space` = Trigger Suggestions
  * `Ctrl + Shift + R` = Refactor
  * `Shift + Alt + F` = (`Right-Click >`) Format document (provided by Flutter extension)
    * Append a comma to each closing parenthesis to take advantage of this command
  * `Ctrl + Click` = `F12` = Go to definition
* Terminal area
  * _PROBLEMS_ = contains list of compile issues (`Left-Click` one issue to jump to it and load suggested fixes, then `Right-Click` to show suggestions list)
  * _DEBUG CONSOLE_ = contains list of runtime issues
  * `Right-Click` > _Clear Console_
* Extensions
  * **Dart**
  * **Dart Data Class Generator** = generates class members (eg constructor based off properties, ie à la manual **Freezed** plugin)
  * **Flutter** (also installs Dart)
  * **Flutter Riverpod Snippets** (_@Robert Brunhage_)
    * [List of snippets](https://marketplace.visualstudio.com/items?itemName=robert-brunhage.flutter-riverpod-snippets)
  * **Material** Icon Theme

#### Snippets

* `st` = widget
* `stle` = Statless Widget
* `stfu` = Stateful widget
* Don't forget you can auto-complete via camelCase initials (eg `sichsc + Tab` => **SingleChildScrollView**)

## Extensions

* **Blup** = GUI & backend visual designer
* **Flame** (Engine) = cross-platform open-source game engine built on top of Flutter
* **Flock** (possibly abandoned) = a community-powered fork of Flutter aspiring to deliver quicker maintenance
* **FlutterFlow** = GUI visual designer, import themes from Figma
* **Serverpod** = FOSS Dart backend for Flutter, with client-side codegen, logging, caching, ORM
* **Very Good CLI** = CLI to generate opiniated scalable templates & use helpful commands
