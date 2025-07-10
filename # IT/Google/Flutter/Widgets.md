# Flutter Widgets (& Classes)

Building blocks of Flutter.

## Quick Tips

* [Appainter](https://appainter.dev) = play with theme settings (also see <https://rxlabz.github.io/panache/#>)
* [Flutter Samples](https://flutter.github.io/samples)
* [Widgets](https://docs.flutter.dev/ui/widgets)
  * [Material](https://docs.flutter.dev/ui/widgets/material)
  * [Material Design Icons](https://fonts.google.com/icons)
  * [Material Design Icons](https://pictogrammers.com/library/mdi)
  * [Material 3 Demo](https://flutter.github.io/samples/web/material_3_demo)
* _Not everything is a widget_ (eg **BoxDecoration**, **ThemeData**, **TextStyle**)

## Misc

* **Badges** = colored circular-shaped superscript text (_badgeColor|Content_, _position_, _animationDuration|Type_, _toAnimate_, _showBadge_), previously a 3rd-party package
* **Divider** & **VerticalDivider** = basically HTML's `<hr>` (_thickness_, _(end)Indent_), set once for all via **MaterialApp**'s **ThemeData**'s _dividerTheme_
* **PreferredSizeWidget** = base interface for widget that have an ideal size when unconstrained, such as **AppBar**
* **Rect** = can be assigned as `offset & size` (**Offset** & **Size**)
* **WidgetSpan** = immutable widget embedded inline within text (eg to embed **InputChip**s within a **TextField**)
* Drag
  * **Draggable\<T>** (_data_, _child(WhenDragging)_, _feedback_)
  * **DragTarget\<T>** (_builder_, _onWillAccept_, _onAccept_, _onLeave_)
  * **LongPressDraggable** = drag child anywhere (_feedback_ alternate view while dragging, within a **Positioned** to pilot its _left/top_ via **Offset** set via _onDragEnd_)
* Flutter: Widgets of the Week
  * **Actions**
  * **Collection**
  * **Focus** & **Shortcuts**
  * **FocusableActionDetector**
  * **LinearGradient**
  * **TabPageSelector**
* **ErrorWidget**

## App

* `runApp(…)` = takes in widget instance and inflate it to screen size (ie calls its `build()` method, etc)
  * [Eric Seidel: runApp twice](https://stackoverflow.com/a/44379895/3559724) = prevents (default to chosen) theme flash-switching during app launching
* **Material** = piece of material (clipping, elevation, ink effects), `Material.of`, **MaterialInkController**, _shape_ (**Beveled/RoundedRectangleBorder** with _borderRadius_ **BorderRadius**)
* **MaterialApp** = builds Material design on top of base **WidgetsApp** (defines _theme_ used by all Material children)
  * Sets _theme_ as **ThemeData** (_useMaterial3_ now default since Flutter 3.16)
  * `MateriapApp(debugShowCheckedModeBanner: false)` = [remove debug banner](https://stackoverflow.com/a/48893964/3559724)
* **WidgetsApp**= wraps a number of base functionality widgets (ie **MediaQuery**)

* **InheritedModel**`<T>` = more granular **InheritedWidget** for particular fields (via _aspect_), `@override updateShouldNotifyDependent()`
* **InheritedWidget** = passing data from ancestors to descendants via the **BuildContext** (matching nearest tree ancestor of same type), used by framework (eg **Theme**)
* **(Render)RepaintBoundary** = gives a widget and its RenderObject (and subtree) its own layer, possibly avoiding/short-circuiting extra unnecessary painting by limiting change contagion (adds some CPU overhead)
  * Tip: activate _Repaint Rainbow_ tool to locate regions that should not repaint

* **Builder** = get a **BuildContext** updated with a local **InheritedWidget** ancestor's presence, from **within same `build()` method**
  * That ancestor is an InheritedWidget like **Scaffold**, **Navigator**, **ThemeData**, **MediaQuery**, **Provider\<T>**
  * Prevents simple parent/child widgets splitting overkill by remaning inline
* **FutureBuilder** = display something (typically a **CircularProgressIndicator**) while loading a future and something else when done
  * _snapshot_ has _connectionState_, _(has)data_, _(has)error_ (ie contains Exception raised in Future) properties
* **StatefulBuilder** = rebuild only a subtree by using a scoped **StateSetter** (`builder: (ctx, setState)`), even inside a Stateless widget
* **StreamBuilder** = rebuilds its children whenever stream data arrives (_initialData_, `snapshot.connectionState|data|error`, `snapshot.hasData|Error`)
* **SharedAppData** = centralized (small) store of key/values that widgets can register to in order to react (ie rebuild) to changes of specific keys

* Listenable = Observer pattern
  * **Listenable** (abstract) = object that maintains a list of listeners (`addListener()`, `removeListener()`)
    * **ValueListenable<T>** (abstract, extends **Listenable**) = interface for subclasses of **Listenable** that expose a (current/single) _value_
    * **Animation\<T>** (abstract, extends **Listenable**, implements **ValueListenable\<T>**) = value with status & direction
    * **ChangeNotifier** (mixin, implements **Listenable**) = listenable with `notifyListeners()`
    * **ValueNotifier\<T>** (extends **ChangeNotifier**, implements **ValueListenable\<T>**) = a **ChangeNotifier** that holds a single (mutable) value triggering notifiations
  * **ListenableBuilder** = widget rebuilding its subtree when a given **Listenable** changes (no `setState()`, set optional _child_ to const subtree for performance)
  * **ValueListenableBuilder** = widget syncing its content with a **ValueListenable** object (no `setState()`, set optional _child_ to const subtree for performance)
  * **NotificationListener** = listens to notifications produced by some (possibly custom) descendant widgets (eg **ScrollNotification** by **ListView**/**Router**)

### Menus

* `showSearch(ctx, SearchDelegate)` = (framework provided) shows a full screen search page that returns result when closed
* **MenuBar** = menu bar managing cascading child menus (à la Windows top menu)
* **MenuItemButton** = **MenuBar** button (also see **SubmenuButton** for menu item with submenu)
* **Scaffold** = basic Material design layout with a set of pre-configured widgets
  * _appBar_= top menu (_leading_, _title_, _centerTitle_, _actions_ widgets, _bottom_, _shape_ eg **RoundedRectangleBorder**)
  * _body_
  * _bottomNavigationBar_ = either a **BottomAppBar** (for one screen actions) or a **(Bottom)NavigationBar** (for navigation between screens)
    * **BottomAppBar** (deprecated 2025.05) = bottom actions menu with up to 4 action icon buttons & a FAB (_shape_ eg **CircularNotchedRectangle** works with docked FAB)
    * **BottomNavigationBar** (Material 2) = bottom navigation menu (_items_ **-Item**s, _type_ **-Type**, _(un)selectedItemColor|FontSize_)
    * **NavigationBar** (Material 3) = (bottom) navigation menu usable from any screen, using a list of **NavigationDestination**
    * **NavigationRail** = (left) side navigation menu with same functionality as bottom navigation bar, for larger sized screens
      * Properties = _extended_ (whether labels appear), _destinations_ (list), _onDestinationSelected_, _elevation_, _(un)selectedLabelTextStyle_, _useIndicator_, _indicatorColor_, _leading/trailing_ widgets
    * Use **MediaQuery** to determine using either a **NavigationBar** or a **NavigationRail** depending on screen size
  * _(end)Drawer_ = `Scaffold.of(context).openDrawer|openEndDrawer()` & `Navigator.pop(context);`, it's possible to use a (then non-modal) Drawer without a Scaffold
    * **DrawerButton** = icon button (ie 3 horizontal bar) that opens/closes a **Drawer**
    * _child_ = typically a **ListView** with **DrawerHeader** (within **SizedBox** to set height) & **ListTile**s children
    * _drawerEdgeDragWidth_ = area within which a horizontal swipe will open **Drawer**
  * _bottomSheet_ = persistent bottom sheet (`Scaffold.of(context).showBottomSheet(…)` or `show(Modal)BottomSheet(context: …, builder: …, sheetAnimationStyle: …)` shorthand to nearest Scaffold)
    * **DraggableScrollableSheet** = draggable container for scrollable content (**ScrollController** passed via _builder_, _initial|min|maxChildSize_)
  * _extendBody_ = make sure body background is seen around docked FAB
  * _extendBodyBehindAppBar_ = makes app bar transparent so content appears through it
  * _floatingActionButton_ = actually accepts any widget (eg **AnimatedIcon**) or subtree (eg a column with two **FAB**s)
  * _floatingActionButtonLocation_ = position FAB within _bottomNavigationBar_ (`FloatingActionButtonLocation.centerDocked`)
* **ScaffoldMessenger** = show/hide 'flytext' notifications (bottom **SnackBar** & top **MaterialBanner**) for descendant **Scaffold**s
  * Eg `ScaffoldMessenger.of(context).show|hideSnackBar(SnackBar(…))`
* **SnackBar** = pop-up a bottom message (_content_, _behavior_ ie docked/floating, use a **Builder** to pass it _context_)

### Navigation & Routing

There are two built-in solutions: imperative **Navigator** (push/pop API that works as a stack) and/or declarative `MaterialApp.router()`.

* **Dialog** = general-purpose Material Design dialog (_child_, awaitable `show[About|General]Dialog<T>(context: context, builder: (context) {…} )`)
  * **AboutDialog** = boring legalese stuff (`showAboutDialog()`, `application`, `children`, `LicenseRegistry.addLicense()`)
  * **AlertDialog** = popup with a title, content and yes/no actions (_title_, _content_, _actions_, _elevation_, _backgroundColor_, _shape_, _barrierDismissible_), also **CupertinoAlertDialog**
  * **SimpleDialog** = simplified popup with a basic list of choices (_contentPadding_, _children_ of **SimpleDialogOption**s)
  * `show(Cupertino)Dialog()` = general, with Navigator
  * `showGeneralDialog()` = full control over advanced animations & custom layout
  * `showModalBottomSheet()` & `showCupertinoModalPopup()`
  * `showLicensePage()` = prebuilt dialog showing open-sources licenses
  * Awaitable result of `showDialog()` is passed via `Navigator.pop(c, result)`
* **MaterialPageRoute\<T>** = modal route replacing entire screen with a platform-adaptive transition
  * _fullscreenDialog_ = whether that route opens as a full-screen dialog (ie _X_ close button instead of a back arrow)
* **PageRouteBuilder** = creates route & page (with _pageBuilder_) with transition effect (via _transitionsBuilder_)
* **Page\<T>** = describes configuration of a Route
* **Route<T>** = abstraction for an entry managed by a Navigator, ie an abstract interface between navigator & routes that get pushed/popped off
* **Router\<T>** = dispatcher for opening/closing pages, parses route information into data & converts data into Pages passed to Navigator
* **Navigator** = widget managing a set of children with a stack discipline (_pages_ turned into `Route<T>`s via `Page.createRoute()`, `(maybe)Pop()`)
  * (awaitable) `push(c, {route})`, `pop(c, ({result}))` (closes bottom sheets, drawer, snackbar, dialogs)
  * _navigatorKey_ (in **MaterialApp** or **GoRouter.configuration**) = gets access to Navigator (push/pop) or context (via `currentState!.context`) without BuildContext
* **NavigatorState** as in `GlobalKey<NavigatorState>`
* **MaterialApp**
  * _home_ = single route, maps to `/`
  * _initialRoute_ = name of first route to show if a Navigator is built (ie via _home_, _routes_, _onGenerateRoute_, _UnknownRoute_)
  * _routes_ = statically named routes (has priority over _onGenerateRoute_ in case of duplicates)
  * _onGenerateRoute_ = dynamic route generator callback when app is navigated to a named route, able to use **RouteSettings** to build them
  * `MaterialApp.router()` = uses more advanced **Router** (with deep linking capabilities eg for web) instead of a **Navigator** (_routerConfig_ eg a **GoRouter**)
* `ModalRoute.of(context).settings.arguments` = access arguments provided via **MaterialPageRoute** builder _settings_
* `[await] Navigator.of(context).pushNamed({route_name}[, arguments: {args}])` = navigate to named route
* `[await] Navigator.of(context).pushReplacementNamed({route_name}[, arguments: {args}])` = replace current navigator route (with named route) and disposes it afterwards
* `Navigator.restorablePushNamed(context, {route_name}[, arguments: {args}])` = navigate to named route (with restoration in case of backgrounded app kill)

## Display, Images, Painting

* **BackdropFilter** = applies an **ImageFilter** to everything beneath/behind its _child_ z-axis, use with parent **Stack** & _fill_
* **CachedNetworkImage**
* **Canvas** = eg `canvas.drawArc()` draws circle (arc)
* **CircleAvatar** = circle container (_radius_, _back/foreground-Image_ with child text initial fallback, append `.image` to **Image**), adequate for user pfp
* **Clips** = wraps a _child_ widget to only show its parts covered by built-in (**ClipOval**, **ClipRRect**) shape or custom (**ClipPath**) path
  * **ClipOval** = auto-adaptative circle/oval cutting (_clipper_ `extends CustomClipper<Rect>`), can be animated for fun effects
  * **ClipRRect** = **R**ounded **r**ectangle (_child_, _borderRadius_, _clipBehavior_)
  * **ClipPath** = create own (svg-like) shape (`clipper: KokoClipper()` where `class KokoClipper extends CustomClipper<Path>`)
    * [Example](https://stackoverflow.com/a/70820679) basic
    * [Example](https://stackoverflow.com/a/69476516) using `quadraticBezierTo(…)`
* **ColorFiltered** = apply color filter over images/widgets groups (eg: `colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation)`)
* **CustomPaint** = low-level paint calls (_size_, _painter_); surround with `FittedBox(SizedBox(width: image.width.toDouble(), height:…))`, (see _Custom painting in Flutter_ video)
* **FadeInImage** = placeholder for images (_placeholder_ from directory/memory, _fadeInDuration_, _fadeInCurve_, **transparent_image** package)
* **FlutterLogo** (100th Widget of the Week!) = built-in Flutter logo (`size`)
* **Icon** = (_icon_ **IconData** with `Icons.…` - or `Icons.adaptive.…` for Android/iOS)
* **Image** = image (_fit_, _colorBlendMode_, _semanticLAbel_) via asset (sizes in _pubspec.yaml_), network (_loadingBuilder_), file, memory
* **ImageFiltered** = applies an **ImageFilter** to its _child_
* **ImageFilter** = filter effect to apply to a raster image (blur, glassy, rotate, scale, skew, stretch, translate, `matrix()`)
* **LinearGradient**, **RadialGradient** (_tileMode_, `createShader()`)
* [ResizeImage](https://api.flutter.dev/flutter/painting/ResizeImage-class.html) = decode image at specified dimensions instead of its native size
* **ShaderMask** = applies to child a (color/gradient/image) mask generated by a **Shader** (`shaderCallback(bounds) => ___Gradient().createShader(bounds)`)
* Visibility
  * **Offstage** = hides a widget from view even though it will exist and run animations therefore costing resources (eg to measure its dimensions before bringing it on screen)
  * **Opacity** & **AnimatedOpacity** = alpha (0 is like CSS' `invisiblility: hidden`)
  * **Visibility** = toggles widgets display on/off

## Inputs & Texts

* Buttons
  * **CupertinoButton** = iOS-style button
  * **DropDownButton\<T>** = a Material Design button for selecting from a list of items
  * **ElevatedButton** = Material Design elevated button (avoid on already-elevated content eg dialogs/cards)
  * **FilledButton** = fill-colored button (`FilledButton.tonal`)
  * **FloatingActionButton** (**FAB**) = Scaffold stacked button (_tooltip_, `FloatingActionButton.extended()` with label & optional icon)
  * **IconButton** = a Material Design icon button (_icon_ (can be **AnimatedIcon**), _tooltip_, _onPressed_, `IconButton.filled|filledTonal|outlined`)
  * **InkResponse** = Material area responding to touch, with external spill
  * **InkWell** = specialized rectangular **InkResponse** with clipped splash (_borderRadius_, _splashColor_, _onHover|LongPress|(Double)Tap_)
  * **OutlinedButton** = a (chip-looking) flat TextButton with an outlined border (_borderSide_, `.icon()`)
  * **RawMaterialButton** = base for a button with a child widget (eg **Text**, _fillColor_, _splashColor_, _shape_)
  * **SegmentedButton\<T>** = pill/tabs-looking radio buttons (`style: SegmentedButton.styleFrom(…Color)`)
  * **TextButton** = basic text button (_onPressed_)
  * **ToggleButtons** = on/off/radio buttons (_isSelected_ = `List<bool>`, _onPressed_ controls selection logic, _abcColor_, _abcBorder_)
  * Use `___Button.icon()` constructor to get a basic button with both text AND icon
  * **ButtonStyle** = _back/foregroundColor_
  * Deprecated
    * _FlatButton_ = replaced with **TextButton**
    * _OutlineButton_ = replaced with **OutlinedButton**
    * _RaisedButton_ = replaced with **ElevatedButton**
    * Old buttons used many static properties for each color & state, this was replaced with dynamic methods handling complex interaction states (see **MaterialState**)
* **CheckBox** = Material Design bi-/tri-states checkbox
* **Chip** = rounded rectangle bordered labeled icon (`_Button.icon()`-like without interactivity, _avatar_, _label_)
  * **ActionChip** = contextual dynamic button/trigger for toggle actions without navigation (ie filter, tag, smart suggestion eg 'Like' or 'Save'), less prominent than a **Button**
  * **ChoiceChip** = single choice among chips set (eg single select filter like **SegmentedButton**)
  * **FilterChip** = multi-selection filter among chips set
  * **InputChip** = more complex piece of information, dismissible, with an optional avatar (eg label or several to/cc e-mail fields)
* **Circular/LinearProgressIndicator** = Material progress bar (_value_, _backgroundColor_, `ThemeData.accentColor` by default)
  * _valueColor_ takes in an **Animation\<T>** instance, which can be result of controlled Tween (via `drive()` or `animate()`)
* Date Picking = `Future<DateTime?> dateFuture = showDatePicker(context, initialDate, firstDate, lastDate)`
* **Form** = form that can be saved/reset/validated (_onChanged_ or via associated **GlobalKey** `currentState.validate()`)
  * **FormState** = state associated with a **Form**, can be accessed via **GlobalKey**, has boolean `validate()` method triggering all descendant fields validators
  * **FormField** = single form field (_onSaved_, _validator_ checked on associated **FormFieldState** `validate()`)
  * **TextFormField** = **FormField** that contains a **TextField**
  * _validator_ = function taking in a field value and returning an error string (displayed in red) if it has errors, null otherwise
* **RefreshIndicator** = pull-to-refresh
* **Slider** = value-in-a-range selection (_onChanged_, _min/max_, _divisions_, _label_, `Slider.adaptive()`), **CupertinoSlider** (iOS-style), **RangeSlider** (from/to slider)
* **Stepper** = quizz like steps
* **Switch** = radio button (`Switch.adaptive()`)
* Text
  * **AutoComplete** = completes as you type (_optionsBuilder_, _displayStringForOption_, _optionsViewBuilder_, _onSelected_, _fieldViewBuilder_)
  * **SelectionArea** = platform-adaptive selectable area
  * **SelectableText** = select a single run of text (_showCursor_, _cursorWidth_, _cursorColor_, _cursorRadius_, _toolbarOptions_, _onTap_, _scrollPhysics_, `.rich()`)
  * **Text** = basic text instance (_TextOverflow.ellipsis_ longtex…)
  * **TextEditingController** = gives access to associated **TextField** programmatically (`addListener(VoidCallback)` in `initState()` then `dispose()`)
    * Can be instantiated locally in a build/builder, not just at (State) class level
    * Sometimes not even necessary (as we can access **TextField** text value within its _onChanged_ callback)
  * **TextField** = input text field (_autofocus_, _controller_, _decoration_, _inputFormatters_, _keyboardType_, _onChanged|EditingComplete|Submitted_)
  * **TextInputFormatter** = **LengthLimiting-** (length), **Filtering-** (regex pattern)
    * [How to use InputFormatters](https://stackoverflow.com/a/50123743/3559724)
  * **TextStyle** = à la CSS (_fontSize_, _fontWeight_)
  * **Tooltip** = accessibility-friendly alt text (_child_, _message_, _verticalOffset_, _height_), some Widgets have a _tooltip_ property
  * **RichText** = complex text composed of multiple nested styled **TextSpan**s (`text: TextSpan(style: TextStyle(…), children: <TextSpan>[…]`)
  * Apply a sentence-wide gradient by using a **ShaderMask**
* Mouse/Pointers
  * **AbsorbPointer** = disable all pointer/touch events over a widgets group (_absorbing_, _ignoringSemantics_ for screen readers ignoring)
  * **IgnorePointer** = ignore pointer/touch events on a specific child (but [click can bubble up](https://stackoverflow.com/a/55431032/3559724))
  * **GestureArena** = disambiguation between gestures using a battle royale strategy
  * **GestureDetector** = detects user inputs (eg (double) tap, long press, h/v drag, pinch)
    * **RawGestureDetector** = detects gestures described using given gesture factories, for creating custom gesture recognizers
  * **InteractiveViewer** = makes child interactable (ie user can pan/scale/zoom)
  * **Listener** = reports raw (low-level OS) pointer events (_onPointerDown/Up/Move_)
  * **MouseRegion** = mouse detection for desktop apps (_cursor_: **SystemMouseCursors** static const properties)
* Keyboard
  * **FocusNode** = obtain keyboard focus & handle keyboard events in a stateful widget (create `late`, set in `initState()`, then `dispose()`)
  * Remove keyboard upon scrolling a list/grid = set **Grid|ListView** _keyboardDismissBehavior_ to `ScrollViewKeyboardDismissBehavior.onDrag`
  * [Scroll a list when keyboard pops up](https://stackoverflow.com/a/70612950/3559724)
  * [Move bottom sheet when autofocused keyboard is up](https://stackoverflow.com/a/57515977)

## Containers

* **DataTable** = auto-adjust grid with sorting (_columns_, _rows_, _sortColumnIndex_, _sortAscending_), wrap in **SingleChildScrollView** to handle overflow
  * **DataCell** = _showEditIcon_, _placeholder_, cells are widget (ie customizable)
  * **DataColumn** = _label_, _numeric_
  * **DataRow** = _selected_, _cells_
* **ExpansionPanel** = expandable 'v' arrow tiles (`headerBuilder:(ctx,isOpen)`, _body_, _isExpanded_, _canTabOnHeader_ indicates whether whole header is tappable)
* **ExpansionPanelList** = **ExpansionPanel** container (_expansionCallback_, _animationDuration_, _dividerColor_, _elevation_, _expandedHeaderPadding_)
* **GridView** = grid (`.builder()`, `.count()`, `.extent()`, _gridDelegate_ layout see below)
  * **SliverGridDelegateWith[Fixed|Max]CrossAxisExtent** = lay out tiles with fixed/maximum cross axis extent (_childAspectRatio_, _crossAxisCount_, _main|crossAxisSpacing_, _maxCrossAxisExtent_)
* **GridTile** = (with **GridTileBar** as _header_ or _footer_)
* **ListView** = scrollable list of children (_scrollDirection_, _reverse_, _physics_, _cacheExtent_, _prototypeItem_)
  * For a dynamic lazy list with for many/infinite items (_itemCount_, _itemExtent_)
    * `ListView.builder(…)`
    * `ListView.separated` (_separatorBuilder_)
    * `ListView.custom` (_childrenDelegate_ sliver)
    * When using a builder, make sure to not name first parameter `context`, especially with inner `MediaQuery.of(context)`
  * _findChildIndexCallback_ = find index by key (in case of reordering)
  * _addAutomaticKeepAlives_ to false to garbage collect items no longer on screen
  * Implicit constructor also performs some display virtualization but creates all items immediately (non-lazily) upfront
  * **Dismissible** = left/right swipeable items (_key_ to track what's visible/hidden, (secondary)_background_, _direction_ , `onDismissed()` to remove underlying item)
* **ListTile** = Material list item (_leading/trailing_ (eg icons), _(sub)title_, _isThreeLine_, _dense_, _shape_ for rounded border, _onTap/LongPress_, `ListTile.divideTiles()`)
  * **CheckboxListTile** = **Checkbox** + **ListTile** (tappable anywhere, ie a checkbox with a label, `secondary`, `controlAffinity`, `value`, `onChanged`, coloring)
  * **ExpansionTile** = **ListTile** with an arrow to toggle show/collapse its children section (possibly containing other nested tiles)
  * **RadioListTile** = **Radio** + **ListTile** (tappable anywhere, ie a radio button with a label)
  * **SwitchListTile** = **Switch** + **ListTile** (tappable anywhere, `value`, `onChanged` with `setState()`, `(in)activeThumbImage`)
* **ListWheelScrollView** = price-is-right 3D carousel list (_itemExtent_, _diameterRatio_, _offAxisFraction_, _userMagnifier_ & _magnification_)
* **PageView** = horizontal or vertical swipable pages/screens (à la gallery/slideshow, _initialPage_, _scrollDirection_), controllable/queryable via **PageController** (_viewportFraction_)
* **ReorderableListView** = drag & drop list items (_children_, `onReorder: (old, new) {setState()}`, optional _header_, set _buildDefaultDragHandles_ to false & add **ReorderableDragStartListener** for custom drag)
* **Stack** = z-axis stacking (_fit_ to children `StackFit.loose` by default, or to parent `StackFit.expand`, _alignment_, _overflow_)
  **IndexedStack** = **Stack** showing only one of its several _children_ at a time, preserving each of their individual states (set _index_ via `setState()`)
* **Table** = simpler fixed grid layout (_defaultVerticalAlignment_, _defaultColumnWidth_, _columnWidths_, _border_ )
* **Scrollable** = manages scrolling in one dimension (eg **ListView**, **DraggableScrollableSheet**, **SingleChildScrollView**)
  * **CustomScrollView** = (hybrid) appbar/grid/list scrolls via _slivers_ (**SliverAppBar**, **SliverList**, **SliverGrid**, `center: key`)
    * **SliverAppBar** = scroll-reactive top menu used with parent **CustomScrollView**, with (zoom, blur) effects (_expandedHeight_, _flexibleSpace_, _floating_ to reappear on each scroll-up, _pinned_)
    * **SliverFixedExtentList** = SliverList with all items of same extent (ie height)
    * **SliverList** & **SliverGrid** = advanced scrolling control (_delegate_: `Sliver[Child|Builder]ListDelegate`, `.count()` & `.extent()` ctors)
    * **SliverAnimatedList|Grid** = **SliverList|Grid** that animates items when added/removed
  * **RestorableScrollController** = special type of scroll controller with embedded restoration capabilities
  * **Scrollbar** = add scrollbar to _finite_ scrollable widget (**List|Grid|CustomScrollView**) (`isAlwaysShown`, `showTrackOnHover`, **ScrollbarTheme**)
  * **ScrollController** = pilots one (or multiple) scrollable widgets programmatically
  * **ScrollPhysics** (default), **Bouncing-** (iOS), **Clamping-** (Android), **NeverScrollable-** (prevents scrolling upon dragging)
  * **SingleChildScrollView** = makes child scrollable
    * Reserve this widget for scenarios where content is to be actually displayed in full (ie not scrollable), but smaller devices may prevent that, hence scroll is added as extraordinary out-of-bounds countermeasure
    * If the intent is to have a scrollable list, then _lazy_, _sliver-based_, _virtualized_ **ListView**/**CustomScrollView** are vastly more efficient
* Tabs
  * **DefaultTabController** = inherited **TabController** for descendants widgets that don't specify one explicitly
  * **TabBar** = Material Design primary tab bar
  * **TabBarView** = page view displaying currently selected tab's child/widget
  * **TabController** = coordinates tab selection between a **TabBar** & **TabBarview**

### Boxes/Wrappers

* **Align** = position a child in parent or **Stack** (_heightFactor_, _t/b/r/l_  or specific _alignment_ within [-1,1] range, see **AlignmentTween** & **AnimatedAlign**)
* **Alignment** = point within a rectangle (top-left _(-1.0,-1.0)_ to bottom-right _(1.0,1.0)_ but values can be outside those bounds)
* **AspectRatio** = formats _child_ to be a specific box ratio (_aspectRatio_ as `width / height` for readability), incompatible with (parent) **Expanded** (unless using **Align** between)
* **Baseline** = positions child widget according to child baseline (ie its bottom)
* **BoxConstraint** = class with immutable layout constraints for **RenderBox** layout (notable properties: _minHeight_, _minWidth_, _maxHeight_, _maxWidth_)
  * `BoxConstraints.loose()` (**min<max**), `BoxConstraints.tightFor[Finite]()` (**min==max**), `BoxConstraints.expand()` (**max**)
* **Card** = Material circle/rectangle (_shape_) with rounded corners and z-axis (_elevation_) shadow, size depends on child unless parent specifies
  * This is actually a simplified [Material](https://api.flutter.dev/flutter/material/Material-class.html) widget, which can take other shapes
* **Center** = transform tight parent constraints into loose constraints (ie **Center** occupies tight space defined by parent, letting child occupy a smaller or equal - but not bigger - area)
* **ColoredBox**
* **ConstrainedBox** = adds min & max h/w constraints on top of its parent's, which may get ignored if more restrictive/tight constraints already apply (eg screen)
* **Container** (à la `<div>`) = wraps child widget in margin/padding/size/color/(foreground)decoration/shape (_aligment_ will fit parent, _constraints_ (eg `BoxConstraints.expand()`), _transform_)
  * Has no `createRenderObject()` method, it is a convenience compositional wrapper for other layout widgets ~ its properties (see its `build()` source code)
* **DecoratedBox** = provides a _decoration_ to change border, color, gradient, etc (also see **DecoratedBoxTransition**)
* **EdgeInsets** = padding (_zero_, `all()`, `symmetric(vertical, horizontal)`, `fromLTRB()` left-top-right-bottom, `only(right:…, top:…)`)
* **Expanded** = (inherits from **Flexible**), essentially **Flexible** with `this.fit=FlexFit.tight` instead of default _loose_
* **Flex** (base class for flex space containers eg **Column/Row**) = distributes available space to their children
  * Space is attributed to their inflexible (_flex:0_) children first, then distribute rest of space (ie parent constraint - inflexible children size) to **Flexible** children
  * Unbounded/unlimited constraints are given to their inflexible children to choose their own size (asking them to shrinkwrap)
  * In bounded context, they themselves take up max size in their main axis by default (ie `mainAxisSize: MainAxisSize.max`)
  * In unbounded context, they try to fit their children (who must all be inflexible)
  * Their cross axis must always be bounded, since they take up all space in that direction
  * See [Understanding constraints: Flex](https://docs.flutter.dev/ui/layout/constraints#flex)
* **Flexible** = receives available space from **Flex** parent (ie Column/Row), via _fit_ (_tight_ divides equally, _loose_ depends on content size) and _flex_ factor (_1_ by default, _0_ is inflexible)
* **FittedBox** = scales/positions child within smaller/larger parent (_fit_ = `BoxFit.{value=contain|cover|fitH/W|fill|none}`, _alignment_)
* **FractionallySizedBox** = size by percentage (_heigh/widthFactor_), align in parent or wrap in **Flexible**; use no child for whitespacing
* **IntrinsicHeight** & **IntrinsicWidth** = sizes its child to its maximum intrinsic h/w by letting it speculatively sizing to its its largest child
  * Useful for edge cases (eg when each sibling wants to align in different directions in a scrollable context), but can be expensive (worse case O(N²))
* **LimitedBox** = give limited constraints (_maxH/W_) to child with infinite (specifically, only) parent constraints (eg **ListView**/**Column**/**Row**/**UnconstrainedBox**)
* **Overlay** = lets child widgets float on top of other widgets (similar to **Stack**), useful eg for onboarding
* **OverflowBar** = behaves either like a **Wrap** (if all children fit within single row) or a **Column** (if they don't)
* **OverflowBox** = lets child be any size it wants, also removing parent constraints, but shows no warnings (simply hides excess/shows as much as it can)
* **Padding** = padding
* **PhysicalModel** = rectangle with rounded corners with 3D shadow effects based on (z-axis pixels) _elevation_, with antialising clipping (also see **PhysicalShape** for shapes other than rectangle)
* **Placeholder** = temporary stand-in while building the UI (use _fallbackHeight/Width_ inside unbounded parent, _color_, _strokWidth_)
* **Positioned** (à la HTML absolute) = position children within a **Stack** (_t/b/r/l/height/width_, `fill()` takes up whole **Stack** area)
* **RotatedBox** = affects layout ie moves everything around it (`quarterTurns`, in contrast `Transform.rotate()` affects rendering, not layout ie as if original was still in place)
* **SizedBox** = give child a size (_w/h_, _double.infinity_ == max, _SizedBox.expand()_ == max _w/h_), use without child for spacing
  * `SizedBox.expand()` vs **Expanded** (which can only be used inside a **Flex**, see <https://stackoverflow.com/a/72416413/3559724>)
  * `SizedBox.shrink()` = container without size, which can be used to keep layout steady (eg in a ternary operator instead of _null_)
  * `SizedBox.square()` = square container (_dimension_)
  * Can be used to cut expensive layout costs by defining a fixed size for a widget (and its entire subtree)
* **Spacer** = returns an **Expanded** with `SizedBox.shrink()` as child, to add custom spaces within Column/Row (beyond their simple _mainAxisAligment_)
* **UnconstrainedBox** = lets child be any size it wants, removing inbound parent (tight) constraints, with black/yellow warning if too large
* **Wrap** = "word wrap" children (_direction_, _alignment_ _spacing_, _runSpacing_), useful for buttons & chips

## Style & Theme

* Use `double.infinity` to set to max available dimensions (eg screen entire width)
* **Border** (extends **BoxBorder**) = 4-sided box border (_top/bottom/left/right_ **BorderSide**s, _borderRadius_ **BorderRadius** eg `BorderRadius.circular(n)`)
  * **BoxBorder** (abstract, implements **ShapeBorder**) = (rounded) rectangle or circle box border
  * **BeveledRectangleBorder** = rectangle with 45° cut angles (ie a prolonged octogon)
  * **CircleBorder** = circle
  * **ContinuousRectangleBorder**
  * **OutlineInputBorder** = rounded rectangle (around an **InputDecorator**)
  * **RoundedRectangleBorder** = rounded rectangle
  * **StadiumBorder** = pill-shaped
  * **StarBorder** = star or polygon-shaped border (_points_, _pointsRounding_, _valleyRounding_)
* **BorderSide** = one side of a border (`merge()`)
* **BoxDecoration** = box immutable description (_border_, _boxShadow_ = collection of **BoxShadow**'s, _gradient_, circle/rectangle _shape_, _borderRadius_)
* **InputDecoration** = border/labels/icons/styles decorating a Material Design text field (_(enabled|disabled|focused|error)border_, _counter(Text)_, _enabled_, _filled_, _fillColor_, _(prefix|suffix)icon_, _helper|hint|labelText_)
* **BoxShadow** = shadow cast by a box (rectangular or not, _blurRadius_, _spreadRadius_)
* [Colors](https://api.flutter.dev/flutter/material/Colors-class.html)
  * `Colors.green[400]`
  * `Colors.transparent`
  * `Color.fromRGBO(r, g, b, opacity)` where _opacity_ is a **double** between _0.0_ and _1.0_
  * `Color.fromARGB(alpha, r, g, b)` where _alpha_ is an **int** between _0_ and _255_
  * `Color.lerp(colorA, colorB, ratio)` = calculate intermediate % color between two colors
    * Use [colors linear interpolation](https://stackoverflow.com/a/66385071/3559724) between tabs transitions (via **TabController**'s _offset_)
  * `withOpacity(0.0 -> 1.0)`
* [States](https://m3.material.io/foundations/interaction/states/overview) = interactive states (eg _enabled/disabled/hovered/focused/pressed/dragged_) taken by some (Material) widgets
* **Theme** = applies/overrides a given **ThemeData** locally to all its child/descendants widget tree
* **ThemeData** = provided via `Theme.of(context)` (`ThemeData.light()` & `ThemeData.dark()`)
  * `copyWith(…)` = applies a set of specific styling/theme, defaulting rest to first found **Theme** ancestor (possibly at app root)
  * `___Button.styleFrom(…)` = allows defining some properties (eg _backgroundcolor_, _shape_), defaulting rest to first found **Theme** ancestor (possibly at app root)
  * _colorScheme_ = Material Design 3 set of 45 colors system across app for consistent theming
    * Dynamic colors scheme can be set from a single seed (eg `ColorScheme.fromSeed(seedColor: Colors.{color})`)
  * _fontFamily_
  * _primarySwatch_ (deprecated) = (not a single color but) a MaterialColor palette (sets `Color.{color}[500]` as _primaryColor_ from whom different shades are derived)
  * _textTheme_
* **WidgetState** = more general (non-Material exclusive) version of (deprecated) **MaterialState** (in _material\_state.dart_)
  * `WidgetStateProperty.all<Color>(Colors.…)` return single color irrespective of particular states
  * `WidgetStateColor.resolveWith((Set<WidgetState> states) => …` return colors depending on states
* **WidgetStateColor** = defines a color that is also a **WidgetStateProperty** (allows shorthanding by passing color instead of full resolver)
* **WidgetStateProperty\<T>** (abstract) = base for classes that resolve to T-typed value based on interactive states

### Adaptivity

* Change (status/navigation) system bars overlay style = (in `main()`:) `SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: …, systemNavigationBarColor: …));`
* Adaptive widgets (with `.adaptive` constructor/propery)
  * **CircularProgressIndicator** becomes a **CupertinoActivityIndicator** on iOS
  * **Icons** (eg `Icons.adaptive.home`)
  * **Slider**
  * **Switch**
  * **SwitchListTile**
* **AndroidView** & **UiKitView** = embeds Android/iOS view in widget hierarchy, allows using native controls (eg a browser control, Google Maps) but pretty performance-expensive
* **CupertinoActionSheet** = iOS-themed actions sliding from bottom
* **LayoutBuilder** = gives access to incoming local parent constraints size, rebuilds when they change (more granular than whole **MediaQuery**), making layout responsive
* **MediaQuery** = retrieve info about screen _orientation_, _size_ (eg `MediaQuery.sizeOf(context)`), text scaling
* **MediaQueryData** = provided via `MediaQuery.of(context)`
  * _orientation_ (device), OrientationBuilder (parent widget) or LayoutBuilder (parent widget, not just its orientation)
  * _padding_ = parts of display partially obscured by system UI (typically hardware notches or system status bar)
  * _size_ (`size.height` = includes **AppBar** & (top) status bar, `.size.shortestSide < 600` = is phone or tablet?)
    * `height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top` x (0.0 -> 1.0 ratio)
  * _viewInsets_ = parts of display completely obscured by system UI (typically device's soft/virtual keyboard)
  * _viewPadding_ = parts of display partially obscured by system UI (typically hardware notches or system status bar)
  * Make sure that the _context_ originates from app root, not a local _ctx_ instance (eg from a `builder((ctx) => …)` method)
  * If multiple call to MediaQuery are done in same file/widget, place it in a local variable and use that instead
  * Using InheritedWidgets such as **MediaQuery** or **Theme** in a widget causes the widget to get rebuilt when they change
    * This is the case even for built-in widgets (eg **Text** very logically rebuilds whenever Theme is changed)
* **Platform**
  * `Theme.of(context).platform` = adapt theme to platform (_TargetPlatform.android|iOS_)
  * `dart:io.Platform` = OS-specific logic (eg for plugins), use with `import 'dart:io' show Platform;` then `Platform.isAndroid|isIOS ? …`
* **SafeArea** = checks **MediaQuery** to ensure we get a neat uncut rectangle on the screen (no obstructing system status bar (in case there's no app bar) or hardware objects)
* **Semantics** = provide child Widget with (lots of) meta-information, improving accessibility

## [Animations](https://docs.flutter.dev/ui/animations)

* Is it more like a drawing? => Image/Lottie/Rive
* Does it repeat forever? Is it discontinuous? Do multiple widgets animate at same time? => Explicit

* **AnimatedCrossFade** = cross-fade-in/out between two children of various sizes (_first/secondChild_, _crossFadeState_ showFirst|Second, _abcCurve_, _layoutBuilder_ to avoid layout jumps)
* **AnimatedList** = list with built-in add/remove item animation (_initialItemCount_, _itemBuilder_, trigger via **AnimatedListState** either locally or via **GlobalKey**)
* **AnimatedSwitcher** = transition between child widgets (set new _child_ via `setState()`, set _transitionBuilder_ to **Fade/Scale/Rotation-Transition**, set _layoutBuilder_, use keys if new widget is same type)
* **Flow** = sizes/positions/animates children widgets according to **FlowDelegate** logic using transformation matrices
* **Hero** = images/clips/etc morphing animation between **Navigator** routes (via common _tag_)
* **HeroMode** = en/disables child **Hero** in widget subtree (_enabled_)
* **Transform** = custom (PowerPoint-like) transitions (`rotate()`, `scale()`,, `skewX()` `translate()`, or 4x4 custom matrix)
* Tweens = (linear) interpolation be**tween**
  * **Animatable\<T>** = base abstract class for tweens (`Animatable<T>.animate(controller)` is identical to `controller.drive(Animatable<T>)`)
  * **Tween** = _begin_ & _end_ values (base class for converting **AnimationController** to a range of values of other types)
  * **ReverseTween** = reverses its parent
  * **AlignmentGeometryTween** = two **AlignmentGeometry**
  * **AlignmentTween** = two alignments
  * **ColorTween** = two colors
  * **ConstantTween** = with a constant value
  * **CurveTween** = transforms value of a given animation by given **Curve** _curve_
  * **FractionalOffsetTween** = two fractional offsets
  * **IntTween** = two integers that rounds
  * **RectTween** = two rectangles
    * **MaterialRectArcTween** = interpolates a **Rect** by having its opposite corners following circular arcs (default for **Hero**)
    * **MaterialRectCenterArcTween** = interpolates a **Rect** by moving it along a circular arc
  * **SizeTween** = two sizes
  * **StepTween** = two integers that floor

### Implicit

Performed automatically when a property updates (via `setState()`), for single non-repeating & continuous animations (ie pulsating).

* **AnimatedAlign** = alignment update transition
* **AnimatedContainer** = versatile linear interpolation (_border_, _color_, _decoration_, _height/width_, _shadow_, with _curve_)
  * Eg `transform: Matrix4.identity()..translate()..multiply()`)
* **AnimatedDefaultTextStyle** = **DefaultTextStyle**
* **AnimatedOpacity** = opacity animation (_curve_, _duration_, _opacity_ via `setState()`)
* **AnimatedPadding** = padding animation (_curve_, _duration_, _padding_ via `setState()`)
* **AnimatedPhysicalModel** = animated _borderRadius_, _color_ & _elevation_
* **AnimatedPositioned** = animated **Positioned** reacting to properties change, useful to implement custom slider
* **AnimatedPositionedDirectional** = **PositionedDirectional**
* **AnimatedRotation** = `Transform.rotate()`
* **AnimatedScale** = `Transform.scale()`
* **AnimatedSize** = size transition
* **AnimatedSlide** = offset transition
* **AnimatedTheme** = animated **Theme**
* **ImplicitlyAnimatedWidget** = abstract base class, its subclasses all manage an **AnimationController** internally
* **TweenAnimationBuilder\<T>** = custom implicit animation (_tween_, _duration_, _builder_, _curve_, _onEnd_), pass _child_ for performance
  * Can be used for smooth _continuous_ (ie pulsating) repeating animations using its `onEnd` callback to set end point to start value, and back
  * It always chases its _tween_'s end point, which can be adjusted (if set to a state variable) as an animation is playing
  * That means it can be somehow controlled, or at least its end target can, via state (eg _loosely driven by_ a user slider)
  * That occurs even between consecutive `build()`s, ie new endpoint will be chased right from current animation position
  * Tweens are mutable, so if value range never changes, place tweens (eg _ColorTween_) in a `static final` variable (ie outside of `build()`)

### Explicit

To be started/piloted manually, for infinitely repeating, discontinued, or multi-widgets animations.
In order to implement a custom widget, use either **AnimatedBuilder**, or extend its parent abstract class **AnimatedWidget** if animation is mostly self-contained.

* Requires a **AnimationController** (to `dispose()` within a StatefulWidget's State)
* **Animation\<T>** = anything of type _T_ (double, Color, Size) that changes over time
* **AnimatedBuilder** (extends **AnimatedWidget** via **ListenableBuilder**) = full-custom explicit animation (provide an inert _child_ to optimize rendering)
* **AnimatedIcon** = controllable icon, explicit despite naming  (`icon: AnimatedIcon.play_pause, progress: _controller`)
* **AnimationController** (extends **Animation\<double>**) = animation pilot/player (_status_, _(reverse)Duration_, _isCompleted|Dismissed_, _value_)
  * `add(Status)Listener()`, `forward()`, `fling()`, `repeat()`, `reverse()`, `dispose()`, `animateTo(double value)` (similar to TweenAB's end), `drive(Animatable<T>)`
  * Controllers can even update widgets without plugging it into any animation, ie by adding a listener that `setState()` (although better to use existing options, see Animation Deep Dive)
  * An **AnimationController** is just _a thing that emits values_ => listening widgets don't actually have to use that `value`, they just get refreshed while it's playing
* **AnimatedWidget** = abstract base class for all explcit built-in **Foo-Transition** & custom **AnimatedBuilder**
  * Can be extended, in which case its single _listenable_ property expects an animation, which is typically an **AnimationController**
  * Has an **\_AnimatedState** whose `initState()` adds a listener to its **Listenable** _listenable_ (ie an animation) and calls `setState()` when it changes
* Curves
  * **CurvedAnimation** = animation that applies a curve to another animation (eg `easeIn|Out`, `elasticIn|Out`, `linear`)
    * Can be used in places where an **AnimationController** is expected (eg `tween.animation(…)`), wrapping it with a curve `CurvedAnimation(parent: _controller, curve: Curves.bounceIn)`
* **Ticker** = an object that calls a function every frame, rarely used ourselves (alleviated via using **(Single)TickerProviderStateMixin**), dispose it when done
  * Required by an **AnimationController** to function (via `vsync: this` on creation)
* **TickerMode** = toggles tickers on/off for all widgets in subtree
* Transitions = built-in explicit animations
  * **AlignTransition**
  * **DecoratedBoxTransition**
  * **DefaultTextStyleTransition**
  * **FadeTransition** = opacity animation
  * **MatrixTransition** = animates Matrix4 of a transformed widget
  * **PositionedTransition**
  * **RelativePositionedTransition**
  * **RotationTransition**
  * **ScaleTransition**
  * **SizeTransition**
  * **SlideTransition** = move relatively to its normal position, using an Offset animation
  * **SliverFadeTransition**
