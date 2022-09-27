# [Flutter](https://gallery.flutter.dev)

An open-source UI framework created by Google, to develop cross-platform applications from a single codebase.

It builds on top of the Dart language & adds a set of UI building blocks called widgets, based on (Google) Material & (Apple) Cupertino design.
The **Flutter SDK** is the part of the framework responsible with compiling the single Dart codebase to different target platforms.

Flutter does not simply translate its widgets to their native iOS/Android counterparts the way other frameworks do (e.g. React Native).
Flutter **does** compile to native(machine code) apps, but it **does not** use native UI components (aka Platform Primitives).
Instead, Flutter draws pixels on the target device using its own low-level rendering engine named _Skia_, à la _Unity_.
It is therefore way more free & flexible than other frameworks, while also highly performant (close to native code).
For instance, Flutter is capable of advanced 2D/3D morph/transform animations à la PowerPoint transitions (see **Transform** widget).

Flutter uses a [declarative style](https://docs.flutter.dev/get-started/flutter-for/declarative), which alleviates the need of the developer to manage UI transitions (à la old WinForm for instance); indeed, she only needs to manage the state (and call `setState()`), and the framework will handle all the UI updating through re-build()'s. Old immutable instances get discarded for new ones, while the RenderObjects persist.

## Lingo

* **Kotlin** = Google preferred language for Android app developers since 2019 (replacing Java), designed & developde by JetBrains
  * Compiles to JVM, or JavaScript for IOS support
* **Dart** = prog language developed by Google for fast client multi-platform apps development with QoL features such as Hot Reload
* **Skia** = rendering engine (à la Unity) that allows Flutter to draw at the pixel level, both on mobile devices and the web (via **CanvasKit**)
* [CanvasKit](https://skia.org/docs/user/modules/canvaskit/) = WebAssembly for rendering Skia Graphics API to HTML canvas & SVG
* Gradle = build automation tool supporting Java, Kotlin, C/C++ & JavaScript
* **Widget** = immutable (declarative) description of part of a UI (layout component or behavior: center, pad, rotate)
  * All Widgets are @`immutable`, holding only `final` data, so any mutating data has to be outsourced into a dedicated mutable **State**
  * immutability is an important part of Flutter, because previous widgets get discarded & new ones created each time `build()` is called
  * Widgets (or State), **not Elements**, hold properties with actual values
  * [Stateless Widget](https://www.youtube.com/watch?v=wE7khGHVkYY) = immmutable widget w/ `final` properties & `const` constructor
    * Those get rebuilt (aka replaced) when the input data from their parent changes (which is e.g. never when the whole tree is _stateless_)
    * All visual elements such as buttons, texts are stateless widgets
  * [Stateful Widget](https://www.youtube.com/watch?v=AqCMFXEmf3w) = associated with a companion class called State, holding changing data
    * This time, the `build()` method is in the State, and is called each time `setState()` is called
    * Get rebuilt (ie replaced) either when the input data from their parent or when their internal (associated) State changes
    * The associated State however is persistent, and survives widget tree rebuilds
    * The State has access to its associated widget's properties (usually passed down from parent), via the `widget` variable
    * `setState()` is [an anonymous method](https://iiro.dev/set-state/) mostly containing _asserts_ and marking the Element dirty
  * [Inherited Widget](https://www.youtube.com/watch?v=Zbm3hjPjQMk) = DYI DI via _context_
    * Inherited Widget takes at least one parameter: a _child_ (its sub-tree that gets notified) which is passed to `super()`
    * Define `of()` shorthand method eg `static InheritedNose of(BuildContext context) => context.inheritFromWidgetOfExactType(InheritedNose)`
    * **Theme**, **MediaQuery** are examples of Inherited Widgets, accessible to all children in their hierarchy
      * E.g. `Theme.of(context).primaryColor`
    * Use this to pass DB or service instances down the widget hierarchy
    * For more complex scenarios, use an integrated State Management solution instead
* **State** = objects associated with stateful widgets (and actually linked from physically from their associated Elements)
  * States survive tree rebuilds (eg a few parts of the screen gets updated), but not navigating to a whole different page, which replaces subtrees
* **Property** = actual value held in a widget e.g. the _text_ property of a **RichText** widget
* **Element** = instantiation of a Widget at a particular location in the _Element Tree_
  * Elements are very simple, holding just the widget type & reference, a reference to child Elements, and potential State
  * This (and their tree) is what Flutter uses to pilot the lifecycle of widgets, and update/redraw the UI
  * While widgets are immutable, Elements are like their mutable counterpart and mounted by Flutter to form the Element Tree
  * The Element Tree is built and handled all by Flutter (based on the Widget Tree), and never by the developer
  * The Element Tree acts as an app skeleton
  * The Element Tree is more "stable" than the widget tree, because unlike the former that gets rebuilt all the time, it is seldom modified
  * You can think of Elements as a buffer between configuration and rendering, because Widgets get rebuild often and mutable Elements do not
  * (You can think of Elements as association tables, because they hold practically no data and mostly point to other stuff (Widget & State))
* **RenderObject** = object in the RenderTree that renders & paints the UI (handles size, layout, painting)
* [Keys](https://medium.com/flutter/keys-what-are-they-good-for-13cb51742e7d)
  * A way to keep track of States uniquement for Stateful Widgets, useful when adding/reordering widgets on the screen
  * **LocalKey** only work at a specific location (under its parent) in the Tree
    * **UniqueKey** is like a GUID
    * **ObjectKey** bases off multiple values (e.g. address) which aggregated are unique
    * **ValueKey** bases off a single value (e.g. TODO item task's text) which is unique amongst its siblings
      * **PageStorageKey** stores a user scroll location, so we can resume it when going back to the Widget
  * **GlobalKey** allow Widgets to change parents without losing State, or access information about another Widget, both anyhere in the Tree
* **Packages**/**Modules** = Dart code **only**; can use plugins (and still qualify as a package); they're published to <https://pub.dev>
* **Plugin** = native code (Kotlin/JS/Swift) features [wrapped as Dart](https://stackoverflow.com/a/63154273/3559724)
* Slivers = different parts of a scrollable area that can each react appropriately to the same scroll
* Constraints = the min/max height/width dimension constraints cascading down the widget tree from parents to children
  * Loose constraints = constraints allowing a range of possible values (i.e. min < max)
  * Tight constraints = constraints defined as a single point (i.e. min == max), e.g. the app root widget **must** fit the whole screen exactly
* [Shrink-wrap](https://flutteragency.com/what-does-the-shrink-wrap-property-does/) = force a widget to pre-calculate its total size ~ its items
* _Lifting state up_ = moving state data up one level to broaden its access; basic solution to fix state sharing between multiple widgets

## Environment

### Install

* [Android Studio](https://developer.android.com/studio/)
  * Install the following under _Tools > SDK Manager > SDK Tools_:
    * [Android SDK Command-line Tools](https://developer.android.com/studio/intro/update#sdk-manager)
    * Google/Samsung USB Driver (those get downloaded and must be then installed manually)
  * (Flutter extension if using as IDE)
* [Flutter](https://flutter.dev/docs/get-started/install/windows)
* (PowerShell 5.1 (via _Windows Management Framework 5.1_))
  * Also gets installed along with Visual Studio
* Visual Studio
* Visual Studio Code
  * PowerShell extension
  * Flutter extension
  * Material Icon Theme
* Any browser (Flutter might complain it requires Chrome, but e.g. Firefox works, even the **Dart DevTools**' live Debugger)
  * Might require closing/restarting the app, closing/reopening/reattaching (while the app is running) the browser tab

### [CLI](https://docs.flutter.dev/reference/flutter-cli)

* `flutter --version`
* `flutter doctor -v(erbose)` (Tip: use PowerShell to get Unicode support)
* `flutter doctor --android-licenses`
* `flutter devices` = list all connected devices
* `flutter create kokoapp`
* `flutter create .`  = add web support to existing app (see <https://docs.flutter.dev/get-started/web#add-web-support-to-an-existing-app>)
* `flutter build`
  * `flutter build appbundle`
  * `flutter build apk --split-per-abi`
  * `flutter build web` = [Build for web deployment](https://docs.flutter.dev/deployment/web)
  * `flutter build web --web-renderer [html|canvaskit]` = [Web Renderers](https://docs.flutter.dev/development/platform-integration/web/renderers)
  * `flutter build web --base-href {path}` = [HTML \<base> href](https://www.w3schools.com/Tags/att_base_href.asp)
  * Troubleshooting
    * set `<base href>` manually to _./_ to deploy in a (non-root) subfolder
    * replace the index.html each time, as it contains a unique service worker version ID
    * run `flutter clean` then rebuild if flutter.js is not regenerated each time
* `flutter run` = F5
  * `flutter run release --apk`
  * `flutter run -d(evice-id) {device}` = Run to chosen device
    * `flutter run -d chrome`
    * `flutter run -d web-server` (works in any browser <https://stackoverflow.com/a/71518488>)
  * `flutter run -d web-server --web-renderer [html|canvaskit]` = same as build
  * `flutter run -d {device} --profile` (physical devices only) = display additional performance metrics banner
  * [Fix "Parameter format not correct"](https://stackoverflow.com/a/69519005/3559724)
* `flutter install` = install app to attached device
* `flutter clean` = clear build & packages cache (very useful before archiving/zipping an app source code)
* `flutter format {filename}` = Format document
* `flutter pub {add} {package}` = manages the _pubspec.yaml_ file, which contains assets & dependencies, downloaded from <pub.dev>
  * E.g. [Install intl](https://stackoverflow.com/a/51706630/3559724)
* `flutter pub get` = explicitely pulls packages into the project & generates _pubspec.lock_ (implied with `flutter run`)
  * `flutter packages get` = [alias for the above](https://stackoverflow.com/a/61038022/3559724)
* `flutter pub cache repair`
* `flutter upgrade` = install latest Flutter version
  * [Upgrade and clean cache](https://stackoverflow.com/a/64515721/3559724)

### Folder Structure

* _.idea/_ = Android Studio (built on JetBrains' IntelliJ **IDEA**) configuration
* _.vscode/_ = Visual Studio configuration (zoom level, etc.)
* _android/_ = complete (passive) Android project used by Flutter (we don't need to change it)
* _build/_ = compile output generated by the Flutter SDK
* _ios/_ = same as Android
* _lib_ = source files (everything is a library in Dart)
* _test_ = automated tests
* _.gitignore_ = Git
* _.metadata_ = managed by Flutter SDK; version ID
* _.packages_ = managed by Flutter SDK
* _{project\_name}.iml_ = managed by Flutter SDK; project dependencies
* _analysis\_opions.yaml_ = Dart linter
* _pubspec.lock_ = required; generated automatically based on the _pubspec.yaml_
* _pubspec.yaml_ = project imported 3rd-party dependencies, fonts, images
* _README.md_ = Git/doc

Clean repositories:

1. delete all _flutter\_build_ folders
2. delete all _build_ folders
3. delete all _ephemeral_ folders

### Visual Studio Code

* Don't forget you can auto-complete via camelCase initials (eg `sichsc + Tab` => **SingleChildScrollView**)

* (`Ctrl + Shift + P` > ) _Dart:_
  * _Open DevTools_ = `Ctrl + Alt + D`
* (`Ctrl + Shift + P` > ) _Flutter:_
  * _Toggle Debug Painting_ = show/hide dashed layout wireframes

* `Ctrl + ,` = _File > Preferences_ > _Settings_
  * _Settings > Editor > Guides: Bracket Pairs_ = set parentheses matching coloured line guides (previously an extension, now built-in)
* `Ctrl + ;` = Quick Fix… (also displays _Refactor_ options)
* `Ctrl + Space` = Intellisense
* `Ctrl + Shift + R` = Refactor
* `Shift + Alt + F` = (Right-Click >) Format document (provided by Flutter extension)
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

## API

* Use two fingers to scroll lists & co will make it faster (useful tip to detect apps written in Flutter)

* `runApp(…)` = takes in the instance of a widget and inflate it to the screen size (calls its `build()` method, etc.)
* `MateriapApp(debugShowCheckedModeBanner: false)` = [remove debug banner](https://stackoverflow.com/a/48893964/3559724)
* `Scaffold(resizeToAvoidBottomInset: false` = [fix virtual keyboard overflow](https://stackoverflow.com/a/57441971/3559724)

* Lifecycle
  * `mounted` = after creating state and before initState(), until dispose() gets called
  * `void initState()` = one-time init (probably better to initialize state variables here than in the state's constructor)
  * `void dispose()` = widget removed from UI
    * Always dispose controllers, focus nodes, streams etc.

* `@override` = (optional) let the Dart analyzer warns us if there is no matching parent method
* `Widget build(BuildContext context) {…}` is a method and can begin with additional statements (such as declarations)
* `constructor({required super.property})` = shorthand to pass on parameters to  _super_ constructor (e.g. an **InheritedWidget**'s _child_)

* `toStringDeep()` = Returns a string representation of this node and its descendants

* Form
  * [How to use InputFormatters](https://stackoverflow.com/a/50123743/3559724)

* It's possible to create widgets in variables, then we can access their properties (eg height) down the tree, or add them conditionally in several places

### [Libraries](https://api.flutter.dev/index.html)

* [collection](https://api.flutter.dev/flutter/package-collection_collection/package-collection_collection-library.html) = array manipulation
  * [IterableExtension\<T>](https://api.flutter.dev/flutter/package-collection_collection/IterableExtension.html) = à la C# Linq
* [intl](https://api.flutter.dev/flutter/intl/intl-library.html) = date formatting
* [services](https://api.flutter.dev/flutter/services/services-library.html)

### Layout & Rendering

* [Layouts in Flutter](https://docs.flutter.dev/development/ui/layout)
  * [Understanding constraints](https://docs.flutter.dev/development/ui/layout/constraints)
    * **Constraints go down. Sizes go up. Parent sets position.**
  * Box constraints
    * _Tight_ constraints means _min == max_
    * _Unbounded_ constraints means max width or height is set to `double.infinity`

* [Flutter: Rendering](https://www.youtube.com/watch?v=54yoCqkew6g)

* Lists & Grids = ListView, DataTable, Table, GridView, ListTile, GridTile (with GridTileBar as _header_ or _footer_)
  * **GridView** = grid layout; usually via `GridView.count()` constructor (_crossAxisCount_, _mainAxisSpacing_, _crossAxisSpacing_)
* Wrappers = Container, Column & Row, Stack, FittedBox, SizedBox, LimitedBox, ConstrainedBox, UnconstrainedBox, OverflowBox, Wrap
  * **Container** has no `createRenderObject()` method; it is a wrapper for other layout widgets ~ its properties (see its `build()` source code)
  * **Column**/**Row** (inheriting from **Flex**)
    * They are flex spaces, giving unbounded constraints to all their children to let them choose their space (& usually asking them to shrinkWrap)
      * The space given to their _flexible_ children is the remaining space = parent_constraints - fixed_items
    * They themselves take up max size in their main axis by default (i.e. `mainAxisSize: MainAxisSize.max`)
  * [Flex](https://api.flutter.dev/flutter/widgets/Flex-class.html) = base class for Column & Row
* Positioning = Align, Center, Positioned, Expanded, Flexible

* `BoxConstraints.loose()` (min<max), `BoxConstraints.tightFor[Finite]()` (min==max), `BoxConstraints.expand()` (max)
* `EdgeInsets.all()`, `EdgeInsets.symmetric(vertical: a, horizontal: b)`, `EdgeInsets.only(right: 1)`

* ShapeBorder = **RoundedRectangleBorder**, **StatiumBorder**

* [Intrinsic Widgets](https://www.youtube.com/watch?v=Si5XJ_IocEs)

#### Layout Troubleshooting

* _Vertical viewport was given unbounded height_
  * A space-hungry misbehaved **ListView** is inside an unbounded constraints permissive (**Flex**) **Column**
  * Read [Column class Troubleshooting](https://api.flutter.dev/flutter/widgets/Column-class.html#troubleshooting)
  * Watch [Decoding Fluter: Unbounded height/widget](https://www.youtube.com/watch?v=jckqXR5CrPI)
  * The solution to this error is to be specific as possible in the intended layout and the bounds given to the ListView
  * => wrap the ListView in either flex-space-sharing-friendly **Expanded**/**Flexible**, or a **SizedBox** with a pre-fixed height
  * [shrinkWrap](https://api.flutter.dev/flutter/widgets/ScrollView/shrinkWrap.html) fixes the error, but do not use it with **Nested ListViews**
    * _shrinkWrap_ forces (sub-)lists to render upfront instead of lazily
    * Watch [Decoding Flutter: ShrinkWrap vs Slivers](https://www.youtube.com/watch?v=LUqDNnv_dh0)
    * => to handle nested lists, replace them instead with a **CustomScrollView** with **SliverList** children

* _RenderFlex children have non-zero flex but incoming height constraints are unbounded_
  * The issue is that a (a _non-zero flex_) **Expanded** is nested inside a **Column** nested inside a **Column**.
  * Columns are **Flex**; they provide their _non-flex_ (aka fixed-sized or `flex=0`) children with unbounded constraints so those can figure out their own size (asking them nicely to _shrinkWrap_), which may sometimes lead to a yellow/black banner but no error. After that, the _flex_ children share the remaining space. The inner Column here is _non-flex_ (it is **Flex**, but not **Flexible**: it does not inherit from **Flexible** and does not have a _flex_ property) therefore it receives unbounded constraints from its parent Column. But then the inner-inner (**Flexible**) Expanded asks to take all of the incoming now unbounded constraints i.e. asking to fill infinity, which is an error.
  * Read [Column class Troubleshooting](https://api.flutter.dev/flutter/widgets/Column-class.html#troubleshooting)
  * Read [Column > Column > Expanded Explanation](https://stackoverflow.com/a/66718208/3559724)
    * **Column** directly inherits from **Flex** but it _not_ a flex-factor (i.e. no _flex_ property) widget (it does not inherit from **Flexible**)
    * **Expanded** directly inherits from **Flexible** (ie it has a _flex_ property and is essentially a Flexible with `fit: FlexFit.tight`)
      * This also means that setting its _flex_ property to 0 makes it a non-flex-factor widget, thus fixes the issue! (_tested & confirmed_)

* Virtual keyboard causing yellow/black pattern
  * When the keyboard comes up, it adds some height padding at the bottom of the screen with the goal of keeping the target input field in view. But if the height is fixed and there no scrollable parent wraps the input field, this just pushes that padding outside the view
  * => Set **Scaffold**'s _resizeToAvoidBottomInset_ property to _false_ (and possibly wrap some areas with **SingleChildScrollView**)

* _Incorrect use of ParentDataWidget Error in Flutter_
  * **Flexible**, **Expanded**, **Positioned** & **TableCell** each require a specific type of parent (namely: Column, Row, Flex, Stack, Table)
  * <https://www.fluttercampus.com/guide/229/incorrect-use-of-parentdatawidget-error/#solution-of-the-error>

* Lazy GridView.builder() or ListView.builder() does not update properly even with keys
  * This occurs because lazy loading makes it impossible to refresh references at build time (builder does not know which items will get built).
  * Use keys with `findChildIndexCallback` to help Flutter update the widget references upon rebuild.

* _SizedBox for whitespace_
  * Problem: a **Container** is used, but we only use its _height_/_width_ properties
  * Solution: it could be advantageously replaced with the leaner **SizedBox** widget, which also has the benefit of a _const_ constructor
  * See <https://www.flutteroverflow.dev/sized-box-for-whitespace/>

* Faint border lines above/below some widgets
  * **DrawerHeader** = set **Divider** color (to _transparent_) or width (to _0_) via (global/local) themeing
  * **Material/Card** = set the _shape_'s _side_'s `color` (to _transparent_) or `width` (to _0_)

### Themeing & Adaptative Design

* `Theme.of(context).textTheme.headline4`
* `MediaQuery.of(context)`
  * `.orientation` (device), OrientationBuilder (parent widget) or LayoutBuilder (parent widget, not just its orientation)
  * `.size.height` = height on screen, including AppBar & (top) status bar
    * `height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top` x (0.0 -> 1.0 ratio)
  * `.size.width`
  * `.size.shortestSide < 600` = is phone or tablet?
  * `.viewInsets.bottom` = soft virtual keyboard
  * Make sure that the _context_ originates from the root of the app, not a local _ctx_ instance (eg from a `builder((ctx) => …)` method)
  * If multiple call to MediaQuery are done in the same file/widget, place it in a local variable and use that instead
  * Using InheritedWidgets such as **MediaQuery** or **Theme** in a widget causes the widget to get rebuilt when they change
    * This is the case even from built-in widgets eg **Text** very logically rebuilds whenever Theme is changed
  * [Scroll a list when keyboard pops up](https://stackoverflow.com/a/70612950/3559724)
  * [Move bottom sheet when autofocused keyboard is up](https://stackoverflow.com/a/57515977)

* [Colors](https://api.flutter.dev/flutter/material/Colors-class.html) e.g. `Colors.green[400]`
  * `Color.fromRGBO(r, g, b, opacity)` where _opacity_ is a **double** between _0.0_ and _1.0_
  * `Color.fromARGB(alpha, r, g, b)` where _alpha_ is an **int** between _0_ and _255_
  * `withOpacity(0.0 - 1.0)`
* Buttons
  * `ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.yellow)`
  * `ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red))`
  * `ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((Set<MaterialState> states) => states.contains(MaterialState.disabled) ? Colors.blueGrey : Colors.blue))`

* Platform-adaptative
  * `Theme.of(context).platform == TargetPlatform.iOS ? CupertinoButton(…) : ElevatedButton(…)` = Apple vs Google button style
  * `import 'dart:io' show Platform;` then `Platform.isAndroid`
  * `.adaptive()` method on some widgets (eg `Switch.adaptive()`)

### [Animations](https://api.flutter.dev/flutter/animation/animation-library.html) & Transitions

[Introduction to Animations](https://docs.flutter.dev/development/ui/animations):

1. [Implicit Animations](https://www.youtube.com/watch?v=IVTjpW3W33s)
2. [TweenAnimationBuilder](https://www.youtube.com/watch?v=6KiPEqzJIKQ) = create tweens in a static final variable outside of `build()`
3. [Built-in Explicit Animations](https://www.youtube.com/watch?v=CunyH6unILQ) = Foo-Transitions
4. [AnimatedBuilder & AnimatedWidget](https://www.youtube.com/watch?v=fneC7t4R_B0)
5. [Animation Deep Dive](https://www.youtube.com/watch?v=PbcILiN8rbo) = Ticker, AnimationController, TweenAnimationBuilder

* [How to choose which Flutter Animation?](https://www.youtube.com/watch?v=GXIJJkq_H8g)
  * [Rive](https://pub.dev/packages/rive)
  * [LottieFiles](https://pub.dev/packages/lottie)
* [Animations done right](https://www.youtube.com/watch?v=wnARLByOtKA) = self-made sound-wave-looking sin animation

* Implicit = performed automatically when a property updates (via setState()), non-repeating, continuous, single
  * **AnimatedCrossFade** = A/B fade transition (_crossFadeState_), use custom _layoutBuilder_ to avoid layout jumps
  * **AnimatedList** = ListViews with built-in visual feedback on adding/removing item
  * **ImplicitlyAnimatedWidget** = base class for the following widgets:
    * **AnimatedAlign** = alignment update transition
    * **AnimatedContainer** = implicit animation via linear interpolation (`transform: Matrix4.identity()..translate()..multiply()`)
    * **AnimatedSlide** = offset update transition
    * **AnimatedOpacity** = opacity animation (_curve_, _duration_, _opacity_ via `setState()`)
    * **AnimatedPadding** = padding animation (_curve_, _duration_, _padding_ via `setState()`)
    * **AnimatedPositioned** = animated **Positioned** reacting to properties change; useful to implement custom slider
    * **AnimatedPhysicalModel** = animated _borderRadius_, _color_ & _elevation_
  * **TweenAnimationBuilder\<T>** = custom implicit animation (_tween_, _duration_, _builder_, _curve_, _onEnd_), pass _child_ for performance
    * It always chases its _tween_'s end point, which can be adjusted (if set to a state variable) as the animation is playing
    * That means it can be somehow controlled, or at least its end target, via state
    * Can be used for _continuous_ (ie pulsating) repeating animations using its `onEnd` callback set the end point to the start value and back
* Explicit = has to be started/piloted manually; requires a **AnimationController** (and its proper disposable within a StatefulWidget's State)
  * **AnimatedBuilder** = full-custom explicit (i.e. coded by the developer) animation using Tweens (provide _child_ to optimize rendering)
    **AnimatedIcon** = (`icon: AnimatedIcon.play_pause, progress: _controller`)
  * **AnimatedWidget** = abstract base class for built-in & custom **Foo-Transition**s, with a single _listenable_ property
    * Can be extended, in which case its _listenable_ property expects an animation, which is typically an **AnimationController**
  * **AnimationController** = animation pilot/player (`vsync: this`, `(reverse)Duration`, `isCompleted|Dismissed`, `value`)
    * The containing widget must mixin **(Single)TickerProviderStateMixin** to allow for `vsync: this` (see Deep Dive about tickers)
    * `add(Status)Listener()`, `forward()`, `fling()`, `repeat()`, `reverse()`, `dispose()`, `animateTo(double value)` similar to TweenAB's end
    * Listeners don't actually have to use its `value` (but it makes sense that they do); they're just getting refreshed while it's 'playing'
  * **Foo-Transition**, where Foo = Size, Fade, Align, Scale, DecoratedBox, DefaultTextStyle, Positioned, Slide, Rotation
* Transitions
  * **AnimatedSwitcher** = child transition animation (_duration_, _child_ via `setState()`, _transitionBuilder_); use keys if same type
  * **Hero** = morphing animation between navigation routes (_child_, _tag_)
  * **Transform** = custom (PowerPoint-like) transitions (`.rotate()` with _angle_, `scale()`, `translate()`, or 4x4 custom matrix)
  * [animations](https://pub.dev/packages/animations) package = turnkey transitions pack, maintained by Material team
    * Container transform, shared axis (horizontal/vertical/scaled), fade through, fade

* `Color.lerp()`
  * Use [colors linear interpolation](https://stackoverflow.com/a/66385071/3559724) between tabs transitions (via **TabController**'s _offset_)
* Curves = `easeIn|Out`, `elasticIn|Out`, `linear`
* Clips = wraps a _child_ widget to only show its parts covered by built-in (**ClipOval**, **ClipRRect**) shape or custom (**ClipPath**) path
  * **ClipOval** = auto-adaptative circle/oval cutting (_clipper_ `extends CustomClipper<Rect>`), can be animated for fun effects
  * **ClipRRect** (**R**ounded) = rounded rectangle (_child_, _borderRadius_, _clipBehavior_)
  * **ClipPath** = create own (svg-like) shape (`clipper: KokoClipper()` where `class KokoClipper extends CustomClipper<Path>`)
    * [Example](https://stackoverflow.com/a/70820679) basic
    * [Example](https://stackoverflow.com/a/69476516) using `quadraticBezierTo(…)`

* TODO:
  * [Animations tutorial](https://docs.flutter.dev/development/ui/animations/tutorial)
  * [Implicit animations](https://docs.flutter.dev/codelabs/implicit-animations)
  * [Staggered animations](https://docs.flutter.dev/development/ui/animations/staggered-animations)
  * [Perspective on Flutter](https://medium.com/flutter/perspective-on-flutter-6f832f4d912e) via **Transform** widget
  * [Hero Animations](https://docs.flutter.dev/development/ui/animations/hero-animations)

### [Widgets](https://docs.flutter.dev/development/ui/widgets) (& Classes)

* `FlutterLogo(size: 200)` = built-in Flutter logo

* [ResizeImage](https://api.flutter.dev/flutter/painting/ResizeImage-class.html)

* [WidgetsApp](https://api.flutter.dev/flutter/widgets/WidgetsApp-class.html) = wraps a number of base functionality widgets (i.e. MediaQuery)
* [MaterialApp](https://api.flutter.dev/flutter/material/MaterialApp-class.html) = builds Material design on top of the base **WidgetsApp**
* [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html) = basic Material design layout with a set of pre-configured widgets
* [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html) = top menu (_leading_, _title_, _actions_, _bottom_)

* [Material](https://api.flutter.dev/flutter/material/Material-class.html)
* PreferredSizeWidget = base interface for widget that have an ideal size when unconstrained, such as **AppBar**
* **CustomScrollView** = custom scroll via _slivers_ (**SliverAppBar**, **SliverList**, **SliverGrid**, `center: key`)
* [ElevatedButton](https://api.flutter.dev/flutter/material/ElevatedButton-class.html)
* **InkWell** = rectangle with touch responses (_on(Double)Tap_, _onLongPress_, _onHover_)
* `NeverScrollableScrollPhysics()` = prevents ListView scrolling when the user drags
* `ClampingScrollPhysics()`
* **SingleChildScrollView** = makes child scrollable
  * This widget should be reserved to scenarios where the content is actually supposed to be displayed in full (i.e. not scrollable), but a smaller than usual devices' screen does make not that possible, so scroll must be added to avoid out-of-bounds
  * If the intent is to have a scrollable list, then _lazy_, _sliver-based_ **ListView**/**CustomScrollView** are vastly more efficient
  * To take advantage of lazy-optimization, the **ListView** must be dynamically built (using one of its builders eg `ListView.builder()`)
  * When using `ListView.builder(ctx, index)` make sure to not name the first parameter `context`, especially with inner `MediaQuery.of(context)`
* Buttons = **ElevatedButton**, **TextButton**, **OutlinedButton**, **IconButton**
  * `TextButton.icon()` = button with both text AND icon
* **CircleAvatar** = circle container (_back/foreground_ with text fallback, append `.image` to **Image**), usually for user pfp
* **SelectionArea** = selectable text (Flutter >=3.3)

* **RadioListTile** = literally Radio + (tappable anywhere) ListTile
* **Card** = Material rectangle shape with rounded corners and z-axis (_elevation_) shadow; size depends on the child unless its parent specifies
  * This is actually a simplified [Material](https://api.flutter.dev/flutter/material/Material-class.html) widget, which can take other shapes

#### [Flutter: Widgets of the Week](https://www.youtube.com/watch?v=lkF0TQJO0bA&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=129)

1. **SafeArea** = checks MediaQuery to ensure we get a neat uncut rectangle on the screen.
2. **Expanded** = expands a child widget to take up all available space in its parent
3. **Wrap** = "word wrap" children (_direction_, _alignment_ _spacing_, _runSpaching_); good for buttons & chips
4. **AnimatedContainer** = implicit (i.e. built-in) animations via linear interpolation (_color_, _shadow_, layouts, _curve_ & _duration_)
5. **Opacity** & **AnimatedOpacity** = alpha (0 is like CSS' `invisiblility: hidden`)
6. **FutureBuilder** = display something while loading a future's result and something else when it's done
7. **FadeTransition** = explicit opacity animation via _animationController_ (clean it up in dispose())
8. **FloatActionButton** (aka **FAB**) = Scaffold stacked button; use _floatingActionButtonLocation_ to embed in _bottomNavigationBar_
9. **PageView** = left-right swipable pages via PageController (_initialPage_, _scrollDirection_)
10. **Table** = simpler fixed grid layout (_defaultVerticalAlignment_, _defaultColumnWidth_, _columnWidths_, _border_ )
11. **SliverAppBar** = scroll-reactive top menu using **CustomScrollView** (_expandedHeight_, _flexibleSpace_, _floating_, _pinned_)
12. **SliverList** & **SliverGrid** = advanced scrolling control (_delegate_: `Sliver[Child|Builder]ListDelegate`, `.count()` & `.extent()` ctors)
13. **FadeInImage** = placeholder for images (_placeholder_ from directory/memory, _fadeInDuration_, _fadeInCurve_, **transparent_image** package)
14. **StreamBuilder** = async events handler (_initialData_, _stream_, `builder: (context, snapshot)` with snapshot.hasError)
15. **InheritedModel**`<T>` = more granular **InheritedWidget** but on specific fields (via _aspect_), `@override updateShouldNotifyDependent()`
16. **ClipRRect** = (R for) **r**ounded corners rectangle (_child_, _borderRadius_, _clipBehavior_), similar to **ClipOval**, **ClipPath**
17. **Hero** = morphing animation between navigation routes (_child_, _tag_)
18. **CustomPaint** = low-level paint calls (_size_, _painter_); surround with `FittedBox(SizedBox(width: image.width.toDouble(), height:…))`, see [Flutter mini-series n°2 Episode 4: Advanced UI with CustomPainter](https://www.youtube.com/watch?v=vvI_NUXK00s)
19. **Tooltip** = accessibility-friendly alt text (_child_, _message_, _verticalOffset_, _height_), some Widgets have a _tooltip_ property
20. **FittedBox** = make child fit smaller parent with (no-wrap) scaling (_fit_ = `BoxFit.{value=contain|cover|fitH/W|fill|none}`, _alignment_)
21. **LayoutBuilder** = provide **constraints**-aware _builder_ function, useful to make adaptative layout
22. **AbsorbPointer** = disable all pointer/touch events over a widgets group (_absorbing_, _ignoringSemantics_ for screen readers ignoring)
23. **Transform** = custom (PowerPoint-like) transitions (`.rotate()` with _angle_, `scale()`, `translate()`, or 4x4 custom matrix)
24. **BackdropFilter** & ImageFilter class = image blur/rotate/skew/stretch effects (`blur()`, `matrix()`), use with parent **Stack** & _fill_
25. **Align** = position a child within its parent (_t/b/r/l_, or specific _double_ value) à la HTML relative position. See **AlignmentTween**
26. **Positioned** = position children within a **Stack** (_t/b/r/l/heigh/width_, `fill()`) à la HTML absolute position
27. **AnimatedBuilder** = explicit (i.e. coded by the developer) animation using Tweens (provide _child_ to optimize rendering)
28. **Dismissible** = left/right swipeable items (_key_, (secondary)_background_, _direction_ , `onDismissed()` to remove underlying item)
29. **SizedBox** = give child a size (_w/h_, `double.infinity` == max, `SizedBox.expand()` == max _w/h_), use empty for spacing
30. **ValueNotifier** & **ValueListenableBuilder** = Observer pattern replacing `setState()` (set optional _child_ to const subtree for performance)
31. **Draggable\<T>** (_data_, _child(WhenDragging)_, _feedback_) & **DragTarget\<T>** (_builder_, _onWillAccept_, _onAccept_, _onLeave_)
32. **AnimatedList** = `itemBuilder: (context, index, animation) {…}`, _initialItemCount_ if not empty, `AnimatedListState.insert/removeItem()`
33. **Flexible** = give child widgets a percentage of the available space within their parent **Column**/**Row** (_flex_, _fit_)
34. **MediaQuery** = Object used to retrieve info about screen size, orientation, text scaling
35. **Spacer** = add custom spaces within Column/Row beyond their simple _mainAxisAligment_ (_flex_ distributes available space)
36. **InheritedWidget** = passing data from ancestors to descendants via the **BuildContext**
37. **AnimatedIcon** = (`icon: AnimatedIcon.play_pause, progress: myAnimation`, `myAnimation.forward/reverse()`)
38. **AspectRatio** = preserve box ratio (_aspectRatio_ as `width/height` for readability, _child_), incompatible w/ **Expanded** (**Align** between)
39. **LimitedBox** = give limited constraints (_maxH/W_) to child with infinite parent (**ListView**/**Column**/**Row**/**UnconstrainedBox**)
40. **Placeholder** = temporary stand-in while building the UI (use _fallbackHeight/Width_ inside unbounded parent, _color_, _strokWidth_)
41. **RichText** = multiple styles per line (`text: TextSpan(style: …, children: <TextSpan>[…]`) for when standard **Text** is not enough
42. **ReordableListView** = drag & drop list items (_children_, `onReorder: (old, new) {setState()}`, optional _header_); use with **ListTile**
43. **AnimatedSwitcher** = child transition animation (_duration_, _child_ via `setState()`, _transitionBuilder_); use keys if same type
44. **AnimatedPositioned** = animated **Positioned** reacting to properties change; useful to implement custom slider
45. **AnimatedPadding** = animated **Padding** reacting to properties change (_curve_, _duration_, _padding_ via `setState()`)
46. **IndexedStack** = **Stack** showing one of several _children_ widgets at a time (_index_ via `setState()`)
47. **Semantics** = provide child Widget with (lots of) meta-information, improving accessibility
48. **ConstrainedBox** = adds min & max h/w constraints to its parent's (the resulting constraints are the more restrictive ones eg the screen)
49. **Stack** = z-axis stacking (_fit_ to children `StackFit.loose` by default, or to parent `StackFit.expand`, _alignment_, _overflow_)
50. **AnimatedOpacity** = implicit (i.e. piloted via property) opacity animation (_duration_, _opacity_ via `setState()`, _curve_)
51. **FractionallySizedBox** = size by percentage (_heigh/widthFactor_), align in parent or wrap in **Flexible**; use no child for whitespacing
52. **ListView** = scrollable list (_scrollDirection_, _reverse_, _physics_, _addAutomaticKeepAlives_, _cacheExtent_, `ListView.builder` with _itemBuilder_, `ListView.separated` with _separatorBuilder_ & _itemCount_, `ListView.custom` with _childrenDelegate_ sliver)
53. **ListTile** = Material List item (up to 3 lines _title_/_subtitle_/_isThreeLine_, _dense_, `tap`, `onLongPress`, `ListTile.divideTiles()`)
54. **Container** = wraps child widget in margin/padding/size/color/decoration/shape (_aligment_ will fit parent, _constraints_, _transform_)
55. **SelectableText** = (_showCursor_, _cursorWidth_, _cursorColor_, _cursorRadius_, _toolbarOptions_, _onTap_, _scrollPhysics_, `.rich()`)
56. **DataTable** = grid-like (_columns_, _rows_, _sortColumnIndex_, _sortAscending_; **DataColumn** _label_, _numeric_, **DataRow** _selected_, _cells_; **DataCell** _showEditIcon_, _placeholder_, and all cells are widget themselves => customizable), wrap in **SingleChildScrollView**
57. (Material) **Slider**, **RangeSlider**, **CupertinoSlider** = sliders (_onChanged_, _min/max_, _divisions_, _label_, `Slider.adaptive()`)

* **(Cupertino)AlertDialog** = pop-up (_title_, _content_ (any), _actions_, _elevation_, _backgroundColor_, _shape_, _barrierDismissible_)
* **AnimatedCrossFade** = fade transition (_first/secondChild_, _duration_, _crossFadeState_, _abcCurve_), use _layoutBuilder_ for custom
* **DraggableScrollableSheet** = draggable container (_builder_ => pass `scrollControlller` to **SingleChildScroll/ListView**, _abcSize_)
* **ColorFiltered** = apply color filter over images/widgets groups (eg: `colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation)`)
* **ToggleButtons** = on/off/radio buttons (_isSelected_ = `List<bool>`, _onPressed_ controls selection logic, _abcColor_, _abcBorder_)
* **CupertinoActionSheet** = iOS-themed actions sliding from the bottom
* **TweenAnimationBuilder** = custom implicit animation (_duration_, _builder_, _curbe_, _onEnd_), pass _child_ for performance
* **Image** = image (_fit_, _colorBlendMode_, _semanticLAbel_) via asset (sizes in _pubspec.yaml_), network (_loadingBuilder_), file, memory
* **DefaultTabController**, **TabBar**, **TabBarView** = tabbed widgets
* **Drawer** = **Scaffold** `(end)drawer:` (`child:` List of **DrawHeader** & **ListTile**s), open via `Scaffold.of(context).open(End)Drawer()`
* **SnackBar** = pop-up a temporary (widget) message, open via `Scaffold.of(context).showSnackBar()` (use a **Builder** to pass it _context_)
* **ListWheelScrollView** = price-is-right 3D carousel list (_itemExtent_, _diameterRatio_, _offAxisFraction_, _userMagnifier_ & _magnification_)
* **ShaderMask** = apply color/gradient/image masks (`shaderCallback(bounds) => abcGradient().createShader(bounds)`)
* **NotificationListener** = listen to some descendant widget's notifications. Custom notifications can also be sent
* **Builder** (not to be confused with the usual _builder_ property) = a widget used to access an (InheritedWidget) ancestor's **BuildContext**, from **within the same `build()` method** (the ancestor is usually **Scaffold**, **Navigator**, **ThemeData**, **MediaQuery**, **Provider\<T>**)
* **ClipPath** = custom (svg-like) shape (_clipper_ `extends CustomClipper<Path>`)
* **Circular/LinearProgressIndicator** = Material (in)determinate progress (_value_, _value/bgColor_, `ThemeData.accentColor` by default)
* **Divider** = basically HTML's `<hr>` (_thickness_, _(end)Indent_), set once for all via **MaterialApp**'s **ThemeData**'s _dividerTheme_
* **IgnorePointer** = ignore pointer/touch events on a specific child (but [click can bubble up](https://stackoverflow.com/a/55431032/3559724))
* **CupertinoActivityIndicator** = Apple's counterpart for **CircularProgressIndicator**
* **ClipOval** = auto-adaptative circle/oval cutting (_clipper_ `extends CustomClipper<Rect>`), can be animated for fun effects
* **AnimatedWidget** (abstract class) = custom transition that is not one of the built-in (**Size/Fade/Align/Scale/DecoratedBox/DefaultTextStyle/Positioned/Slide/Rotation-Transition**)
* **Padding** = padding
* **CheckboxListTile** = literally Checkbox + (tappable anywhere) ListTile (`secondary`, `controlAffinity`, `value`, `onChanged`, coloring)
* **AboutDialog** = boring legalese stuff (`showAboutDialog()`, `application_`, `children`, `LicenseRegistry.addLicense()`)
* (_async_ package)
* (_url\_launcher_ package)
* (_sqflite_ package)
* **SliverAppBar** (again) = AppBar reacting to scroll, now with new effects (zoom, blur)
* **InteractiveViewer** = lets user interact (ie pan/scale/zoom) with content larger than the device
* **GridView** = Grid (`.builder()`, `.count()`, `extent()`, `crossAxisCount`, `main|crossAxisSpacing`)
* **SwitchListTile** = literally Switch + (tappable anywhere) ListTile (`value`, `onChanged` with `setState()`, `(in)activeThumbImage`)
* (_location_ package)
* (_device\_info_ package)
* **ImageFiltered** & **BackdropFilter** = filters (blur, scale, translate, skew, rotate)
* **PhysicalModel** = custom 3D shadow effects
* (_animations_ package)
* (_flutter\_slidable_ package)
* **RotatedBox** = (`quarterTurns`); in contrast, `Transform.rotate()` affects rendering, not layout
* **ExpansionPanel** & **ExpansionPanelList** = expandable _v_ widget (`animationDuration`, `elevation`, `expandedHeaderPadding`, `canTabOnHeader`)
* **Scrollbar** = add scrollbar to _finite_ scrollable widget (**List|Grid|CustomScrollView**) (`isAlwaysShown`, `showTrackOnHover`, ScrollbarTheme)
*
*
*
*
*
*
*
*
*
*
*
*

### [Packages](https://pub.dev/)

[Using packages](https://docs.flutter.dev/development/packages-and-plugins/using-packages)
[Community Packages](https://pub.dev/publishers/fluttercommunity.dev/packages)

  At a minimum, a Dart package is a directory containing a pubspec file.
  A plugin is a type of package—the full designation is _plugin package_, which is generally shortened to plugin.
  A plugin package is a special kind of package that makes platform functionality available to the app. Plugin packages can be written for Android (using Kotlin or Java), iOS (using Swift or Objective-C), web, macOS, Windows, Linux, or any combination thereof. For example, a plugin might provide Flutter apps with the ability to use a device’s camera.

* [animated_clipper](https://pub.dev/packages/animated_clipper) = clip transitions for interactive buttons & co
* [bloc](https://pub.dev/packages/bloc) = [BLoC pattern](https://www.didierboelens.com/2018/08/reactive-programming-streams-bloc/)
* [clippy_flutter](https://pub.dev/packages/clippy_flutter) = collection of clip shapes (arrows, rhombus)
* [flutter_custom_clippers](https://pub.dev/packages/flutter_custom_clippers) = collection of clip shapes (wave, panels)
* [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)
* [get_it](https://pub.dev/packages/get_it) (aka **GetIt**) = DI container / service locator
* [GetX](https://chornthorn.github.io/getx-docs/) = DI, Navigation, State Management all-in-one framework (à la WPF Prism)
* [go_router](https://pub.dev/packages/go_router)
* [motion](https://pub.dev/packages/motion) = gyroscope-based effect
* [provider](https://pub.dev/packages/provider) = easier, more reusable **InheritedWidget**
  * [create vs value](https://stackoverflow.com/a/61861315/3559724); use _value_ inside `Grid|ListView.builder`
* [shimmer](https://pub.dev/packages/shimmer) = pulsating UI loading effect
* **transparent_image** (see **FadeInImage**)

#### [Flutter: Package of the Week](https://www.youtube.com/watch?v=r0tHiCjW2w0&list=PLjxrf2q8roU1quF6ny8oFHJ2gBdrYN_AK&index=21)

* [cached_network_image](https://docs.flutter.dev/cookbook/images/cached-images)
* [intl](https://pub.dev/packages/intl) = Dates & Numbers (& Bidi) formatting methods

* **async**= additions to Dart's built-in _async_ (`StreamGroup.merge()`, `AsyncCache<T>()` time-based cacheing, **StreamQueue**)
* **url_launcher** = open external URL/e-mail/phone number/SMS/any app with special URL handlers (e.g. YouTube). Check `canLaunch()` first
* **sqflite** = save structured data locally in SQLite DB (usual CRUD, or raw SQL). Enable foreign keys explicitely if they are needed
* **location** = device geographical location; `serviceEnabled()`, `requestService()`, `hasPermission`, `requestPermission()`, `getLocation()`
* **device_info** = device/OS-specific information; `DeviceInfoPlugin()` then `.androidInfo` or `.iosInfo` ~ built-in `Platform.isAndroid|IOS`
* **animations** = turnkey animations/transitions pack, maintained by Material team
* **flutter_slidable** ~= **Dismissible** but can stay in place (`actionPane`, `actions: [IconSlideAction]`, `actionExtentRatio: 1/actions.length`)
*
*
*
*
*
*
*
*
* **path_provider** = find commonly used locations on the filesystem for different devices
*
*
*
*
* a

## Tutorials

* [@Robert Brunhage](https://www.youtube.com/c/RobertBrunhage)
* [@FilledStacks](https://www.youtube.com/c/FilledStacks)

* [Fireship: React Native vs Flutter](https://youtu.be/X8ipUgXH6jw?t=162)
  * **React Native** = native UI components for each platform, linked to JS code through a bridge
  * **Flutter** = native pixel painting (via Skia, a Google 2D painting library) à la Unity
* [Fireship: 12 Minute Flutter Bootcamp](https://www.youtube.com/watch?v=1xipg02Wu8s)
  * Layout
    * Container (single child, à la `<div>`)
    * Margin/Padding
      * Via _margin_/_padding_ properties of the chosen container
      * Via **Padding** widget
    * BoxDecoration
    * SizedBox (sets height & width)
    * Center
    * Flex (Column & Row)
      * Main axis = vertical for Columns, horizontal for Row
      * Cross axis = horizontal for Columns, verical for Row
      * _mainAxisAlignment_ & _crossAxisAlignment_ = centering, justify
      * **Flexible** & **Expanded** widgets to take less or more space
    * Stack (z-axis overlays)
    * **Positioned** & **Align** = à la HTML _absolute_ & _relative_
    * Scaffold
      * **AppBar** at the top
      * **FloatingActionButton** with _onPressed()_ event
      * **BottomNavigationBar** with **BottomNavigationBarItem**s
      * **Drawer** on the left
    * Listview = scroll (Horiz/Verti) & garbage-collect children that are no longer on the screen
  * Builder = add widgets dynamically e.g. based on some DB data, or even infinite based (with a random generator)
  * State Management (_provider_, _bloc_, _cubit_)
  * Navigation = works like a stack (à la browser history)
  * Animation, using the **Hero** widget which performs transition "morphing" between widgets
* [Fireship: Top 12 Flutter Tips & Tricks](https://www.youtube.com/watch?v=FdgDgcrDeNI)
  * VS Code bracket pairs coloring
  * **AnimatedContainer** = animate between styles (position, size, color, shadow, gradient) with duration & curve
  * **Hero** via Navigator and a common _tag_
  * **Flare** = 2D complex animation tool
  * Profiling (`flutter run --profile`)
  * Material vs Cupertino (`import 'dart:io' show Platform;` or `Widget.adaptive()`)
  * `ListView.builder()` & `ListView.separated()`
  * State Management (_get\_it_, _provider_ = synctactic sugar for built-in inherited widget/stream builder & compatible with Firebase)
  * Generate all platforms/sizes icons (via community-created [_flutter\_launcher\_icons_](https://pub.dev/packages/flutter_launcher_icons))

### [Flutter](https://docs.flutter.dev/)

* [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab) = TwinWords
* [Write your first Flutter web app](https://docs.flutter.dev/get-started/codelab-web) = (login) input fields with progress
  * **TextEditingController** = controller for an editable input text field (i.e. a **TextFormField**)
  * The _const_ keyword in front of the constructor is very important, making rendering more efficient by skipping most of the rebuild
  * **Navigator** & routes/pages via `push()` & `pop()`
  * Linear progress bar with color Animations
  * Debugging

* [How Flutter renders Widgets](https://www.youtube.com/watch?v=996ZgFRENMs) (Configure, Lifecycle & Paint!)
* [Building your first Flutter Widget](https://www.youtube.com/watch?v=W1pNjxmNHNQ)
  * **RawMaterialButton** (_fillColor_, _splashColor_)
  * **Row**'s _mainAxisSize_ (`MainAxisSize.min`)
  * Use **SizedBox** for spacing
  * Use **GestureDetector** for detecting taps, long-presses, drags, etc.
  * Use **RotatedBox** to apply rotation on child Widgets
  * **AnimationController** (_duration_, _vsync_, `.repeat()`)

## TODO

* [Flutter: Cookbook](https://docs.flutter.dev/cookbook)
  * [Persistence](https://docs.flutter.dev/cookbook/persistence)
    * [Persist data with SQLite](https://docs.flutter.dev/cookbook/persistence/sqlite)
    * [Read and write files](https://docs.flutter.dev/cookbook/persistence/reading-writing-files) = (_path\_provider_)
    * [Store key-value data on disk](https://docs.flutter.dev/cookbook/persistence/key-value) = (_shared\_preferences_)
  * [Design](https://docs.flutter.dev/cookbook/design)
    * [Display a snackbar](https://docs.flutter.dev/cookbook/design/snackbars)
  * [Forms](https://docs.flutter.dev/cookbook/forms)
    * [Build a Form with validation](https://docs.flutter.dev/cookbook/forms/validation)
  * [Navigation](https://docs.flutter.dev/cookbook/navigation)
  
* [Navigator class](https://api.flutter.dev/flutter/widgets/Navigator-class.html)
* [MaterialApp.router](https://api.flutter.dev/flutter/material/MaterialApp/MaterialApp.router.html)
  * \+ [go_router](https://pub.dev/packages/go_router) package
* [Navigator 2.0](https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade)

  * [Splash screen](https://blog.logrocket.com/make-splash-screen-flutter/)

* [Material Design 3](https://m3.material.io/)
  * [Material Typography](https://m3.material.io/styles/typography/fonts)

* Themeing
  * [AppBar customization](https://www.geeksforgeeks.org/flutter-appbar-widget/)
  * [Reddit: ThemeData is a mess](https://www.reddit.com/r/FlutterDev/comments/xjlman/themedata_is_a_mess/)
  * Dark theme(ing)
  * Colors
    * Find synergetic [Color palettes](https://coolors.co/palettes/trending)
    * [Material.io - Picking colors](https://material.io/design/color/the-color-system.html#tools-for-picking-colors) (cyan, teal)
  * Fonts
    * [Google Fonts](https://fonts.google.com/)
  * Icons, Images
    * **AnimatedIcon** = like Icons.abc, but animated (`icon: AnimatedIcon.play_pause, progress: myAnimation`, `myAnimation.forward/reverse()`)
    * [Switch Clipper](https://pub.dev/packages/flutter_switch_clipper) fill/transition effects package
    * [Pack images for each device size](https://docs.flutter.dev/development/ui/assets-and-images)
    * [Android Icon Design Specifications](https://developer.android.com/distribute/google-play/resources/icon-design-specifications)
    * [Flutter Material Icons](https://api.flutter.dev/flutter/material/Icons/bookmark_remove-constant.html)
    * [Wizard](https://www.flaticon.com/free-icons/wizard)
    * [Magic](https://www.flaticon.com/free-icons/magic)
    * [Sparkles](https://www.flaticon.com/free-icons/sparkles)
    * [spinkit](https://pub.dev/packages/flutter_spinkit) loading icons package
  * Sounds
    * [flutter_sound](https://pub.dev/packages/flutter_sound)
    * `SystemSound.play(SystemSoundType.click);`

* DB, Files, Firebase
  * [Saving data to Local Storage in Fluter](https://medium.com/kick-start-fluttering/saving-data-to-local-storage-in-flutter-e20d973d88fa)
  * [Fireship: Flutter Provider - Advanced Firebase Data Management](https://www.youtube.com/watch?v=vFxk_KJCqgk) (_dispose StreamSubscription_)
  * [Robert Brunhage: Flutter Firebase Authentication - The Clean Way](https://www.youtube.com/watch?v=oJ5Vrya3wCQ)
  * [Add Firebase to your Flutter app](https://firebase.google.com/docs/flutter/setup)

* State Management
  * [Ephemeral vs App states](https://docs.flutter.dev/development/data-and-backend/state-mgmt/ephemeral-vs-app)
  * [Flutter: Pragmatic State Management Using Provider (The Boring Flutter Development Show)](https://www.youtube.com/watch?v=HrBiNHEqSYU)
  * [Fireship: Flutter State Management - The Grand Tour](https://www.youtube.com/watch?v=3tm-R7ymwhc)
  * [Flutter state management for minimalists](https://suragch.medium.com/flutter-state-management-for-minimalists-4c71a2f2f0c1)
    * [get_it](https://pub.dev/packages/get_it) = simple Service Locator
  * [Flutter Redux](https://blog.logrocket.com/flutter-redux-complete-tutorial-with-examples/) = DI for data using InheritedWidgets
  * Bloc
    * [bloc](https://pub.dev/packages/flutter_bloc) = BLoC (Business Logic Component) design pattern
    * [BLoC Pattern](https://www.flutterclutter.dev/flutter/basics/what-is-the-bloc-pattern/2021/2084/)
  * Provider
    * [provider](https://pub.dev/packages/provider)
    * [Enrico Ori: A simple guide for Provider](https://medium.com/theotherdev-s/starting-with-flutter-a-simple-guide-for-provider-401b25957989)

* Archi
  * [Flutter Architecture Samples](https://fluttersamples.com/)
  * [Aglowid: Flutter Best Practices to Follow in 2022](https://aglowiditsolutions.com/blog/flutter-best-practices/)
  * [Conner Aldrich: Code Organization](https://medium.com/flutter-community/flutter-code-organization-revised-b09ad5cef7f6)
  * [Aashish Vichare: Flutter Widgets lifecycle](https://medium.com/nerd-for-tech/flutter-widgets-lifecycle-widget-tree-and-element-tree-ac41ab1918da)
  * [JediPixels: Widget Tree & Element Tree](https://www.youtube.com/watch?v=4W8eN_6mO2E)
  * [Didier Boelens: Flutter internals](https://www.didierboelens.com/2019/09/flutter-internals/) ("there is no Widget Tree"? may be incorrect/wrong)
  * [Platform Channels](https://docs.flutter.dev/development/platform-integration/platform-channels) = platform-specific code/APIs

* [Awesome Flutter](https://github.com/Solido/awesome-flutter) = github index of Flutter resources
  * [Ins and Outs of Flutter Web by Nash](https://github.com/Solido/awesome-flutter)
  * [https://medium.com/@diegoveloper](https://medium.com/@diegoveloper)
    * [Communication between Widgets](https://medium.com/flutter-community/flutter-communication-between-widgets-f5590230df1e)
  * [Awesome Flutter tips & tricks](https://github.com/erluxman/awesomefluttertips/)
  * [Todo List built with Flutter](https://github.com/lesnitsky/todolist_flutter)
* [Flutter in Focus: Flutter Performance Tips](https://www.youtube.com/watch?v=PKGguGUwSYE)

* [MediaQuery in Flutter](https://medium.com/flutter-community/mediaquery-in-flutter-4317d3fe3612)
* [PWA with Flutter](https://www.fullstacklabs.co/blog/pwa-with-flutter)
* [Android Home Screen App Widget](https://medium.com/@ashishgarg1998/how-to-create-home-screen-app-widgets-in-flutter-ce3458f3638e)

* Release, Performance & Testing
  * [Build and release an Android app](https://docs.flutter.dev/deployment/android)
  * [Internationalization](https://docs.flutter.dev/development/accessibility-and-localization/internationalization)
    * Follow that (^) official tutorial to 'install' locales and use thems in the app to format dates (`DateFormat.yMd('fr_BE').format(date)`)
    * [Managing Locale in Flutter](https://medium.com/saugo360/managing-locale-in-flutter-7693a9d4d6ac)
    * `Locale myLocale = Localizations.localeOf(context)` (see [How to format DateTime in Flutter](https://stackoverflow.com/a/51579740/3559724))
    * [supportedLocales property](https://api.flutter.dev/flutter/material/MaterialApp/supportedLocales.html)
  * Use DevTools' _Highlight Repaints_ to ensure repaints are performed at the appropriate granularity (not the whole **MaterialApp**/**Scaffold**)
    * It is best practice to split large Widgets to ensure the ones that don't need rebuilding get split in their own Stateless Widget
    * Flutter might still be able to reuse existing unchanged elements and repaint those instead of rebuilding them, but still
  * Platform adaptation
    * Test app with very small sizes, e.g. a small window in split-screen mode (a **SingleChildScrollView** might be useful in that scenario)
    * [Material Cross-platform guidelines](https://material.io/design/platform-guidance/cross-platform-adaptation.html#cross-platform-guidelines)

* [RawKeyboardListener](https://stackoverflow.com/a/58321483/3559724)

* [Flutter Search Bar](https://www.geeksforgeeks.org/flutter-search-bar/)

* [Optimizing](https://www.youtube.com/watch?v=vVg9It7cOfY)

* [Web: URL strategy & removing '#'](https://stackoverflow.com/a/67148421)

## Code samples

Simplest possible running apps (assuming `import 'package:flutter/material.dart';`):

```dart
void main() => runApp(const MaterialApp());
void main() => runApp(const MaterialApp(home: Text('Koko')));
void main() => runApp(const Text('Koko', textDirection: TextDirection.ltr));  // Text direction is required here (or in an ancestor).
// Does not work with SafeArea or Scaffold, which require MediaQuery, which is initialized by an enclosing MaterialApp;
// (by WidgetsApp to be precise, see https://api.flutter.dev/flutter/widgets/WidgetsApp-class.html)
// That is checked beforehand via debugCheckHasMediaQuery(), which raises an error since the MediaQuery wasn't initialized in an ancestor.
```

Passing data **from child to parent**:

* via a callback method passed through the child's constructor,
* via `of()` in parent widget to access its state (using `findAncestorStateOfType()` - note: this gets _State_); the state has a public setter:

```dart
// Simplified from https://flutteragency.com/send-data-from-child-widget-to-its-parent/
// Stateful widget (access its state)
static ParentState of(BuildContext context) => context.findAncestorStateOfType<ParentState>();
// State
set koko(String value) => setState(() => _koko = value);
// Child's build() method
ParentStateful.of(context).koko = "koko";
```

Generate random Colors:

```dart
// https://fluttercentral.com/Articles/Post/1182/How_to_generate_random_colors_in_flutter_or_dart
class UniqueColorGenerator {
  static Random random = new Random();
  static Color getColor() {
    return Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}
```
