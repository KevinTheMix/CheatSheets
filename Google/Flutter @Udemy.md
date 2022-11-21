# [Flutter @Udemy course](https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps)

## 01

## 02

## 03: Different devices & Debugging Apps

## 04: Widgets, Styling, Adding Logic

1. Intro
2.
3.
4.
5.
6.
7.
8.
9.
10.
11.
12.
13. String interpolation
14.
15.
16. **TextField**
17. **TextEditingController** tied to TextField's _controller_
18.
19.
20.
21. **SingleChildScrollView**
22. Replace **Column** with **ListView** with built-in scrolling. `ListView()` vs lazy `ListView.builder((BuildContext, int) {…})`
23. Validation & Formatting (text inputs validation, form submission, `double` formatting)
24. **AppBar**'s _actions_ & **FloatingActionButton**
25. Refactor the app and Pop-up a modal bottom sheet to add items. Use a **GestureDetector** to fix hide sheet bug
26. Stateful modal input texts, `widget.` and **BottomSheet** auto-closing
27. Themeing
28. Fonts (install & use in themes)
29. (.html)
30. Images (install & use)
31. Designing the chart
32. List `for` loop (transactions to _map_ by weekday)
33. (.html on `for` loops)
34. `get` recent transactions via `where()`
35. Designing the bar (`decoration`)
36. Populating the bar (`fold()` & totals)
37. Finishing the bar layout (**Flexible**, **FittedBox** around **Text**)
38. **Flexible** (_flex_ available space sharing, _fit_ `FlexFit.loose` vs `FlexFix.tight`), **Expanded** (== Flexible with `FlexFit.tight`)
39. Replace **Card** with **ListTile**, **CircleAvatar**
40. Refining the bar (set title parent height so it does not shrink bc of FittedBox, bar order using **List** `reversed`)
41. Summary rewind & evolve as a Flutter developer
42. Add DatePicker input fields
43. Show DatePicker using `Future<DateTime?> dateFuture = showDatePicker()`
44. Using the date picked
45. Deleting via **ButtonIcon**
46. Fixed-height vs Expanded **ListView**
47. Wrap-up
48. (.html)

* App: Personal Expenses Tracking
  * Forcing device orientation (_main.dart_)
  * Date formatting with locales/localization (see _track\_expenses\_app.dart_ & _add.dart_ `DateFormat.yMd('fr_BE').format(date)`)
  * `Future<DateTime?> showDatePicker()` (_add.dart_)

## 05: Responsive & Adaptative UI

