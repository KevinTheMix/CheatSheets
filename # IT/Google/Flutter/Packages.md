# [Flutter Packages & Plugins](https://pub.dev)

* [dart.dev](https://pub.dev/publishers/dart.dev/packages) = official core/foundational packages published by Dart team
  * [crypto](https://pub.dev/packages/crypto)
  * [grpc](https://pub.dev/packages/grpc)
  * [http](https://pub.dev/packages/http)
  * [logging](https://pub.dev/packages/logging)
  * [path](https://pub.dev/packages/path) = helper to combine/construct paths
* [Flutter team plugins](https://github.com/flutter/plugins#plugins)
  * camera
  * espresso
  * file_selector
  * google_maps_flutter
  * google_sign_in
  * image_picker
  * [in_app_purchase](https://pub.dev/packages/in_app_purchase)
  * ios_platform_images
  * local_auth
  * path_provider
  * plugin_platform_interface
  * quick_actions
  * shared_preferences
  * url_launcher
  * video_player
  * webview_flutter
* [@fluttercommunity.dev](https://pub.dev/publishers/fluttercommunity.dev/packages)

* [flutter_hooks](https://pub.dev/packages/flutter_hooks) = reuse lifecycle-embedded logic (eg _AnimationController_)
* [go_router](https://pub.dev/packages/go_router) = routing across multiple platform (maintained by official Flutter team)
* [uuid](https://pub.dev/packages/uuid) = generate UUIDs
* [freezed](https://pub.dev/packages/freezed) = codegen for model classes (with JSON mapping), written by @Remi Rousselet
* [RxDart](https://pub.dev/packages/rxdart) = reactive programming
* [FlutterGen](https://pub.dev/packages/flutter_gen) = access assets programmatically instead of path strings
* [undo](https://pub.dev/packages/undo)

## Quick Tips

* Lots of packages require the full Flutter SDK, but a few require only the Dart SDK
* Blue tags under package name/version indicate which SDK (Dart or Flutter) & platform (Android, IOS, MACOS, WEB, WINDOWS) it targets/is compatible with
* Hot Reload/Restart are not enough to reload plugins with platform native device features => `flutter run` (or _F5_ equivalent) after adding
* [Using packages](https://docs.flutter.dev/development/packages-and-plugins/using-packages)
* [Flutter Favorite program](https://docs.flutter.dev/development/packages-and-plugins/favorites)
  * [Flutter Favorite](https://pub.dev/packages?q=is%3Aflutter-favorite) packages

## Glossary

* **Package** = at a minimum, a Dart package is a directory containing a pubspec file
* **Plugin** (aka _plugin package_) = a special kind of package that makes platform functionality available to the app
  * Plugin packages can be written for Android (using Kotlin or Java), iOS (using Swift or Objective-C), web, macOS, Windows, Linux, or any combination thereof
  * For example, a plugin might provide Flutter apps with the ability to use a device’s camera
* **Pub** = name of a package manager, which takes care of fetching packages and package versioning information
  * Its CLI can be summoned either via `dart pub {pub_command}` or `flutter pub {pub_command}`

## [Framework Libraries](https://api.flutter.dev/index.html)

* [collection](https://api.flutter.dev/flutter/package-collection_collection/package-collection_collection-library.html) = array manipulation
  * [IterableExtension\<T>](https://api.flutter.dev/flutter/package-collection_collection/IterableExtension.html) = à la C# Linq
* [intl](https://api.flutter.dev/flutter/intl/intl-library.html) = date formatting
* [services](https://api.flutter.dev/flutter/services/services-library.html)

## Text

* [stemmer](https://pub.dev/packages/stemmer) = reduces word to their base form
* [pdf_text](https://pub.dev/packages/pdf_text)  PDF

### DI & State Management

* [GetX](https://pub.dev/packages/get) = DI, Navigation, State Management all-in-one framework (à la WPF Prism)
  * [GetX website](https://chornthorn.github.io/getx-docs/)
* [get_it](https://pub.dev/packages/get_it) (aka **GetIt**) = simple DI container / service locator
* [bloc](https://pub.dev/packages/bloc)
* [flutter_bloc](https://pub.dev/packages/flutter_bloc) (also <https://bloclibrary.dev/#/flutterbloccoreconcepts>)
* [provider](https://pub.dev/packages/provider) = state management using InheritedWidget, written by @Remi Rousselet
  * [create vs value](https://stackoverflow.com/a/61861315/3559724); use _value_ inside `Grid|ListView.builder`
* [riverpod](https://pub.dev/packages/flutter_riverpod) = compile-safe state management using global variable, written by @Remi Rousselet
  * [state_notifier](https://pub.dev/packages/state_notifier) = replaces vanilla mutable **ChangeNotifier** w/ immutable, debuggable, undo-redo

### DB & I/O

* [graphql_flutter](https://pub.dev/packages/graphql_flutter)
* [shared_preferences](https://pub.dev/packages/shared_preferences)
* [get_storage](https://pub.dev/packages/get_storage) = key-value in memory storage wit disk backup, alternative to **shared_preferences**

* [Isar Database](https://isar.dev) = replacement for Hive with full Web support (relies on IndexDB)
  * [_Isar does not support freezed_](https://github.com/isar/isar/issues/197#issuecomment-1207419153) unless extra mapping
  * [Hive](https://pub.dev/packages/hive) = key-value NoSQL DB (written in Dart)
* [ObjectBox](https://objectbox.io) = high-performance Offline-First NoSQL DB with integrated Data Sync; no Web support
  * [ObjectBox Sync](https://sync.objectbox.io)
* [Drift](https://drift.simonbinder.eu) (previously _Moor_)= offline-first persistence

### Animations, Graphism, Sounds & Themes

* **transparent_image** (see **FadeInImage**)
* [motion](https://pub.dev/packages/motion) = gyroscope-based "wobbling" effect
* [FlexColorScheme](https://pub.dev/packages/flex_color_scheme)
* [Switch Clipper](https://pub.dev/packages/flutter_switch_clipper) fill/transition effects package
* [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter)

* Clips
  * [animated_clipper](https://pub.dev/packages/animated_clipper) = clip transitions for interactive buttons & co
  * [clippy_flutter](https://pub.dev/packages/clippy_flutter) = collection of clip shapes (arrows, rhombus)
  * [flutter_custom_clippers](https://pub.dev/packages/flutter_custom_clippers) = collection of clip shapes (wave, panels)
* Animation
  * [flutter_animate](https://pub.dev/packages/flutter_animate)
  * [animations](https://pub.dev/packages/animations) package = turnkey transitions pack, maintained by Material team
    * Container transform, shared axis (horizontal/vertical/scaled), fade through, fade
  * [shimmer](https://pub.dev/packages/shimmer) = pulsating UI loading effect
* Images
  * [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) = generate all platforms/sizes icons
  * [spinkit](https://pub.dev/packages/flutter_spinkit) loading icons package
  * [Rive](https://pub.dev/packages/rive)
  * [LottieFiles](https://pub.dev/packages/lottie) = GIF-like After Effects (exported via bodymovin extension) JSON vector animations
* Sounds
  * [flutter_sound](https://pub.dev/packages/flutter_sound)
  * [flutter_beep](https://pub.dev/packages/flutter_beep) = play basic system sounds
  * [Packages search: audio player](https://pub.dev/packages?q=audio+player)
    * [audioplayers](https://pub.dev/packages/audioplayers) with [AudioCache](https://stackoverflow.com/a/52842613/3559724)

### [Flutter: Package of the Week](https://www.youtube.com/watch?v=r0tHiCjW2w0&list=PLjxrf2q8roU1quF6ny8oFHJ2gBdrYN_AK&index=21)

* [cached_network_image](https://docs.flutter.dev/cookbook/images/cached-images)
* [intl](https://pub.dev/packages/intl) = Dates & Numbers (& Bidi) formatting methods
* [in_app_purchase](https://pub.dev/packages/in_app_purchase)

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
