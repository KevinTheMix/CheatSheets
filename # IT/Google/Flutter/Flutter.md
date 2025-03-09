# [Flutter](https://gallery.flutter.dev)

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

* [Flutter Samples](https://flutter.github.io/samples)
  * [Material 3 Demo](https://flutter.github.io/samples/web/material_3_demo)
* [@Wm Leler](https://leler.com/wm/bio.html#flutter) = Flutter-promoting articles (eg _what's revolutionary?_, _why Dart?_ UX study with eight developers, _company pitch_)
  * Most of the time, Flutter can do layout in a single pass (or even none, through cacheing), aka linear time, so it can even be used for scrolling & any animations
* [Matthew Smith - Why we chose Flutter and how it's changed our company](https://medium.com/@matthew.smith_66715/why-we-chose-flutter-and-how-its-changed-our-company-for-the-better-271ddd25da60)
* _const_ in front of constructors is very important, making rendering more efficient by skipping most of rebuild
* It's possible to create & assign widgets to variables, then we can access their properties (eg height) down the tree, or add them conditionally in several places
* Break down long widgets into modular widgets rather than helper methods (see Decoding Flutter video on that topic)
* Use `compute()` (similar to Dart `Isolate.run()`) to run a given callback in background, for operations that take longer than a few milliseconds
* `build()` should remain 'pure' ie without side-effects (see <https://stackoverflow.com/a/52249579/3559724>)
* [Material Theme Builder](https://material-foundation.github.io/material-theme-builder) = generate dynamic color schemes (pick primary, secondary, etc)
* Refactor small widget subtrees subject to frequent change out of large `build()` methods to leverage **more granular & efficient rebuilds**
* Builders are methods that can map data to return widgets dynamically, also enable describing UI declaratively (as `build()` does)

## Glossary

* [Architecture](https://docs.flutter.dev/resources/architectural-overview#anatomy-of-an-app)
  * **Dart App** = user custom app written entirely in Dart language
  * **Framework** = Flutter classes (high-level API in Dart)
  * **Engine** = platform-agnostic low-level API in C/C++, including rendering engine (eg Skia), Dart Runtime (including Dart VM that runs user Dart & framework Flutter code), platform channels, Embedder API
  * **Embedder** = native application hosting all Flutter content, interfaces host OS & Flutter, is app main entrypoint (as an Android Activity or iOS UIViewController), manages event loop & lifecycle
  * **Runner** = native-level customizable code (originally generated via `flutter create`)
  * [Inside Flutter](https://docs.flutter.dev/resources/inside-flutter) = optimized & single pass layouting, onboarding strategies
* [BLoC](https://www.flutterclutter.dev/flutter/basics/what-is-the-bloc-pattern/2021/2084) = state management design pattern using Streams of events (in) & states (out)
* [Build Modes](https://docs.flutter.dev/testing/build-modes) = Debug (development, Hot Reload), Profile (performances analysis), Release (release app)
* **BuildContext** = context for current widget, handle for widget location in its tree, holds a reference to its corresponding Element
* [CanvasKit](https://skia.org/docs/user/modules/canvaskit) = lightweight version of Skia compiled to WebAssembly optimized for web browser (paint to HTML canvas/SVG) via WebGL
* [Casual Games Toolkit](https://docs.flutter.dev/resources/games-toolkit) = mobile games development resources
* **Configuration** = refers to a widget's input parameters/properties provided by its parent, or to a Widget in relation to its corresponding Element
* [DevTools](https://docs.flutter.dev/development/tools/devtools/overview) = debugging & performance tools
  * [Flutter Inspector](https://docs.flutter.dev/development/tools/devtools/inspector)
    * **Layout Explorer** = debug/inspect/edit layout properties in real-time
* **Element** (implements **BuildContext**) = instantiation of a Widget at a particular location in the _Element Tree_ (that Widget is considered that Element's _configuration_)
  * An elements is very simple, holding just a reference to associated widget (& its original type), its children elements, and potential State
  * Elements are mutable and modified in place to reflect changes in Widgets tree, hence Elements tree is seldom rebuilt & more stable, and acts as a buffer/**cache** between configuration & rendering
  * Element Tree acts as an app skeleton, and is built and handled all automatically by Flutter (based on the Widget Tree), using it to pilot widgets lifecycle, and update/redraw UI
  * (You can think of Elements as association tables, because they hold practically no data and mostly point to other stuff (Widget & State))
  * **StatefulElement** = an **Element** that uses a **StatefulWidget** as its configuration
  * **StatelessElement** = an **Element** that uses a **StatelessWidget** as its configuration
  * **ComponentElement** = container/host for other elements
* [Flutter Create](http://flutter.dev/create) = a one-time coding competition in 2019
* [Impeller](https://github.com/flutter/flutter/wiki/Impeller) = latest rendering enging replacing Skia (already on iOS since Flutter 3.10), eliminating costly runtime shader compiling
* **Keys** — see [@Emily Fortuna - Keys! What are they good for?](https://medium.com/flutter/keys-what-are-they-good-for-13cb51742e7d)
  * A way to keep track of States (ie for Stateful Widgets only), useful when adding/reordering widgets on the screen
  * **LocalKey** = match elements in their local tree (ie among its siblings), so put them at top of (sub)tree to preserve
    * **UniqueKey** = à la GUID
    * **ObjectKey** = bases off multiple values (eg address) which aggregated are unique
    * **ValueKey** = bases off a single value (eg TODO item task's text) which is unique amongst its siblings
      * **PageStorageKey** = stores a user scroll location, so it can be resumeed when going back to widget
  * **GlobalKey** allow widgets to change parents without losing State, or access information about another Widget, both anywhere in the Tree (see **LabeledGlobalKey**, **GlobalObjectKey**)
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
* **Tear-off** = passing a method via name (à la delegate/pointer, ie not a lambda/anonymous function)
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

### [Install](https://docs.flutter.dev/get-started/install)

* **Android Studio**
  *
  * Install under _Customize > All settings… > Languages & Frameworks > Android SDK > SDK Tools_:
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

Use command with options long names or short names, eg:

* `flutter -t skeleton`
* `flutter --template=skeleton`
* `flutter --version`

* `flutter analyze` = inspect code and display all infos/warnings/errors
* `flutter build`
  * `flutter build appbundle` = builds Android App Bundle (AAB), for publishing to Google Play Store
  * `flutter build apk --split-per-abi` (note: this target is called _apk_, not _android_)
  * `flutter build ios`
  * `flutter build web` = [Build for web deployment](https://docs.flutter.dev/deployment/web)
  * `flutter build web --web-renderer [canvaskit|html|skwasm]` = specify renderer (ie _CanvasKit_, _HTML_ & _WebAssembly_)
    * _canvaskit_ & _skwasm_ both draw to a single HTML `<canva>`, can handle complex visual games/presentations
    * _html_ maps component to native HTML/CSS/JS elements (eg images as `<img>`), can handle basic CSS animations, better for SEO
  * `flutter build web --base-href {path}` = [HTML \<base> href](https://www.w3schools.com/Tags/att_base_href.asp)
* `flutter channel [master|beta|stable]` = pick release channel (_master_ = dev, _beta_ = finalized/tested, _stable_ = production)
* `flutter clean` = clear build & packages cache (very useful before archiving/zipping an app source code)
* `flutter create .` = regenerate platform-specific directories (ie android/, ios/, web/, etc)
  * Adding web support to existing app (see <https://docs.flutter.dev/get-started/web#add-web-support-to-an-existing-app>)
* `flutter create kokoapp`
  * `-e` = generates a (barebone minimal) empty app (without comments)
  * `--org "com.koko"` = organization in reverse domain name notation (used as namespace when developing/publishing plugin packages)
  * `--platforms android,ios,linux,web,windows` = target platforms
  * `--sample=widgets.SingleChildScrollView.1 mysample` = create new app from existing sample code
  * `--template=skeleton` = generate a List View / Detail View app that follows community best practices (incompatible with `-e`)
  * `-t package {koko}` = [creates a package project](https://docs.flutter.dev/development/packages-and-plugins/developing-packages)
* `flutter devices` = list all connected devices
* `flutter doctor -v(erbose)` (Tip: use PowerShell to get Unicode support)
* `flutter doctor --android-licenses`
* `flutter format {filename}` = Format document
* `flutter install` = install app to attached device
* `flutter pub` = manages the _pubspec.yaml_ file, which contains assets & dependencies, downloaded from <pub.dev>
* `flutter pub add {package}` = downloads & references package
* `flutter pub cache repair`
  * eg [Install intl](https://stackoverflow.com/a/51706630/3559724)
* `flutter pub get` = explicitely pulls packages into the project & generates _pubspec.lock_ (implied with `flutter run`)
  * `flutter packages get` = [alias for the above](https://stackoverflow.com/a/61038022/3559724)
* `flutter pub outdated` = display current/upgradable/latest versions for each dependency
* `flutter pub run {executable} {options}` = runs a Dart script (with a `main()`) or a package that provides CLI (eg **build_runner**, **flutter_launcher_icons**, **native_splash_screen**)
* `flutter pub upgrade` (+ `--major-versions` to force absolute latest)
* `flutter run` = run app (without debugging, equivalent to `Ctrl + F5` in **Visual Studio Code** with _Flutter_ extension installed)
  * `r` = Hot reload, `R` = Hot restart (resets state), `h` = List commands, `d` = Detach (terminates run but app lives on), `c` = clrscr, `q` = Quit
  * `flutter run -d(evice-id) {device}` = run to chosen device
    * `flutter run -d chrome`
    * `flutter run -d web-server` ([works in any browser](https://stackoverflow.com/a/71518488))
    * `flutter run -d web-server --web-renderer [html|canvaskit]` = same as build
  * `flutter run --no-enable-impeller` = force use old Skia rendering engine
  * `flutter run --profile` (then `P`) = displays profiling performance metrics overlay (on physical devices, not emulators)
  * `flutter run --release` = compile to release mode (removes all debugging directives eg asserts)
  * [Fix "Parameter format not correct"](https://stackoverflow.com/a/69519005/3559724)
* `flutter test` = run tests
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
* Keyboard shortcuts
  * `F5` = Start Debugging
  * `Ctrl + F5` = Run Without Debugging
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
  * **Material** Icon Theme

#### Snippets

* `st` = widget
* `stle` = Statless Widget
* `stfu` = Stateful widget
* Don't forget you can auto-complete via camelCase initials (eg `sichsc + Tab` => **SingleChildScrollView**)

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

## [Debugging](https://docs.flutter.dev/testing/code-debugging)

Run apps actually without debugging (unless intended) for faster development/execution cycles.

* Use `toStringDeep()` = a string representation of this node and its descendants
* Use _dart:convert_ `jsonEncode(…)` to encode & pass whole objects
* For custom widgets, override `debugFillProperties()` to add custom information (**DiagnosticsProperty**) into Flutter widget tree inspector (especially when publishing packages)
* Toggle Repaint Rainbow tool to identify superfluous repaints (via **DevTools** or setting _debugRepaintRainbowEnabled_ in main)
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

## Testing

* **WidgetTester** = programmatically interact with widgets & test environment
  * See [WidgetTester class](https://api.flutter.dev/flutter/flutter_test/WidgetTester-class.html) where a test uses `pumpWidget()` to load a widget tree
* **TestWidgetsFlutterBinding** = base class for bindings used by widgets library tests (`ensuteInitialized()`)
* **integration_test** package = automated testing of app UI