1. Intro
2. _Responsive_ (~size) vs _Adaptive_ (~platform)
3. how to improve the expenses app
4. responsive height by using MediaQuery.height and subtracting AppBar.preferredSize and MediaQuery.padding
5. (.html) `MediaQuery.of(context).textScaleFactor`
6. LayoutBuilder
7. Device orientation `WidgetsFlutterBinding.ensureInitialized(); SystemChrome.setPreferredOrientations([…]);`
8. Landscape-specific content (toggle **Switch**)
9. Adapting/Fixing some heights
10. Store `MediaQuery.of(context).orientation` - as well as any widgets really - in _final_ variables to be used in multiple places
11. Respecting softkeyboard insets (add bottom padding to the tune of `MediaQuery.of(context).viewInsets.bottom`)
12. `MediaQuery.of(context).size.height|width`
13. Store the whole `MediaQuery.of(context)` in a local variable
14. `Switch.adaptive()`, `import 'dart:io';` then `Platform.IsIOS`
15. [Cupertino](https://docs.flutter.dev/development/ui/widgets/cupertino) **PageScaffold**, **NavigationBar** (**PreferredSizedWidget**), custom Material-like **IconButton** using **GestureDetector** & **Icon** with `CupertinoIcons.add`
16. **SafeArea**
17. **CupertinoApp**, **CupertinoThemeData**
18. **CupertinoTextField**, **CupertinoButton**
19. Build own adaptive widgets (eg **AdaptiveFlatButton**)
20. Wrap-up
21. (html)

## 06: Widget & Flutter Internals Deep Dive

1. Intro
2. 60fps build
3. Widget & Element Tree
4. Widgets, Elements, Renders, States; widget references updating
5. Widget tree building sequence (via `print(…)`); MediaQuery-provoked rebuilds; isolate custom widgets that rebuild more often
6. `const` widgets & constructors optimization (widgets marked as `const` in the widget-tree are reused instead of being reinstantiated)
7. Improving readability vs performance
8. Extracting a widget
9. using local _builder_ methods to improve readability instead of extracting into very separate widgets, use `...` to return multiple widgets
10. Widget lifecycle (widget _ctor_, `createState()`, state _ctor_, `initState()`, `didUpdateWidget()`, `dispose()`)
11. (.html) `super.initState()`
12. App lifecycle **WidgetsBindingObserver**, `WidgetsBinding.instance.add|removeObserver(this)`, `didChangeAppLifecycleState(AppLifecycleState s)`
13. Context can navigate ancestors, its `.widget` configuration, & `findRenderObject()`. And **Element** _implements_ **BuildContext**
14. (Keys intro:) problem with Stateful widgets collections modifications
15. Widget, Element & State updates diagram
16. Keys to identify reordered child widgets (tip: use `findChildIndexCallback` with `ListView.builder()` to make keys work properly)
17. Wrap-up
18. (.html)

**UPDATE**: item #9 above is inaccurate: it is more efficient to single out code in separate widgets rather than method.
See <https://stackoverflow.com/a/53234826>

## 07: Navigation & Multiple Screens

1. Introduction
2. Planning the Meals app
3. Adding _Category_ model & data, **GridView()** with `gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent()`
4. _CategoryItem_ widget, decoration with gradients (**LinearGradient**, `color.withOpacity(double)`)
5. MaterialApp.home
6. Theme
7. _CategoryMealsScreen_; **GestureDetector** vs **Inkwell**; use **Navigator** to imperatively navigate to widget
8. Navigate to widget with parametered constructor
9. Global nav to named routes with arguments
10. Use or change initial route '/', and using static const String holding route name for each screen
11. Adding _Meal_ model & data
12. Filtering (sample) meals based on picked Category
13. Displaying meal Cards (with images via `Image.network()`)
14. Completing the meal Card items
15. Navigation to meal details screen (aka page/route)
16. `onGenerateRoute` & `onUnknownRoute`
17. Completing meal detail screen: reusable 'builder' function (w/ child) instead of _Extract Widget_
18. Tabs via **DefaultTabController**, **TabBar**, **Tab** & **TabBarView**
19. Tabs via **BottomNavigationBar** & **BottomNavigationBarItem**
20. Adding a Scaffold's **Drawer**; building method vs extracting widget (~mostly if dependencies eg Theme); using custom bold (`FontWeight.w700`)
21. Drawer navigation
22. `pushReplacementNamed()` to replace previous page in page history stack; btw _initialRoute_ has side-effects (it pushes multiple routes)
23. `pop()` data back, result as (_dynamic_) Future, `didChangeDependencies()` instead of `initState()` with inherited `of()` (unless `listen: false`)
24. **SwitchListTile**
25. Managing filters with logic (centralized, lifting up states in main.dart)
26. Managing favorites (also in main.dart)
27. Problem pop()-ing pages, we get past snapshots that are not refreshed. Also, everything gets rebuilt because main.dart controls all states
28. Wrap Up; Drawer, like modal bottom sheet, can be closed via `pop()` (and opened programmatically via `Scaffold.of(c).openDrawer()`)
29. (.html)

* Multiple ways to set the starting screen:
  * `home: Screen()`
  * `initialRoute: /a/b/c` the entire route must exist, but all the intermediate routes also get individually pushed to the stack
  * `routes: { '/': (c) => … }`

## 08: State Management

1. Introduction
2. Drawing the Shop app
3. Adding _Product_ model
4. **GridView.builder()** with `gridDelegate: SliverGridDelegateWithFixedCrossAxisCount()`, **Gridtile** & **GridTileBar**, `Colors.black54`
5. Theme & fonts
6. Navigation
7. State management rationale
8. _provider_ package introduction
9. (long!) Install & setup _provider_ (**ChangeNotifier**, `notifyListeners()`, **ChangeNotifierProvider**, `Provider.of<T>(context)`)
10. Inheritance (_extends_) vs Mixins (_with_)
11. (.html) providing non-ChangeNotifier objects `Provider<String>(create: (ctx) => 'Koko', child: ...);` (in place of **ChangeNotifierProvider**)
12. Listening in different places; centralizing potentially reusable logic (eg findBy…) in notifying class; `Provider.of<T>(context, listen: false)`
13. Turning basic model also into **ChangeNotifier**
14. Pro & cons of `ChangeNotifierProvider.value(…)`: _create_ on-the-fly new instance, _value_ with existing instances (or `List|GridView.builder()`)
15. (more granular) **Consumer** instead of `Provider.of<T>()`; _child_ can be used for nested widget/subtree within Consumer that should not update
16. **PopupMenuButton|Item**, **StatefulBuilder**; beware of _const_ child widget with `GridView.builder()` & child `Provider.of(c, listen:false)`
17. Adding _Cart_ model/notifier; map `containsKey`, `putIfAbsent()` & `update()`
18. **MultiProvider**
19. Cart Consumer; @Max's intermediary custom Badge widget with child; Consumer with unchanging child (outside of _builder_)
20. Cart screen: (pill/rounded-rectangle-shaped) **Chip**, **Spacer**
21. Cart Item widget; extract widget as ListView/collection child; **CircleAvatar**>**Padding**>**FittedBox**>**Text** combo; `import as/show`;
22. Swipe to remove cart items with **Dismissible**
23. Detail screen; note: **SizedBox** in lieu of **Container** with just _height_/_width_
24. Adding _Orders_ model/notifier
25. Creating orders from _CartScreen_
26. Adding _OrdersScreen_ & _OrderItem_ widget
27. Adding a **Drawer**, with an **AppBar** (with _automaticallyImplyLeading_ set to false); `Navigator.of(context).pushReplacementNamed('/')`
28. Making order item expandable via stateful widget (_Icons.expand\_less_ & _Icons.expand\_more_)
29. Wrap Up
30. (.html)

Don't forget:

* `listen:false`
* Provider by (existing) value vs create (new instance)
* Consumer child == non-rebuilding
* **CircleAvatar**>**Padding**>**FittedBox**>**Text** combo

## 09: User Input & Forms

1. Intro
2. `Scaffold.of(c).showBottomSheet(…)` (shorhand `showBottomSheet(…)`) via nearest Scaffold (close via **Navigator** pop(), similar to other popups: `Scaffold.of(c).openDrawer()`, `Scaffold.of(c).showSnackBar(SnackBar())`, `showModalBottomSheet(…)`, `showDialog`, `showAboutDialog()`)
3. (.html) use `ScaffoldMessenger.of(c).show|hideCurrentSnackBar(const SnackBar(content: …)` instead of Scaffold (see _product\_item.dart_)
4. **AlertDialog**, `confirmDismiss: (direction) => showDialog<bool>(… actions:[ … Navigator.of(c).pop(true/false) … ] …)`; custom `onUpdate`
5. User Products screen; CircleAvatar with **NetworkImage** provider (ie not an `Image.network()`); `ListView.separated(…)`
6. Edit Product screen & planning the (stateful) form with built-in validation
7. **Form**, **TextFormField** with `decoration` and _TextInputAction.next_ keyboard arrow
8. (.html) Form fields inside of a Column, because ListView could erase part of the progress for long forms when out-of-view
9. `keyboardType: TextInputType.number`, **FocusNode**
10. Multiline
11. (.html) Fixing image preview
12. Image Url with preview field; **TextFormField** is space-greedy
13. Submitting Form; `FormState.save()` calls all fields' `onSaved`
14. `validator`; using decoration for styling error message
15. Validators can have multiples flows
16. (.html) Regex
17. Add new product to the provided ProductsList
18. Update existing product; Form field `initialValue` property
19. Delete product
20. Outro
21. (.html)

Don't forget:

* Controllers & FocusNodes `.dispose()`
* Emulator controls
  * Long-press into emulator GUI to paste some text
  * `Ctrl + Click` = two-fingers
* `keyboardType: const TextInputType.numberWithOptions(decimal: true)` (iOS compatible)
* `context` (like `widget`) is available anywhere in a **State** object
* VS Code `Alt + Shift + Up/Down` = "paint"-copy
* Mind the network images thumbnail size, because they are costly to show

## 10: Http Requests

1. Intro
2. local vs web storage
3. Don't connect Flutter (directly) to DB
4. Creating Realtime Database on Firebase
5. HTTP requests (GET/POST/PATCH/PUT/DELETE) explanation
6. (.html) **http** package
7. Create one (JSON) product (to Firebase) via HTTP POST, via **package:http** & **dart:convert** built-in JSON handling library
8. **http** future callback via `then((response))`; read DB id
9. **Future** & _async_ Deep Dive
10. **CircularProgressIndicator** while `http.post()` future is working
11. Future error handling
12. `async-await` & `try-catch-finally` (instead of catch|onError)
13. Read all via HTTP GET
14. Parsing http into Product, conditonal **CircularProgressIndicator** while loading
15. easy _Pull-to-refresh_ via **RefreshIndicator**
16. Update one via HTTP PATCH
17. Optimistic deletion (delete first & rollback if it fails); explicitly checking HTTP status code (< 400) (as only `get()` & `post` raise errors)
18. Throwing custom exceptions (with `toString()`), catching them and displaying a SnackBar (with cached ScaffoldMessengerState if using async-await)
19. The Flutter _http_ package only throw errors for _get_ & _post_ requests (not _patch_ & _delete_) => use HTTP response status code (< 400)
20. Updating remote Product granularly via `http.patch('isFavorite': isFavorite)`
21. Creating remote Order, with loading indicator
22. Read remote Orders, mapping nested sub-items
23. **FutureBuilder** (`snapshot.hasError`, `snapshot.hasData`) instead of tedious _Stateful_ _isLoading indicator + error handling
24. Outro (async HTTP requests, optimistic upating, error handling (try-catch, snacks/showDialogs), loading indication)
25. (.html)

* Emulator controls
  * `Ctrl + Left/Right` = rotate device
  * `Ctrl + Up/Down` = zoom device
* Futures
  * Do specify generic type of `then<R>()` preceding an error catching block
  * `showDialog()` returns a Future _immediately_ => we need to handle it as such and `await` it (especially if something follows)

## 11: User Authentication

1. Intro
2. Mobile client <-> Server Authentication
3. Setting (email/password) authentication on Firebase
4. Copying the Auth screen, **Container** `transform: Matrix4.rotationZ(pi / 180)..translate(…)`
5. (html)
6. Sign up
7. Log in
8. Handling (Firebase) named errors with `try {…} on KokoException catch(e) {…} catch(e) {…}`, `showDialog()` popup
9. Forking Auth screen whether user is authenticated, from having parsed signup/login response into token, expiry, …
10. [ChangeNotifierProxyProvider](https://pub.dev/documentation/provider/latest/provider/ChangeNotifierProxyProvider-class.html)
11. Passing `?auth={idToken}` query parameter to all HTTP requests
12. Scoping favorites per user (matching two collections in memory)
13. Scoping products per user (filtering at Firebase server level using queries); **FutureBuilder** to force initial load while still Stateless
14. Scoping orders per user (simply move orders down one level in DB)
15. Logout
16. Auto logout
17. Auto login via _shared\_preferences_ plugin, `Navigator.of(c).pushNamedAndRemoveUntil('/', (route) => false)`
18. Outro
19. (html)

* **ButtonStyle** `tapTargetSize: MaterialTapTargetSize.shrinkWrap` (see _auth\_screen.dart_)

## 12: Animations

1. Intro
2. **AnimationController** with manual listener + setState()
3. **AnimatedBuilder**
4. **AnimatedContainer**
5. **FadeTransition**, **SlideTransition**, **AnimatedContainer**'s `constraints: BoxConstraints(min/maxHeight: …)`
6. **FadeInImage**
7. Hero animation
8. **CustomScrollView**, **SliverAppBar** with **FlexibleSpaceBar**, **SliverList** with **SliverChildListDelegate**
9. More easy **AnimatedContainer**
10. (html; now use `settings.name == '/'` instead of `settings.isInitialRoute`)
11. Custom route transition (one `extends MaterialPageRoute<T>` or all `extends PageTransitionsBuilder` in **PageTransitionsTheme**)
12. Outro
13. (html; Flutter Animations)

## 13: Native Device Features

1. Intro
2. Planning _Great Places_ app
3. Setting up app empty files structure (main, models, providers, screens)
4. Set **ButtonStyle** _tapTargetSize_ to _MaterialTapTargetSize.shrinkWrap_ (removes tappable margin), **TextField** & **InputDecoration**
5. Install & setup **image_picker** plugin
6. Storing the image on filesystem via **path** (IO path manipulation) & **path_provider** (easily get devices common paths) plugins
7. Passing image data up via callbacks pipeline
8. Handling no image picked
9. Testing on physical devices
10. Install **sqflite** plugin, create static async `insert(table, values)` helper method
11. Add `getAll(table)` static helper method
12. Install **location** plugin, setup Android & iOS permissions
13. Use **location** plugin to obtain current latitude/longitude
14. Use [Google Maps Platform](https://mapsplatform.google.com/) API to load static snapshot image from latitude/longitude
15. Install (official) **google_maps_flutter** plugin (requires platforms permissions, Android Google Play), **GoogleMap** widget
16.
17.
18.
19. Outro
20. (html)

* Stop debug & re-run after installing a platform-type plugin
