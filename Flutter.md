# [Flutter](https://en.wikipedia.org/wiki/Flutter_(software))

An open-source UI framework created by Google, to develop cross-platform applications from a single codebase.

It builds on top of the Dart platform, adding libraries of UI design features and widgets - notably Material components.

## Lingo

* Dart = programming language developed by Google for client web & mobile apps development
* Kotlin = Google preferred language for Android app developers since 2019 (replacing Java)
  * Compiles to JVM, or JavaScript for IOS support
* Gradle = build automation tool supporting Java, Kotlin, C/C++ & JavaScript
* Widget = reusable blueprint _class_ to build a UI component or layout behavior (center, pad, rotate)
  * All visual elements such as buttons, texts are stateless widgets (in .NET: base _Control_ class)
  * All Widgets are _@immutable_, hence stateful widgets hold a reference to a mutable state
  * [Stateless Widget](https://www.youtube.com/watch?v=wE7khGHVkYY) = immmutable widget w/ _final_ properties & _const_ constructor.
    * in .NET WPF: none of the properties have RaisePropertyChanged
  * [Stateful Widget](https://www.youtube.com/watch?v=AqCMFXEmf3w) = mark as dirty & redraw next frame
  * [Inherited Widget](https://www.youtube.com/watch?v=Zbm3hjPjQMk) = DYI DI via _context_
    * Can define `of()` method in the parent to allow shortcut in children
    * _Theme_, _MediaQuery_ are examples of Inherited Widgets, accessible to all children in their hierarchy
      * E.g. `Theme.of(context).primaryColor`
    * Use it to pass DB or service instances down the widget hierarchy
* Element = instantiation of a Widget at a particular location in the tree
  * While widgets are immutable, Elements are like their mutable counterpart
  * Element Tree = à la WPF Live Tree
* [Key](https://medium.com/flutter/keys-what-are-they-good-for-13cb51742e7d) = (stateful) Widget ID, necessary e.g. when reordering widgets on the screen

* Ink splash = radiating mouseclick animation
* LayoutBuilder
* [MediaQuery](https://api.flutter.dev/flutter/widgets/MediaQuery-class.html)
  * Object used to retrieve info about screen size, orientation, text scaling
* [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html) = basic Material layout with a set of more elaborate widgets (e.g. an Add button that floats at the bottom right, or top/bottom menu bars) ready to use

## Environment

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
