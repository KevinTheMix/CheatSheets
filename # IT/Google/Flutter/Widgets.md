# Flutter Widgets (& Classes)

Building blocks of Flutter.

## Quick Tips

* [Widget Catalog](https://docs.flutter.dev/ui/widgets)
* _Not everything is a widget_ (eg BoxDecoration, TextStyle)
* Wrapping (eg **Center**) & containing widgets have a _child(ren)_ property

## Misc

* **Canvas** = eg `canvas.drawArc()` draws circle (arc)
* **SelectionArea** = selectable text (Flutter >=3.3)
* **SimpleDialog** = modal dialog (_contentPadding_, _children_)
* [ResizeImage](https://api.flutter.dev/flutter/painting/ResizeImage-class.html)
* **AndroidView** & **UiKitView** = embeds Android/iOS view in widget hierarchy, allows using native controls (eg a browser control, Google Maps) but pretty performance-expensive
* **Visibility** = toggles widgets display on/off
* **PageRouteBuilder** = creates route & page (with _pageBuilder_) with transition effect (via _transitionsBuilder_)

* [Colors](https://api.flutter.dev/flutter/material/Colors-class.html)
  * `Colors.green[400]`
  * `Color.fromRGBO(r, g, b, opacity)` where _opacity_ is a **double** between _0.0_ and _1.0_
  * `Color.fromARGB(alpha, r, g, b)` where _alpha_ is an **int** between _0_ and _255_
  * `Color.lerp(colorA, colorB, ratio)` = calculate intermediate % color between two colors
    * Use [colors linear interpolation](https://stackoverflow.com/a/66385071/3559724) between tabs transitions (via **TabController**'s _offset_)
  * `withOpacity(0->1)`
* [Borders](https://www.woolha.com/tutorials/flutter-using-boxborder-examples)
  * **OutlineInputBorder** (eg in a **InputDecoration**)
  * **ShapeBorder**
  * **RoundedRectangleBorder**
  * Properties
    * **BorderRadius**
    * **BorderSide**
  * **BoxDecoration** = (_shape_, _boxShadow_ = collection of **BoxShadow**s)

## App & Navigation

* **WidgetsApp** = wraps a number of base functionality widgets (ie MediaQuery)
* **MaterialApp** = builds Material design on top of base **WidgetsApp**
* **Scaffold** = basic Material design layout with a set of pre-configured widgets
  * It's possible to use a Drawer without a Scaffold, in which case it's not modal (see <https://material.io/components/navigation-drawer/flutter>)
  * `drawerEdgeDragWidth`
* **PreferredSizeWidget** = base interface for widget that have an ideal size when unconstrained, such as **AppBar**
* **AppBar** = top menu (_leading_, _title_, _actions_ as wdigets to display after title, _bottom_), also see scrollable **SliverAppBar** (embeds **AppBar** & **CustomScrollView**)
* **Material** = piece of material (clipping, elevation, ink effects), `Material.of`, **MaterialInkController**, _shape_ (**Beveled/RoundedRectangleBorder** with _borderRadius_ **BorderRadius**)

* **BottomNavigationBar** = with **BottomNavigationBarItem**s (Material 2)
* NavigationBar = with **NavigationDestination**s (Material 3 w/ _useMaterial3_)
  * See [Material 3 navigation bar](https://m3.material.io/components/navigation-bar/overview) = nav menu (available)
  * See [Material 3 bottom app bar](https://m3.material.io/components/bottom-app-bar/overview) = 4 icons & FAB (in progress)

## Buttons & Images & Text

* Buttons
  * **CupertinoButton** = iOS-style button
  * **DropDownButton\<T>** = a Material Design button for selecting from a list of items
  * **ElevatedButton** = Material Design elevated button
  * **FilledButton** = fill-colored button (`FilledButton.tonal`)
  * **FloatActionButton** (aka **FAB**) = Scaffold stacked button, use _floatingActionButtonLocation_ to embed in _bottomNavigationBar_
  * **IconButton** = a Material Design icon button (_icon_, _tooltip_, _onPressed_, `IconButton.filled|filledTonal|outlined`)
  * **InkWell** = rectangle with touch responses (_on(Double)Tap_, _onLongPress_, _onHover_)
  * **OutlinedButton** = a TextButton with an outlined border (_borderSide_)
  * **RawMaterialButton** = base for a button with a child widget (eg **Text**, _fillColor_, _splashColor_, _shape_)
  * **SegmentedButton** = radio buttons looking like pills/tabs
  * **TextButton** = basic text button (`TextButton.icon()` = button with both text AND icon)
  * **ToggleButtons** = on/off/radio buttons (_isSelected_ = `List<bool>`, _onPressed_ controls selection logic, _abcColor_, _abcBorder_)
* Deprecated Buttons
  * _FlatButton_ = replaced with **TextButton**
  * _OutlineButton_ = replaced with **OutlinedButton**
  * _RaisedButton_ = replaced with **ElevatedButton**
* Button Styling
  * `ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.yellow)`
  * `ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red))`
  * `ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((Set<MaterialState> states) => states.contains(MaterialState.disabled) ? Colors.blueGrey : Colors.blue))`
* **Form** = form that can be saved/reset/validated (_onChanged_), with input fields
  * **FormField** = single form field (_onSaved_, _validator_)
  * **TextFormField** (_controller_: **TextEditingController**, _decoration_: **InputDecoration**, _validator_ checked on Form `validate()`)
    * This is a convenience widget wrapping a **TextField** in a **FormField**, so use former only if there is no enclosing **Form** (eg a search field)
* **TextEditingController** = gives access to associated **TextField** programmatically
* **TextField** = input text field (_controller_, _onChanged_, _decoration_: **InputDecoration** (_hintText_, _border_, _focusedBorder_, _prefix/suffixIcon_))
* **TextStyle** = à la CSS (_fontSize_)

## Containers & Layout

Basicall, widgets with multiple children.

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
* **EdgeInsets** = padding (_zero_, `all()`, `symmetric(vertical, horizontal)`, `only(right:…, top:…)`)
* **PageView** = horizontal or vertical swipable pages/screens (à la gallery/slideshow, _initialPage_, _scrollDirection_), controllable/queryable via **PageController** (_viewportFraction_)
* **RadioListTile** = literally Radio + (tappable anywhere) ListTile
* **RenderBox** = a **RenderObject** (inherits from it) in a 2D Cartesian coordinate system (with a _size_ property, and **BoxConstraint** _constraints_ property inherited from parent)
* **RenderObject** = render tree object handling concrete operations (layout, painting, hit testing, accessbility) without child model (undefined child/children/named children) nor coordinate system (Cartesian/polar)
  * **RenderObjectElement** = element that uses **RenderObjectWidget** as configuration, with an associated RenderObject in render tree
  * **RenderObjectWidget** = configuration for **RenderObjectElement**

* Lists & Grids = **DataTable**, **GridTile**, **GridView**, **ListTile**, **ListView**, **Table**
  * **ExpansionPanel** = expandable 'v' arrow tiles (`headerBuilder:(ctx,isOpen)`, _body_, _isExpanded_, _canTabOnHeader_ indicates whether whole header is tappable)
  * **ExpansionPanelList** = **ExpansionPanel** container (_expansionCallback_, _animationDuration_, _dividerColor_, _elevation_, _expandedHeaderPadding_)
  * **GridView** = grid layout; usually via `GridView.count()` constructor (_crossAxisCount_, _mainAxisSpacing_, _crossAxisSpacing_)
  * **GridTile** = (with **GridTileBar** as _header_ or _footer_)
  * **ListView** = scrollable list of children (_scrollDirection_, _reverse_, _physics_, _addAutomaticKeepAlives_, _cacheExtent_, `ListView.builder` with _itemBuilder_ & _itemExtent_, `ListView.separated` with _separatorBuilder_ & _itemCount_, `ListView.custom` with _childrenDelegate_ sliver)
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
  * **ConstrainedBox** = adds min & max h/w constraints to its parent's, resulting constraints are the more restrictive/forced ones (ie strict/tighter always win, eg screen)
  * **Container** = wraps child widget in margin/padding/size/color/decoration/shape (_aligment_ will fit parent, _constraints_ (eg `BoxConstraints.expand()`), _transform_)
    * Has no `createRenderObject()` method, it is a convenience compositional wrapper for other layout widgets ~ its properties (see its `build()` source code)
  * **FittedBox** = make child fit smaller parent with (no-wrap) scaling (_fit_ = `BoxFit.{value=contain|cover|fitH/W|fill|none}`, _alignment_)
  * **LimitedBox** = give limited constraints (_maxH/W_) to child with infinite (specifically, only) parent constraints (eg **ListView**/**Column**/**Row**/**UnconstrainedBox**)
  * **OverflowBox** = lets child be any size it wants, also removing parent constraints, but shows no warnings (simply hides excess/shows as much as it can)
  * **SizedBox** = give child a size (_w/h_, _double.infinity_ == max, _SizedBox.expand()_ == max _w/h_), use empty for spacing
    * [SizedBox.expand() vs Expanded](https://stackoverflow.com/a/72416413/3559724) = _SizedBox.expand()_ can be used anywhere
  * **Stack** = z-axis stacking (_fit_ to children `StackFit.loose` by default, or to parent `StackFit.expand`, _alignment_, _overflow_)
  * **UnconstrainedBox** = lets child be any size it wants, removing inbound parent (tight) constraints, with black/yellow warning if too large
  * **Wrap** = "word wrap" children (_direction_, _alignment_ _spacing_, _runSpaching_); good for buttons & chips

### Scroll

* `NeverScrollableScrollPhysics()` = prevents ListView scrolling when the user drags
* `ClampingScrollPhysics()`
* **CustomScrollView** = custom scroll via _slivers_ (**SliverAppBar**, **SliverList**, **SliverGrid**, `center: key`)
* **SingleChildScrollView** = makes child scrollable
  * This widget should be reserved to scenarios where the content is actually supposed to be displayed in full (ie not scrollable), but a smaller than usual devices' screen does make not that possible, so scroll must be added to avoid out-of-bounds
  * If the intent is to have a scrollable list, then _lazy_, _sliver-based_ **ListView**/**CustomScrollView** are vastly more efficient
  * To take advantage of lazy-optimization, the **ListView** must be dynamically built (using one of its builders eg `ListView.builder()`)
  * When using `ListView.builder(ctx, index)` make sure to not name the first parameter `context`, especially with inner `MediaQuery.of(context)`
* [ScrollController](https://api.flutter.dev/flutter/widgets/ScrollController-class.html) = pilots one or multiple scrollable widget(s)
  * Eg: **SingleChildScrollView**, **ListView**, **DraggableScrollableSheet**

## [Animations](https://docs.flutter.dev/ui/animations)

* Is it more like a drawing? => Image/Lottie/Rive
* Does it repeat forever? Is it discontinuous? Do multiple widgets animate at same time? => Explicit

* **AnimatedCrossFade** = fade-in/out transition (_first/secondChild_, _duration_, _crossFadeState_, _abcCurve_), set custom _layoutBuilder_ to avoid layout jumps
* **AnimatedList** = list with built-in animation when adding/removing item (_initialItemCount_ if not empty, _itemBuilder_, move item from both list & **AnimatedListState** from within item or GlobalKey elsewhere)
* **AnimatedSwitcher** = child transitions (set new child via `setState()`, set _transitionBuilder_ to **Fade/Scale/Rotation-Transition**), set _layoutBuilder_, use keys if new widget is of same type
* **Hero** = images/clips/etc. morphing animation between **Navigator** routes (_child_, _tag_)
* **HeroMode** = disables a **Hero**
* **Transform** = custom (PowerPoint-like) transitions (`rotate()`, `scale()`,, `skewX()` `translate()`, or 4x4 custom matrix)
* Tweens
  * **Animatable\<T>** = base abstract class for tweens, `Animatable<T>.animate(controller)` is identical to `controller.drive(Animatable<T>)`
  * **Tween** = linear interpolation between (generic) _begin_ & _end_ values
  * **AlignmentGeometryTween** = interpolation between two **AlignmentGeometry**
  * **AlignmentTween** = interpolation between two alignments
  * **ColorTween** = interpolation between two colors
  * **ConstantTween** = tween with a constant value
  * **CurveTween** = transforms value of a given animation by given **Curve** _curve_
  * **FractionalOffsetTween** = interpolation between two fractional offsets
  * **IntTween** = interpolation between two integers that rounds
  * **RectTween** = interpolation between two rectangles
  * **ReverseTween** = tween that evaluates its parent in reverse
  * **SizeTween** = interpolation between two sizes
  * **StepTween** = interpolation between two integers that floors

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

* Requires a **AnimationController** (and its proper disposal within a StatefulWidget's State)
* **Animation\<T>** = anything of type _T_ (double, Color, Size) that changes over time
* **AnimatedBuilder** (extends **AnimatedWidget** via **ListenableBuilder**) = full-custom explicit animation using Tweens (provide a _child_ to optimize rendering)
  * Set its _child_ property to an inert widget to more efficiently rebuilding only the parts that animated
  **AnimatedIcon** = controllable icon, explicit (=> requires a controller, see Animations done right) despite naming (`icon: AnimatedIcon.play_pause, progress: _controller`)
* **AnimationController** (extends `Animation<double>`) = animation pilot/player (_status_, _(reverse)Duration_, _isCompleted|Dismissed_, _value_)
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
  * **FadeTransition**
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
  * **ValueListenable** (abstract, extends **Listenable**) = interface for subclasses of **Listenable** that expose a (current/single) _value_
  * **Animation** (abstract, extends **Listenable**, implements **ValueListenable\<T>**) = animation with value _T_, and a concept of direction
  * **ChangeNotifier** (mixin, implements **Listenable**) = listenable with `notifyListeners()`
  * **ValueNotifier** (extends **ChangeNotifier**, implements **ValueListenable\<T>**) = a **ChangeNotifier** that holds a single (mutable) value triggering notifiations

* **ListenableBuilder** = widget rebuilding its subtree when a given **Listenable** changes (without `setState()`, set optional _child_ to const subtree for performance)
* **ValueListenableBuilder** = widget syncing its content with a **ValueListenable** object (without `setState()`, set optional _child_ to const subtree for performance)

## [Flutter: Widgets of the Week](https://www.youtube.com/watch?v=lkF0TQJO0bA&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=129)

1. **SafeArea** = checks MediaQuery to ensure we get a neat uncut rectangle on the screen (no obstructing system status bar or hardware objects)
2. Expanded
3. Wrap
4. AnimatedContainer
5. **Opacity** & **AnimatedOpacity** = alpha (0 is like CSS' `invisiblility: hidden`)
6. **FutureBuilder** = display something while loading a future's result and something else when it's done
7. **FadeTransition** = explicit opacity animation via _animationController_ (clean it up in dispose())
8. FloatActionButton
9. PageView
10. Table
11. **SliverAppBar** = scroll-reactive top menu using **CustomScrollView** (_expandedHeight_, _flexibleSpace_, _floating_, _pinned_)
12. SliverList & SliverGrid
13. **FadeInImage** = placeholder for images (_placeholder_ from directory/memory, _fadeInDuration_, _fadeInCurve_, **transparent_image** package)
14. **StreamBuilder** = rebuilds its children whenever stream data arrives (_initialData_, `snapshot.connectionState|data|error`, `snapshot.hasData|Error`)
15. **InheritedModel**`<T>` = more granular **InheritedWidget** for particular fields (via _aspect_), `@override updateShouldNotifyDependent()`
16. ClipRRect
17. Hero
18. **CustomPaint** = low-level paint calls (_size_, _painter_); surround with `FittedBox(SizedBox(width: image.width.toDouble(), height:…))`, (see _Custom painting in Flutter_ video)
19. **Tooltip** = accessibility-friendly alt text (_child_, _message_, _verticalOffset_, _height_), some Widgets have a _tooltip_ property
20. FittedBox
21. **LayoutBuilder** = provide **constraints**-aware _builder_ function, useful to make adaptative layout
22. **AbsorbPointer** = disable all pointer/touch events over a widgets group (_absorbing_, _ignoringSemantics_ for screen readers ignoring)
23. Transform
24. **BackdropFilter** & ImageFilter class = image blur/rotate/skew/stretch effects (`blur()`, `matrix()`), use with parent **Stack** & _fill_
25. Align
26. Positioned
27. AnimatedBuilder
28. Dismissible
29. SizedBox
30. ValueNotifier & ValueListenableBuilder
31. **Draggable\<T>** (_data_, _child(WhenDragging)_, _feedback_) & **DragTarget\<T>** (_builder_, _onWillAccept_, _onAccept_, _onLeave_)
32. AnimatedList
33. Flexible
34. **MediaQuery** = Object used to retrieve info about screen size, orientation, text scaling
35. Spacer
36. **InheritedWidget** = passing data from ancestors to descendants via the **BuildContext** (matching nearest tree ancestor of same type), used by framework (eg **Theme**)
37. **AnimatedIcon** = (`icon: AnimatedIcon.play_pause, progress: myAnimation`, `myAnimation.forward/reverse()`)
38. **AspectRatio** = formats _child_ to be a specific box ratio (_aspectRatio_ as `width / height` for readability), incompatible with (parent) **Expanded** (unless using **Align** between)
39. LimitedBox
40. **Placeholder** = temporary stand-in while building the UI (use _fallbackHeight/Width_ inside unbounded parent, _color_, _strokWidth_)
41. **RichText** = multiple styles per line (`text: TextSpan(style: …, children: <TextSpan>[…]`) for when standard **Text** is not enough
42. **ReordableListView** = drag & drop list items (_children_, `onReorder: (old, new) {setState()}`, optional _header_); use with **ListTile**
43. **AnimatedSwitcher** = child transition animation (_duration_, _child_ via `setState()`, _transitionBuilder_); use keys if same type
44. AnimatedPositioned
45. **AnimatedPadding** = animated **Padding** reacting to properties change (_curve_, _duration_, _padding_ via `setState()`)
46. **IndexedStack** = **Stack** showing one of several _children_ widgets at a time (_index_ via `setState()`)
47. **Semantics** = provide child Widget with (lots of) meta-information, improving accessibility
48. ConstrainedBox
49. Stack
50. AnimatedOpacity
51. **FractionallySizedBox** = size by percentage (_heigh/widthFactor_), align in parent or wrap in **Flexible**; use no child for whitespacing
52. ListView
53. ListTile
54. Container
55. **SelectableText** = (_showCursor_, _cursorWidth_, _cursorColor_, _cursorRadius_, _toolbarOptions_, _onTap_, _scrollPhysics_, `.rich()`)
56. **DataTable** = grid-like (_columns_, _rows_, _sortColumnIndex_, _sortAscending_; **DataColumn** _label_, _numeric_, **DataRow** _selected_, _cells_; **DataCell** _showEditIcon_, _placeholder_, and all cells are widget themselves => customizable), wrap in **SingleChildScrollView**
57. (Material) **Slider**, **RangeSlider**, **CupertinoSlider** = sliders (_onChanged_, _min/max_, _divisions_, _label_, `Slider.adaptive()`)

* **(Cupertino)AlertDialog** = pop-up (_title_, _content_ (any), _actions_, _elevation_, _backgroundColor_, _shape_, _barrierDismissible_)
* **DraggableScrollableSheet** = draggable container (_builder_ => pass `scrollControlller` to **SingleChildScroll/ListView**, _abcSize_)
* **ColorFiltered** = apply color filter over images/widgets groups (eg: `colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation)`)
* **CupertinoActionSheet** = iOS-themed actions sliding from the bottom
* **Image** = image (_fit_, _colorBlendMode_, _semanticLAbel_) via asset (sizes in _pubspec.yaml_), network (_loadingBuilder_), file, memory
* **DefaultTabController**, **TabBar**, **TabBarView** = tabbed widgets
* **Drawer** = **Scaffold** `(end)drawer:` (`child:` col of **DrawerHeader** & **ListTile**s), open via `Scaffold.of(context).open(End)Drawer()`
* **SnackBar** = pop-up a temporary message holding _content_ (ie a widget), open via `Scaffold.of(context).showSnackBar(…)` (can use a **Builder** to pass it _context_)
* **ListWheelScrollView** = price-is-right 3D carousel list (_itemExtent_, _diameterRatio_, _offAxisFraction_, _userMagnifier_ & _magnification_)
* **ShaderMask** = apply color/gradient/image masks (`shaderCallback(bounds) => abcGradient().createShader(bounds)`)
* **NotificationListener** = listen to some descendant widget's notifications. Custom notifications can also be sent
* **Builder** = widget used to access an ancestor's **BuildContext**, from **within same `build()` method** where that ancestor is also declared in (as it otherwise does not exist yet in that context)
  * That ancestor is an InheritedWidget like **Scaffold**, **Navigator**, **ThemeData**, **MediaQuery**, **Provider\<T>**
  * Was created to avoid overkill of splitting a very simple widget into two child/parent (giving access to parent's context to child)
* **Circular/LinearProgressIndicator** = Material (in)determinate progress (_value_, _value/bgColor_, `ThemeData.accentColor` by default)
* **Divider** = basically HTML's `<hr>` (_thickness_, _(end)Indent_), set once for all via **MaterialApp**'s **ThemeData**'s _dividerTheme_
* **IgnorePointer** = ignore pointer/touch events on a specific child (but [click can bubble up](https://stackoverflow.com/a/55431032/3559724))
* **CupertinoActivityIndicator** = Apple's counterpart for **CircularProgressIndicator**
* **Padding** = padding
* **CheckboxListTile** = literally Checkbox + (tappable anywhere) ListTile (`secondary`, `controlAffinity`, `value`, `onChanged`, coloring)
* **AboutDialog** = boring legalese stuff (`showAboutDialog()`, `application`, `children`, `LicenseRegistry.addLicense()`)
* **SliverAppBar** (again) = AppBar reacting to scroll, now with new effects (zoom, blur)
* **InteractiveViewer** = lets user interact (ie pan/scale/zoom) with content larger than the device
* **GridView** = Grid (`.builder()`, `.count()`, `.extent()`, `crossAxisCount`, `main|crossAxisSpacing`)
* **SwitchListTile** = literally Switch + (tappable anywhere) ListTile (`value`, `onChanged` with `setState()`, `(in)activeThumbImage`)
* **ImageFiltered** & **BackdropFilter** = filters (blur, scale, translate, skew, rotate)
* **PhysicalModel** = rectangle with rounded corners with 3D shadow effects based on (z-axis pixels) _elevation_, with antialising clipping (also see **PhysicalShape** for shapes other than rectangle)
* **RotatedBox** = affects layout (ie moves everything around it, `quarterTurns`), in contrast, `Transform.rotate()` affects rendering, not layout (ie acts as if original was still in place)
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
* **GestureDetector** = detects user taps, long presses, drags, etc.
* **Freezed**
* **Baseline**
* **Badges**
* **ScaffoldMessenger**
* **StatefulBuilder** = rebuild only a subtree by using a scoped StateSetter (`builder: (ctx, setState)`), can actually even be used in a Stateless widget
* **RepaintBoundary**
* **FocusableActionDetector**
* **NavigationRail**
* **AutoComplete**
* **LinearGradient**
* **Focus**
* **Shortcuts**
* **Actions**
