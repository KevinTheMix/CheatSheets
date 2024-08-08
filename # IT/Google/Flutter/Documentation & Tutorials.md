# Flutter Documentation

* [Bring Material 3 to Flutter](https://github.com/flutter/flutter/issues/91605) = `ThemeData(useMaterial3: true)`

## Tutorials

* [@Robert Brunhage](https://www.youtube.com/c/RobertBrunhage)
  * [Flutter Folder Structure and Packages](https://www.youtube.com/watch?v=yJRpuTP156o) = structure (type, layer, feature) & packaging (from git!)
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
    * Flex (Column & Row)
      * Main axis = vertical for Columns, horizontal for Row
      * Cross axis = horizontal for Columns, verical for Row
      * _mainAxisAlignment_ & _crossAxisAlignment_ = centering, justify
      * **Flexible** & **Expanded** widgets to take less or more space
    * Stack (z-axis overlays)
    * **Positioned** & **Align** = à la HTML _absolute_ & _relative_
    * Scaffold
      * **BottomNavigationBar** with **BottomNavigationBarItem**s
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
* [Top 10 tips I learned at 2M+ users](https://medium.com/@zharfan104/top-10-flutter-developer-tips-i-learned-after-2-million-users-ab03eda10a55)

### [Flutter](https://docs.flutter.dev)

* [Flutter for Android developers](https://docs.flutter.dev/get-started/flutter-for/android-devs)
  * Flutter does not have activities; rather navigation via routes within same activity
* [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab) = TwinWords
* [Write your first Flutter web app](https://docs.flutter.dev/get-started/codelab-web) = (login) input fields with progress
  * **TextEditingController** = controller for an editable input text field (i.e. a **TextFormField**)
  * The _const_ keyword in front of the constructor is very important, making rendering more efficient by skipping most of the rebuild
  * **Navigator** & routes/pages via `push()` & `pop()`
  * Linear progress bar with color Animations
  * Debugging
* [Building your first Flutter Widget](https://www.youtube.com/watch?v=W1pNjxmNHNQ)
  * **RawMaterialButton** (_fillColor_, _splashColor_)
  * **Row**'s _mainAxisSize_ (`MainAxisSize.min`)
  * Use **SizedBox** for spacing
  * Use **GestureDetector** for detecting taps, long-presses, drags, etc.
  * Use **RotatedBox** to apply rotation on child Widgets
  * **AnimationController** (_duration_, _vsync_, `.repeat()`)

* [Layouts in Flutter](https://docs.flutter.dev/development/ui/layout)
  * [Understanding constraints](https://docs.flutter.dev/development/ui/layout/constraints)
    * **Constraints go down. Sizes go up. Parent sets position.**
  * Box constraints
    * _Tight_ constraints means _min == max_
    * _Unbounded_ constraints means max width or height is set to `double.infinity`

* [GDD China: How Flutter renders Widgets](https://www.youtube.com/watch?v=996ZgFRENMs) (Configure, Lifecycle & Paint!)

* [Decoding Flutter: Intrinsic Widgets](https://www.youtube.com/watch?v=Si5XJ_IocEs)
* [Decoding Flutter: Rendering?!](https://www.youtube.com/watch?v=54yoCqkew6g)
* [FlutterVikings 2022: Lifecycle of a Widget](https://www.youtube.com/watch?v=_gIbneld-bw)
  * Not _everything_ is a widget (eg BoxDecoration, TextStyle)
  * BuildContext is an element!
  * Stateless-, Stateful- & **RenderObject-** (eg: Padding, RichText) Widget
  * StatefulElement's states (initial, active, inactive, defunct); check `mounted` in State class if element aka buildContext still in tree

* [Tao Dong: How I do Developer UX at Google](https://medium.com/google-design/how-i-do-developer-ux-at-google-b21646c2c4df)

* [@kevmoo: Learn how Flutter enhances web apps](https://www.youtube.com/watch?v=kCnYRhkfWHY) = HTML vs Canvas/WebGL, then WebAssembly

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
  
* Routing
  * [Navigation](https://docs.flutter.dev/cookbook/navigation)
  * [Navigator class](https://api.flutter.dev/flutter/widgets/Navigator-class.html)
  * [MaterialApp.router](https://api.flutter.dev/flutter/material/MaterialApp/MaterialApp.router.html)
  * [Navigator 2.0](https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade)
  * [Timbergus](https://stackoverflow.com/a/58089444/3559724)
    * Don't forget to manage the navigator stack soundly so it's not messy (make sure & test this)
      * Eg after login, remove login.php from stack?
    * [Eric Seidel - runApp twice](https://stackoverflow.com/a/44379895/3559724)
    * [Collin Jackson - Preventing initial load stuttering](https://stackoverflow.com/a/44379991/3559724)
  * [Rémi Rousselet - Authenticated routes](https://stackoverflow.com/a/47810160/3559724)
  * [Splash screen](https://blog.logrocket.com/make-splash-screen-flutter)

* [Material Design 3](https://m3.material.io)
  * [Material Typography](https://m3.material.io/styles/typography/fonts)

* Themeing
  * [AppBar customization](https://www.geeksforgeeks.org/flutter-appbar-widget)
  * [Reddit: ThemeData is a mess](https://www.reddit.com/r/FlutterDev/comments/xjlman/themedata_is_a_mess)
  * Dark theme(ing)
  * Colors
    * Find synergetic [Color palettes](https://coolors.co/palettes/trending)
    * [Material.io - Picking colors](https://material.io/design/color/the-color-system.html#tools-for-picking-colors) (cyan, teal)
  * Fonts
    * [Google Fonts](https://fonts.google.com)
  * Icons, Images
    * **AnimatedIcon** = like Icons.abc, but animated (`icon: AnimatedIcon.play_pause, progress: myAnimation`, `myAnimation.forward/reverse()`)
    * [Pack images for each device size](https://docs.flutter.dev/development/ui/assets-and-images)
    * [Android Icon Design Specifications](https://developer.android.com/distribute/google-play/resources/icon-design-specifications)
    * [Flutter Material Icons](https://api.flutter.dev/flutter/material/Icons/bookmark_remove-constant.html)
    * [Wizard](https://www.flaticon.com/free-icons/wizard)
    * [Magic](https://www.flaticon.com/free-icons/magic)
    * [Sparkles](https://www.flaticon.com/free-icons/sparkles)
  * Sounds
    * `SystemSound.play(SystemSoundType.click);`

* DB, Files, Firebase
  * [Saving data to Local Storage in Fluter](https://medium.com/kick-start-fluttering/saving-data-to-local-storage-in-flutter-e20d973d88fa)
  * [Fireship: Flutter Provider - Advanced Firebase Data Management](https://www.youtube.com/watch?v=vFxk_KJCqgk) (_dispose StreamSubscription_)
  * [Robert Brunhage: Flutter Firebase Authentication - The Clean Way](https://www.youtube.com/watch?v=oJ5Vrya3wCQ)
  * [Add Firebase to your Flutter app](https://firebase.google.com/docs/flutter/setup)
  * [Offline first](https://medium.com/flutter-community/offline-first-with-flutter-be1e8335d976)
  
* State Management
  * [Ephemeral vs App states](https://docs.flutter.dev/development/data-and-backend/state-mgmt/ephemeral-vs-app)
  * [Flutter: Pragmatic State Management Using Provider (The Boring Flutter Development Show)](https://www.youtube.com/watch?v=HrBiNHEqSYU)
  * [Fireship: State Management Grand Tour](https://www.youtube.com/watch?v=3tm-R7ymwhc) = **StatefulBuilder**, _RxDart_, _get\_it_, _bloc_
  * [Flutter state management for minimalists](https://suragch.medium.com/flutter-state-management-for-minimalists-4c71a2f2f0c1)
  * [Flutter Redux](https://blog.logrocket.com/flutter-redux-complete-tutorial-with-examples) = DI for data using InheritedWidgets
  * Bloc (Business Logic Component)
    * [What is the BLoC pattern?](https://www.flutterclutter.dev/flutter/basics/what-is-the-bloc-pattern/2021/2084)
    * [Streams, Bloc and Reactive Programming](https://www.didierboelens.com/2018/08/reactive-programming-streams-bloc)
    * [Bloc Login tutorial](https://bloclibrary.dev/#/flutterlogintutorial)
  * Provider
    * [Enrico Ori: A simple guide for Provider](https://medium.com/theotherdev-s/starting-with-flutter-a-simple-guide-for-provider-401b25957989)

* Archi
  * [Flutter Architecture Samples](https://fluttersamples.com)
  * [Aglowid: Flutter Best Practices to Follow in 2022](https://aglowiditsolutions.com/blog/flutter-best-practices)
  * [Conner Aldrich: Code Organization](https://medium.com/flutter-community/flutter-code-organization-revised-b09ad5cef7f6)
  * [Aashish Vichare: Flutter Widgets lifecycle](https://medium.com/nerd-for-tech/flutter-widgets-lifecycle-widget-tree-and-element-tree-ac41ab1918da)
  * [JediPixels: Widget Tree & Element Tree](https://www.youtube.com/watch?v=4W8eN_6mO2E)
  * [Didier Boelens: Flutter internals](https://www.didierboelens.com/2019/09/flutter-internals) ("there is no Widget Tree"? may be incorrect/wrong)
  * [Platform Channels](https://docs.flutter.dev/development/platform-integration/platform-channels) = platform-specific code/APIs

* [Awesome Flutter](https://github.com/Solido/awesome-flutter) = github index of Flutter resources
  * [Ins and Outs of Flutter Web by Nash](https://github.com/Solido/awesome-flutter)
  * [https://medium.com/@diegoveloper](https://medium.com/@diegoveloper)
    * [Communication between Widgets](https://medium.com/flutter-community/flutter-communication-between-widgets-f5590230df1e)
  * [Awesome Flutter tips & tricks](https://github.com/erluxman/awesomefluttertips)
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

* [Flutter Search Bar](https://www.geeksforgeeks.org/flutter-search-bar)

* [Optimizing](https://www.youtube.com/watch?v=vVg9It7cOfY)

* [Web: URL strategy & removing '#'](https://stackoverflow.com/a/67148421)

* [Serializing JSON via code generation](https://docs.flutter.dev/development/data-and-backend/json#serializing-json-using-code-generation-libraries)

* Google Play (store)
  * [Update or unpublish your app](https://support.google.com/googleplay/android-developer/answer/9859350?hl=en)
  * [Content ratings](https://support.google.com/googleplay/android-developer/answer/9859655)

* TODO:
  * [Animations tutorial](https://docs.flutter.dev/development/ui/animations/tutorial)
  * [Implicit animations](https://docs.flutter.dev/codelabs/implicit-animations)
  * [Staggered animations](https://docs.flutter.dev/development/ui/animations/staggered-animations)
  * [Perspective on Flutter](https://medium.com/flutter/perspective-on-flutter-6f832f4d912e) via **Transform** widget
  * [Hero Animations](https://docs.flutter.dev/development/ui/animations/hero-animations)

* Tests: Unit, [Widget, integration](https://flutterfromdotnet.hashnode.dev/integration-tests), automated testing
  * [Types of Software Testing](https://www.javatpoint.com/types-of-software-testing)

* [Error Handling](https://docs.flutter.dev/testing/errors) & `PlatformDispatcher.onError`

* [@emily.fortuna: Slivers, Demystified](https://medium.com/flutter/slivers-demystified-6ff68ab0296f)

* [In-app Purchases](https://duckduckgo.com/?t=ffsb&q=flutter+in-app+purchases&ia=web)
