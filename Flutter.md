# [Flutter](https://en.wikipedia.org/wiki/Flutter_(software))

An open-source UI framework created by Google, to develop cross-platform applications from a single codebase.

It builds on top of the Dart platform, adding libraries of UI design features and widgets - notably Material components.

## Environment

### Install

* [Android Studio](https://developer.android.com/studio/)
  * Install under _Tools > SDK Manager > SDK Tools_:
    * [Android SDK Command-line Tools](https://developer.android.com/studio/intro/update#sdk-manager)
    * Google/Samsung USB Driver (must be then installed manually)
  * (Flutter extension if using as IDE)
* [Flutter](https://flutter.dev/docs/get-started/install/windows)
* (PowerShell 5.1 (via _Windows Management Framework 5.1_))
  * Actually gets installed along with Visual Studio
* Visual Studio
* Visual Studio Code
  * PowerShell extension
  * Flutter extension
* (Any browser, but Chrome is apparently required to actually _Debug_, via its devtools protocol)

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
* `flutter pub {add} {package}` = manages the _pubspec.yaml_ file which contains assets & dependencies, downloaded from <pub.dev>
* `flutter pub get` = pulls the package into the project & generates _pubspec.lock_

### Visual Sudio Code

* `Ctrl + ;` = `Ctrl + Shift + R` = Refactor
  * Convert Stateless to Stateful
* `Ctrl + Alt + D` = _Dart: Open DevTools_
* `Ctrl + Space` = Intellisense
* `Shift + Alt + F` = (Right-Click >) Format document

#### Snippets

* `st` = widget
* `stle` = Statless Widget
* `stfu` = Stateful widget

### Lingo

* Kotlin = Google preferred language for Android app developers since 2019 (replacing Java)
  * Compiles to JVM, or JavaScript for IOS support
* Dart = programming language developed by Google for client web & mobile apps development
* Gradle = build automation tool supporting Java, Kotlin, C/C++ & JavaScript
* **Widget** = immutable (declarative) description of part of a UI (layout component or behavior: center, pad, rotate)
  * Widgets (not Elements) hold properties with actual values. Their tree is built (in memory) based on the source code static config
  * All Widgets are _@immutable_, hence state in stateful widgets is managed via an external mutable state instead
  * [Stateless Widget](https://www.youtube.com/watch?v=wE7khGHVkYY) = immmutable widget w/ _final_ properties & _const_ constructor
    * All visual elements such as buttons, texts are stateless widgets
  * [Stateful Widget](https://www.youtube.com/watch?v=AqCMFXEmf3w) = associated with a companion class called State, holding changing data
  * [Inherited Widget](https://www.youtube.com/watch?v=Zbm3hjPjQMk) = DYI DI via _context_
    * Can define `of()` method in the parent to allow shortcut in children
    * _Theme_, _MediaQuery_ are examples of Inherited Widgets, accessible to all children in their hierarchy
      * E.g. `Theme.of(context).primaryColor`
    * Use this to pass DB or service instances down the widget hierarchy
* **Property** = actual value held in a widget e.g. the _text_ property of a **RichText** widget
* **Element** = instantiation of a Widget at a particular location in the _Element Tree_
  * Elements are very simple, holding just the type of the widget, a reference to child Elements, source Widget and potential State
  * While widgets are immutable, Elements are like their mutable counterpart and mounted by Flutter to form the Element Tree
  * This is basically what pilots the lifecycle of widgets, and updates the UI
  * The Element Tree is built by Flutter based on the configuration the developer declared as the Widget Tree
* **RenderObject** = object in the RenderTree that renders & paints the UI (handles size, layout, painting)
* [Keys](https://medium.com/flutter/keys-what-are-they-good-for-13cb51742e7d)
  * A way to keep track of States uniquement for Stateful Widgets, useful when adding/reordering widgets on the screen
  * **LocalKey** only work at a specific location (under its parent) in the Tree
    * **UniqueKey** is like a GUID
    * **ObjectKey** bases off multiple values (e.g. address) which aggregated are unique
    * **ValueKey** bases off a single value (e.g. TODO item task's text) which is unique amongst its siblings
      * **PageStorageKey** stores a user scroll location, so we can resume it when going back to the Widget
  * **GlobalKey** allow Widgets to change parents without losing State, or access information about another Widget, both anyhere in the Tree

### Ecosystem

* [Official Dart & Flutter package repository](https://pub.dev/)

## Architecture

* [Platform Channels](https://docs.flutter.dev/development/platform-integration/platform-channels)
  * A way to write platform-specific code and call platform-specific APIs
* [Flutter: How Flutter renders Widgets](https://www.youtube.com/watch?v=996ZgFRENMs) (Configure, Lifecycle & Paint!)
* [Fireship: React Native vs Flutter](https://youtu.be/X8ipUgXH6jw?t=162)
  * **React Native** = native UI components for each platform, linked to JS code through a bridge
  * **Flutter** = native pixel painting (via Skia, a Google 2D painting library) à la Unity
* [Aashish Vichare: Flutter Widgets lifecycle](https://medium.com/nerd-for-tech/flutter-widgets-lifecycle-widget-tree-and-element-tree-ac41ab1918da)
* [Didier Boelens: Flutter internals](https://www.didierboelens.com/2019/09/flutter-internals/) ("there is no Widget Tree"? may be incorrect/wrong)
* [JediPixels: Widget Tree & Element Tree](https://www.youtube.com/watch?v=4W8eN_6mO2E)

* [Awesome Flutter](https://github.com/Solido/awesome-flutter) = index of Flutter resources
* [Flutter Best Practices to Follow in 2022](https://aglowiditsolutions.com/blog/flutter-best-practices/)

### State Management

* [BLoC Pattern](https://www.flutterclutter.dev/flutter/basics/what-is-the-bloc-pattern/2021/2084/)
* [Flutter state management for minimalists](https://suragch.medium.com/flutter-state-management-for-minimalists-4c71a2f2f0c1)
  * [get_it](https://pub.dev/packages/get_it) = simple Service Locator
* [Flutter Redux](https://blog.logrocket.com/flutter-redux-complete-tutorial-with-examples/) = DI for data using InheritedWidgets

## API

* `StreamBuilder` = subscribe to streams (à la events?)

* `runApp(...)` = takes in a widget and inflate it to the screen size

* `void initState()` = one-time init
* `setState(() {})`
  * [Why it takes in an anonymous method](https://iiro.dev/set-state/) = it performs a handful of `assert()`s first, but mainly marks the Element dirty
* `void dispose()` = widget removed from UI

* ``

### Widgets

* [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html) = basic Material layout with a set of more elaborate widgets (e.g. an Add button that floats at the bottom right, or top/bottom menu bars) ready to use

1. **SafeArea** = checks MediaQuery to ensure we get a neat uncut rectangle on the screen. Synergizes with a **Scaffold**'s _body_
2.
3.
4.
5.
6.
7.
8.
9.
10.
11.
12.
13.
14.
15.
16.
17.
18.
19.
20. **FittedBox** = Wrap child in layouting box with _fit_ (`BoxFit.{value=contain|fitWidth|fill|none}`), _alignment_
21. **LayoutBuilder** = make adaptative layout based on target parent size constraints via _builder_
22.
23.
24.
25.
26.
27.
28.
29. **SizedBox** = exact dimensions (_width_ & _height_, `double.infinity` means max, `SizedBox.expand()` means double infinity), even empty for spacing
30.
31.
32.
33.
34. **MediaQuery** = Object used to retrieve info about screen size, orientation, text scaling
35.
36.
37.
38.
39.
40.
41.
42.
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
53. **ListTile** = Material specification-following List Item up to 3 lines (_title_, _subtitle_, _isThreeLine_), _dense_, `tap`, `onLongPress`

## Tutorials

* <https://dartpad.dev> aka <https://dartpad.dartlang.org>
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
      * **FloatingActionButton** with _onPressed()_ event
      * **BottomNavigationBar** with BottomNavigationBar items
      * **Drawer** on the left
    * Listview = scroll (Horiz/Verti) & garbage-collect children that are no longer on the screen
  * Builder = add widgets dynamically e.g. based on some DB data, or even infinite based (with a random generator)
    * Also used for navigating between "screens", i.e. widgets!
  * Navigation = works like a stack (à la browser history)
  * Animation, using the **Hero** widget which performs transition "morphing" between widgets
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
