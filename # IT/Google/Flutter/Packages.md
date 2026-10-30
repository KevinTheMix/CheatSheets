# [Flutter Packages & Plugins](https://pub.dev)

## Quick Tips

* [Flutter Gems](https://fluttergems.dev) = collection of 6700+ curated Dart/Flutter packages (by feature)
* [Using packages](https://docs.flutter.dev/development/packages-and-plugins/using-packages)
* Quickly add plugins from within Visual Studio Code via Command Palette (`Ctrl + Shift + P`) > *Add Dependency*
* Hot Reload/Restart are not enough to reload plugins with platform native device features => `flutter run` (or *F5* equivalent) after adding
* Blue tags under package name/version indicate which SDK (Dart or Flutter) & platform (Android, IOS, MACOS, WEB, WINDOWS) it targets/is compatible with

## Glossary

* [Flutter Favorite program](https://docs.flutter.dev/packages-and-plugins/favorites) = high-quality first priority packages
* **Package** = "pure Dart code" package, at a minimum it is a directory containing a *pubspec.yaml* file
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

From Dart's point of view, Flutter is actually a package like any other (ie it's referenced in *pubspec.yaml*, then imported via eg `import 'package:flutter/….dart';`).

* **async** = (eg `FutureOr<T>`)
* **collection** (array manipulation eg **IterableExtension** à la C# Linq)
* **convert** = en/decode between different data representations (eg String to JSON `jsonDecode()`, UTF-8, Base64, HTML escape)
* **dart:core**
* **dart:math**
* [dart:mirrors](https://api.dart.dev/dart-mirrors) = introspection (ie readonly reflection) & dynamic invocation, used by Dart VM, not available in Flutter framework
  * [Rémi Rousselet: dart:mirror is disabled](https://stackoverflow.com/a/47810160/3559724)
  * [Runtime reflection is disabled](https://docs.flutter.dev/data-and-backend/serialization/json#is-there-a-gsonjacksonmoshi-equivalent-in-flutter) because it interferes with tree shaking
  * Use **reflectable** (unverified) plugin for code-generated limited reflection capabilities
* **flutter_localizations** = internalization (i18n) & localization (i10n), permits parameterized & conditional output (generated via source ARB files)
* **foundation**
* **intl** = date formatting
* **material**
* **services** = platform features (clipboard, system sounds eg `SystemSound.play(SystemSoundType.click);`)
* **dart:time** = **DateTime** & **Duration** inline manipulation (eg `3.days.fromNow.day` for a future date in 3 days or `await 2.seconds.delay` to wait 2 seconds)
* **widgets** = no implementations, only (re-)exports all widget-related libraries

## Plugins

### Official

* **async** (*@dart.dev*) = additions to built-in [dart:async](https://api.dart.dev/stable/3.5.0/dart-async/dart-async-library.html) (`StreamGroup.merge()`, `AsyncCache<T>()` time-based cacheing, **StreamQueue**)
* **collection** (*@dart.dev*) = collection utilities (eg *max*)
* **crypto** (*@dart.dev*) = cryptographic hashing functions for Dart
* **fake_async** (*@dart.dev*) = provides a **FakeAsync** class to deterministically test code using asynchronous features (Future, Stream, Timer, microtasks)
* **grpc** (*@dart.dev*) = Google (HTTP/2 & Protobuf) protocol for connecting microservices or mobile clients to backends
* **http** (*@dart.dev*)
* **intl** (*@dart.dev*) = Dates & Numbers (& Bidi) formatting methods
* **logging** (*@dart.dev*)
* **path** (*@dart.dev*) = helper to combine/construct paths
* [tools.dart.dev](https://pub.dev/publishers/tools.dart.dev/packages) = packages published by Dart team
  * **build_runner** (*@tools.dart.dev*) = generate files on disk using Dart code
    * `dart run build_runner build` = generate once (`--delete-conflicting-outputs`)
    * `dart run build_runner watch -d` = generate continusouly on files change/save
    * `flutter pub run build_runner build --delete-conflicting-outputs`
    * Don't include folders where generated files reside to a git repo (by mentioning them in *.gitignore* config)
  * **dds** (*@tools.dart.dev*) = spawns Dart Developer Service used to communicate with Dart VM Service instance
  * **html** (*@tools.dart.dev*) = HTML 5 parser
  * **leak_tracker** (*@tools.dart.dev*) = framework for detecting memory issues
  * **markdown** (*@tools.dart.dev*) = client or server Markdown to HTML parser

* **built_value** (*@google.dev*) = popular value class codegen, similar to **freezed** (immutable value types, EnumClass, JSON serialization)
* **flutter_simple_treeview** (*@google.dev*) = tree structure of widget nodes
* **google_moblie_ads** (*@google.dev*)
* **json_serializable** (*@google.dev*) = generate to/fromJson code based on annotated class members
* **vector_math** (*@google.dev*) = vector math for 2D/3D apps (distance calculation, vector/matrix, collision detection)
* Firebase = via (FlutterFire) CLI
  * **firebase_core** (*@firebase.google.com*) = Firebase Core API connecting to multiple Firebase apps
  * **firebase_messaging** (*@firebase.google.com*) = Firebase push notification

* **dynamic_color** (*@material.io*) = Material color schemes based on platform dynamic color
* **google_fonts** (*@material.io*) = use [Google Fonts](https://fonts.google.com) (*fontSize|Weight*, *height*)
* **material_color_utilities** (*@material.io*) = low-level algorithms & utilities enabling Material Design 3 color system

#### [@flutter plugins](https://github.com/flutter/plugins#plugins)

* **animations** (*@flutter.dev*) = turnkey transitions pack (container (à la **Hero**), shared axis (h/v/zoom), fade/pop)
* **camera** (*@flutter.dev*)
* **espresso** (*@flutter.dev*) = bindings for Espresso tests (for Android apps)
* **file_selector** (*@flutter.dev*) = files & file dialogs
* **flutter_adaptive_scaffold** (*@flutter.dev*, *discontinued*) = Material 3 guidelines adaptive (reacts to inputs) Scaffold
* **flutter_lints** (*@flutter.dev*) = recommended set of lints for Flutter apps, packages, and plugins
* **flutter_svg** (*@flutter.dev*) = draw SVG files (`SvgPicture.asset('assets/icons/union.svg')` or from network)
* **go_router** (*@flutter.dev*) = declarative routing with deep links handling across multiple platforms (maintained by official Flutter team)
* **google_maps_flutter** (*@flutter.dev*)
* **google_sign_in** (*@flutter.dev*)
* **image_picker** (*@flutter.dev*) = pick image from library or take a new one with camera
* **in_app_purchase** (*@flutter.dev*) = storefront-agnostic (eg Google/iOS) API for purchases
* **ios_platform_images** (*@flutter.dev*) = share images between Flutter and iOS
* **local_auth** (*@flutter.dev*) = local on-device authentication (fingerprint reader, touch/face ID)
* **path_parsing** (*@flutter.dev*) = create & manipulate paths, parse Path from SVG data string
* **path_provider** (*@flutter.dev*) = find commonly used locations on the filesystem for different devices
* **pigeon** (*@flutter.dev*) = code generator tool making communication between Flutter & host platform easier/faster/type-safe (eg for creating plugins)
* **plugin_platform_interface** (*@flutter.dev*)
* **quick_actions** (*@flutter.dev*) = device home screen app custom quick actions (appearing when long-pressing app icon)
* **shared_preferences** (*@flutter.dev*) = simple key-value storage (works on all platforms!)
* **url_launcher** (*@flutter.dev*) = open external URL/e-mail/phone number/SMS/any app with special URL handlers (eg YouTube). Check `canLaunch()` first
* **video_player** (*@flutter.dev*)
* **webview_flutter** (*@flutter.dev*) = WebView widget

### Community

* **android_intent_plus** (*@fluttercommunity.dev*) = launch arbitrary intents on Android-only platform
* **connectivity_plus** (*@fluttercommunity.dev*) = discover network connectivity types (eg mobile, wifi, ethernet, vpn, bluetooth) for all platforms
* **device_info_plus** (*@fluttercommunity.dev*) = device/OS-specific information; `DeviceInfoPlugin()` then `.androidInfo` or `.iosInfo` ~ built-in `Platform.isAndroid|IOS`
* **equatable** (*@fluttercommunity.dev*) = simplifies (value) equality comparison boilerplate (just define *props* and remove `hashCode()` & `operator==()`)
* **flutter_blurhash** (*@fluttercommunity.dev*) = [BlurHash](https://blurha.sh) short string-based representation of an image to display while loading
* **flutter_launcher_icons** (*@fluttercommunity.dev*) = CLI to generate all platforms/sizes icons from a single image asset (`flutter pub run flutter_launcher_icons:main`)
  * See [Google Play icon design specifications](https://developer.android.com/distribute/google-play/resources/icon-design-specifications) = icon guidelines (512x512, 1024KB)
* **font_awesome_flutter** (*@fluttercommunity.dev*) = free [Font Awesome](https://fontawesome.com/icons) Icon pack as Flutter Icons
* **get_it** (aka **GetIt**) (*@fluttercommunity.dev*) = simple DI container/service locator via global singleton
  * **injectable** (*@codeness.ly*) = code generator for get_it
* **package_info_plus** (*@fluttercommunity.dev*) = meta-information about application package (name, version, build number)
* **rxdart** (*@fluttercommunity.dev*) = extends Dart **Streams** & **StreamControllers** with reactive programming
* **sensors_plus** (*@fluttercommunity.dev*) = accelerometer, gyroscope, magnetometer, barometer sensors
* **share_plus** (*@fluttercommunity.dev*) = share (text/URL/images/files) data between apps, using platform's share dialog
* **wakelock_plus** (*@fluttercommunity.dev*) = keep device screen awake
* **workmanager** (*@fluttercommunity.dev*) = schedule tasks at OS-level (thus works even with app backgrounded/closed)

#### Rémi Rousselet

* **flutter_hooks** (*@dash-overflow.net*) = makes boilerplate lifecycle-tied logic more compact & reusable (eg **AnimationController** via `useAnimationController`)
  * [Existing hooks](https://github.com/rrousselGit/flutter_hooks#existing-hooks)
* **freezed** (*@dash-overflow.net*) = codegen for data/model/union classes (adds `copyWith()`, equality, JSON from/to, `toString()`), requires **build_runner** & **json_serializable**
* **provider** (*@dash-overflow.net*) = state management wrapper/syntactic sugar around built-in **InheritedWidget**
  * [Making sense of all the (Provider) providers](https://medium.com/flutter-community/making-sense-all-of-those-flutter-providers-e842e18f45dd)
  * [create vs value](https://stackoverflow.com/a/61861315/3559724) = *create* for creating a new instance, *value* to use an already created instance
  * **ChangeNotifierProvider** = provides a **ChangeNotifier** (from Flutter SDK, able to call `notifyListeners()` rather than `setState()`) instance that will rebuild its Consumers upon change
  * **Consumer** = accesses a provided instance
  * **FutureProvider** = wrapper around **FutureBuilder**
  * **ListenableProvider** = custom Provider
  * **MultiProvider** = to avoid nesting many Providers, set multiple ones directly
  * **Provider** = exposes a model but don't listen to its changes, plus a *child* subtree
  * `Provider.of<T>(context)` = access to instance without necessarily having to rebuild UI (eg calling a method that updates its state, but we don't care about changes)
  * **Selector** = like **Consumer** but able to filter/notify updates to only a subset of values (prepares data for *builder*)
  * **StreamProvider** = wrapper around **StreamBuilder**
  * **ValueListenableProvider** = for **ValueNotifier**
* **riverpod** (*@dash-overflow.net*) = statically typed compile-time safe reactive caching & data-binding state management framework, uses dependency-injected Provider global variables not **BuildContext**, testing flexibility
  * `@riverpod` = shorthand for `Riverpod()` (with parameters such as `keepAlive: true`)
  * `ref.listen()` = register a callback executed on change (without rebuilds)
  * `ref.read()` = one-time access
  * `ref.watch()` = observe & rebuild on change
  * `ref.watch(provider.select((state) => bool projection)` = responds to change on only a substrata of a provider
  * **AsyncNotifier** (*Riverpod 2.0*) = a **Notifier** that is asynchronously initialized (eg for caching network requests or initializing data from DB)
  * **ChangeNotifierProvider** (*deprecated*) = provides a **ChangeNotifier** (for **provider** backwards-compatibility, avoid in new code)
  * **Consumer** = (update eg `ref.read(P.notifier).state = …`)
  * **FutureProvider** = **Provider** for asynchronous code (eg for database instance)
  * **Notifier** (*Riverpod 2.0*) = class exposing a state changing over time after reacting to custom events (eg user interactions)
  * **NotifierProvider** = listens/exposes a **Notifier**
  * **Provider** = provides a simple (readonly?) value (eg useful for setting up a DI instance, or caching computations)
    * `Provider.autoDispose()` = when a widget that uses that provider is removed from tree, that provider gets cleaned automatically
    * `Provider.family()` = derived provider useful to return subsets of a whole set returned by another provider (ie filtering, with cacheing)
  * **ProviderScope** = stores states of providers (at app root level, or for local subtrees, or both app root with local override)
  * **StateNotifierProvider** (*deprecated*) = provides an instance of **StateNotifier** (a class that manages a state & broadcast changes, not riverpod see package below)
  * **StateProvider** = simpler then **NotifierProvider** for simple/primitive states without having to write a **Notifier**
  * **StreamProvider**
  * `(Provider).autoDispose()` = destroy state when no longer used (eg closing Firebase connection or resetting state between screens transition)
  * See <https://medium.com/flutter-community/flutter-riverpod-tutorial-counter-app-ed3aa758f02f>
* **state_notifier** (*@dash-overflow.net*) = exposes immutable, debuggable, undo-redoable **StateNotifier** abstract class
  * Uses *state* setter property that notifies listeners when set (as opposed to manually calling `notifyListeners()` in case of vanilla mutable **ChangeNotifier**)
  * used in combination with Provider or Riverpod

#### Misc

* **auto_route** (*@codeness.ly*) = navigation/routing with deep linking & code generation
* **dart_code_metrics_presets** (*@dcm.dev*) = advanced linter for Dart/Flutter
* **dart_frog** (*@dart-frog.dev*) = fast, minimalistic backend framework for Dart
* **device_preview** (*@aloisdeniel.com*) = approximate how an app looks & performs on another device (select devices, orientation, language, theme, custom resolution & safe areas)
* **dio** (*@flutter.cn*) = HTTP networking (cancel request, adds auth/header interceptors to automatically attach JWT tokens & logging, file up/download with progress tracking, set timeout)
* **dotted_border** (-) = easily add (rect/round/oval) dotted borders around widget
* **easy_localization** (-) = easy translations for many languages, supports other file formats (JSON, CSV, Yaml, XML), plurals, genders
* **external_path** (-) = internal/external/public storage paths (ie paths that require explicit permissions, unlike **path_provider** that handles always-accessible directories)
* **extra_alignments** (*@gskinner.com*) = like **Center** but all other directions (eg **TopLeft** or **CenterRight**)
* **file_picker** (*@miguelruivo.com*) = cross-platform native single/multi file explorer/saver (with extension filtering)
* **file_saver** (*@hassanansari.dev*) = cross-platform file saving
* **fl_chart** (*@flchart.dev*) = line/bar/pie/scatter/radar charts
* **flutter_blue** (*@pauldemarco.com*) = bluetooth LE (Low Energy)
* **flutter_cache_manager** (*@baseflow.com*) = download & cache web files in app's cache directory (for a configurable duration)
* **flutter_gen** (*@wasabeek.jp*) = access assets programmatically instead of path strings (inspired by [SwiftGen](https://github.com/SwiftGen/SwiftGen))
* **flutter_keyboard_visibility** (*@jasonrai.ca*) = react to virtual keyboard visibility changes
* **flutter_local_notifications** (*@dexterx.dev*) = display notifications on most platforms (desktop & mobile, not web)
* **flutter_native_splash** (*jonhanson.net*) = splash screen before/while Flutter boots
* **flutter_rating_bar** (*@sarbagyastha.com.np*) = "5-stars" (or other icons) fractional rating bar
* **flutter_secure_storage** (*@steenbakker.dev*) = platform-specific secure storage using Keychain (iOS) and Encrypted Shared Preferences with Tink (Android)
* **flutter_slidable** (*@romainrastel.com*) ~= customizable **Dismissible** (`actionPane`, `actions: [IconSlideAction]`, `actionExtentRatio: 1/actions.length`)
* **flutter_treeview** (*@kevinandre.com*) = customizable hierarchical tree of widgets
* **focusable_control_builder** = reacts to all sorts of inputs (focus, tab key, mouse events, keyboard shortcut)
* **geolocator** (*@baseflow.com*) = access native platforms specific geolocation services (last location, etc)
* **graphql** (*@zino.company*) = GraphQL (data query & manipulation for declarative data fetching APIs, created by Facebook) client, also used for CQRS
* **graphql_flutter** (*@zino.company*) = API & widgets for **graphql**
* **husky** (-) = manage git hooks (eg lint commit messages & code, run tests, etc in reaction to git commit/push)
* **intl_utils** (*@localizely.com*) = binding between your translations from .arb files and Flutter app
* **jaspr** (*@schultek.dev*) = web framework for building HTML/CSS websites in Dart (with both client-side & server-side rendering)
* **location** (*@bernos.dev*) = device geographical location; `serviceEnabled()`, `requestService()`, `hasPermission`, `requestPermission()`, `getLocation()`
* **mqtt_client** (*@darticulate.com*) = server & browser based on MQTT client for Dart (IoT publish/subscribe messaging protocol, use for project Clock)
* **permission_handler** (*@baseflow.com*) = cross-platform post-install granular app permission requests
* **pixel_snap** (*@widgetbakery.dev*) = fix Windows 150% non-integral pixel scaling blur
* **printing** (*@nfet.net*) = generate & print documents to mobile-compatible printers
* **pub_version_plus** (*@mrgnhnt.com*) = increment fragments of a version (& build) number via single command
  * Usage = `dart run pub_version_plus:main {major|minor|patch|build} (--pre-release {beta|alpha|dev})`
  * Works well with CI/CD **when installed as a dev-dependency**
* **pubghost** (*novadev.be*, Flutter Belgium) = CLI tool to detect ghost/orphan (*pubspec.yaml*) dependencies/classes/widgets/translation (*.arb*) files
* **rate_my_app** (*@skyost.eu*) = kindly ask users to rate your app after some conditions are met (install time, number of launches, etc)
* **rect_getter** (*@debuggerx.com*) = obtain a widget's rectangular coordinates
* **rnd** (*@gskinner.com*) = makes working with random values easier (global **Random** instance + helpful extension methods)
* **searchfield** (*@maheshjamdade.com*) = simple customizable autocomplete search widget
* **sentry** (*@sentry.io*) = Sentry SDK for pure Dart ([Sentry](https://sentry.io) performance monitoring & error tracking)
* **sentry_dart_plugin** (*@sentry.io*) = build-time tool uploading debug symbols/sources/source maps to Sentry (`dart run sentry_dart_plugin`, see [Sentry](Sentry.md) & [setup](https://docs.sentry.io/platforms/dart/guides/flutter/debug-symbols/dart-plugin), [config file](https://github.com/getsentry/sentry-dart-plugin/tree/main))
  * Plugin uploads *.symbols* (Dart debug information file) & *obfuscation.map.json* (Dart symbol obfuscation map), via `dart run sentry_dart_plugin` (after `flutter build`)
  * Settings are read from several places by priority:
    1. Environment variables (**SENTRY_DSN**, **SENTRY_ORG**, **SENTRY_PROJECT**, **SENTRY_RELEASE**, **SENTRY_AUTH_TOKEN**)
    2. CLI (ie `dart run sentry_dart_plugin --sentry-define=<key>=<value>` eg `release=my-app@1.0.0`)
    3. *pubspec.yaml*
    4. *sentry.properties* = git-ignored sensitive file (appropriate for holding **auth_token**), created by Sentry Wizard, read by Sentry Dart Plugin
  * `options` (in `SentryFlutter.init()`) = runtime SDK settings, separate from Plugin settings (eg `dsn`, `release`, `environment`, `enableLogs`, `sendDefaultPii`, `tracesSampleRate`)
    * `release` should match Plugin's **release** (default *name@version* from *pubspec.yaml*) so uploaded symbols/source maps apply to reported events
  * Properties
    * **auth_token** = token required for using Sentry CLI administrative tool
    * **build_path** = base build directory (default *build*)
    * **dart_symbol_map_path** = path to Dart obfuscation map file to upload (for Android/iOS, as generated via `--extra-gen-snapshot-options=--save-obfuscation-map`)
    * **log_level** = logging level (ie *trace*, *debug*, *info*, *warn*, *error*)
    * **org** = organization slug
    * **project** = project slug
    * **symbols_path** = folder holding symbols (as specified via `--split-debug-info`)
    * **upload_debug_symbols** = allows interpreting obfuscated stack traces (files, functions, line numbers)
    * **upload_source_maps** (web applications only) = translates minified (Javascript) code back to original source code
    * **upload_sources** = helps display source code snippets in stack traces (aka Source Context)
* **sentry_flutter** (*@sentry.io*) = Sentry SDK for Flutter (see [Sentry](Sentry.md))
  * Install via Sentry Wizard (which also installs **sentry_dart_plugin**)
    * Adds *sentry_flutter* & *sentry_dart_plugin* (dev dependency, see above) to *pubspec.yaml*
    * Creates git-ignored *sentry.properties* holding **auth_token**
    * Patches *main.dart* with `SentryFlutter.init`
    * Prompts for optional features (tracing, session replay, logs)
    * Adds a sample error (to remove afterwards)
  * [sqflite integration](https://docs.sentry.io/platforms/dart/guides/flutter/integrations/sqflite-instrumentation)
  * [Troubleshooting](https://docs.sentry.io/platforms/dart/guides/flutter/troubleshooting)
* **slang** (*@tienisto.com*) = simplify L10n, breaks down large translation files into smaller ones (via namespaces), access values via nested keys (à la jQuery)
* **sliver_tools** (*@pietervanloon.com*) = missing sliver package (related: [SliverFooter](https://stackoverflow.com/a/49621060/3559724) by Rémy Rousselet)
* **system_tray** (-) = design a system tray menu for desktop (Linux, macOS, Windows) opening from the system tray app icon
* **tflite_flutter** (*@tensorflow.org*) = TensorFlow Lite interpreter and perform interference, with multi-platform support (mobile & desktop)
* **undo** (*@rodydavis.com*) = undo/redo history stack to go back/forward
* **universal_platform** (*@gskinner.com*) = platform detection (eg *isAndroid*, *isWeb*, *isWindows*) that works for web (unlike *dart.io.Platform* at the time)
* **uuid** (*@yuli.dev*) = generate UUIDs
* **version** (*@dart.ninja*) = parse & compare semantic versions
* **window_size** (-) = gets/sets desktop (Linux/macOS/Windows) apps window size (also see **desktop_window** package)

* Animated Containers
  * **drag_and_drop_lists** (-) = drag & drop items between multiple lists
  * **reorderables** (-) = drag & drop lists, rows/columns, wraps
* Animation & Clip
  * **animate_do** (*@fernando-herrera.com*) = crisp bounce/in/out animations (à la jQuery, inspired by Animate.css)
    * [animations library API](https://pub.dev/documentation/animations/latest/animations/animations-library.html)
  * **animated_clipper** (*@oodavid.com*) = clip transitions for interactive buttons & co
  * **animated_text_kit** (*@ayushagarwal.ml*) = text animations (rotate/fade/type/scale/colorize/liquidfill/wavy/flicker)
  * **confetti** (*@funwith.app*) = easy confetti particles
  * **flutter_animate** (*@gskinner.com*) = easy compositionable animated effects (blur, colors, fade, flip, scale, shimmer, slide)
    * Defines microseconds-based duration num extensions (eg `300.ms`)
    * Eg [flip tiles game](https://guillaume.bernos.dev/using-flutter_animate-for-a-flutter-game-animation)
  * **flutter_custom_clippers** (*@dlohani.com.np*) = collection of clip shapes (wave, panels)
  * **flutter_shaders** (-) = makes working with FragmentProgram API easier
    * Defines an **AnimatedSampler** class that is able to render a widget to an image on-the-fly
  * **flutter_spinkit** (*@jogboms.xyz*) = collection of loading indicators/spinners (instapired by [CSS SpinKit](https://github.com/tobiasahlin/SpinKit))
  * **flutter_switch_clipper** (*@fluttercandies.com*) = fill/transition effects package
  * [FlutterFX](https://github.com/flutterfx/flutterfx_widgets)
  * **liquid_swipe** (*@sahdeepsingh.com*) = wave motion transition
  * **motion** (*@cendre.me*) = gyroscope-based "wobbling" effect
  * **particle_field** (*@gskinner.com*) = high performance custom particle effects
  * **particles_flutter** (-) = interactive particles animation
  * **shimmer** (*@hunghd.dev*) = skeleton loader effect
  * **wave_container** (-) = sine water-like wave animations
  * **wave_transition** (-) = radial layer reveal effect
  * **wave_transition_animation** (-) = radial layer reveal effect
* Buttons
  * **pretty_animated_buttons** (*@yl0.me*) = 12 turnkey button (border neumorphic, slide)
  * [Top 20 CSS buttons](https://dev.to/webdeasy/top-20-css-buttons-animations-f41) = gaussian gooey buttons
* Font & Theme
  * **flex_color_scheme** (*@rydmike.com*) = Material Design 3 seeded generated color schemes
  * **material_symbols_icons** (*@hiveright.tech*) = uses official Material Symbols Icons
    * [Flutter-based Demo](https://timmaffett.github.io/material_symbols_icons)
  * **tiny_color** (*@tinycommunity.dev*) = color manipulation/conversion
* Image & Video
  * **before_after** (*@xdsahil.dev*) = see difference between two images via draggable slider
  * **cached_network_image** (*@baseflow.com*) = show images from internet, keep them in cache directory
  * **flutter_spinkit** (*@ogbomo.com*) = funky loading icons package
  * **lottie** (*@xaha.dev*) = GIF-like After Effects (exported via bodymovin extension) JSON vector animations
    * [Flutter Web: Lottie Animation issue](https://stackoverflow.com/a/73779834/3559724)
  * **material_design_icons_flutter** (*@ziofat.dev*) = [Material Design Icons](https://pictogrammers.com/library/mdi) as Flutter Icons
  * **photo_view** (*@blue-fire.xyz*) = simple pannable, rotatable zoomable image widget
  * **rive** (*@rive.app*) (formerly **flare**) = state-machine-powered complex 2D interactive animation tool
  * **transparent_image** (-) = (see **FadeInImage**)
  * **video_compress** (*@getx.site*) = (mobile-only) video compression, remove audios (*not* using ffmpeg)
* Onboarding
  * **intro_slider** (-) = onboarding slideshow intro
  * **introduction_screen** (-) = onboarding starting slideshow
  * **onboarding_overlay** (-) = large/fullscreen modal onboarding overlays
  * **showcaseview** (*@simform.com*) = small modal onboarding overlaid arrowed boxes
* Sound
  * **audio_service** (*@ryanhaise.com*) = play background audio while screen is off
  * **audioplayers** (*@blue-fire.xyz*) = with [AudioCache](https://stackoverflow.com/a/52842613/3559724)
  * **flutter_beep** (*@gonoter.com*) = very lite module to play system beeps & sounds
  * **flutter_soloud** (*@marcobavagnoli.com*) = low-latency audio for games & immersive apps
  * **flutter_sound** (*@tau.canardoux.xyz*) = play & record audio files/streams with various codecs
  * **just_audio** (*@ryanheise.com*) = feature-rich full audio player
  * Also see Flutter **services.dart** libary for system sounds
* Text
  * **diacritic** (*@agilord.com*) = removes common accents/diacritical signs from a string, replacing them with an equivalent character
  * **fuzzy** (*@borges.dev*) = Fuzzy (Elastic) search
  * **intl4x** (*@labs.dart.dev*) = dates/numbers/lists formatting, collation
  * **native_collator** = locale-aware string sorting/collation (note: only handles basic strings)
  * **pdf_text** (*@aluc.dev*) =  PDF
  * **stemmer** (-) = reduces word to their base form
  * **string_similarity** (*@jeremylandon.com*) = string distance/similarity (à la Levenshtein)
* Turnkey Components
  * **boxy** (*@tst.sh*) = set of layout widgets to align/position widgets against other widgets (eg flex, multi-child, dynamic inflation, slivers)
  * **flutter_sticky_header** (*@romainrastel.com*) = section headers that sticks while section scrolled
  * **flutter_zoom_drawer** (*@medyas.ml*) = custom drawer with rotation & shadow clones
  * **ftoast** (-) = toast pop-up messages (ie center screen notifications)
  * **gap** (-) = adds space inside **Flex** widgets (ie **Column**/**Row** or scroll lists, see **MaxGap** & **SliverGap**)
  * **panara_dialogs** (*@panarastudios.in*) = info/confirmation/warning/error modal dialogs
* Upgrade/Update
  * **in_app_update** (*@jonasbark.de*) = enables In App Updates on Android via official Android APIs (check/download/suggest/force users to update an app)
  * **upgrader** (*@larryaassen.com*) = informs users there is a newer app store version of the app (with no configuration necessary)

#### Codegen, DI, [State Management](https://docs.flutter.dev/data-and-backend/state-mgmt/options)

State can have a broad definition; in a mostly immutable environment, that could mean any variable.
Using some of these packages allows building an app without never actually using any **StatefulWidget** at all.
[Flutter state management for minimalists](https://suragch.medium.com/flutter-state-management-for-minimalists-4c71a2f2f0c1).

* **bloc** (*@bloclibrary.dev*) = implementation of [BLoC](https://bloclibrary.dev/getting-started/#packages) (aka Business Logic Component) state management pattern
  * Has two modes: either extending simple **Cubit** (functions & states) or more advanced **Bloc** (event classes & states)
  * `Bloc<Event, State>` = takes **Stream** of *Events* in, transforms them as **Stream** of *States* out
* **flutter_bloc** (*@bloclibrary.dev*) = uses **bloc** package, adds widgets
  * **BlocBuilder** = read state & rebuilds on change (à la **StreamBuilder**), possibly many times (*builder* should be idempotent)
  * **BlocConsumer** = *builder* & *listener* (à la nested **BlocListener** & **BlocBuilder**)
  * **BlocListener** = like **BlockBuilder** but rebuilds only once per state change
  * **BlocProvider** = provides a bloc (BL) to its children/descendants (*create*, *child*, *lazy*)
  * **BlocObserver** = interface for observing behavior of `Bloc<Event, State>` instances (ie all app state changes)
  * **BlocSelector** = more granular **BlocBuilder** for some value change (same logic as **provider** package)
  * **MultiBlocListener** = multiple **BlocListener** into one
  * **MultiBlocProvider** = multiple **BlocProvider** into one
  * **ReposityProvider** & **MultiRepositoryProvider** = provides a repository to its children/descendants
* **flutter_command** (-) = **ValueListenable**-based Command pattern (à la .NET)
* **flutter_redux** (*@brianegan.com*) = utilities to consume a Redux store
* **get** (*@getx.site*) = GetX (state management + DI + route management all-in-one framework à la WPF Prism)
* **mason** (*@brickhub.dev*) = generates boilerplate code based on bricks (ie interactive customizable & community-shared manifest files), augments `flutter create` with more flexible `mason add|make {brick_name}`
* **morphy** (-) = codegen tool (`copyWith`, `equals`, `toString`, constructors, json to & from)
* **redux** (*@fluttercommunity.dev*) = Redux state management architecture library using a centralized single source of truth store, updated via actions (which can be logged/serialized/stored/replayed)
* **stacked** (*@filledstacks.com*) = MvvM architectural framework for real-world scenarios
  * See <https://medium.com/flutter-community/a-beginners-guide-to-architecting-a-flutter-app-1e9053211a74>

* DB, Storage, [Caching](https://docs.flutter.dev/get-started/fundamentals/local-caching)
  * **drift** (previously *Moor*, *@simonbinder.eu*) = offline-first reactive (ie streaming changes) persistence library with type-safe queries for Dart & Flutter (works with desktop), built on top of SQLite
  * **graphql_flutter** (*@zino.company*)
  * **get_storage** (*@getx.site*) = key-value in memory storage wit disk backup, alternative to **shared_preferences**
  * **hive_flutter** (*@hivedb.dev*) = lightweight wrapper around **Isar** key-value NoSQL DB, simple for small apps, written in pure Dart
  * **hive_generator** (*@hivedb.dev*) = Hive TypeAdapters generator extension
  * **isar** (*@isar.dev*) = cross-plaform DB for flutter (replaces Hive with full Web support via IndexedDB), amazing for offline-first, sync-ready use cases
  * **objectbox** (*@objectbox.io*) = high-performance offline-first (on-device data persistence & AI) edge vector search NoSQL DB
    * [ObjectBox Data Sync](https://objectbox.io/sync) = edge/offline/cloud data synchronization (no Web)
  * **sqflite** (*@tekartik.com*) = save structured data locally in SQLite DB (usual CRUD, or raw SQL). Enable foreign keys explicitely if they are needed
  * **sqflite_ffi** (*@tekartik.com*) = makes sqflite work on desktop (Linux, MacOS, Windows) for both Flutter/Dart VM
