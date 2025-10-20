# [Flutter Packages & Plugins](https://pub.dev)

## Quick Tips

* [Flutter Gems](https://fluttergems.dev) = collection of 6700+ curated Dart/Flutter packages (by feature)
* [Using packages](https://docs.flutter.dev/development/packages-and-plugins/using-packages)
* Quickly add plugins from within Visual Studio Code via Command Palette (`Ctrl + Shift + P`) > _Add Dependency_
* Hot Reload/Restart are not enough to reload plugins with platform native device features => `flutter run` (or _F5_ equivalent) after adding
* Blue tags under package name/version indicate which SDK (Dart or Flutter) & platform (Android, IOS, MACOS, WEB, WINDOWS) it targets/is compatible with

## Glossary

* [Flutter Favorite program](https://docs.flutter.dev/packages-and-plugins/favorites) = high-quality first priority packages
* **Package** = "pure Dart code" package, at a minimum it is a directory containing a _pubspec.yaml_ file
* **Plugin** (aka **Plugin Package**) = a special kind of package part-native (Kotlin/JS/Swift) code wrapped as Dart making platform features available to an app
  * Plugins can be written for Android (using Kotlin or Java), iOS (using Swift or Objective-C), web, macOS, Windows, Linux, or any combination thereof
  * Plugins make it easy to access platform services and hardware (eg accelerometer, camera, etc.) OS-independently
* **Pub** = name of a package manager, which takes care of fetching packages and package versioning information
  * Its CLI can be summoned either via `dart pub {pub_command}` or `flutter pub {pub_command}`
* `as` = specifying an (arbitrary) local scope name of whole [library](https://dart.dev/language/libraries)
* `export` = re-export a library, useful eg to centralize multiple libraries into a single entry point or modulate with `hide`/`show`
* `import` = import library/package
* `part` = split one library into other files (mostly used by codegen packages)
* `part of` = indicates it's part of another library (mostly used by codegen packages)
* `show` (& `hide` eg for overlapping names in multiple libs) = specifying granular objects to import/export within a library

## [Flutter SDK Package](https://api.flutter.dev/index.html)

From Dart's point of view, Flutter is actually a package like any other (ie it's referenced in _pubspec.yaml_, then imported via eg `import 'package:flutter/….dart';`).

* **async** = (eg `FutureOr<T>`)
* **collection** (array manipulation eg **IterableExtension** à la C# Linq)
* **convert** = en/decode between different data representations (eg String to JSON `jsonDecode()`, UTF-8, Base64, HTML escape)
* **dart:core**
* **dart:math**
* **flutter_localizations** = internalization (i18n) & localization (i10n), permits parameterized & conditional output (generated via source ARB files)
* **foundation**
* **intl** = date formatting
* **material**
* **services** = platform features (clipboard, system sounds eg `SystemSound.play(SystemSoundType.click);`)
* **widgets** = no implementations, only (re-)exports all widget-related libraries

## Plugins

### Official

* **async** (_@dart.dev_) = additions to built-in [dart:async](https://api.dart.dev/stable/3.5.0/dart-async/dart-async-library.html) (`StreamGroup.merge()`, `AsyncCache<T>()` time-based cacheing, **StreamQueue**)
* **build_runner** (_@tools.dart.dev_) = generate files on disk using Dart code
  * `dart run build_runner build` = generate once (`--delete-conflicting-outputs`)
  * `dart run build_runner watch -d` = generate continusouly on files change/save
  * `flutter pub run build_runner build --delete-conflicting-outputs`
  * Don't include folders where generated files reside to a git repo (by mentioning them in _.gitignore_ config)
* **collection** (_@dart.dev_) = collection utilities (eg _max_)
* **crypto** (_@dart.dev_) = cryptographic hashing functions for Dart
* **dds** (_@tools.dart.dev_) = spawns Dart Developer Service used to communicate with Dart VM Service instance
* **fake_async** (_@dart.dev_) = provides a **FakeAsync** class to deterministically test code using asynchronous features (Future, Stream, Timer, microtasks)
* **grpc** (_@dart.dev_) = Google (HTTP/2 & Protobuf) protocol for connecting microservices or mobile clients to backends
* **html** (_@tools.dart.dev_) = HTML 5 parser
* **http** (_@dart.dev_)
* **intl** (_@dart.dev_) = Dates & Numbers (& Bidi) formatting methods
* **leak_tracker** (_@tools.dart.dev_) = framework for detecting memory issues
* **logging** (_@dart.dev_)
* **path** (_@dart.dev_) = helper to combine/construct paths

* **built_value** (_@google.dev_) = popular value class codegen, similar to **freezed** (immutable value types, EnumClass, JSON serialization)
* **flutter_simple_treeview** (_@google.dev_) = tree structure of widget nodes
* **google_moblie_ads** (_@google.dev_)
* **json_serializable** (_@google.dev_) = generate to/fromJson code based on annotated class members
* **vector_math** (_@google.dev_) = vector math for 2D/3D apps (distance calculation, vector/matrix, collision detection)

* **dynamic_color** (_@material.io_) = Material color schemes based on platform dynamic color
* **google_fonts** (_@material.io_) = use [Google Fonts](https://fonts.google.com) (_fontSize|Weight_, _height_)
* **material_color_utilities** (_@material.io_) = low-level algorithms & utilities enabling Material Design 3 color system

#### [@flutter plugins](https://github.com/flutter/plugins#plugins)

* **animations** (_@flutter.dev_) = turnkey transitions pack (container (à la **Hero**), shared axis (h/v/zoom), fade/pop)
* **camera** (_@flutter.dev_)
* **espresso** (_@flutter.dev_) = bindings for Espresso tests (for Android apps)
* **file_selector** (_@flutter.dev_) = files & file dialogs
* **flutter_adaptive_scaffold** (_@flutter.dev_, _discontinued_) = Material 3 guidelines adaptive (reacts to inputs) Scaffold
* **flutter_lints** (_@flutter.dev_) = recommended set of lints for Flutter apps, packages, and plugins
* **flutter_svg** (_@flutter.dev_) = draw SVG files (`SvgPicture.asset('assets/icons/union.svg')` or from network)
* **go_router** (_@flutter.dev_) = declarative routing with deep links handling across multiple platforms (maintained by official Flutter team)
* **google_maps_flutter** (_@flutter.dev_)
* **google_sign_in** (_@flutter.dev_)
* **image_picker** (_@flutter.dev_) = pick image from library or take a new one with camera
* **in_app_purchase** (_@flutter.dev_) = storefront-independent API for purchases
* **ios_platform_images** (_@flutter.dev_) = share images between Flutter and iOS
* **local_auth** (_@flutter.dev_) = local on-device authentication (fingerprint reader, touch/face ID)
* **path_parsing** (_@flutter.dev_) = create & manipulate paths, parse Path from SVG data string
* **path_provider** (_@flutter.dev_) = find commonly used locations on the filesystem for different devices
* **pigeon** (_@flutter.dev_) = code generator tool making communication between Flutter & host platform easier/faster/type-safe (eg for creating plugins)
* **plugin_platform_interface** (_@flutter.dev_)
* **quick_actions** (_@flutter.dev_) = device home screen app custom quick actions (appearing when long-pressing app icon)
* **shared_preferences** (_@flutter.dev_) = simple key-value storage (works on all platforms!)
* **url_launcher** (_@flutter.dev_) = open external URL/e-mail/phone number/SMS/any app with special URL handlers (eg YouTube). Check `canLaunch()` first
* **video_player** (_@flutter.dev_)
* **webview_flutter** (_@flutter.dev_) = WebView widget

### Community

* **connectivity_plus** (_@fluttercommunity.dev_) = discover network connectivity types (eg mobile, wifi, ethernet, vpn, bluetooth) for all platforms
* **device_info_plus** (_@fluttercommunity.dev_) = device/OS-specific information; `DeviceInfoPlugin()` then `.androidInfo` or `.iosInfo` ~ built-in `Platform.isAndroid|IOS`
* **equatable** (_@fluttercommunity.dev_) = simplifies (value) equality comparison boilerplate (just define _props_ and remove `hashCode()` & `operator==()`)
* **flutter_blurhash** (_@fluttercommunity.dev_) = [BlurHash](https://blurha.sh) short string-based representation of an image to display while loading
* **flutter_launcher_icons** (_@fluttercommunity.dev_) = CLI to generate all platforms/sizes icons from a single image asset (`flutter pub run flutter_launcher_icons:main`)
* **font_awesome_flutter** (_@fluttercommunity.dev_) = free [Font Awesome](https://fontawesome.com/icons) Icon pack as Flutter Icons
* **get_it** (aka **GetIt**) (_@fluttercommunity.dev_) = simple DI container/service locator via global singleton
* **package_info_plus** (_@fluttercommunity.dev_) = meta-information about application package (name, version, build number)
* **rxdart** (_@fluttercommunity.dev_) = extends Dart **Streams** & **StreamControllers** with reactive programming
* **sensors_plus** (_@fluttercommunity.dev_) = accelerometer, gyroscope, magnetometer, barometer sensors
* **share_plus** (_@fluttercommunity.dev_) = share (text/URL/images/files) data between apps, using platform's share dialog
* **wakelock_plus** (_@fluttercommunity.dev_) = keep device screen awake
* **workmanager** (_@fluttercommunity.dev_) = schedule tasks at OS-level (thus works even with app backgrounded/closed)

#### Rémi Rousselet

* **flutter_hooks** (_@dash-overflow.net_) = makes boilerplate lifecycle-tied logic more compact & reusable (eg **AnimationController** via `useAnimationController`)
  * [Existing hooks](https://github.com/rrousselGit/flutter_hooks#existing-hooks)
* **freezed** (_@dash-overflow.net_) = codegen for data/model/union classes (adds `copyWith()`, equality, JSON from/to, `toString()`), requires **build_runner** & **json_serializable**
* **provider** (_@dash-overflow.net_) = state management wrapper/syntactic sugar around built-in **InheritedWidget**
  * [Making sense of all the (Provider) providers](https://medium.com/flutter-community/making-sense-all-of-those-flutter-providers-e842e18f45dd)
  * [create vs value](https://stackoverflow.com/a/61861315/3559724) = _create_ for creating a new instance, _value_ to use an already created instance
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
* **state_notifier** (_@dash-overflow.net_) = exposes immutable, debuggable, undo-redoable **StateNotifier** abstract class
  * Uses _state_ setter property that notifies listeners when set (as opposed to manually calling `notifyListeners()` in case of vanilla mutable **ChangeNotifier**)
  * used in combination with Provider or Riverpod

#### Misc

* **auto_route** (_@codeness.ly_) = navigation/routing with deep linking & code generation
* **device_preview** (_@aloisdeniel.com_) = approximate how an app looks & performs on another device (select devices, orientation, language, theme, custom resolution & safe areas)
* **dio** (_@flutter.cn_) = HTTP networking (request cancel/intercept to automatically attach JWT tokens, file up/download with progress tracking, timeout)
* **dotted_border** (-) = easily add (rect/round/oval) dotted borders around widget
* **easy_localization** (-) = easy translations for many languages, supports other file formats (JSON, CSV, Yaml, XML), plurals, genders
* **external_path** (-) = internal/external/public storage paths (ie paths that require explicit permissions, unlike **path_provider** that handles always-accessible directories)
* **extra_alignments** (_@gskinner.com_) = like **Center** but all other directions (eg **TopLeft** or **CenterRight**)
* **file_picker** (_@miguelruivo.com_) = cross-platform native single/multi file explorer/saver (with extension filtering)
* **file_saver** (_@hassanansari.dev_) = cross-platform file saving
* **fl_chart** (_@flchart.dev_) = line/bar/pie/scatter/radar charts
* **flutter_blue** (_@pauldemarco.com_) = bluetooth LE (Low Energy)
* **flutter_gen** (_@wasabeek.jp_) = access assets programmatically instead of path strings (inspired by [SwiftGen](https://github.com/SwiftGen/SwiftGen))
* **flutter_keyboard_visibility** (_@jasonrai.ca_) = react to virtual keyboard visibility changes
* **flutter_local_notifications** (_@dexterx.dev_) = display notifications on most platforms (desktop & mobile, not web)
* **flutter_native_splash** (_jonhanson.net_) = splash screen before/while Flutter boots
* **flutter_rating_bar** (_@sarbagyastha.com.np_) = "5-stars" (or other icons) fractional rating bar
* **sentry** = Sentry SDK for pure Dart ([Sentry](https://sentry.io) performance monitoring & error tracking)
* **sentry_flutter** (_@sentry.io_) = Sentry SDK for Flutter
* **flutter_slidable** (_@romainrastel.com_) ~= customizable **Dismissible** (`actionPane`, `actions: [IconSlideAction]`, `actionExtentRatio: 1/actions.length`)
* **flutter_treeview** (_@kevinandre.com_) = customizable hierarchical tree of widgets
* **focusable_control_builder** = reacts to all sorts of inputs (focus, tab key, mouse events, keyboard shortcut)
* **geolocator** (_@baseflow.com_) = access native platforms specific geolocation services (last location, etc)
* **graphql** (_@zino.company_) = GraphQL (data query & manipulation for declarative data fetching APIs, created by Facebook) client, also used for CQRS
* **graphql_flutter** (_@zino.company_) = API & widgets for **graphql**
* **husky** (-) = manage git hooks (eg lint commit messages & code, run tests, etc in reaction to git commit/push)
* **intl_utils** (_@localizely.com_) = binding between your translations from .arb files and Flutter app
* **jaspr** (_@schultek.dev_) = web framework for building HTML/CSS websites in Dart (with both client-side & server-side rendering)
* **location** (_@bernos.dev_) = device geographical location; `serviceEnabled()`, `requestService()`, `hasPermission`, `requestPermission()`, `getLocation()`
* **permission_handler** (_@baseflow.com_) = cross-platform post-install granular app permission requests
* **printing** (_@nfet.net_) = generate & print documents to mobile-compatible printers
* **pub_version_plus** (_@mrgnhnt.com_) = increment fragments of a version (& build) number via single command
  * Usage = `dart run pub_version_plus:main {major|minor|patch|build} (--pre-release {beta|alpha|dev})`
  * Works well with CI/CD **when installed as a dev-dependency**
* **rect_getter** (_@debuggerx.com_) = obtain a widget's rectangular coordinates
* **rnd** (_@gskinner.com_) = makes working with random values easier (global **Random** instance + helpful extension methods)
* **searchfield** (_@maheshjamdade.com_) = simple customizable autocomplete search widget
* **sliver_tools** (_@pietervanloon.com_) = missing sliver package (related: [SliverFooter](https://stackoverflow.com/a/49621060/3559724) by Rémy Rousselet)
* **system_tray** (-) = design a system tray menu for desktop (Linux, macOS, Windows) opening from the system tray app icon
* **tflite_flutter** (_@tensorflow.org_) = TensorFlow Lite interpreter and perform interference, with multi-platform support (mobile & desktop)
* **undo** (_@rodydavis.com_) = undo/redo history stack to go back/forward
* **universal_platform** (_@gskinner.com_) = platform detection (eg _isAndroid_, _isWeb_, _isWindows_) that works for web (unlike _dart.io.Platform_ at the time)
* **upgrader** (_@larryaassen.com_) = informs users there is a newer app store version of the app
* **uuid** (_@yuli.dev_) = generate UUIDs
* **version** (_@dart.ninja_) = parse & compare semantic versions
* **window_size** (-) = gets/sets desktop (Linux/macOS/Windows) apps window size (also see **desktop_window** package)

* Animateed Containers
  * **drag_and_drop_lists** (-) = drag & drop items between multiple lists
  * **reorderables** (-) = drag & drop lists, rows/columns, wraps
* Animation & Clip
  * **animate_do** (_@fernando-herrera.com_) = crisp bounce/in/out animations (à la jQuery, inspired by Animate.css)
    * [animations library API](https://pub.dev/documentation/animations/latest/animations/animations-library.html)
  * **animated_clipper** (_@oodavid.com_) = clip transitions for interactive buttons & co
  * **animated_text_kit** (_@ayushagarwal.ml_) = text animations (rotate/fade/type/scale/colorize/liquidfill/wavy/flicker)
  * **confetti** (_@funwith.app_) = easy confetti particles
  * **flutter_animate** (_@gskinner.com_) = easy compositionable animated effects (blur, colors, fade, flip, scale, shimmer, slide)
    * Defines microseconds-based duration num extensions (eg `300.ms`)
    * Eg [flip tiles game](https://guillaume.bernos.dev/using-flutter_animate-for-a-flutter-game-animation)
  * **flutter_custom_clippers** (_@dlohani.com.np_) = collection of clip shapes (wave, panels)
  * **flutter_shaders** (-) = makes working with FragmentProgram API easier
    * Defines an **AnimatedSampler** class that is able to render a widget to an image on-the-fly
  * **flutter_spinkit** (_@jogboms.xyz_) = collection of loading indicators/spinners (instapired by [CSS SpinKit](https://github.com/tobiasahlin/SpinKit))
  * **flutter_switch_clipper** (_@fluttercandies.com_) = fill/transition effects package
  * [FlutterFX](https://github.com/flutterfx/flutterfx_widgets)
  * **liquid_swipe** (_@sahdeepsingh.com_) = wave motion transition
  * **motion** (_@cendre.me_) = gyroscope-based "wobbling" effect
  * **particle_field** (_@gskinner.com_) = high performance custom particle effects
  * **particles_flutter** (-) = interactive particles animation
  * **shimmer** (_@hunghd.dev_) = pulsating UI loading effect
  * **wave_container** (-) = sine water-like wave animations
  * **wave_transition** (-) = radial layer reveal effect
  * **wave_transition_animation** (-) = radial layer reveal effect
* Font & Theme
  * **flex_color_scheme** (_@rydmike.com_) = Material Design 3 seeded generated color schemes
  * **material_symbols_icons** (_@hiveright.tech_) = uses official Material Symbols Icons
    * [Flutter-based Demo](https://timmaffett.github.io/material_symbols_icons)
  * **tiny_color** (_@tinycommunity.dev_) = color manipulation/conversion
* Image & Video
  * **before_after** (_@xdsahil.dev_) = see difference between two images via draggable slider
  * **cached_network_image** (_@baseflow.com_) = show images from internet, keep them in cache directory
  * **flutter_spinkit** (_@ogbomo.com_) = funky loading icons package
  * **lottie** (_@xaha.dev_) = GIF-like After Effects (exported via bodymovin extension) JSON vector animations
    * [Flutter Web: Lottie Animation issue](https://stackoverflow.com/a/73779834/3559724)
  * **material_design_icons_flutter** (_@ziofat.dev_) = [Material Design Icons](https://pictogrammers.com/library/mdi) as Flutter Icons
  * **photo_view** (_@blue-fire.xyz_) = simple pannable, rotatable zoomable image widget
  * **rive** (_@rive.app_) (formerly **flare**) = state-machine-powered complex 2D interactive animation tool
  * **transparent_image** (-) = (see **FadeInImage**)
  * **video_compress** (_@getx.site_) = (mobile-only) video compression, remove audios (_not_ using ffmpeg)
* Onboarding
  * **intro_slider** (-) = onboarding slideshow intro
  * **introduction_screen** (-) = onboarding starting slideshow
  * **onboarding_overlay** (-) = large/fullscreen modal onboarding overlays
  * **showcaseview** (_@simform.com_) = small modal onboarding overlaid arrowed boxes
* Sound
  * **audio_service** (_@ryanhaise.com_) = play background audio while screen is off
  * **audioplayers** (_@blue-fire.xyz_) = with [AudioCache](https://stackoverflow.com/a/52842613/3559724)
  * **flutter_beep** (_@gonoter.com_) = very lite module to play system beeps & sounds
  * **flutter_soloud** (_@marcobavagnoli.com_) = low-latency audio for games & immersive apps
  * **flutter_sound** (_@tau.canardoux.xyz_) = play & record audio files/streams with various codecs
  * **just_audio** (_@ryanheise.com_) = feature-rich full audio player
  * Also see Flutter **services.dart** libary for system sounds
* Text
  * **diacritic** (_@agilord.com_) = removes common accents/diacritical signs from a string, replacing them with an equivalent character
  * **fuzzy** (_@borges.dev_) = Fuzzy (Elastic) search
  * **intl4x** (_@labs.dart.dev_) = dates/numbers/lists formatting, collation
  * **native_collator** = locale-aware string sorting/collation (note: only handles basic strings)
  * **pdf_text** (_@aluc.dev_) =  PDF
  * **stemmer** (-) = reduces word to their base form
  * **string_similarity** (_@jeremylandon.com_) = string distance/similarity (à la Levenshtein)
* Turnkey Components
  * **boxy** (_@tst.sh_) = set of layout widgets to align/position widgets against other widgets (eg flex, multi-child, dynamic inflation, slivers)
  * **flutter_sticky_header** (_@romainrastel.com_) = section headers that sticks while section scrolled
  * **flutter_zoom_drawer** (_@medyas.ml_) = custom drawer with rotation & shadow clones
  * **ftoast** (-) = toast pop-up messages (ie center screen notifications)
  * **gap** (-) = adds space inside **Flex** widgets (ie **Column**/**Row** or scroll lists, see **MaxGap** & **SliverGap**)
  * **panara_dialogs** (_@panarastudios.in_) = info/confirmation/warning/error modal dialogs

#### Codegen, DI, [State Management](https://docs.flutter.dev/data-and-backend/state-mgmt/options)

State can have a broad definition; in a mostly immutable environment, that could mean any variable.
Using some of these packages allows building an app without never actually using any **StatefulWidget** at all.
[Flutter state management for minimalists](https://suragch.medium.com/flutter-state-management-for-minimalists-4c71a2f2f0c1).

* **bloc** (_@bloclibrary.dev_) = implementation of [BLoC](https://bloclibrary.dev/getting-started/#packages) (aka Business Logic Component) state management pattern
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
* **flutter_redux** (_@brianegan.com_) = utilities to consume a Redux store
* **get** (_@getx.site_) = GetX (state management + DI + route management all-in-one framework à la WPF Prism)
* **mason** (_@brickhub.dev_) = generates boilerplate code based on bricks (ie interactive customizable & community-shared manifest files), augments `flutter create` with more flexible `mason add|make {brick_name}`
* **morphy** (-) = codegen tool (`copyWith`, `equals`, `toString`, constructors, json to & from)
* **redux** (_@fluttercommunity.dev_) = Redux state management architecture library using a centralized single source of truth store, updated via actions (which can be logged/serialized/stored/replayed)
* **stacked** (_@filledstacks.com_) = MvvM architectural framework for real-world scenarios
  * See <https://medium.com/flutter-community/a-beginners-guide-to-architecting-a-flutter-app-1e9053211a74>

* DB, Storage, [Caching](https://docs.flutter.dev/get-started/fundamentals/local-caching)
  * **drift** (previously _Moor_, _@simonbinder.eu_) = offline-first reactive (ie streaming changes) persistence library with type-safe queries for Dart & Flutter (works with desktop), built on top of SQLite
  * **graphql_flutter** (_@zino.company_)
  * **get_storage** (_@getx.site_) = key-value in memory storage wit disk backup, alternative to **shared_preferences**
  * **hive_flutter** (_@hivedb.dev_) = lightweight wrapper around **Isar** key-value NoSQL DB, simple for small apps, written in pure Dart
  * **hive_generator** (_@hivedb.dev_) = Hive TypeAdapters generator extension
  * **isar** (_@isar.dev_) = cross-plaform DB for flutter (replaces Hive with full Web support via IndexedDB), amazing for offline-first, sync-ready use cases
  * **objectbox** (_@objectbox.io_) = high-performance offline-first (on-device data persistence & AI) edge vector search NoSQL DB with [Data Synchronization](https://sync.objectbox.io) (no Web)
  * **sqflite** (_@tekartik.com_) = save structured data locally in SQLite DB (usual CRUD, or raw SQL). Enable foreign keys explicitely if they are needed
  * **sqflite_ffi** (_@tekartik.com_) = makes sqflite work on desktop (Linux, MacOS, Windows) for both Flutter/Dart VM
