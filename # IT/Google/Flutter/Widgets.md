# Flutter Widgets (& Classes)

Building blocks of Flutter.

## Quick Tips

* [Widget Catalog](https://docs.flutter.dev/ui/widgets)
  * [Material](https://docs.flutter.dev/ui/widgets/material)
  * [Material 3](https://flutter.github.io/samples/web/material_3_demo)
* _Not everything is a widget_ (eg **BoxDecoration**, **ThemeData**, **TextStyle**)

## Misc

* **Canvas** = eg `canvas.drawArc()` draws circle (arc)
* **SelectionArea** = selectable text (Flutter >=3.3)
* **SimpleDialog** = modal popup (_contentPadding_, _children_)
* [ResizeImage](https://api.flutter.dev/flutter/painting/ResizeImage-class.html)
* **AndroidView** & **UiKitView** = embeds Android/iOS view in widget hierarchy, allows using native controls (eg a browser control, Google Maps) but pretty performance-expensive
* **PageRouteBuilder** = creates route & page (with _pageBuilder_) with transition effect (via _transitionsBuilder_)
* **Switch** = radio button (`Switch.adaptive()`)
* **Semantics** = provide child Widget with (lots of) meta-information, improving accessibility
* **Circular/LinearProgressIndicator** = Material progress bar (_value_, _backgroundColor_, `ThemeData.accentColor` by default)
  * _valueColor_ takes in an **Animation\<T>** instance, which can be result of controlled Tween (via `drive()` or `animate()`)
* **Rect** = can be assigned as `offset & size` (**Offset** & **Size**)
* **Icon** = (_icon_ **IconData** with `Icons.…`)

## App & Navigation

* `runApp(…)` = takes in widget instance and inflate it to screen size (ie calls its `build()` method, etc)
* `showSearch(ctx, SearchDelegate)` = (framework provided) shows a full screen search page that returns result when closed
* **WidgetsApp** = wraps a number of base functionality widgets (ie MediaQuery)
* **Material** = piece of material (clipping, elevation, ink effects), `Material.of`, **MaterialInkController**, _shape_ (**Beveled/RoundedRectangleBorder** with _borderRadius_ **BorderRadius**)
* **MaterialApp** = builds Material design on top of base **WidgetsApp** (defines _theme_ used by all Material children)
  * Sets _theme_ as **ThemeData** (_useMaterial3_ now default since Flutter 3.16)
  * `MateriapApp(debugShowCheckedModeBanner: false)` = [remove debug banner](https://stackoverflow.com/a/48893964/3559724)
* **MaterialPageRoute** _fullScreenDialog_ = 'X' close button instead of back arrow (and slightly different transition animation)

* **PreferredSizeWidget** = base interface for widget that have an ideal size when unconstrained, such as **AppBar**

* **Scaffold** = basic Material design layout with a set of pre-configured widgets
  * **AppBar** = top menu (_leading_, _title_, _actions_ as widgets to display after title, _bottom_), also see scrollable **SliverAppBar** (embeds **AppBar** & **CustomScrollView**)
  * **BottomNavigationBar** = with **BottomNavigationBarItem**s (Material 2)
  * **(end)Drawer** = `Scaffold.of(context).open(End)Drawer()` & `Navigator.pop(context);`, it's possible to use a (then non-modal) Drawer without a Scaffold
    * _child_ = **DrawerHeader** + **ListTile**s
    * _drawerEdgeDragWidth_ = area within which a horizontal swipe will open **Drawer**
  * **FloatingActionButton** with _floatingActionButtonLocation_ = dictates how/where associated FAB integrates/incrustates

* Tabs
  * **DefaultTabController** = inherited **TabController** for descendants widgets that don't specify one explicitly
  * **TabBar** = Material Design primary tab bar
  * **TabBarView** = page view displaying currently selected tab's child/widget
  * **TabController** = coordinates tab selection between a **TabBar** & **TabBarview**
  
* **MenuBar** = menu bar managing cascading child menus (à la Windows top menu)
* **MenuItemButton** = MenuBar button (also see **SubmenuButton** for menu item with submenu)

* NavigationBar = with **NavigationDestination**s (Material 3)
  * See [Material 3 navigation bar](https://m3.material.io/components/navigation-bar/overview) = nav menu (available)
  * See [Material 3 bottom app bar](https://m3.material.io/components/bottom-app-bar/overview) = 4 icons & FAB (in progress)

* [Router](https://api.flutter.dev/flutter/widgets/Router-class.html)

* Closable via **Navigator** `pop()`:
  * `Scaffold.of(c).showBottomSheet(…)` (or shorthand, to nearest **Scaffold**: `showModalBottomSheet(context: …, builder: …)`)
  * `Scaffold.of(c).openDrawer()`
  * `Scaffold.of(c).showSnackBar(SnackBar())`
  * `showDialog()`
  * `showAboutDialog()`)

### Adaptivity & Themes

* Use `double.infinity` to set to max available dimensions (eg screen entire width)

* **Border** = (usually) 4 **BorderSides** part of a **BoxDecoration** (`merge()`)
  * **BeveledRectangleBorder**
  * **BorderRadius**
  * **BorderSide** = one side of a border
  * **BoxBorder**
  * **BoxDecoration** = immutable description how to paint a box (_boxShadow_ = collection of **BoxShadow**'s, _gradient_, circle/rectangle _shape_)
  * **CircleBorder**
  * **ContinuousRectangleBorder**
  * **OutlineInputBorder** (eg in a **InputDecoration**)
  * **RoundedRectangleBorder**
  * **ShapeBorder** = base class
  * **StadiumBorder**
  * **StarBorder** = star or polygon-shaped border (_points_, _pointsRounding_, _valleyRounding_)

* **ButtonStyle** = _back/foregroundColor_
  * Old buttons used many static properties for each independant color & state, this was replaced with dynamic methods handling complex interacion states (see **MaterialState**)
  * `…Button.styleFrom(…)` = allows defining some properties, defaulting rest to first found **Theme** ancestor (possibly at app root)

* [Colors](https://api.flutter.dev/flutter/material/Colors-class.html)
  * `Colors.green[400]`
  * `Color.fromRGBO(r, g, b, opacity)` where _opacity_ is a **double** between _0.0_ and _1.0_
  * `Color.fromARGB(alpha, r, g, b)` where _alpha_ is an **int** between _0_ and _255_
  * `Color.lerp(colorA, colorB, ratio)` = calculate intermediate % color between two colors
    * Use [colors linear interpolation](https://stackoverflow.com/a/66385071/3559724) between tabs transitions (via **TabController**'s _offset_)
  * `withOpacity(0.0 -> 1.0)`

* **LayoutBuilder** = rebuilds when incoming parent constraints change (ie when local parent changes, more granular than whole **MediaQuery**), making layout responsive
* **MediaQuery** = Object used to retrieve info about screen size, orientation, text scaling
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
  * [Scroll a list when keyboard pops up](https://stackoverflow.com/a/70612950/3559724)
  * [Move bottom sheet when autofocused keyboard is up](https://stackoverflow.com/a/57515977)
* **SafeArea** = checks **MediaQuery** to ensure we get a neat uncut rectangle on the screen (no obstructing system status bar or hardware objects)
* **ThemeData** = provided via `Theme.of(context)` (`ThemeData.light()` & `ThemeData.dark()`)
  * `copyWith(…)` = applies a set of specific styling/theme, defaulting rest to first found **Theme** ancestor (possibly at app root)
  * _colorScheme_ = set of 45 colors based on Material spec to configure most components colors, dynamic colors scheme can be set from a single seed
    * [primaryColor is one of those shades, normally equal to `primarySwatch\[500\]`](https://stackoverflow.com/a/50214259/3559724)
  * _platform_ = `TargetPlatform.iOS ? iOSWidget(…) : AndroidWidget(…)` (alternatively `import 'dart:io' show Platform;` then `Platform.isAndroid` or `.adaptive()` method on some widgets)
  * _textScheme_
* **Visibility** = toggles widgets display on/off

* [States](https://m2.material.io/design/interaction/states.html) = interactive states (eg hovered, pressed, focused, disabled, scrolledUnder) taken by some (Material) widgets
* **WidgetState** = more general (non-Material exclusive) version of (@deprecated) **MaterialState** (in _material\_state.dart_)
  * `WidgetStateProperty.all<Color>(Colors.…)` return single color irrespective of particular states
  * `WidgetStateColor.resolveWith((Set<WidgetState> states) => …` return colors depending on states
* **WidgetStateColor** = defines a color that is also a **WidgetStateProperty** (allows shorthanding by passing color instead of full resolver)
* **WidgetStateProperty\<T>** (abstract) = base for classes that resolve to T-typed value based on interactive states

## Inputs & Texts

* **AbsorbPointer** = disable all pointer/touch events over a widgets group (_absorbing_, _ignoringSemantics_ for screen readers ignoring)
* **FocusNode** = obtain keyboard focus & handle keyboard events in a stateful widget
* **Form** = form that can be saved/reset/validated (_onChanged_), with input fields
  * **FormField** = single form field (_onSaved_, _validator_ checked on associated **FormFieldState** `validate()`)
  * **TextFormField** = **FormField** that contains a **TextField**
* **GestureArena** = disambiguation between gestures using a battle royale strategy
* **GestureDetector** = detects user inputs (eg (double) tap, long press, h/v drag, pinch)
  * For low-level device OS input events, see **Listener** (_onPointerDown/Up/Move_)
* **RichText** = multiple styles per line (`text: TextSpan(style: …, children: <TextSpan>[…]`) for when standard **Text** is not enough
* **SelectableText** = (_showCursor_, _cursorWidth_, _cursorColor_, _cursorRadius_, _toolbarOptions_, _onTap_, _scrollPhysics_, `.rich()`)
* **Slider** = slider (_onChanged_, _min/max_, _divisions_, _label_, `Slider.adaptive()`), **CupertinoSlider** (iOS-style), **RangeSlider** (from/to slider)
* **TextEditingController** = gives access to associated **TextField** programmatically
* **TextField** = input text field (_controller_, _decoration_, _inputFormatters_, _onChanged|EditingComplete|Submitted_)
  * **InputDecoration** = (_border_, _counter_ of entered characters, _enabled_, _focusedBorder_, _(prefix|suffix)icon_, _hint|labelText_)
  * **TextInputFormatter** = **LengthLimitingTextInputFormatter** (length), **FilteringTextInputFormatter** (regex pattern)
    * [How to use InputFormatters](https://stackoverflow.com/a/50123743/3559724)
* **TextStyle** = à la CSS (_fontSize_, _fontWeight_)
* **Tooltip** = accessibility-friendly alt text (_child_, _message_, _verticalOffset_, _height_), some Widgets have a _tooltip_ property

### Buttons

* **CupertinoButton** = iOS-style button
* **DropDownButton\<T>** = a Material Design button for selecting from a list of items
* **ElevatedButton** = Material Design elevated button (avoid on already-elevated content eg dialogs/cards)
* **FilledButton** = fill-colored button (`FilledButton.tonal`)
* **FloatActionButton** (**FAB**) = Scaffold stacked button, use _floatingActionButtonLocation_ to embed in _bottomNavigationBar_
* **IconButton** = a Material Design icon button (_icon_, _tooltip_, _onPressed_, `IconButton.filled|filledTonal|outlined`)
* **InkWell** = rectangle with touch responses (_on(Double)Tap_, _onLongPress_, _onHover_)
* **OutlinedButton** = a TextButton with an outlined border (_borderSide_)
* **RawMaterialButton** = base for a button with a child widget (eg **Text**, _fillColor_, _splashColor_, _shape_)
* **SegmentedButton\<T>** = pill/tabs-looking radio buttons
* **TextButton** = basic text button (`TextButton.icon()` = button with both text AND icon)
* **ToggleButtons** = on/off/radio buttons (_isSelected_ = `List<bool>`, _onPressed_ controls selection logic, _abcColor_, _abcBorder_)
* Deprecated
  * _FlatButton_ = replaced with **TextButton**
  * _OutlineButton_ = replaced with **OutlinedButton**
  * _RaisedButton_ = replaced with **ElevatedButton**

## Layout Containers

Basically, widget nodes with one or multiple children.

* **Alignment** = point within a rectangle (top-left _(-1.0,-1.0)_ to bottom-right _(1.0,1.0)_ but values can be outside those bounds)
* **BoxConstraint** = class with immutable layout constraints for **RenderBox** layout (notable properties: _minHeight_, _minWidth_, _maxHeight_, _maxWidth_)
  * `BoxConstraints.loose()` (**min<max**), `BoxConstraints.tightFor[Finite]()` (**min==max**), `BoxConstraints.expand()` (**max**)
* **Card** = Material rectangle shape with rounded corners and z-axis (_elevation_) shadow, size depends on child unless its parent specifies
  * This is actually a simplified [Material](https://api.flutter.dev/flutter/material/Material-class.html) widget, which can take other shapes
* **Clips** = wraps a _child_ widget to only show its parts covered by built-in (**ClipOval**, **ClipRRect**) shape or custom (**ClipPath**) path
  * **ClipOval** = auto-adaptative circle/oval cutting (_clipper_ `extends CustomClipper<Rect>`), can be animated for fun effects
  * **ClipRRect** = **R**ounded **r**ectangle (_child_, _borderRadius_, _clipBehavior_)
  * **ClipPath** = create own (svg-like) shape (`clipper: KokoClipper()` where `class KokoClipper extends CustomClipper<Path>`)
    * [Example](https://stackoverflow.com/a/70820679) basic
    * [Example](https://stackoverflow.com/a/69476516) using `quadraticBezierTo(…)`
* **CircleAvatar** = circle container (_back/foreground-Image_ with child text initial fallback, append `.image` to **Image**), adequate for user pfp
* **ColoredBox**
* **DecoratedBox** = paints a **(Box)Decoration** either before or after its child paints (also see **DecoratedBoxTransition**)
* **EdgeInsets** = padding (_zero_, `all()`, `symmetric(vertical, horizontal)`, `only(right:…, top:…)`)
* **IntrinsicHeight** & **IntrinsicWidth** = sizes its child to its maximum intrinsic h/w by letting it speculatively sizing to its its largest child
  * Useful for edge cases (eg when each sibling wants to align in different directions in a scrollable context), but can be expensive (worse case O(N²))
* **PageView** = horizontal or vertical swipable pages/screens (à la gallery/slideshow, _initialPage_, _scrollDirection_), controllable/queryable via **PageController** (_viewportFraction_)
* **RadioListTile** = literally Radio + (tappable anywhere) ListTile

* Lists & Grids = **DataTable**, **GridTile**, **GridView**, **ListTile**, **ListView**, **Table**
  * **DataTable** = auto-adjust grid with sorting (_columns_, _rows_, _sortColumnIndex_, _sortAscending_), wrap in **SingleChildScrollView** to handle overflow
    * **DataCell** = _showEditIcon_, _placeholder_, cells are widget (ie customizable)
    * **DataColumn** = _label_, _numeric_
    * **DataRow** = _selected_, _cells_
  * **ExpansionPanel** = expandable 'v' arrow tiles (`headerBuilder:(ctx,isOpen)`, _body_, _isExpanded_, _canTabOnHeader_ indicates whether whole header is tappable)
  * **ExpansionPanelList** = **ExpansionPanel** container (_expansionCallback_, _animationDuration_, _dividerColor_, _elevation_, _expandedHeaderPadding_)
  * **GridView** = grid (`.builder()`, `.count()`, `.extent()`, _crossAxisCount_, _main|crossAxisSpacing_)
  * **GridTile** = (with **GridTileBar** as _header_ or _footer_)
  * **ListView** = scrollable list of children (_scrollDirection_, _reverse_, _physics_, _addAutomaticKeepAlives_, _cacheExtent_)
    * Use `ListView.builder(…)` for lazy/many items (_itemCount|Extent_) or `ListView.separated` (_separatorBuilder_) or `ListView.custom` (_childrenDelegate_ sliver)
    * Implicit constructor also performs some display virtualization but creates all items immediately (non-lazily) upfront
    * **Dismissible** = left/right swipeable items (_key_ to track what's visible/hidden, (secondary)_background_, _direction_ , `onDismissed()` to remove underlying item)
    * **ListTile** = Material List item (up to 3 lines _title_/_subtitle_/_isThreeLine_, _dense_, `tap`, `onLongPress`, `ListTile.divideTiles()`)
  * **SliverList** & **SliverGrid** = advanced scrolling control (_delegate_: `Sliver[Child|Builder]ListDelegate`, `.count()` & `.extent()` ctors)
  * **Table** = simpler fixed grid layout (_defaultVerticalAlignment_, _defaultColumnWidth_, _columnWidths_, _border_ )
* Positioning = **Align**, **Center**, **Positioned**, **Expanded**, **Flexible**
  * **Align** = position a child within its parent (_t/b/r/l_, or specific _double_ value) à la HTML relative position (see **AlignmentTween** & **AnimatedAlign**)
  * **Center** = transform tight parent constraints into loose constraints (ie **Center** occupies tight space defined by parent, letting child occupy a smaller or equal - but not bigger - area)
  * **Expanded** = expands child to force it to take up all remaining available space in its parent, inherits from **Flexible** and equivalent to it but with `this.fit=FlexFit.tight` instead of _loose_
  * **Flexible** = class (& base class for **Expanded**) with _fit_ & _flex_ property (_1_ by default, _0_ means inflexible), ie whose size is not fixed but can take up available space within its **Flex** parent
  * **Positioned** = position children within a **Stack** (_t/b/r/l/heigh/width_, `fill()`) à la HTML absolute position
  * **Spacer** = returns an **Expanded** with `SizedBox.shrink()` as child, to add custom spaces within Column/Row (beyond their simple _mainAxisAligment_)
* ShapeBorder = **RoundedRectangleBorder**, **StadiumBorder**
* Wrappers = **Column/Row**, **ConstrainedBox**, **Container**, **FittedBox**, **FractionallySizedBox**, **LimitedBox**, **OverflowBox**, **SizedBox**, **Stack**, **UnconstrainedBox**, **Wrap**
  * **Column/Row** = inherit from **Flex** (base class for flex space containers) that distribute available space to their children
    * Space is attributed to their inflexible (_flex:0_) children first, then distribute rest of space (ie parent constraint - inflexible children size) to **Flexible** children
    * Unbounded/unlimited constraints are given to their inflexible children to choose their own size (asking them to shrinkwrap)
    * In bounded context, they themselves take up max size in their main axis by default (ie `mainAxisSize: MainAxisSize.max`)
    * In unbounded context, they try to fit their children (who must all be inflexible)
    * Their cross axis must always be bounded, since they take up all space in that direction
    * See [Understanding constraints: Flex](https://docs.flutter.dev/ui/layout/constraints#flex)
  * **ConstrainedBox** = adds min & max h/w constraints on top of its parent's, which may get ignored if more restrictive/tight constraints already apply (eg screen)
  * **Container** = wraps child widget in margin/padding/size/color/decoration/shape (_aligment_ will fit parent, _constraints_ (eg `BoxConstraints.expand()`), _transform_)
    * Has no `createRenderObject()` method, it is a convenience compositional wrapper for other layout widgets ~ its properties (see its `build()` source code)
  * **FittedBox** = fit/scale child within smaller parent (_fit_ = `BoxFit.{value=contain|cover|fitH/W|fill|none}`, _alignment_)
  * **FractionallySizedBox** = size by percentage (_heigh/widthFactor_), align in parent or wrap in **Flexible**; use no child for whitespacing
  * **LimitedBox** = give limited constraints (_maxH/W_) to child with infinite (specifically, only) parent constraints (eg **ListView**/**Column**/**Row**/**UnconstrainedBox**)
  * **OverflowBox** = lets child be any size it wants, also removing parent constraints, but shows no warnings (simply hides excess/shows as much as it can)
  * **RotatedBox** = affects layout ie moves everything around it (`quarterTurns`, in contrast `Transform.rotate()` affects rendering, not layout ie as if original was still in place)
  * **SizedBox** = give child a size (_w/h_, _double.infinity_ == max, _SizedBox.expand()_ == max _w/h_), use without child for spacing
    * [SizedBox.expand() vs Expanded](https://stackoverflow.com/a/72416413/3559724) = **Expanded** can only be used inside a **Flex**
    * Can be used to cut expensive layout costs by defining a fixed size for a widget (and its entire subtree)
  * **Stack** = z-axis stacking (_fit_ to children `StackFit.loose` by default, or to parent `StackFit.expand`, _alignment_, _overflow_)
    **IndexedStack** = **Stack** showing only one of several _children_ widgets at a time, preserving each of their individual states (_index_ via `setState()`)
  * **UnconstrainedBox** = lets child be any size it wants, removing inbound parent (tight) constraints, with black/yellow warning if too large
  * **Wrap** = "word wrap" children (_direction_, _alignment_ _spacing_, _runSpaching_); good for buttons & chips

### Scroll

* `NeverScrollableScrollPhysics()` = prevents ListView scrolling when the user drags
* `ClampingScrollPhysics()`
* **CustomScrollView** = (hybrid) grid/list scrolls via _slivers_ (**SliverAppBar**, **SliverList**, **SliverGrid**, `center: key`)
  * **SliverAppBar** = scroll-reactive top menu using **CustomScrollView** (_expandedHeight_, _flexibleSpace_, _floating_, _pinned_), with effects (zoom, blur)
  * **SliverList** = inner list
* **SingleChildScrollView** = makes child scrollable
  * This widget should be reserved to scenarios where the content is actually supposed to be displayed in full (ie not scrollable), but a smaller than usual devices' screen does make not that possible, so scroll must be added to avoid out-of-bounds
  * If the intent is to have a scrollable list, then _lazy_, _sliver-based_ **ListView**/**CustomScrollView** are vastly more efficient
  * To take advantage of lazy-optimization, the **ListView** must be dynamically built (using one of its builders eg `ListView.builder()`)
  * When using `ListView.builder(ctx, index)` make sure to not name the first parameter `context`, especially with inner `MediaQuery.of(context)`
* [ScrollController](https://api.flutter.dev/flutter/widgets/ScrollController-class.html) = pilots one or multiple scrollable widget(s) (eg **SingleChildScrollView**, **ListView**, **DraggableScrollableSheet**)
* **RestorableScrollController** = special type of scroll controller with embedded restoration capabilities

## [Animations](https://docs.flutter.dev/ui/animations)

* Is it more like a drawing? => Image/Lottie/Rive
* Does it repeat forever? Is it discontinuous? Do multiple widgets animate at same time? => Explicit

* **AnimatedCrossFade** = fade-in/out transition (_first/secondChild_, _duration_, _crossFadeState_, _abcCurve_), set custom _layoutBuilder_ to avoid layout jumps
* **AnimatedList** = list with built-in animation when adding/removing item (_initialItemCount_ if not empty, _itemBuilder_, move item from both list & **AnimatedListState** from within item or GlobalKey elsewhere)
* **AnimatedSwitcher** = child transitions (set new child via `setState()`, set _transitionBuilder_ to **Fade/Scale/Rotation-Transition**), set _layoutBuilder_, use keys if new widget is of same type
* **Hero** = images/clips/etc. morphing animation between **Navigator** routes (_child_, _tag_)
* **HeroMode** = disables a **Hero**
* **Transform** = custom (PowerPoint-like) transitions (`rotate()`, `scale()`,, `skewX()` `translate()`, or 4x4 custom matrix)
* Tweens = (linear) interpolation be**tween**
  * **Animatable\<T>** = base abstract class for tweens (`Animatable<T>.animate(controller)` is identical to `controller.drive(Animatable<T>)`)
  * **Tween** = _begin_ & _end_ values
  * **ReverseTween** = reverses its parent
  * **AlignmentGeometryTween** = two **AlignmentGeometry**
  * **AlignmentTween** = two alignments
  * **ColorTween** = two colors
  * **ConstantTween** = with a constant value
  * **CurveTween** = transforms value of a given animation by given **Curve** _curve_
  * **FractionalOffsetTween** = two fractional offsets
  * **IntTween** = two integers that rounds
  * **RectTween** = two rectangles
  * **SizeTween** = two sizes
  * **StepTween** = two integers that floor

### Implicit

Performed automatically when a property updates (via `setState()`), non-repeating, continuous, single.

* **AnimatedAlign** = alignment update transition
* **AnimatedCrossFade** = cross-fades between two children, animates itself between their sizes
* **AnimatedContainer** = versatile linear interpolation (_color_, _shadow_, layouts, _curve_ & _duration_, `transform: Matrix4.identity()..translate()..multiply()`)
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
  * It always chases its _tween_'s end point, which can be adjusted (if set to a state variable) as the animation is playing
  * That means it can be somehow controlled, or at least its end target can, via state (eg _loosely driven by_ a user slider)
  * Can be used for smooth _continuous_ (ie pulsating) repeating animations using its `onEnd` callback to set end point to start value, and back
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
  * **CurvedAnimation** = wraps a controller with a curve `CurvedAnimation(parent: _controller, curve: Curves.bounceIn)`
    * Can be used in places where an **AnimationController** is expected eg `tween.animation(…)`
  * `easeIn|Out`, `elasticIn|Out`, `linear`
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
  * **SlideTransition** = animates widget position relative to its normal position
  * **SliverFadeTransition**

### Listenable

Observer pattern.

* **Listenable** (abstract) = object that maintains a list of listeners (`addListener()`, `removeListener()`)
  * **ValueListenable<T>** (abstract, extends **Listenable**) = interface for subclasses of **Listenable** that expose a (current/single) _value_
  * **Animation\<T>** (abstract, extends **Listenable**, implements **ValueListenable\<T>**) = value with status & direction
  * **ChangeNotifier** (mixin, implements **Listenable**) = listenable with `notifyListeners()`
  * **ValueNotifier\<T>** (extends **ChangeNotifier**, implements **ValueListenable\<T>**) = a **ChangeNotifier** that holds a single (mutable) value triggering notifiations

* **ListenableBuilder** = widget rebuilding its subtree when a given **Listenable** changes (without `setState()`, set optional _child_ to const subtree for performance)
* **ValueListenableBuilder** = widget syncing its content with a **ValueListenable** object (without `setState()`, set optional _child_ to const subtree for performance)
* **NotificationListener** = listens to notifications produced by some descendant widgets (eg **ScrollNotifications** by **ListView**/**Router**)

## [Flutter: Widgets of the Week](https://www.youtube.com/watch?v=lkF0TQJO0bA&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=129)

1. SafeArea
2. Expanded
3. Wrap
4. AnimatedContainer
5. **Opacity** & **AnimatedOpacity** = alpha (0 is like CSS' `invisiblility: hidden`)
6. **FutureBuilder** = display something while loading a future's result and something else when it's done
7. FadeTransition
8. FloatActionButton
9. PageView
10. Table
11. SliverAppBar
12. SliverList & SliverGrid
13. **FadeInImage** = placeholder for images (_placeholder_ from directory/memory, _fadeInDuration_, _fadeInCurve_, **transparent_image** package)
14. **StreamBuilder** = rebuilds its children whenever stream data arrives (_initialData_, `snapshot.connectionState|data|error`, `snapshot.hasData|Error`)
15. **InheritedModel**`<T>` = more granular **InheritedWidget** for particular fields (via _aspect_), `@override updateShouldNotifyDependent()`
16. ClipRRect
17. Hero
18. **CustomPaint** = low-level paint calls (_size_, _painter_); surround with `FittedBox(SizedBox(width: image.width.toDouble(), height:…))`, (see _Custom painting in Flutter_ video)
19. Tooltip
20. FittedBox
21. LayoutBuilder
22. AbsorbPointer
23. Transform
24. **BackdropFilter** & **ImageFilter** class = image blur/rotate/skew/stretch effects (`blur()`, `matrix()`), use with parent **Stack** & _fill_
25. Align
26. Positioned
27. AnimatedBuilder
28. Dismissible
29. SizedBox
30. ValueNotifier & ValueListenableBuilder
31. **Draggable\<T>** (_data_, _child(WhenDragging)_, _feedback_) & **DragTarget\<T>** (_builder_, _onWillAccept_, _onAccept_, _onLeave_)
32. AnimatedList
33. Flexible
34. MediaQuery
35. Spacer
36. **InheritedWidget** = passing data from ancestors to descendants via the **BuildContext** (matching nearest tree ancestor of same type), used by framework (eg **Theme**)
37. AnimatedIcon
38. **AspectRatio** = formats _child_ to be a specific box ratio (_aspectRatio_ as `width / height` for readability), incompatible with (parent) **Expanded** (unless using **Align** between)
39. LimitedBox
40. **Placeholder** = temporary stand-in while building the UI (use _fallbackHeight/Width_ inside unbounded parent, _color_, _strokWidth_)
41. RichText
42. **ReordableListView** = drag & drop list items (_children_, `onReorder: (old, new) {setState()}`, optional _header_); use with **ListTile**

* **(Cupertino)AlertDialog** = pop-up (_title_, _content_ (any), _actions_, _elevation_, _backgroundColor_, _shape_, _barrierDismissible_)
* **DraggableScrollableSheet** = draggable container (_builder_ => pass `scrollControlller` to **SingleChildScroll/ListView**, _abcSize_)
* **ColorFiltered** = apply color filter over images/widgets groups (eg: `colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation)`)
* **CupertinoActionSheet** = iOS-themed actions sliding from the bottom
* **Image** = image (_fit_, _colorBlendMode_, _semanticLAbel_) via asset (sizes in _pubspec.yaml_), network (_loadingBuilder_), file, memory
* **DefaultTabController**, **TabBar**, **TabBarView** = tabbed widgets
* **SnackBar** = pop-up a temporary message holding _content_ (ie a widget), open via `Scaffold.of(context).showSnackBar(…)` (can use a **Builder** to pass it _context_)
* **ListWheelScrollView** = price-is-right 3D carousel list (_itemExtent_, _diameterRatio_, _offAxisFraction_, _userMagnifier_ & _magnification_)
* **ShaderMask** = apply color/gradient/image masks (`shaderCallback(bounds) => abcGradient().createShader(bounds)`)
* **NotificationListener** = listen to some descendant widget's notifications. Custom notifications can also be sent
* **Builder** = widget used to access an ancestor's **BuildContext**, from **within same `build()` method** where that ancestor is also declared in (as it otherwise does not exist yet in that context)
  * That ancestor is an InheritedWidget like **Scaffold**, **Navigator**, **ThemeData**, **MediaQuery**, **Provider\<T>**
  * Was created to avoid overkill of splitting a very simple widget into two child/parent (giving access to parent's context to child)
* **Divider** = basically HTML's `<hr>` (_thickness_, _(end)Indent_), set once for all via **MaterialApp**'s **ThemeData**'s _dividerTheme_
* **IgnorePointer** = ignore pointer/touch events on a specific child (but [click can bubble up](https://stackoverflow.com/a/55431032/3559724))
* **CupertinoActivityIndicator** = Apple's counterpart for **CircularProgressIndicator**
* **Padding** = padding
* **CheckboxListTile** = literally Checkbox + (tappable anywhere) ListTile (`secondary`, `controlAffinity`, `value`, `onChanged`, coloring)
* **AboutDialog** = boring legalese stuff (`showAboutDialog()`, `application`, `children`, `LicenseRegistry.addLicense()`)
* **InteractiveViewer** = lets user interact (ie pan/scale/zoom) with content larger than the device
* **SwitchListTile** = literally Switch + (tappable anywhere) ListTile (`value`, `onChanged` with `setState()`, `(in)activeThumbImage`)
* **ImageFiltered** & **BackdropFilter** = filters (blur, scale, translate, skew, rotate)
* **PhysicalModel** = rectangle with rounded corners with 3D shadow effects based on (z-axis pixels) _elevation_, with antialising clipping (also see **PhysicalShape** for shapes other than rectangle)
* **Scrollbar** = add scrollbar to _finite_ scrollable widget (**List|Grid|CustomScrollView**) (`isAlwaysShown`, `showTrackOnHover`, **ScrollbarTheme**)
* **Connectivity**
* **FlutterLogo** (100th Widget of the Week!) = built-in Flutter logo (`size`)
* **MouseRegion**
* **Collection**
* **HeroMode**
* **RefreshIndicator** = pull-to-refresh
* **Flow**
* **TabPageSelector**
* **Theme**
* **CachedNetworkImage**
* **Freezed**
* **Baseline**
* **Badges**
* **ScaffoldMessenger**
* **StatefulBuilder** = rebuild only a subtree by using a scoped StateSetter (`builder: (ctx, setState)`), can actually even be used in a Stateless widget
* **RepaintBoundary** = gives a widget & its RenderObject its own layer, possibly avoiding/short-circuiting extra unnecessary painting by limiting change contagion
* **FocusableActionDetector**
* **NavigationRail**
* **AutoComplete**
* **LinearGradient**
* **Focus**
* **Shortcuts**
* **Actions**
