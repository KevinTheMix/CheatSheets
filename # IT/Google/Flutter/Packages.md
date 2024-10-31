# [Flutter Packages & Plugins](https://pub.dev)

Plugins make it easy to access platform services and hardware (eg accelerometer, camera, etc.) OS-independently.

## Quick Tips

* Lots of packages require the full Flutter SDK, but a few require only Dart SDK
* Hot Reload/Restart are not enough to reload plugins with platform native device features => `flutter run` (or _F5_ equivalent) after adding
* Blue tags under package name/version indicate which SDK (Dart or Flutter) & platform (Android, IOS, MACOS, WEB, WINDOWS) it targets/is compatible with
* [Using packages](https://docs.flutter.dev/development/packages-and-plugins/using-packages)

## Glossary

* _@dash-overflow.net_ = Rémi Rousselet
* [Flutter Favorite program](https://docs.flutter.dev/packages-and-plugins/favorites) = high-quality first priority packages
* **Package** = at a minimum, a Dart package is a directory containing a _pubspec.yaml_ file
* **Plugin** (aka _plugin package_) = a special kind of package that makes platform functionality available to the app
  * Plugin packages can be written for Android (using Kotlin or Java), iOS (using Swift or Objective-C), web, macOS, Windows, Linux, or any combination thereof
  * For example, a plugin might provide Flutter apps with the ability to use a device’s camera
* **Pub** = name of a package manager, which takes care of fetching packages and package versioning information
  * Its CLI can be summoned either via `dart pub {pub_command}` or `flutter pub {pub_command}`

## Libraries

* From Dart's point of view, Flutter is actually a package like any other (ie it's referenced in _pubspec.yaml_, then imported via eg `import 'package:flutter/….dart';`)
* [Flutter API libraries](https://api.flutter.dev/index.html) = libraries that are exported by Flutter SDK
  * **collection** (array manipulation eg **IterableExtension** à la C# Linq)
  * **dart:core**
  * **dart:math**
  * **foundation**
  * **intl** = date formatting
  * **material**
  * **services** = platform features eg clipboard
  * **widgets** = no implementations, only (re-)exports all widget-related libraries

## Plugins

* [@flutter plugins](https://github.com/flutter/plugins#plugins)

* **animated_text_kit** (@ayushagarwal.ml) = text animations
* **animations** (@flutter.dev) = turnkey animations/transitions pack (Container transform, shared axis (horizontal/vertical/scaled), fade through, fade)
* **async** (@dart.dev) = additions to built-in [dart:async](https://api.dart.dev/stable/3.5.0/dart-async/dart-async-library.html) (`StreamGroup.merge()`, `AsyncCache<T>()` time-based cacheing, **StreamQueue**)
* **camera** (@flutter.dev)
* **crypto** (@dart.dev)
* **device_info_plus** (@fluttercommunity.dev) = device/OS-specific information; `DeviceInfoPlugin()` then `.androidInfo` or `.iosInfo` ~ built-in `Platform.isAndroid|IOS`
* **espresso** (@flutter.dev) = bindings for Espresso tests (for Flutter Android apps)
* **file_selector** (@flutter.dev)
* **flutter_gen** (@wasabeek.jp) = access assets programmatically instead of path strings (inspired by [SwiftGen](https://github.com/SwiftGen/SwiftGen))
* **flutter_hooks** (@dash-overflow.net) = reuse lifecycle-tied logic (eg **AnimationController** boilerplate via `useAnimationController`)
  * [Existing hooks](https://github.com/rrousselGit/flutter_hooks#existing-hooks)
* **flutter_rating_bar** (@sarbagyastha.com.np) = "5-stars" (or other icons) fractional rating bar
* **flutter_slidable** (@romainrastel.com) ~= **Dismissible** but can stay in place (`actionPane`, `actions: [IconSlideAction]`, `actionExtentRatio: 1/actions.length`)
* **freezed** @dash-overflow.net) = codegen for model classes (with JSON mapping)
* **go_router** (@flutter.dev) = routing across multiple platform (maintained by official Flutter team)
* **google_fonts** (@material.io) = use [Google Fonts](https://fonts.google.com)
* **google_maps_flutter** (@flutter.dev)
* **google_sign_in** (@flutter.dev)
* **grpc** (@dart.dev)
* **html** (@tools.dart.dev) = HTML 5 parser
* **http** (@dart.dev)
* **image_picker** (@flutter.dev)
* **in_app_purchase** (@flutter.dev) = storefront-independent API for purchases
* **intl** (@dart.dev) = Dates & Numbers (& Bidi) formatting methods
* **ios_platform_images** (@flutter.dev)
* **jaspr** = web framework for building websites in Dart (with both client-side & server-side rendering)
* **local_auth** (@flutter.dev)
* **location** (@bernos.dev) = device geographical location; `serviceEnabled()`, `requestService()`, `hasPermission`, `requestPermission()`, `getLocation()`
* **logging** (@dart.dev)
* **mason** (@brickhub.dev) = generates boilerplate code based on bricks (ie interactive customizable & community-shared manifest files), augments `flutter create …`
* **path** (@dart.dev) = helper to combine/construct paths
* **path_provider** = find commonly used locations on the filesystem for different devices
* **plugin_platform_interface** (@flutter.dev)
* **quick_actions** (@flutter.dev)
* **rxdart** (@fluttercommunity.dev) = extends Dart **Streams** & **StreamControllers** with reactive programming
* **sensors_plus** (@fluttercommunity.dev)
* **undo** (@rodydavis.com) = undo/redo
* **url_launcher** (@flutter.dev) = open external URL/e-mail/phone number/SMS/any app with special URL handlers (e.g. YouTube). Check `canLaunch()` first
* **uuid** (@yuli.dev) = generate UUIDs
* **video_player** (@flutter.dev)
* **webview_flutter** (@flutter.dev)

* Text
  * **stemmer** (-) = reduces word to their base form
  * **pdf_text** (@aluc.dev) =  PDF
* DI & [State Management](https://docs.flutter.dev/data-and-backend/state-mgmt/options)
  * **bloc** (@bloclibrary.dev) = core Dart (& Flutter) APIs ([Bloc](https://bloclibrary.dev))
  * **flutter_bloc** (bloclibrary.dev) = Flutter widgets
  * **flutter_riverpod** (@dash-overflow.net) = (Dart & Flutter) compile-safe state management using global variable
  * **get** (@getx.site) = DI, Navigation, State Management all-in-one framework (à la WPF Prism, [GetX website](https://chornthorn.github.io/getx-docs))
  * **get_it** (aka **GetIt**) (@fluttercommunity.dev) = simple DI container / service locator
  * **provider** (@dash-overflow.net) = state management using InheritedWidget
    * **ChangeNotifierProvider** = register instance via [create or value](https://stackoverflow.com/a/61861315/3559724) (ie use _value_ if already create eg inside `Grid|ListView.builder`), and _child_ subtree
    * Instance class must call `notifyListeners()` internally (instead of caller calling `setState()`)
  * **riverpod** (@dash-overflow.net) = pure Dart (& Flutter) reactive caching & data-binding framework, doesn't require **BuildContext**, statically typed compile-time safety, testing flexibility
  * **state_notifier** (@dash-overflow.net) = when using Provider or Riverpod, replaces vanilla mutable **ChangeNotifier** with immutable, debuggable, undo-redo **StateNotifier**
* DB, Storage, [Caching](https://docs.flutter.dev/get-started/fundamentals/local-caching)
  * [Drift](https://drift.simonbinder.eu) (previously _Moor_) = reactive persistence library for Dart & Flutter
  * **graphql_flutter** (@zino.company)
  * **get_storage** (@getx.site) = key-value in memory storage wit disk backup, alternative to **shared_preferences**
  * **hive** = lightweight key-value NoSQL DB (written in Dart)
  * [Isar](https://isar.dev) = cross-plaform DB for flutter, relies on IndexDB (replaces Hive with full Web support, see [Isar + freezed](https://github.com/isar/isar/issues/197))
  * [ObjectBox](https://objectbox.io) = high-performance Offline-First NoSQL DB with integrated Data Sync (no Web support)
    * [ObjectBox Sync](https://sync.objectbox.io)
  * **shared_preferences** (@flutter.dev) = simple key-value storage (works on all platforms!)
  * **sqflite** (@tekartik.com) = save structured data locally in SQLite DB (usual CRUD, or raw SQL). Enable foreign keys explicitely if they are needed

### Animations, Graphism, Sounds & Themes

* **font_awesome_flutter** (@fluttercommunity.dev) = free [Font Awesome](https://fontawesome.com/icons) Icon pack as Flutter Icons
* **transparent_image** (-) = (see **FadeInImage**)
* **motion** (@cendre.me) = gyroscope-based "wobbling" effect
* **flex_color_scheme** (@rydmike.com)
* **flutter_switch_clipper** (@fluttercandies.com) = fill/transition effects package

* Clips
  * **animated_clipper** (@oodavid.com) = clip transitions for interactive buttons & co
  * **clippy_flutter** (_deprecated_) = collection of clip shapes (arrows, rhombus)
  * **flutter_custom_clippers** (@dlohani.com.np) = collection of clip shapes (wave, panels)
* Animation
  * **flutter_animate** (@gskinner.com)
  * **shimmer** (@hunghd.dev) = pulsating UI loading effect
* Images
  * **flutter_launcher_icons** (@fluttercommunity.dev) = generate all platforms/sizes icons
  * **flutter_spinkit** (@ogbomo.com) = funky loading icons package
  * **lottie** (@xaha.dev) = GIF-like After Effects (exported via bodymovin extension) JSON vector animations
  * **rive** (@rive.app)
* Sounds
  * **flutter_sound** (@tau.canardoux.xyz)
  * **flutter_beep** (@gonoter.com) = play basic system sounds
  * **audioplayers** (@blue-fire.xyz) = with [AudioCache](https://stackoverflow.com/a/52842613/3559724)
