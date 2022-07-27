# [Flutter](https://en.wikipedia.org/wiki/Flutter_(software))

An open-source UI framework created by Google, to develop cross-platform applications from a single codebase.

It builds on top of the Dart platform, adding libraries of UI design features and widgets - notably Material components.

## Environment

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
  * [Stateful Widget](https://www.youtube.com/watch?v=AqCMFXEmf3w) = mark as dirty & redraw next frame
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

* Ink splash = radiating mouseclick animation
* LayoutBuilder
* [MediaQuery](https://api.flutter.dev/flutter/widgets/MediaQuery-class.html)
  * Object used to retrieve info about screen size, orientation, text scaling
* [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html) = basic Material layout with a set of more elaborate widgets (e.g. an Add button that floats at the bottom right, or top/bottom menu bars) ready to use

### Architecture

* [Flutter: How Flutter renders Widgets](https://www.youtube.com/watch?v=996ZgFRENMs) (Configure, Lifecycle & Paint)
* [Fireship: React Native vs Flutter](https://youtu.be/X8ipUgXH6jw?t=162)
  * React Native = native UI components for each platform, linked to JS code through a bridge
  * Flutter = native pixel painting (via Skia, a Google 2D painting library) à la Unity
* [Aashish Vichare: Flutter Widgets lifecycle](https://medium.com/nerd-for-tech/flutter-widgets-lifecycle-widget-tree-and-element-tree-ac41ab1918da)
* [Didier Boelens: Flutter internals](https://www.didierboelens.com/2019/09/flutter-internals/) (no W. Tree? possibly incorrect)
* [JediPixels: Widget Tree & Element Tree](https://www.youtube.com/watch?v=4W8eN_6mO2E)

### Install

* [Android Studio](https://developer.android.com/studio/)
  * Install under _Tools > SDK Manager > SDK Tools_:
    * [Android SDK Command-line Tools](https://developer.android.com/studio/intro/update#sdk-manager)
    * Google/Samsung USB Driver (must be then installed manually)
  * (Flutter extension if using as IDE)
* (Chrome)
* [Flutter](https://flutter.dev/docs/get-started/install/windows)
* (PowerShell 5.1 (via _Windows Management Framework 5.1_))
  * Actually gets installed along with Visual Studio
* Visual Studio
* Visual Studio Code
  * PowerShell extension
  * Flutter extension

### CLI

* `flutter doctor` (Tip: use PowerShell to get Unicode support)
* `flutter doctor --android-licenses`
* `flutter create kokoapp`
* `flutter run` = F5
* `flutter run -d web-server` (<https://stackoverflow.com/a/71518488>)
* `flutter --version`

## Visual Sudio Code

* `Ctrl + ;` = `Ctrl + Shift + R` = Refactor
  * Convert Stateless to Stateful
* `Ctrl + Alt + D` = _Dart: Open DevTools_
* `Ctrl + Space` = Intellisense
* `Shift + Alt + F` = Format Document

### Snippets

* `st` = widgets

## API

* `final` = assigned once, in the instance constructor
* `const` = fixed value, can be static (i.e. accessed without instance)

* `StreamBuilder` = subscribe to streams (à la events?)

* `runApp(...)` = takes in a widget and inflate it to the screen size

* `void initState()` = one-time init
* `void dispose()` = widget removed from UI

* ``
* ``

## Resources

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
      * **BottomNavigationBar** with BNB items
      * **Drawer** on the left
    * Listview = scroll (Horiz/Verti) & garbage-collect children that are no longer on the screen
  * Builder = add widgets dynamically e.g. based on some DB data, or even infinite based (with a random generator)
    * Also used for navigating between "screens", i.e. widgets!
  * Navigation = works like a stack (à la browser history)
  * Animation, using the **Hero** widget which performs transition "morphing" between widgets

* [Platform Channels](https://docs.flutter.dev/development/platform-integration/platform-channels)
  * A way to write platform-specific code and call platform-specific APIs
