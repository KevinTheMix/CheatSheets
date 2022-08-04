# [Flutter](https://en.wikipedia.org/wiki/Flutter_(software))

An open-source UI framework created by Google, to develop cross-platform applications from a single codebase.

It builds on top of the Dart language & adds a set of UI building blocks called widgets, based on (Google) Material & (Apple) Cupertino design.
The **Flutter SDK** is the part of the framework responsible with compiling the single Dart codebase to different target platforms.

Flutter does not simply translate its widgets to their native iOS/Android counterparts the way other frameworks do (e.g. React Native).
Flutter **does** compile to native(machine code) apps, but it **does not** use native UI components (aka Platform Primitives).
Instead, Flutter draws pixels on the target device using its own low-level rendering engine, à la _Unity_.
It is therefore way more free & flexible than other frameworks, while also highly performant (close to native code).
For instance, Flutter is capable of advanced 2D/3D transform animations à la PowerPoint transitions (see **Transform** widget).

## Lingo

* Kotlin = Google preferred language for Android app developers since 2019 (replacing Java), designed & developde by JetBrains
  * Compiles to JVM, or JavaScript for IOS support
* Dart = programming language developed by Google for fast client multi-platform (web & mobile) apps development with QoL features such as Hot Reload
* Gradle = build automation tool supporting Java, Kotlin, C/C++ & JavaScript
* **Widget** = immutable (declarative) description of part of a UI (layout component or behavior: center, pad, rotate)
  * All Widgets are _@immutable_, so either they manage only _final_ data, or the changing data is outsourced in a dedicated mutable **State**
  * Widgets (or State), **not Elements**, hold properties with actual values
  * [Stateless Widget](https://www.youtube.com/watch?v=wE7khGHVkYY) = immmutable widget w/ _final_ properties & _const_ constructor
    * All visual elements such as buttons, texts are stateless widgets
  * [Stateful Widget](https://www.youtube.com/watch?v=AqCMFXEmf3w) = associated with a companion class called State, holding changing data
  * [Inherited Widget](https://www.youtube.com/watch?v=Zbm3hjPjQMk) = DYI DI via _context_
    * Access Tree top-ish data (`@override updateShouldNotify()`)
    * Use this to pass DB or service instances down the widget hierarchy
    * Can define `of()` method in the parent to allow shortcut in children
    * _Theme_, _MediaQuery_ are examples of Inherited Widgets, accessible to all children in their hierarchy
      * E.g. `Theme.of(context).primaryColor`
* **Property** = actual value held in a widget e.g. the _text_ property of a **RichText** widget
* **Element** = instantiation of a Widget at a particular location in the _Element Tree_
  * Elements are very simple, holding just the type of the widget, a reference to child Elements, source Widget and potential State
  * You can think of them as an DB association table, because they hold practically no data and mostly point to other stuff (Widget & State)
  * This (and their tree) is what Flutter uses to pilot the lifecycle of widgets, and update/redraw the UI
  * While widgets are immutable, Elements are like their mutable counterpart and mounted by Flutter to form the Element Tree
  * The Element Tree is built and handled all by Flutter (based on the Widget Tree), and never by the developer
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
* (Any browser, but Chrome is required for its devtools protocol to use the (otherwise hidden) _Debug_ tab)

### CLI

* `flutter --version`
* `flutter doctor` (Tip: use PowerShell to get Unicode support)
* `flutter doctor --android-licenses`
* `flutter devices`
* `flutter create kokoapp`
* `flutter run` = F5
* `flutter run -d {device}` = Run to chosen device
  * `flutter run -d web-server` (works in any browser <https://stackoverflow.com/a/71518488>)
* `flutter format {filename}` = Format document
* `flutter pub {add} {package}` = manages the _pubspec.yaml_ file, which contains assets & dependencies, downloaded from <pub.dev>
* `flutter pub get` = explicitely pulls packages into the project & generates _pubspec.lock_ (implied with `flutter run`)
  * `flutter packages get` = [alias for the above](https://stackoverflow.com/a/61038022/3559724)

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

### Visual Studio Code

* `Ctrl + ;` = `Ctrl + Shift + R` = Refactor
  * Convert Stateless to Stateful
* `Ctrl + Alt + D` = _Dart: Open DevTools_
* `Ctrl + Space` = Intellisense
* `Shift + Alt + F` = (Right-Click >) Format document
  * Append a comma to each closing parenthesis to take advantage of Format Document provided by Flutter extension

#### Snippets

* `st` = widget
* `stle` = Statless Widget
* `stfu` = Stateful widget

## API

* `FlutterLogo(size: 200)` = built-in Flutter logo
* `runApp(...)` = takes in the instance of a widget and inflate it to the screen size (calls its `build()` method, etc.)

* `void initState()` = one-time init
* `setState(() {})`
  * [Why an anonymous method](https://iiro.dev/set-state/) = it performs a handful of `assert()`s first, but mainly marks the Element dirty
* `void dispose()` = widget removed from UI

* `List.generate(n, (index) { ... });` can be used to generate widgets

* [Colors](https://api.flutter.dev/flutter/material/Colors-class.html) e.g. `Colors.green[400]`

* `toStringDeep()` = Returns a string representation of this node and its descendants

* Adaptative Design
  * `MediaQuery.of(context).orientation` (device), OrientationBuilder (parent widget) or LayoutBuilder (parent widget, not just its orientation)
  * `final isMobile = MediaQuery.of(context).size.shortestSide < 600` = is phone or tablet?
  * `Theme.of(context).platform == TargetPlatform.iOS ? CupertinoButton(…) : ElevatedButton(…)` = Apple vs Google button style

* `@override` = explicitely but optionally declare that a method overrides a parent method. The Dart analyzer warns us if there is no matching parent

### Widgets (& Classes)

* [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html) = basic Material layout with a set of more elaborate widgets (e.g. an Add button that floats at the bottom right, or top/bottom menu bars) ready to use
* PreferredSizeWidget = base interface for widget that have an ideal size when unconstrained, such as **AppBar**
* [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html) = top menu (_leading_, _title_, _actions_, _bottom_)
* **Builder** (not to be confused with the usual _builder_ property) = a widget used to access an (InheritedWidget) ancestor's BuildContext
* **GridView** = grid layout; usually via `GridView.count()` constructor (_crossAxisCount_, _mainAxisSpacing_, _crossAxisSpacing_)
* **CustomScrollView** = custom scroll via _slivers_ (**SliverAppBar**, **SliverList**, **SliverGrid**, `center: key`)
* [ElevatedButton](https://api.flutter.dev/flutter/material/ElevatedButton-class.html)
* NeverScrollableScrollPhysics = prevents ListView scrolling when the user drags

[Flutter Widgets of the Week](https://www.youtube.com/watch?v=lkF0TQJO0bA&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=129):

1. **SafeArea** = checks MediaQuery to ensure we get a neat uncut rectangle on the screen.
2. **Expanded** = expands a child widget to take up all available space in its parent
3. **Wrap** = "word wrap" children (_direction_, _alignment_ _spacing_, _runSpaching_); good for buttons & chips
4. **AnimatedContainer** = implicit (i.e. built-in) animations via linear interpolation (_color_, _shadow_, layouts, _curve_ & _duration_)
5. **Opacity** & **AnimatedOpacity** = alpha (0 is like CSS' `invisiblility: hidden`)
6. **FutureBuilder** = display something while loading a future's result and something else when it's done
7. **FadeTransition** = opacity animation via animationController (clean it up in dispose())
8. **FloatActionButton** (aka **FAB**) = Scaffold stacked button; use _floatingActionButtonLocation_ to embed in _bottomNavigationBar_
9. **PageView** = swipable pages via PageController (_initialPage_, _scrollDirection_)
10. **Table** = simpler fixed grid layout (_defaultVerticalAlignment_, _defaultColumnWidth_, _columnWidths_, _border_ )
11. **SliverAppBar** = scroll-reactive top menu using **CustomScrollView** (_expandedHeight_, _flexibleSpace_, _floating_, _pinned_)
12. **SliverList** & **SliverGrid** = container scrolling (_delegate_: `Sliver[Child|Builder]ListDelegate`). Use `.count()` or `.extent()` ctors
13. **FadeInImage** = placeholder for images (_placeholder_ from directory/memory, _fadeInDuration_, _fadeInCurve_, **transparent_image** package)
14. **StreamBuilder** = async events handler (_initialData_, _stream_, `builder: (context, snapshot)` with snapshot.hasError)
15. **InheritedModel**`<T>` = more granular **InheritedWidget** but on specific fields (via _aspect_), `@override updateShouldNotifyDependent()`
16. **ClipRRect** = (R for) Rounded corners rectangle (_child_, _borderRadius_, _clipBehavior_), similar to **ClipOval**, **ClipPath**
17. **Hero** = morphing animation between navigation routes (_child_, _tag_)
18. **CustomPaint** = low-level paint calls (_size_, _painter_); surrounds with `FittedBox(SizedBox(width: image.width.toDouble(), height:…))`
19. **Tooltip** = accessibility-friendly alt text (_child_, _message_, _verticalOffset_, _height_), some Widgets have a _tooltip_ property
20. **FittedBox** = make child's original size fit smaller parent (_fit_ = `BoxFit.{value=contain|fitWidth|fill|none}`, _alignment_)
21. **LayoutBuilder** = provide `build()` method with Widget size, useful to make adaptative layout (_builder_) e.g. different # of rows/cols
22. **AbsorbPointer** = protects any number of sub-widgets from touch events (_absorbing_, _ignoringSemantics_ = also ignored by screen readers)
23. **Transform** = custom (PowerPoint-like) transitions (`.rotate()` with _angle_, `scale()`, `translate()`, or 4x4 custom matrix)
24. **BackdropFilter** & ImageFilter class = image blur/rotate/skew/stretch effects (`blur()`, `matrix()`), use with parent **Stack** & _fill_
25. **Align** = position a child within its parent (_t/b/r/l_, or specific _double_ value) à la HTML relative position. See **AlignmentTween**
26. **Positioned** = position children within a **Stack** (_t/b/r/l/heigh/width_, `fill()`) à la HTML absolute position
27. **AnimatedBuilder** = explicit (i.e. coded by the developer) animation using Tweens (provide _child_ to optimize rendering)
28. **Dismissible** = left/right swipable items (_key_, (secondary)_background_, _direction_ , `onDismissed()` to remove underlying item)
29. **SizedBox** = specific size (_width_ & _height_, `double.infinity` == max, `SizedBox.expand()` == 2 x max), use empty for spacing
30. **ValueNotifier** & **ValueListenableBuilder** = Observer pattern replacing `setState()` (set optional _child_ to const subtree for performance)
31. **Draggable\<T>** (_data_, _child(WhenDragging)_, _feedback_) & **DragTarget\<T>** (_builder_, _onWillAccept_, _onAccept_, _onLeave_)
32. **AnimatedList** = (`itemBuilder: (context, index, animation) {…}`, _initialItemCount_ if not empty, `AnimatedListState.insert/removeItem()`)
33. **Flexible** = give child widgets a percentage of the available space within their parent **Column**/**Row** (_flex_, _fit_)
34. **MediaQuery** = Object used to retrieve info about screen size, orientation, text scaling
35. **Spacer** = add custom spaces within Column/Row beyond their simple _mainAxisAligment_ (_flex_ distributes available space)
36. **InheritedWidget** = sharing data between ancestors/descendants via the **BuildContext**
37. **AnimatedIcon** = (`icon: AnimatedIcon.play_pause, progress: myAnimation`, `myAnimation.forward/reverse()`)
38. **AspectRatio** = preserve box ratio (_aspectRatio_ as `width/height` for readibility, _child_), incompatible w/ **Expanded** (**Align** between)
39. **LimitedBox** = give child default size constraints when its unbounded parent (**ListView**/**Column**/**Row**) didn't (_maxHeight/Width_)
40. **Placeholder** = temporary stand-in while building the UI (use _fallbackHeight/Width_ inside unbounded parent, _color_, _strokWidth_)
41. **RichText** = multiple styles per line (`text: TextSpan(style: …, children: <TextSpan>[…]`) for when standard **Text** is not enough
42. **ReordableListView** = drag & drop list items (_children_, `onReorder: (old, new) {setState(() {…}`, optional _header_); use with **ListTile**
43.
44.
45.
46.
47.
48.
49.
50.
51.
52.
53. **ListTile** = Material specification-following List Item (up to 3 lines _title_/_subtitle_/_isThreeLine_, _dense_, `tap`, `onLongPress`)
54. **Container** = wraps child widget w/ some color/decoration/shape/m/p/size (_aligment_ will fit parent, _constraints_, _transform_)

### Packages

[Official Dart & Flutter package repository](https://pub.dev/)

* **transparent_image** (see **FadeInImage**)

## Tutorials

* [Didier Boelens: Flutter internals](https://www.didierboelens.com/2019/09/flutter-internals/) ("there is no Widget Tree"? may be incorrect/wrong)
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
      * **BottomNavigationBar** with BottomNavigationBar items
      * **Drawer** on the left
    * Listview = scroll (Horiz/Verti) & garbage-collect children that are no longer on the screen
  * Builder = add widgets dynamically e.g. based on some DB data, or even infinite based (with a random generator)
    * Also used for navigating between "screens", i.e. widgets!
  * Navigation = works like a stack (à la browser history)
  * Animation, using the **Hero** widget which performs transition "morphing" between widgets
* [Flutter: How Flutter renders Widgets](https://www.youtube.com/watch?v=996ZgFRENMs) (Configure, Lifecycle & Paint!)
* [Flutter: Building your first Flutter Widget](https://www.youtube.com/watch?v=W1pNjxmNHNQ)
  * **RawMaterialButton** (_fillColor_, _splashColor_)
  * **Row**'s _mainAxisSize_ (`MainAxisSize.min`)
  * Use **SizeBox** for spacing
  * Use **GestureDetector** for detecting taps, long-presses, drags, etc.
  * Use **RotatedBox** to apply rotation on child Widgets
  * **AnimationController** (_duration_, _vsync_, `.repeat()`)
  * Ink splash = radiating mouseclick animation
* [Flutter: Building your first Flutter app](https://docs.flutter.dev/get-started/codelab)
* [Flutter: Write your first Flutter web app](https://docs.flutter.dev/get-started/codelab-web)
  * **Card** = Material design card with slightly rounded corners and shadow
  * **TextEditingController** = controller for an editable input text field (i.e. a **TextFormField**)
  * The _const_ keyword in front of the constructor is very important, making rendering more efficient by skipping most of the rebuild
  * **Navigator** & routes/pages via `push()` & `pop()`
  * Linear progress bar with color Animations

## TODO

* Animations
  * [Introduction to animations](https://docs.flutter.dev/development/ui/animations)
  * [Animations tutorial](https://docs.flutter.dev/development/ui/animations/tutorial)
  * [Implicit animations](https://docs.flutter.dev/codelabs/implicit-animations)
  * [Staggered animations](https://docs.flutter.dev/development/ui/animations/staggered-animations)
  * [animations library](https://api.flutter.dev/flutter/animation/animation-library.html)
  * [Perspective on Flutter](https://medium.com/flutter/perspective-on-flutter-6f832f4d912e) via **Transform** widget

* DB & Storage
  * [Persistence](https://docs.flutter.dev/cookbook/persistence)
    * [Persist data with SQLite](https://docs.flutter.dev/cookbook/persistence/sqlite)
    * [Read and write files](https://docs.flutter.dev/cookbook/persistence/reading-writing-files) = (_path\_provider_)
    * [Store key-value data on disk](https://docs.flutter.dev/cookbook/persistence/key-value) = (_shared\_preferences_)
  * [Saving data to Local Storage in Fluter](https://medium.com/kick-start-fluttering/saving-data-to-local-storage-in-flutter-e20d973d88fa)

* Bloc
  * [bloc](https://pub.dev/packages/flutter_bloc) = BLoC (Business Logic Component) design pattern
  * [BLoC Pattern](https://www.flutterclutter.dev/flutter/basics/what-is-the-bloc-pattern/2021/2084/)

* State Management
  * [Flutter state management for minimalists](https://suragch.medium.com/flutter-state-management-for-minimalists-4c71a2f2f0c1)
    * [get_it](https://pub.dev/packages/get_it) = simple Service Locator
  * [Flutter Redux](https://blog.logrocket.com/flutter-redux-complete-tutorial-with-examples/) = DI for data using InheritedWidgets
  * Provider
    * [provider](https://pub.dev/packages/provider)
    * [Enrico Ori: A simple guide for Provider](https://medium.com/theotherdev-s/starting-with-flutter-a-simple-guide-for-provider-401b25957989)

* Archi
  * [Conner Aldrich: Code Organization](https://medium.com/flutter-community/flutter-code-organization-revised-b09ad5cef7f6)
  * [Aglowid: Flutter Best Practices to Follow in 2022](https://aglowiditsolutions.com/blog/flutter-best-practices/)

* [Platform Channels](https://docs.flutter.dev/development/platform-integration/platform-channels)
  * A way to write platform-specific code and call platform-specific APIs

* [Aashish Vichare: Flutter Widgets lifecycle](https://medium.com/nerd-for-tech/flutter-widgets-lifecycle-widget-tree-and-element-tree-ac41ab1918da)
* [JediPixels: Widget Tree & Element Tree](https://www.youtube.com/watch?v=4W8eN_6mO2E)

* [Awesome Flutter](https://github.com/Solido/awesome-flutter) = index of Flutter resources
  * [Ins and Outs of Flutter Web by Nash](https://github.com/Solido/awesome-flutter)
  * [https://medium.com/@diegoveloper](https://medium.com/@diegoveloper)
    * [Communication between Widgets](https://medium.com/flutter-community/flutter-communication-between-widgets-f5590230df1e)
  * [Awesome Flutter tips & tricks](https://github.com/erluxman/awesomefluttertips/)
  * [Todo List built with Flutter](https://github.com/lesnitsky/todolist_flutter)

* [Romain Rastel: What are Dart mixins?](https://medium.com/flutter-community/dart-what-are-mixins-3a72344011f3)
* [Splash screen](https://blog.logrocket.com/make-splash-screen-flutter/)
* [MediaQuery in Flutter](https://medium.com/flutter-community/mediaquery-in-flutter-4317d3fe3612)
* [PWA with Flutter](https://www.fullstacklabs.co/blog/pwa-with-flutter)

## Code samples

Simplest possible running apps (assuming `import 'package:flutter/material.dart';`):

```dart
void main() => runApp(const MaterialApp());
void main() => runApp(const MaterialApp(home: Text('Koko')));
void main() => runApp(const Text('Koko', textDirection: TextDirection.ltr));  // Text direction is required here (or in an ancestor).
// Does not work with SafeArea or Scaffold, because those require MediaQuery access, which is usually initialized by an enclosing MaterialApp.
// That is checked beforehand via debugCheckHasMediaQuery(), which raises an error since the MediaQuery wasn't initialized in an ancestor.
```
