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
* `export` = re-export a library, useful eg to centralize multiple libraries into a single entry point or modulate with `hide`/`show`
* `import` = import library/package
* `part` = split one library into other files (mostly used by codegen packages)
* `part of` = indicates it's part of another library (mostly used by codegen packages)
* `show` (& `hide` eg for overlapping names in multiple libs) = specifying granular objects to import/export within a library

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
* **auto_route** (_@codeness.ly_) = navigation/routing with deep linking & code generation
* **build_runner** (_@tools.dart.dev_) = generate files on disk using Dart code
  * Use `pub run build_runner watch` to update output continusouly on source files change
  * Don't include folders where generated files reside to a git repo (by mentioning them in _.gitignore_ config)
* **camera** (_@flutter.dev_)
* **collection** (_@darT.dev_) = collection utilities (eg _max_)
* **crypto** (_@dart.dev_) = cryptographic hashing functions for Dart
* **device_info_plus** (_@fluttercommunity.dev_) = device/OS-specific information; `DeviceInfoPlugin()` then `.androidInfo` or `.iosInfo` ~ built-in `Platform.isAndroid|IOS`
* **equatable** (_@fluttercommunity.dev_) = simplifies (value) equality comparison boilerplate
* **espresso** (_@flutter.dev_) = bindings for Espresso tests (for Flutter Android apps)
* **extra_alignments** (_@gskinner.com_) = like **Center** but all other directions (eg **TopLeft** or **CenterRight**)
* **file_selector** (_@flutter.dev_) = file dialogs interaction
* **fl_chart** (_@flchart.dev_) = line/bar/pie/scatter/radar charts
* **flutter_adaptive_scaffold** (_@flutter.dev_) = Material adaptive Scaffold
* **flutter_gen** (_@wasabeek.jp_) = access assets programmatically instead of path strings (inspired by [SwiftGen](https://github.com/SwiftGen/SwiftGen))
* **flutter_hooks** (_@dash-overflow.net_) = makes boilerplate lifecycle-tied logic more compact & reusable (eg **AnimationController** via `useAnimationController`)
  * [Existing hooks](https://github.com/rrousselGit/flutter_hooks#existing-hooks)
* **flutter_lints** (_@flutter.dev_) = recommended set of lints for Flutter apps, packages, and plugins
* **flutter_rating_bar** (_@sarbagyastha.com.np_) = "5-stars" (or other icons) fractional rating bar
* **flutter_slidable** (_@romainrastel.com_) ~= **Dismissible** but can stay in place (`actionPane`, `actions: [IconSlideAction]`, `actionExtentRatio: 1/actions.length`)
* **focusable_control_builder** = reacts to all sorts of inputs (focus, tab key, mouse events, keyboard shortcut)
* **freezed** _@dash-overflow.net_) = codegen for model classes (with JSON mapping) & union types (ie classes with multiple factory constructors then eg `state.when(initial: …, loading: …, success: …, failure: …`)
* **geolocator** (_@baseflow.com_) = access native platforms specific geolocation services (last location, etc)
* **go_router** (_@flutter.dev_) = declarative routing with deep links handling across multiple platforms (maintained by official Flutter team)
* **google_maps_flutter** (_@flutter.dev_)
* **google_sign_in** (_@flutter.dev_)
* **graphql** (_@zino.company_) = GraphQL (data query & manipulation for declarative data fetching APIs, created by Facebook) client, also used for CQRS
* **graphql_flutter** (_@zino.company_) = API & widgets for **graphql**
* **grpc** (_@dart.dev_)
* **html** (_@tools.dart.dev_) = HTML 5 parser
* **http** (_@dart.dev_)
* **in_app_purchase** (_@flutter.dev_) = storefront-independent API for purchases
* **intl** (_@dart.dev_) = Dates & Numbers (& Bidi) formatting methods
* **jaspr** = web framework for building websites in Dart (with both client-side & server-side rendering)
* **json_serializable** (_@google.dev_) = generate to/fromJson code based on annotated class members
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
* **tflite_flutter** (_@tensorflow.org_) = TensorFlow Lite interpreter and perform interference, with multi-platform support (mobile & desktop)
* **undo** (_@rodydavis.com_) = undo/redo
* **universal_platform** (_@gskinner.com_) = platform detection (eg _isAndroid_, _isWeb_, _isWindows_) that works for web (unlike _dart.io.Platform_ at the time)
* **url_launcher** (_@flutter.dev_) = open external URL/e-mail/phone number/SMS/any app with special URL handlers (e.g. YouTube). Check `canLaunch()` first
* **uuid** (_@yuli.dev_) = generate UUIDs
* **vector_math** (_@google.dev_) = vector math for 2D/3D apps (distance calculation, vector/matrix, collision detection)
* **webview_flutter** (_@flutter.dev_) = WebView widget
* **window_size** (_unverified_) = gets/sets desktop (Linux/macOS/Windows) apps window size (also see **desktop_window** package)

* Text
  * **stemmer** (-) = reduces word to their base form
  * **pdf_text** (_@aluc.dev_) =  PDF
* DB, Storage, [Caching](https://docs.flutter.dev/get-started/fundamentals/local-caching)
  * [Drift](https://drift.simonbinder.eu) (previously _Moor_) = reactive persistence library for Dart & Flutter (works with desktop)
  * **graphql_flutter** (_@zino.company_)
  * **get_storage** (_@getx.site_) = key-value in memory storage wit disk backup, alternative to **shared_preferences**
  * **hive_flutter** (_@hivedb.dev_) = lightweight wrapper around **Isar**, key-value NoSQL DB, written in pure Dart
  * **isar** (_@isar.dev_) = cross-plaform DB for flutter, (replaces Hive with full Web support via IndexDB)
  * **objectbox** (_@objectbox.io_) = high-performance offline-first (on-device data persistence & AI) edge vector search NoSQL DB with [Data Synchronization](https://sync.objectbox.io) (no Web)
  * **shared_preferences** (_@flutter.dev_) = simple key-value storage (works on all platforms!)
  * **sqflite** (_@tekartik.com_) = save structured data locally in SQLite DB (usual CRUD, or raw SQL). Enable foreign keys explicitely if they are needed

### UI (Animations, Graphism, Sounds & Themes)

* **gap** (_unverified_) = adds space inside **Flex** widgets (eg **Column**/**Row** or scroll lists, see **MaxGap** & **SliverGap**)
* **image_picker** (_@flutter.dev_) = pick image from library or take a new one with camera
* **ios_platform_images** (_@flutter.dev_) = share images between Flutter and iOS
* **motion** (_@cendre.me_) = gyroscope-based "wobbling" effect
* **video_player** (_@flutter.dev_)

* Animation & Clips
  * **animations** (_@flutter.dev_) = turnkey transitions pack (container (à la **Hero**), shared axis (h/v/zoom), fade/pop)
    * [animations library API](https://pub.dev/documentation/animations/latest/animations/animations-library.html)
  * **animated_clipper** (_@oodavid.com_) = clip transitions for interactive buttons & co
  * **animated_text_kit** (_@ayushagarwal.ml_) = text animations
  * **clippy_flutter** (_deprecated_) = collection of clip shapes (arrows, rhombus)
  * **flutter_adaptive_scaffold** (_@flutter.dev_) = reacts to device/screen/user inputs, and renders according to Material 3 guidelines
  * **flutter_animate** (_@gskinner.com_) = easy compositionable animated effects (blur, colors, fade, scale, shimmer, slide)
    * Defines microseconds-based duration num extensions (eg `300.ms`)
  * **flutter_custom_clippers** (_@dlohani.com.np_) = collection of clip shapes (wave, panels)
  * **flutter_shaders** (_unverified_) = makes working with FragmentProgram API easier
    * Defines an **AnimatedSampler** class that is able to render a widget to an image on-the-fly
  * **flutter_switch_clipper** (_@fluttercandies.com_) = fill/transition effects package
  * **liquid_swipe** (_@sahdeepsingh.com_) = wave motion transition
  * **particle_field** (_@gskinner.com_) = high performance custom particle effects
  * **shimmer** (_@hunghd.dev_) = pulsating UI loading effect
* Font & Themes
  * **dynamic_color** (_@material.io_) = Material color schemes based on platform dynamic color
  * **flex_color_scheme** (_@rydmike.com_) = Material Design 3 seeded generated color schemes
  * **google_fonts** (_@material.io_) = use [Google Fonts](https://fonts.google.com) (_fontSize|Weight_, _height_)
  * **material_color_utilities** (_@material.io_) = low-level algorithms & utilities enabling Material Design 3 color system
  * **material_symbols_icons** (_@hiveright.tech_) = uses official Material Symbols Icons
    * [Flutter-based Demo](https://timmaffett.github.io/material_symbols_icons)
* Images
  * **flutter_launcher_icons** (_@fluttercommunity.dev_) = CLI to generate all platforms/sizes icons from a single image asset
  * **flutter_spinkit** (_@ogbomo.com_) = funky loading icons package
  * **font_awesome_flutter** (_@fluttercommunity.dev_) = free [Font Awesome](https://fontawesome.com/icons) Icon pack as Flutter Icons
  * **lottie** (_@xaha.dev_) = GIF-like After Effects (exported via bodymovin extension) JSON vector animations
    * [Flutter Web: Lottie Animation issue](https://stackoverflow.com/a/73779834/3559724)
  * **rive** (_@rive.app_) (formerly **flare**) = state-machine-powered complex 2D interactive animation tool
  * **transparent_image** (-) = (see **FadeInImage**)
* Sounds
  * **audio_service** (_@ryanhaise.com_) = play background audio while screen is off
  * **audioplayers** (_@blue-fire.xyz_) = with [AudioCache](https://stackoverflow.com/a/52842613/3559724)
  * **flutter_beep** (_@gonoter.com_) = play basic system sounds
  * **flutter_sound** (_@tau.canardoux.xyz_)

### DI & [State Management](https://docs.flutter.dev/data-and-backend/state-mgmt/options)

State can have a broad definition; in a mostly immutable environment, that could mean any variable.
Using some of these packages allows building an app without never actually using any **StatefulWidget** at all.

* **bloc** (_@bloclibrary.dev_) = implementation of [BLoC](https://bloclibrary.dev/getting-started/#packages)  (Business Logic Component) state management pattern
  * Has two modes: either extending simple **Cubit** (functions & states) or more advanced **Bloc** (event classes & states)
  * `Bloc<Event, State>` = takes **Stream** of _Events_ in, transforms them as **Stream** of _States_ out
* **flutter_bloc** (_@bloclibrary.dev_) = uses **bloc** package, adds widgets
  * **BlocBuilder** = read state & rebuilds on change (à la **StreamBuilder**), possibly many times (_builder_ should be idempotent)
  * **BlocConsumer** = _builder_ & _listener_ (à la nested **BlocListener** & **BlocBuilder**)
  * **BlocListener** = like **BlockBuilder** but rebuilds only once per state change
  * **BlocProvider** = provides a bloc (BL) to its children/descendants (_create_, _child_, _lazy_)
  * **BlocObserver** = interface for observing behavior of `Bloc<Event, State>` instances (ie all app state changes)
  * **BlocSelector** = more granular **BlocBuilder** for some value change (same logic as **provider** package)
  * **MultiBlocListener** = multiple **BlocListener** into one
  * **MultiBlocProvider** = multiple **BlocProvider** into one
  * **ReposityProvider** & **MultiRepositoryProvider** = provides a repository to its children/descendants
* **get** (_@getx.site_) = DI, Navigation, State Management all-in-one framework (à la WPF Prism, [GetX website](https://chornthorn.github.io/getx-docs))
* **get_it** (aka **GetIt**) (_@fluttercommunity.dev_) = simple DI container/service locator via global singleton
* **provider** (_@dash-overflow.net_) = state management wrapper/syntactic sugar around built-in **InheritedWidget**
  * [Making sense of all the (Provider) providers](https://medium.com/flutter-community/making-sense-all-of-those-flutter-providers-e842e18f45dd)
  * [create vs value](https://stackoverflow.com/a/61861315/3559724)
  * **ChangeNotifierProvider** = provides a **ChangeNotifier** (from Flutter SDK, able to call `notifyListeners()` rather than `setState()`) instance that will rebuild its Consumers upon change
  * **Consumer** = accesses a provided instance
  * **FutureProvider** = wrapper around **FutureBuilder**
  * **ListenableProvider** = custom Provider
  * **MultiProvider** = to avoid nesting many Providers, set multiple ones directly
  * **Provider** = exposes a model but don't listen to its changes, plus a _child_ subtree
  * `Provider.of<T>(context)` = access to instance without necessarily having to rebuild UI (eg calling a method that updates its state, but we don't care about changes)
  * **Selector** = like **Consumer** but able to filter/notify updates to only a subset of values (prepares data for _builder_)
  * **StreamProvider** = wrapper around **StreamBuilder**
  * **ValueListenableProvider** = for **ValueNotifier**
* **riverpod** (_@dash-overflow.net_) = statically typed compile-time safe reactive caching & data-binding state management framework, uses dependency-injected Provider global variables not **BuildContext**, testing flexibility
  * **ChangeNotifierProvider** = provides a **ChangeNotifier** (for **provider** backwards-compatibility, avoid in new code)
  * **FutureProvider**
  * **Provider** = simply provides an instance (useful for setting up DI)
  * **ProviderScope** = stores states of providers (at app root level, or for local subtrees, or both app root with local override)
  * **StateNotifierProvider** = provides an instance of **StateNotifier** (a class that manages a state & broadcast changes, not riverpod see package below)
  * **StateProvider** = provides a (simple state) value that can get updated (via `ref.read(P.notifier).state = …`)
  * **StreamProvider**
  * `(Provider).autoDispose()` = destroy state when no longer used (eg closing Firebase connection or resetting state between screens transition)
  * See <https://medium.com/flutter-community/flutter-riverpod-tutorial-counter-app-ed3aa758f02f>
* **stacked** (_@filledstacks.com_) = MvvM architectural framework for real-world scenarios
  * See <https://medium.com/flutter-community/a-beginners-guide-to-architecting-a-flutter-app-1e9053211a74>
* **state_notifier** (_@dash-overflow.net_) = exposes immutable, debuggable, undo-redoable **StateNotifier** abstract class
  * Uses _state_ setter property that notifies listeners when set (as opposed to manually calling `notifyListeners()` in case of vanilla mutable **ChangeNotifier**)
  * used in combination with Provider or Riverpod
