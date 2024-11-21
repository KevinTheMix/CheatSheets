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
* **Package** = "pure Dart code" package, at a minimum it is a directory containing a _pubspec.yaml_ file
* **Plugin** (aka _plugin package_) = a special kind of package part-native (Kotlin/JS/Swift) code wrapped as Dart making platform features available to an app
  * Plugins can be written for Android (using Kotlin or Java), iOS (using Swift or Objective-C), web, macOS, Windows, Linux, or any combination thereof
  * For example, a plugin might provide Flutter apps with the ability to use a device’s camera
* **Pub** = name of a package manager, which takes care of fetching packages and package versioning information
  * Its CLI can be summoned either via `dart pub {pub_command}` or `flutter pub {pub_command}`
* `as` = specifying an (arbitrary) local scope name of whole [library](https://dart.dev/language/libraries)
* `export` = exports part of a file
* `import` = import library/package
* `show` (& `hide` eg for overlapping names in multiple libs) = picking/accessing a specific (existing) object within that library

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

* **async** (_@dart.dev_) = additions to built-in [dart:async](https://api.dart.dev/stable/3.5.0/dart-async/dart-async-library.html) (`StreamGroup.merge()`, `AsyncCache<T>()` time-based cacheing, **StreamQueue**)
* **build_runner** (_@tools.dart.dev_) = generate files on disk using Dart code
* **camera** (_@flutter.dev_)
* **collection** (_@darT.dev_) = collection utilities (eg _max_)
* **crypto** (_@dart.dev_) = cryptographic hashing functions for Dart
* **device_info_plus** (_@fluttercommunity.dev_) = device/OS-specific information; `DeviceInfoPlugin()` then `.androidInfo` or `.iosInfo` ~ built-in `Platform.isAndroid|IOS`
* **equatable** (_@fluttercommunity.dev_) = simplifies (value) equality comparison boilerplate
* **espresso** (_@flutter.dev_) = bindings for Espresso tests (for Flutter Android apps)
* **extra_alignments** (_@gskinner.com_) = like **Center** but all other directions (eg **TopLeft** or **CenterRight**)
* **file_selector** (_@flutter.dev_) = file dialogs interaction
* **fl_chart** (_@flchart.dev_) = line/bar/pie/scatter/radar charts
* **flutter_adaptive_scaffold** (_@flutter.dev_) = Material adaptive
* **flutter_gen** (_@wasabeek.jp_) = access assets programmatically instead of path strings (inspired by [SwiftGen](https://github.com/SwiftGen/SwiftGen))
* **flutter_hooks** (_@dash-overflow.net_) = reuse lifecycle-tied logic (eg **AnimationController** boilerplate via `useAnimationController`)
  * [Existing hooks](https://github.com/rrousselGit/flutter_hooks#existing-hooks)
* **flutter_lints** (_@flutter.dev_) = recommended set of lints for Flutter apps, packages, and plugins
* **flutter_rating_bar** (_@sarbagyastha.com.np_) = "5-stars" (or other icons) fractional rating bar
* **flutter_slidable** (_@romainrastel.com_) ~= **Dismissible** but can stay in place (`actionPane`, `actions: [IconSlideAction]`, `actionExtentRatio: 1/actions.length`)
* **focusable_control_builder** = reacts to all sorts of inputs (focus, tab key, mouse events, keyboard shortcut)
* **freezed** _@dash-overflow.net_) = codegen for model classes (with JSON mapping) and union types (ie classes with multiple factory constructors then eg `state.when(initial: …, loading: …, success: …, failure: …`)
* **gap** (_unverified_) = space inside **Flex** widgets (eg **Column**/**Row** or scroll lists, see **MaxGap** & **SliverGap**)
* **geolocator** (_@baseflow.com_) = access native platforms specific geolocation services (last location, etc)
* **go_router** (_@flutter.dev_) = routing with deep links handling across multiple platforms (maintained by official Flutter team)
* **google_maps_flutter** (_@flutter.dev_)
* **google_sign_in** (_@flutter.dev_)
* **grpc** (_@dart.dev_)
* **html** (_@tools.dart.dev_) = HTML 5 parser
* **http** (_@dart.dev_)
* **image_picker** (_@flutter.dev_) = pick image from library or take a new one with camera
* **in_app_purchase** (_@flutter.dev_) = storefront-independent API for purchases
* **intl** (_@dart.dev_) = Dates & Numbers (& Bidi) formatting methods
* **ios_platform_images** (_@flutter.dev_) = share images between Flutter and iOS
* **jaspr** = web framework for building websites in Dart (with both client-side & server-side rendering)
* **local_auth** (_@flutter.dev_) = local on-device authentication
* **location** (_@bernos.dev_) = device geographical location; `serviceEnabled()`, `requestService()`, `hasPermission`, `requestPermission()`, `getLocation()`
* **logging** (_@dart.dev_)
* **mason** (_@brickhub.dev_) = generates boilerplate code based on bricks (ie interactive customizable & community-shared manifest files), augments `flutter create …`
* **path** (_@dart.dev_) = helper to combine/construct paths
* **path_parsing** (_@flutter.dev_) = create & manipulate paths, parse Path from SVG data string
* **path_provider** = find commonly used locations on the filesystem for different devices
* **plugin_platform_interface** (_@flutter.dev_)
* **quick_actions** (_@flutter.dev_) = device home screen app custom quick actions (appearing when long-pressing app icon)
* **rnd** (_@gskinner.com_) = makes working with random values easier (global **Random** instance + helpful extension methods)
* **rxdart** (_@fluttercommunity.dev_) = extends Dart **Streams** & **StreamControllers** with reactive programming
* **sensors_plus** (_@fluttercommunity.dev_) = accelerometer, gyroscope, magnetometer, barometer sensors
* **undo** (_@rodydavis.com_) = undo/redo
* **url_launcher** (_@flutter.dev_) = open external URL/e-mail/phone number/SMS/any app with special URL handlers (e.g. YouTube). Check `canLaunch()` first
* **uuid** (_@yuli.dev_) = generate UUIDs
* **vector_math** (_@google.dev_) = vector math for 2D/3D apps (distance calculation, vector/matrix, collision detection)
* **video_player** (_@flutter.dev_)
* **webview_flutter** (_@flutter.dev_) = WebView widget
* **window_size** (_unverified_) = gets/sets desktop (Linux/macOS/Windows) apps window size (also see **desktop_window** package)

* Text
  * **stemmer** (-) = reduces word to their base form
  * **pdf_text** (_@aluc.dev_) =  PDF
* DI & [State Management](https://docs.flutter.dev/data-and-backend/state-mgmt/options)
  * **bloc** (_@bloclibrary.dev_) = core Dart (& Flutter) APIs ([Bloc](https://bloclibrary.dev))
  * **flutter_bloc** (bloclibrary.dev) = Flutter widgets
  * **flutter_riverpod** (_@dash-overflow.net_) = (Dart & Flutter) compile-safe state management using global variable
  * **get** (_@getx.site_) = DI, Navigation, State Management all-in-one framework (à la WPF Prism, [GetX website](https://chornthorn.github.io/getx-docs))
  * **get_it** (aka **GetIt**) (_@fluttercommunity.dev_) = simple DI container / service locator
  * **provider** (_@dash-overflow.net_) = state management using InheritedWidget
    * **ChangeNotifierProvider** = register instance via [create or value](https://stackoverflow.com/a/61861315/3559724) (ie use _value_ if already create eg inside `Grid|ListView.builder`), and _child_ subtree
    * Instance class must call `notifyListeners()` internally (instead of caller calling `setState()`)
    * **Selector** = like **Consumer** but able to filter/notify updates to only a subset of values (prepares data for _builder_)
  * **riverpod** (_@dash-overflow.net_) = pure Dart (& Flutter) reactive caching & data-binding framework, doesn't require **BuildContext**, statically typed compile-time safety, testing flexibility
  * **state_notifier** (_@dash-overflow.net_) = when using Provider or Riverpod, replaces vanilla mutable **ChangeNotifier** with immutable, debuggable, undo-redo **StateNotifier**
* DB, Storage, [Caching](https://docs.flutter.dev/get-started/fundamentals/local-caching)
  * [Drift](https://drift.simonbinder.eu) (previously _Moor_) = reactive persistence library for Dart & Flutter
  * **graphql_flutter** (_@zino.company_)
  * **get_storage** (_@getx.site_) = key-value in memory storage wit disk backup, alternative to **shared_preferences**
  * **hive_flutter** (_@hivedb.dev_) = lightweight wrapper around **Isar**, key-value NoSQL DB, written in pure Dart
  * **isar** (_@isar.dev_) = cross-plaform DB for flutter, (replaces Hive with full Web support via IndexDB)
  * **objectbox** (_@objectbox.io_) = high-performance offline-first (on-device data persistence & AI) edge vector search NoSQL DB with [Data Synchronization](https://sync.objectbox.io) (no Web)
  * **shared_preferences** (_@flutter.dev_) = simple key-value storage (works on all platforms!)
  * **sqflite** (_@tekartik.com_) = save structured data locally in SQLite DB (usual CRUD, or raw SQL). Enable foreign keys explicitely if they are needed

### Animations, Graphism, Sounds & Themes

* **motion** (_@cendre.me_) = gyroscope-based "wobbling" effect

* Animation & Clips
  * **animations** (_@flutter.dev_) = turnkey transitions pack (container (à la **Hero**), shared axis (h/v/zoom), fade/pop)
    * [animations library API](https://pub.dev/documentation/animations/latest/animations/animations-library.html)
  * **animated_clipper** (_@oodavid.com_) = clip transitions for interactive buttons & co
  * **animated_text_kit** (_@ayushagarwal.ml_) = text animations
  * **clippy_flutter** (_deprecated_) = collection of clip shapes (arrows, rhombus)
  * **flutter_animate** (_@gskinner.com_) = easy compositionable animated effects (blur, colors, fade, scale, shimmer, slide)
    * Defines microseconds-based duration num extensions (eg `300.ms`)
  * **flutter_custom_clippers** (_@dlohani.com.np_) = collection of clip shapes (wave, panels)
  * **flutter_shaders** (_unverified_) = makes working with FragmentProgram API easier
    * Defines an **AnimatedSampler** class that is able to render a widget to an image on-the-fly
  * **flutter_switch_clipper** (_@fluttercandies.com_) = fill/transition effects package
  * **particle_field** (_@gskinner.com_) = high performance custom particle effects
  * **shimmer** (_@hunghd.dev_) = pulsating UI loading effect
* Font & Themes
* **dynamic_color** (_@material.io_) = Material color schemes based on platform dynamic color
* **flex_color_scheme** (_@rydmike.com_)
* **google_fonts** (_@material.io_) = use [Google Fonts](https://fonts.google.com)
* Images
  * **flutter_launcher_icons** (_@fluttercommunity.dev_) = generate all platforms/sizes icons
  * **flutter_spinkit** (_@ogbomo.com_) = funky loading icons package
  * **font_awesome_flutter** (_@fluttercommunity.dev_) = free [Font Awesome](https://fontawesome.com/icons) Icon pack as Flutter Icons
  * **lottie** (_@xaha.dev_) = GIF-like After Effects (exported via bodymovin extension) JSON vector animations
    * [Flutter Web: Lottie Animation issue](https://stackoverflow.com/a/73779834/3559724)
  * **rive** (_@rive.app_)
  * **transparent_image** (-) = (see **FadeInImage**)
* Sounds
  * **audio_service** (_@ryanhaise.com_) = play background audio while screen is off
  * **audioplayers** (_@blue-fire.xyz_) = with [AudioCache](https://stackoverflow.com/a/52842613/3559724)
  * **flutter_beep** (_@gonoter.com_) = play basic system sounds
  * **flutter_sound** (_@tau.canardoux.xyz_)
