# [Flutter Packages & Plugins](https://pub.dev)

Plugins make it easy to access platform services and hardware (eg accelerometer, camera, etc.) OS-independently.

## Quick Tips

* Lots of packages require the full Flutter SDK, yet a few require only Dart SDK
* Hot Reload/Restart are not enough to reload plugins with platform native device features => `flutter run` (or _F5_ equivalent) after adding
* Blue tags under package name/version indicate which SDK (Dart or Flutter) & platform (Android, IOS, MACOS, WEB, WINDOWS) it targets/is compatible with
* [Using packages](https://docs.flutter.dev/development/packages-and-plugins/using-packages)
* Quickly add plugins from within Visual Studio Code via Command Palette (`Ctrl + Shift + P`) > _Add Dependency_
* [Flutter Gems](https://fluttergems.dev) = collection of 6700+ curated Dart/Flutter packages (by feature)

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
  * **async** = (eg `FutureOr<T>`)
  * **collection** (array manipulation eg **IterableExtension** à la C# Linq)
  * **convert** = en/decode between different data representations (eg String to JSON `jsonDecode()`, UTF-8, Base64, HTML escape)
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
  * `dart run build_runner build` = generate once (`--delete-conflicting-outputs`)
  * `dart run build_runner watch -d` = generate continusouly on files change/save
  * `flutter pub run build_runner build --delete-conflicting-outputs`
  * Don't include folders where generated files reside to a git repo (by mentioning them in _.gitignore_ config)
* **camera** (_@flutter.dev_)
* **collection** (_@dart.dev_) = collection utilities (eg _max_)
* **connectivity_plus** (_@fluttercommunity.dev_) = discover network connectivity types (eg mobile, wifi, ethernet, vpn, bluetooth) for all platforms
* **crypto** (_@dart.dev_) = cryptographic hashing functions for Dart
* **device_info_plus** (_@fluttercommunity.dev_) = device/OS-specific information; `DeviceInfoPlugin()` then `.androidInfo` or `.iosInfo` ~ built-in `Platform.isAndroid|IOS`
* **dio** (_@flutter.cn_) = HTTP networking (request cancel, file up/download, timeout)
* **easy_localization** (-) = easy translations for many languages, supports other file formats (JSON, CSV, Yaml, XML)
* **equatable** (_@fluttercommunity.dev_) = simplifies (value) equality comparison boilerplate (just define _props_ and remove `hashCode()` & `operator==()`)
* **espresso** (_@flutter.dev_) = bindings for Espresso tests (for Android apps)
* **extra_alignments** (_@gskinner.com_) = like **Center** but all other directions (eg **TopLeft** or **CenterRight**)
* **file_selector** (_@flutter.dev_) = file dialogs interaction
* **fl_chart** (_@flchart.dev_) = line/bar/pie/scatter/radar charts
* **flutter_adaptive_scaffold** (_@flutter.dev_) = Material adaptive Scaffold
* **flutter_gen** (_@wasabeek.jp_) = access assets programmatically instead of path strings (inspired by [SwiftGen](https://github.com/SwiftGen/SwiftGen))
* **flutter_hooks** (_@dash-overflow.net_) = makes boilerplate lifecycle-tied logic more compact & reusable (eg **AnimationController** via `useAnimationController`)
  * [Existing hooks](https://github.com/rrousselGit/flutter_hooks#existing-hooks)
* **flutter_keyboard_visibility** (_@jasonrai.ca_) = react to virtual keyboard visibility changes
* **flutter_lints** (_@flutter.dev_) = recommended set of lints for Flutter apps, packages, and plugins
* **flutter_local_notifications** (_@dexterx.dev_) = display notifications on most platforms (desktop & mobile, not web)
* **flutter_native_splash** (_jonhanson.net_) = splash screen before/while Flutter boots
* **flutter_rating_bar** (_@sarbagyastha.com.np_) = "5-stars" (or other icons) fractional rating bar
* **flutter_simple_treeview** (_@google.dev_) = tree structure of widget nodes
* **flutter_slidable** (_@romainrastel.com_) ~= customizable **Dismissible** (`actionPane`, `actions: [IconSlideAction]`, `actionExtentRatio: 1/actions.length`)
* **flutter_treeview** (_@kevinandre.com_) = customizable hierarchical tree of widgets
* **flutter_zoom_drawer** (_@medyas.ml_) = custom drawer with rotation & shadow clones
* **focusable_control_builder** = reacts to all sorts of inputs (focus, tab key, mouse events, keyboard shortcut)
* **freezed** (_@dash-overflow.net_) = codegen for data/model/union classes (adds `copyWith()`, equality, JSON from/to, `toString()`), requires **build_runner** & **json_serializable**
* **ftoast** (-) = toast pop-up messages (ie center screen notifications)
* **geolocator** (_@baseflow.com_) = access native platforms specific geolocation services (last location, etc)
* **go_router** (_@flutter.dev_) = declarative routing with deep links handling across multiple platforms (maintained by official Flutter team)
* **google_maps_flutter** (_@flutter.dev_)
* **google_sign_in** (_@flutter.dev_)
* **graphql** (_@zino.company_) = GraphQL (data query & manipulation for declarative data fetching APIs, created by Facebook) client, also used for CQRS
* **graphql_flutter** (_@zino.company_) = API & widgets for **graphql**
* **grpc** (_@dart.dev_) = Google (HTTP/2 & Protobuf) protocol for connecting microservices or mobile clients to backends
* **html** (_@tools.dart.dev_) = HTML 5 parser
* **http** (_@dart.dev_)
* **husky** (-) = manage git hooks (eg lint commit messages & code, run tests, etc in reaction to git commit/push)
* **in_app_purchase** (_@flutter.dev_) = storefront-independent API for purchases
* **intl** (_@dart.dev_) = Dates & Numbers (& Bidi) formatting methods
* **intl_utils** (_@localizely.com_) = binding between your translations from .arb files and Flutter app
* **introduction_screen** (-) = onboarding starting slideshow
* **jaspr** = web framework for building websites in Dart (with both client-side & server-side rendering)
* **json_serializable** (_@google.dev_) = generate to/fromJson code based on annotated class members
* **local_auth** (_@flutter.dev_) = local on-device authentication
* **location** (_@bernos.dev_) = device geographical location; `serviceEnabled()`, `requestService()`, `hasPermission`, `requestPermission()`, `getLocation()`
* **logging** (_@dart.dev_)
* **mason** (_@brickhub.dev_) = generates boilerplate code based on bricks (ie interactive customizable & community-shared manifest files), augments `flutter create` with more flexible `mason add|make {brick_name}`
* **mockito** (_@dart.dev_) = mock library for unit tests (inspired by Java's Mockito)
* **onboarding_overlay** (-) = large overlays
* **panara_dialogs** (_@panarastudios.in_) = info/confirmation/warning/error modal dialogs
* **path** (_@dart.dev_) = helper to combine/construct paths
* **path_parsing** (_@flutter.dev_) = create & manipulate paths, parse Path from SVG data string
* **path_provider** = find commonly used locations on the filesystem for different devices
* **plugin_platform_interface** (_@flutter.dev_)
* **quick_actions** (_@flutter.dev_) = device home screen app custom quick actions (appearing when long-pressing app icon)
* **rect_getter** (_@debuggerx.com_) = obtain a widget's rectangular coordinates
* **rnd** (_@gskinner.com_) = makes working with random values easier (global **Random** instance + helpful extension methods)
* **rxdart** (_@fluttercommunity.dev_) = extends Dart **Streams** & **StreamControllers** with reactive programming
* **searchfield** (_@maheshjamdade.com_) = simple customizable autocomplete search widget
* **sensors_plus** (_@fluttercommunity.dev_) = accelerometer, gyroscope, magnetometer, barometer sensors
* **showcaseview** (_@simform.com_) = small modal onboarding overlay arrows
* **sliver_tools** (_@pietervanloon.com_) = missing sliver package (related: [SliverFooter](https://stackoverflow.com/a/49621060/3559724) by Rémy Rousselet)
* **system_tray** (-) = design a system tray menu for desktop (Linux, macOS, Windows) opening from the system tray app icon
* **tflite_flutter** (_@tensorflow.org_) = TensorFlow Lite interpreter and perform interference, with multi-platform support (mobile & desktop)
* **undo** (_@rodydavis.com_) = undo/redo
* **universal_platform** (_@gskinner.com_) = platform detection (eg _isAndroid_, _isWeb_, _isWindows_) that works for web (unlike _dart.io.Platform_ at the time)
* **url_launcher** (_@flutter.dev_) = open external URL/e-mail/phone number/SMS/any app with special URL handlers (e.g. YouTube). Check `canLaunch()` first
* **uuid** (_@yuli.dev_) = generate UUIDs
* **vector_math** (_@google.dev_) = vector math for 2D/3D apps (distance calculation, vector/matrix, collision detection)
* **webview_flutter** (_@flutter.dev_) = WebView widget
* **window_size** (-) = gets/sets desktop (Linux/macOS/Windows) apps window size (also see **desktop_window** package)
* **workmanager** (_@fluttercommunity.dev_) = schedule tasks at OS-level (thus works even with app backgrounded/closed)

* Text
  * **fuzzy** (_@borges.dev_) = Fuzzy (Elastic) search
  * **pdf_text** (_@aluc.dev_) =  PDF
  * **stemmer** (-) = reduces word to their base form
  * **string_similarity** (_@jeremylandon.com_) = string distance/similarity (à la Levenshtein)
* DB, Storage, [Caching](https://docs.flutter.dev/get-started/fundamentals/local-caching)
  * **drift** (previously _Moor_, _@simonbinder.eu_) = reactive persistence library for Dart & Flutter (works with desktop), builds on SQLite
  * **graphql_flutter** (_@zino.company_)
  * **get_storage** (_@getx.site_) = key-value in memory storage wit disk backup, alternative to **shared_preferences**
  * **hive_flutter** (_@hivedb.dev_) = lightweight wrapper around **Isar**, key-value NoSQL DB, written in pure Dart
  * **isar** (_@isar.dev_) = cross-plaform DB for flutter, (replaces Hive with full Web support via IndexedDB)
  * **objectbox** (_@objectbox.io_) = high-performance offline-first (on-device data persistence & AI) edge vector search NoSQL DB with [Data Synchronization](https://sync.objectbox.io) (no Web)
  * **shared_preferences** (_@flutter.dev_) = simple key-value storage (works on all platforms!)
  * **sqflite** (_@tekartik.com_) = save structured data locally in SQLite DB (usual CRUD, or raw SQL). Enable foreign keys explicitely if they are needed
  * **sqflite_ffi** (_@tekartik.com_) = makes sqflite work on desktop (Linux, MacOS, Windows) for both Flutter/Dart VM

### UI (Animations, Graphism, Sounds & Themes)

* **boxy** (_@tst.sh_) = set of layout widgets to align/position widgets against other widgets (eg flex, multi-child, dynamic inflation, slivers)
* **flutter_sticky_header** (_@romainrastel.com_) = section headers that sticks while section scrolled
* **gap** (-) = adds space inside **Flex** widgets (ie **Column**/**Row** or scroll lists, see **MaxGap** & **SliverGap**)
* **image_picker** (_@flutter.dev_) = pick image from library or take a new one with camera
* **ios_platform_images** (_@flutter.dev_) = share images between Flutter and iOS
* **motion** (_@cendre.me_) = gyroscope-based "wobbling" effect
* **video_player** (_@flutter.dev_)

* Animation & Clips
  * **animate_do** (_@fernando-herrera.com_) = crisp bounce/in/out animations (à la jQuery, inspired by Animate.css)
  * **animations** (_@flutter.dev_) = turnkey transitions pack (container (à la **Hero**), shared axis (h/v/zoom), fade/pop)
    * [animations library API](https://pub.dev/documentation/animations/latest/animations/animations-library.html)
  * **animated_clipper** (_@oodavid.com_) = clip transitions for interactive buttons & co
  * **animated_text_kit** (_@ayushagarwal.ml_) = text animations (rotate/fade/type/scale/colorize/liquidfill/wavy/flicker)
  * **clippy_flutter** (_deprecated_) = collection of clip shapes (arrows, rhombus)
  * **flutter_adaptive_scaffold** (_@flutter.dev_, _discontinued_) = reacts to device/screen/user inputs, and renders according to Material 3 guidelines
  * **flutter_animate** (_@gskinner.com_) = easy compositionable animated effects (blur, colors, fade, scale, shimmer, slide)
    * Defines microseconds-based duration num extensions (eg `300.ms`)
  * **flutter_custom_clippers** (_@dlohani.com.np_) = collection of clip shapes (wave, panels)
  * **particles_flutter** (-) = interactive particles animation
  * **flutter_shaders** (-) = makes working with FragmentProgram API easier
    * Defines an **AnimatedSampler** class that is able to render a widget to an image on-the-fly
  * **flutter_switch_clipper** (_@fluttercandies.com_) = fill/transition effects package
  * [FlutterFX](https://github.com/flutterfx/flutterfx_widgets)
  * **liquid_swipe** (_@sahdeepsingh.com_) = wave motion transition
  * **particle_field** (_@gskinner.com_) = high performance custom particle effects
  * **shimmer** (_@hunghd.dev_) = pulsating UI loading effect
  * **wave_container** (-) = sine water-like wave animations
  * **wave_transition** (-) = radial layer reveal effect
  * **wave_transition_animation** (-) = radial layer reveal effect
* Font & Themes
  * **dynamic_color** (_@material.io_) = Material color schemes based on platform dynamic color
  * **flex_color_scheme** (_@rydmike.com_) = Material Design 3 seeded generated color schemes
  * **google_fonts** (_@material.io_) = use [Google Fonts](https://fonts.google.com) (_fontSize|Weight_, _height_)
  * **material_color_utilities** (_@material.io_) = low-level algorithms & utilities enabling Material Design 3 color system
  * **material_symbols_icons** (_@hiveright.tech_) = uses official Material Symbols Icons
    * [Flutter-based Demo](https://timmaffett.github.io/material_symbols_icons)
* Images
  * **flutter_launcher_icons** (_@fluttercommunity.dev_) = CLI to generate all platforms/sizes icons from a single image asset (`flutter pub run flutter_launcher_icons:main`)
  * **flutter_spinkit** (_@ogbomo.com_) = funky loading icons package
  * **flutter_svg** (_@flutter.dev_) = draw SVG files (`SvgPicture.asset('assets/icons/union.svg')` or from network)
  * **font_awesome_flutter** (_@fluttercommunity.dev_) = free [Font Awesome](https://fontawesome.com/icons) Icon pack as Flutter Icons
  * **lottie** (_@xaha.dev_) = GIF-like After Effects (exported via bodymovin extension) JSON vector animations
    * [Flutter Web: Lottie Animation issue](https://stackoverflow.com/a/73779834/3559724)
  * **material_design_icons_flutter** (_@ziofat.dev_) = [Material Design Icons](https://pictogrammers.com/library/mdi) as Flutter Icons
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
* **flutter_command** (-) = **ValueListenable**-based Command pattern (à la .NET)
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
  * `@riverpod` = shorthand for `Riverpod()` (with parameters such as `keepAlive: true`)
  * `ref.listen()` = register a callback executed on change (without rebuilds)
  * `ref.read()` = one-time access
  * `ref.watch()` = observe & rebuild on change
  * `ref.watch(provider.select((state) => bool projection)` = responds to change on only a substrata of a provider
  * **AsyncNotifier** (_Riverpod 2.0_) = a **Notifier** that is asynchronously initialized (eg for caching network requests or initializing data from DB)
  * **ChangeNotifierProvider** (_deprecated_) = provides a **ChangeNotifier** (for **provider** backwards-compatibility, avoid in new code)
  * **Consumer** = (update eg `ref.read(P.notifier).state = …`)
  * **FutureProvider** = **Provider** for asynchronous code (eg for database instance)
  * **Notifier** (_Riverpod 2.0_) = class exposing a state changing over time after reacting to custom events (eg user interactions)
  * **NotifierProvider** = listens/exposes a **Notifier**
  * **Provider** = provides a simple (readonly?) value (eg useful for setting up a DI instance, or caching computations)
    * `Provider.autoDispose()` = when a widget that uses that provider is removed from tree, that provider gets cleaned automatically
    * `Provider.family()` = derived provider useful to return subsets of a whole set returned by another provider (ie filtering, with cacheing)
  * **ProviderScope** = stores states of providers (at app root level, or for local subtrees, or both app root with local override)
  * **StateNotifierProvider** (_deprecated_) = provides an instance of **StateNotifier** (a class that manages a state & broadcast changes, not riverpod see package below)
  * **StateProvider** = simpler then **NotifierProvider** for simple/primitive states without having to write a **Notifier**
  * **StreamProvider**
  * `(Provider).autoDispose()` = destroy state when no longer used (eg closing Firebase connection or resetting state between screens transition)
  * See <https://medium.com/flutter-community/flutter-riverpod-tutorial-counter-app-ed3aa758f02f>
* **stacked** (_@filledstacks.com_) = MvvM architectural framework for real-world scenarios
  * See <https://medium.com/flutter-community/a-beginners-guide-to-architecting-a-flutter-app-1e9053211a74>
* **state_notifier** (_@dash-overflow.net_) = exposes immutable, debuggable, undo-redoable **StateNotifier** abstract class
  * Uses _state_ setter property that notifies listeners when set (as opposed to manually calling `notifyListeners()` in case of vanilla mutable **ChangeNotifier**)
  * used in combination with Provider or Riverpod
