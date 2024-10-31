# [Flutter](https://gallery.flutter.dev)

Highly performant (close to native) open-source UI **SDK** by Google for cross mobile (Android/iOS) & desktop (Windows, MacOS, Linux) & later Web applications from a single (Dart) codebase.

Flutter was started as an experiment by members of the Chrome team for a new kind of layout/rendering engine.

Features:

* Everything is Dart (no specialized layout HTML/XML language)
* Everything is a widget (including pure layout components eg **Center**, **Padding**), however all (visual element) leaves are **RenderObject**
  * Widgets are UI building blocks as app blue print, based on (Google) Material & (Apple) Cupertino design
* Native pixel painting (via Skia/Impeller, a Google 2D painting library) à la Unity/Unreal
* Flutter is faster than React Native, closer to native performance (see graph Fireship's R vs F)
* Advanced 2D/3D morph/transform animations à la PowerPoint transitions (see eg **Transform** widget)
* Access to native features (location, maps, camera), especially wrapped through rich 3rd-party growing plugins ecosystem
* State-based [declarative style](https://docs.flutter.dev/get-started/flutter-for/declarative) with reactive views (ie `UI = f(State)`)
  * UI isn't manually managed (à la WinForm) or even via bound mutable properties/viewmodel (à la WPF), only state is managed to rebuild UI parts
  * UI gets updated Flutter granularly/modularly replacing immutable widget(s) in hierarchy with other immutable widgets
    * Components don't get updated, instead old ones get dropped & replaced very quickly with fresh ones
  * Flutter compares old & new widget trees, and updates UI accordingly (if necessary)
  * State is separated from widgets, so as they get replaced, **state persists**

## Quick Tips

* [@Wm Leler](https://leler.com/wm/bio.html#flutter) = Flutter-promoting articles (eg _what's revolutionary?_, _why Dart?_, _company pitch_)
  * Most of the time, Flutter can do layout in a single pass (or even none, through cacheing), aka linear time, so it can even be used for scrolling & any animations
* [Matthew Smith - Why we chose Flutter and how it's changed our company](https://medium.com/@matthew.smith_66715/why-we-chose-flutter-and-how-its-changed-our-company-for-the-better-271ddd25da60)
* _const_ in front of constructors is very important, making rendering more efficient by skipping most of rebuild

## Glossary

* [Architecture](https://docs.flutter.dev/resources/architectural-overview#anatomy-of-an-app)
  * **Dart App** = custom user app
  * **Framework** = Flutter classes (high-level API in Dart)
  * **Engine** = platform-agnostic low-level API in C/C++, including rendering engine (eg Skia), Dart Runtime (including Dart VM that runs user Dart & framework Flutter code), platform channels, Embedder API
  * **Embedder** = native application hosting all Flutter content, interfaces host OS & Flutter, is app main entrypoint (as an Android Activity or iOS UIViewController), manages event loop & lifecycle
  * **Runner** = native-level customizable code (originally generated via `flutter create`)
  * [Inside Flutter](https://docs.flutter.dev/resources/inside-flutter) = optimized & single pass layouting, onboarding strategies
* [Build Modes](https://docs.flutter.dev/testing/build-modes) = Debug (development, Hot Reload), Profile (performances analysis), Release (release app)
* **BuildContext** = context for current widget, handle for widget location in its tree, holds a reference to its corresponding Element
* [CanvasKit](https://skia.org/docs/user/modules/canvaskit) = lightweight version of Skia compiled to WebAssembly optimized for web browser (paint to HTML canvas/SVG) via WebGL
* [Casual Games Toolkit](https://docs.flutter.dev/resources/games-toolkit) = mobile games development resources
* [DevTools](https://docs.flutter.dev/development/tools/devtools/overview) = debugging & performance tools
  * [Flutter Inspector](https://docs.flutter.dev/development/tools/devtools/inspector)
    * **Layout Explorer** = debug/inspect/edit layout properties in real-time
* **Element** (implements **BuildContext**) = instantiation of a Widget at a particular location in the _Element Tree_ (that Widget is considered that Element's _configuration_)
  * An elements is very simple, holding just a reference to associated widget (& its original type), its children elements, and potential State
  * Elements are mutable and modified in place to reflect changes in Widgets tree, hence Elements tree is seldom rebuilt & more stable, and acts as a buffer/**cache** between configuration & rendering
  * Element Tree acts as an app skeleton, and is built and handled all automatically by Flutter (based on the Widget Tree), using it to pilot widgets lifecycle, and update/redraw UI
  * (You can think of Elements as association tables, because they hold practically no data and mostly point to other stuff (Widget & State))
  * **ComponentElement** = host for other elements
  * **RenderObjectElement** = participates in layout/paint phases (ie a leaf element)
  * **StatefulElement** = an **Element** that uses a **StatefulWidget** as its configuration
  * **StatelessElement** = an **Element** that uses a **StatelessWidget** as its configuration
* [Impeller](https://github.com/flutter/flutter/wiki/Impeller) = latest rendering enging replacing Skia (already on iOS since Flutter 3.10), eliminating costly runtime shader compiling
* **Keys** — see [@Emily Fortuna - Keys! What are they good for?](https://medium.com/flutter/keys-what-are-they-good-for-13cb51742e7d)
  * A way to keep track of States (ie for Stateful Widgets only), useful when adding/reordering widgets on the screen
  * **LocalKey** = match elements in their local tree (ie among its siblings), so put them at top of (sub)tree to preserve
    * **UniqueKey** = à la GUID
    * **ObjectKey** = bases off multiple values (eg address) which aggregated are unique
    * **ValueKey** = bases off a single value (eg TODO item task's text) which is unique amongst its siblings
      * **PageStorageKey** = stores a user scroll location, so it can be resumeed when going back to widget
  * **GlobalKey** allow widgets to change parents without losing State, or access information about another Widget, both anywhere in the Tree
* **Material Design** = design language developed by Google in 2014
  * [Material 3 Demo](https://flutter.github.io/samples/web/material_3_demo)
* **Packages**/**Modules** = Dart code **only**; can use plugins (and still qualify as a package); they're published to <https://pub.dev>
* **Platform Channel** = bi-directional communication between Flutter custom code and native platform, with serialization (thus slowser than FFIs) via _codecs_
  * **MethodChannel** = invoke a method on native platform and get back some value
  * **EventChannel** = stream data continuously/unidirectionally from native platform to Flutter
  * **BasicMessageChannel** = send/receive asynchronous messages in both directions
* **Plugin** = native code (Kotlin/JS/Swift) features [wrapped as Dart](https://stackoverflow.com/a/63154273/3559724)
  * Fluent Design System = a design language developed by Microsoft in 2017
* **Property** = actual value held in a widget eg the _text_ property of a **RichText** widget
* **RenderObject** = counterpart of RenderObjectElements (but not ComponentElements) in a **Render Tree**, abstract model for layout and painting
  * Paints UI via dedicated subclasses that can handles size, layout, painting (eg **RenderParagraph** renders text, **RenderImage** an image)
* **RenderTree** = data structure storing UI geometry (computed at layout, used for painting & hit testing)
* **RenderView** = root of all RenderObjects, it total output of Render Tree (its `compositeFrame()` generates a frame to display)
* **Skia** = open-source cross-platform 2D (3D via Vulkan & Metal) GPU-accelerated graphics library to draw stuff, written in C++ (à la Unity, running in web as WebAssembly), also used by Chrome
  * Native Android apps also use Skia as part of their rendering routine, however Flutter packs its own standalone copy (in the engine layer) to remain decouple from a platform's specific version
* **Slivers** = different parts of a scrollable area that can each react appropriately to the same scroll
* **State** = objects associated with stateful widgets (actually linked **from** their associated Elements)
  * `widget` = access to its associated widget's properties (usually passed down from parent)
  * `context` = access to its associated widget's context (might need to specify `late final` variables to use it in an initializer)
  * `build()` = called by Flutter (and never directly!), possibly very often whenever it needs to paint something (ie `setState()` called, or parent input data changes, or once during app creation)
    * Always return a new or cached (tree of) widget(s), ie it constitutes a reactive snapshot of UI
  * `setState()` = [takes in & executes an anonymous method, mostly contains _asserts_, then marks the Element dirty](https://iiro.dev/set-state)
    * State (aka private variables) can be managed in any Dart class really, but `setState()` is what Flutter does need to update UI
  * _Lifting state up_ = moving state data up one level to broaden its access; basic solution to fix state sharing between multiple widgets
  * State is persistent between widget tree rebuilds (eg a few parts of the screen gets updated), but not navigating to a whole different page, which replaces subtrees
* **WebGL** = JavaScript API for rendering interactive 2/3D graphics with GPU-accelerated physics to web browsers (ie HTML canvas) without plugins
* **Widget** = immutable (declarative) description of part of a UI (layout component or behavior: center, pad, rotate)
  * _Everything is a widget_, including app itself
  * All Widgets are @`immutable`, holding only `final` data, so any mutating data has to be outsourced into a dedicated mutable **State**
  * Although already instantiated widgets are immutable, `build()` can return new widgets (subtree) each time as old ones get discarded
  * Widgets - or State -, **not Elements**, hold properties with actual values
  * [Stateless Widget](https://www.youtube.com/watch?v=wE7khGHVkYY) = immmutable widget w/ `final` properties & `const` constructor
    * Those get rebuilt (aka replaced) when the input data from their parent changes, ie when their parent rebuilds
    * A widget tree composed of only _stateless_ widgets therefore never updates
    * All visual elements such as buttons, texts are stateless widgets
  * [Stateful Widget](https://www.youtube.com/watch?v=AqCMFXEmf3w) = associated with a companion class called State that holds changing data, `build()` & `setState()` methods
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
* **Composition** = overlaying visual elements in draw order
* [Layout](https://docs.flutter.dev/ui/layout) = positioning & sizing elements (_where & how big everything is_)
  * Parent-child layout conversation: _Constraints go down. Sizes go up. Parent sets the position_:
    1. child receives constraints (ie set of 4 doubles: min/max height & width) from parent
    2. child determines its size, passes it back up
    3. parent determines child positionsheila
* **Paint** = converting elements into visual representation (_determining visual appearance_), prepares different layers for compositing, isolates unchanged subtrees
* **Rasterizing** = translates output into GPU render instructions
* **Rendering** = layout + paint + composition
* [Shrink-wrap](https://flutteragency.com/what-does-the-shrink-wrap-property-does) = force a widget to pre-calculate its total size ~ its items

## Environment

### [Install](https://docs.flutter.dev/get-started/install)

* **Android Studio**
  * Install the following under _Tools > SDK Manager > SDK Tools_:
    * [Android SDK Command-line Tools](https://developer.android.com/studio/intro/update#sdk-manager)
    * Google/Samsung USB Driver (those get downloaded and must be then installed manually)
  * (Flutter extension if using as IDE)
* **Flutter SDK**
* (**PowerShell 5.1**, via _Windows Management Framework 5.1_ or along with Visual Studio)
* **Visual Studio** (for developing Windows apps)
* **Visual Studio Code** (with extensions **Flutter**, **Material Icon Theme**)
  * **Flutter** extension provides dev tools & debugging (via `F5`), and also auto-Hot reload when saving files
* Any **browser** (Flutter might complain it requires Chrome, but eg Firefox works, even the **Dart DevTools**' live Debugger)
  * Might require closing/restarting the app, closing/reopening/reattaching (while the app is running) the browser tab

### [CLI](https://docs.flutter.dev/reference/flutter-cli)

Use command with options long names or short names, eg:

* `flutter -t skeleton`
* `flutter --template=skeleton`

* `flutter --version`
* `flutter doctor -v(erbose)` (Tip: use PowerShell to get Unicode support)
* `flutter doctor --android-licenses`
* `flutter devices` = list all connected devices
* `flutter create kokoapp`
* `flutter create .` = regenerate platform-specific directories (android/, ios/, etc)
  * Eg adding web support to existing app (see <https://docs.flutter.dev/get-started/web#add-web-support-to-an-existing-app>)
  * `flutter create --sample=widgets.SingleChildScrollView.1 mysample` = create new app from existing sample code
  * `flutter create --template=skeleton` = generate a List View / Detail View app that follows community best practices
  * `flutter create -t package {koko}` = [creates a package project](https://docs.flutter.dev/development/packages-and-plugins/developing-packages)
* `flutter analyze` = inspect code and display all infos/warnings/errors
* `flutter test` = run tests
* `flutter build`
  * `flutter build appbundle` = builds Android App Bundle (AAB), for publishing to Google Play Store
  * `flutter build apk --split-per-abi` (note: this target is called _apk_, not _android_)
  * `flutter build ios`
  * `flutter build web` = [Build for web deployment](https://docs.flutter.dev/deployment/web)
  * `flutter build web --web-renderer [html|canvaskit]` = [Web Renderers](https://docs.flutter.dev/development/platform-integration/web/renderers)
  * `flutter build web --base-href {path}` = [HTML \<base> href](https://www.w3schools.com/Tags/att_base_href.asp)
  * Web Troubleshooting
    * Hack: set `<base href>` manually to _./_ relative path to deploy in a (non-root) subfolder
      * note that _index.html_ contains a unique service worker version ID changing at each build so don't replace the whole file
    * run `flutter clean` then rebuild if _flutter.js_ is not regenerated each time (see <https://stackoverflow.com/a/73780022/3559724>)
* `flutter run` = run app (without debugging, equivalent to `Ctrl + F5` in **Visual Studio Code** with _Flutter_ extension installed)
  * `r` = Hot reload, `R` = Hot restart (resets state), `h` = List commands, `d` = Detach (terminates run but app lives on), `c` = clrscr, `q` = Quit
  * `flutter run -d(evice-id) {device}` = Run to chosen device
    * `flutter run -d {device} --profile` (physical devices only) = display additional performance metrics banner
    * `flutter run -d chrome`
    * `flutter run -d web-server` ([works in any browser](https://stackoverflow.com/a/71518488))
    * `flutter run -d web-server --web-renderer [html|canvaskit]` = same as build
  * `flutter run --no-enable-impeller` = force use old Skia rendering engine
  * `flutter run --release` = compile to release mode (removes all debugging directives eg asserts)
  * [Fix "Parameter format not correct"](https://stackoverflow.com/a/69519005/3559724)
* `flutter install` = install app to attached device
* `flutter clean` = clear build & packages cache (very useful before archiving/zipping an app source code)
* `flutter format {filename}` = Format document
* `flutter pub {add} {package}` = manages the _pubspec.yaml_ file, which contains assets & dependencies, downloaded from <pub.dev>
  * eg [Install intl](https://stackoverflow.com/a/51706630/3559724)
* `flutter pub get` = explicitely pulls packages into the project & generates _pubspec.lock_ (implied with `flutter run`)
  * `flutter packages get` = [alias for the above](https://stackoverflow.com/a/61038022/3559724)
* `flutter pub cache repair`
* `flutter pub upgrade`
* `flutter upgrade` = install latest Flutter version
  * [Upgrade and clean cache](https://stackoverflow.com/a/64515721/3559724)

### Folder Structure

* _.idea/_ = Android Studio (built on JetBrains' IntelliJ **IDEA**) configuration
* _.vscode/_ = Visual Studio configuration (zoom level, etc)
* _android/_ = complete (passive) Android project used by Flutter (we don't need to change it)
* _build/_ = compile output generated by Flutter SDK
* _ios/_ = same as Android
* _lib_ = source files (everything is a library in Dart)
  * _lib/main.dart_'s `main()` = entry point of a Flutter app (by convention)
* _test_ = automated tests
* _.gitignore_ = Git
* _.metadata_ (managed by Flutter SDK) = version ID
* _.packages_ (managed by Flutter SDK) =
* _{project\_name}.iml_ (managed by Flutter SDK) = project dependencies
* _analysis\_opions.yaml_ = Dart linter
* _pubspec.lock_ = required, generated automatically based on the _pubspec.yaml_
* _pubspec.yaml_ = project imported 3rd-party dependencies, fonts, images
* _README.md_ = Git/doc

### Visual Studio Code

* (_File > Preferences >_) **Settings** (`Ctrl + ,`)
  * **Bracket Pairs** = set parentheses matching coloured line guides (formerly an extension, now built-in)
  * **Dart: Dev Tools Browser** = `chrome` or `system default` (eg Firefox)
  * **Dart: Dev Tools Location** = `active`/`beside` (VS Code) or `external` (browser)
  * **Dart: Closing Labels** = enable/disable or change prefix (eg to _#_)
* (_View >_) **Command Palette** (`Ctrl + Shift + P`)
  * Dart: **Open DevTools** (`Ctrl + Alt + D`)
  * Dart: **Add Dependency** = add (comma-separated) package(s) in one go
  * Flutter: **Toggle Debug Painting** = show/hide dashed layout wireframes
  * `F5` = Start Debugging
  * `Ctrl + F5` = Run Without Debugging
  * `Ctrl + ;` = Quick Fix… (also displays _Refactor_ options)
  * `Ctrl + I|Space` = Trigger Suggestions
  * `Ctrl + Shift + R` = Refactor
  * `Shift + Alt + F` = (`Right-Click >`) Format document (provided by Flutter extension)
    * Append a comma to each closing parenthesis to take advantage of this command
  * `Ctrl + Click` = `F12` = Go to definition
* Terminal area
  * _PROBLEMS_ tab contains list of compile issues
  * _DEBUG CONSOLE_ contains list of runtime issues
  * `Right-Click` > _Clear Console_

#### Snippets

* `st` = widget
* `stle` = Statless Widget
* `stfu` = Stateful widget
* Don't forget you can auto-complete via camelCase initials (eg `sichsc + Tab` => **SingleChildScrollView**)

## API

* `runApp(…)` = takes in widget instance and inflate it to screen size (ie calls its `build()` method, etc)
* `showSearch(ctx, SearchDelegate)` = (framework provided) shows a full screen search page that returns result when closed
* `toStringDeep()` = Returns a string representation of this node and its descendants
* `MateriapApp(debugShowCheckedModeBanner: false)` = [remove debug banner](https://stackoverflow.com/a/48893964/3559724)
* **MaterialPageRoute** _fullScreenDialog_ = 'X' close button instead of back arrow (and slightly different transition animation)
* [Background computation isolate](https://docs.flutter.dev/cookbook/networking/background-parsing) = `compute()` returns a Future
* It's possible to create & assign widgets to variables, then we can access their properties (eg height) down the tree, or add them conditionally in several places
* Form
  * [How to use InputFormatters](https://stackoverflow.com/a/50123743/3559724)

### Lifecycles

* `void initState()` = one-time init (probably better to initialize state variables here than in the state's constructor)
* `void dispose()` = widget removed from UI (always dispose controllers, focus nodes, streams, etc)
* App
  * [What does WidgetsFlutterBinding.ensureInitialized() do?](https://stackoverflow.com/a/63873689/3559724)
  * [WidgetsFlutterBinding.ensureInitialized()](https://stackoverflow.com/a/67295324) = wait for async platform channels (eg for Firebase)
  * **WidgetsBindingObserver**, `WidgetsBinding.instance.add|removeObserver(this)`, `didChangeAppLifecycleState(AppLifecycleState s)`
* Widget = _ctor_, `createState()`
* State = _ctor_, `initState()`, `didUpdateWidget()`, `dispose()` (_created_, _initialized_, _ready_, _defunct_)
  * _mounted_ (bool) = true if this state is associated with a BuildContext (ie after creation/construction (before `initState()`) and until `dispose()` gets called)
  * `didUpdateWidget()` can be used to update something along in the state when its associated widget got rebuilt (with a new input value)
    * See <https://github.com/rrousselGit/flutter_hooks#motivation>
* **(Stateful)Element** states = _initial_, _active_, _inactive_, _defunct_

### Adaptative Design

* `MediaQuery.of(context)`
  * `.orientation` (device), OrientationBuilder (parent widget) or LayoutBuilder (parent widget, not just its orientation)
  * `.size.height` = height on screen, including AppBar & (top) status bar
    * `height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top` x (0.0 -> 1.0 ratio)
  * `.size.width` = screen width
  * `.size.shortestSide < 600` = is phone or tablet?
  * `.viewInsets.bottom` = soft virtual keyboard
  * Make sure that the _context_ originates from app root, not a local _ctx_ instance (eg from a `builder((ctx) => …)` method)
  * If multiple call to MediaQuery are done in same file/widget, place it in a local variable and use that instead
  * Using InheritedWidgets such as **MediaQuery** or **Theme** in a widget causes the widget to get rebuilt when they change
    * This is the case even for built-in widgets (eg **Text** very logically rebuilds whenever Theme is changed)
  * [Scroll a list when keyboard pops up](https://stackoverflow.com/a/70612950/3559724)
  * [Move bottom sheet when autofocused keyboard is up](https://stackoverflow.com/a/57515977)

* Platform-adaptative
  * `Theme.of(context).platform == TargetPlatform.iOS ? iOSWidget(…) : AndroidWidget(…)` = Apple vs Google button style
  * `import 'dart:io' show Platform;` then `Platform.isAndroid`
  * `.adaptive()` method on some widgets (eg `Switch.adaptive()`)

## [Troubleshooting](https://docs.flutter.dev/testing/common-errors)

* _Vertical viewport was given unbounded height_
  * A space-hungry misbehaving **ListView** is inside an unbounded constraints permissive (**Flex**) **Column**
  * Read [Column class Troubleshooting](https://api.flutter.dev/flutter/widgets/Column-class.html#troubleshooting)
  * Watch [Decoding Fluter: Unbounded height/width](https://www.youtube.com/watch?v=jckqXR5CrPI)
  * Solution = be specific as possible in intended layout and bounds given to the ListView
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

* [Flutter Web: Lottie Animation issue](https://stackoverflow.com/a/73779834/3559724)
