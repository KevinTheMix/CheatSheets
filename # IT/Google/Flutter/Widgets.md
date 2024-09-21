# Flutter [Widgets](https://docs.flutter.dev/development/ui/widgets) (& Classes)

* **Canvas** = eg `canvas.drawArc()` draws circle (arc)
* **SelectionArea** = selectable text (Flutter >=3.3)
* **SimpleDialog** = modal dialog (_contentPadding_, _children_)
* [ResizeImage](https://api.flutter.dev/flutter/painting/ResizeImage-class.html)

## App & Navigation

* [WidgetsApp](https://api.flutter.dev/flutter/widgets/WidgetsApp-class.html) = wraps a number of base functionality widgets (ie MediaQuery)
* [MaterialApp](https://api.flutter.dev/flutter/material/MaterialApp-class.html) = builds Material design on top of the base **WidgetsApp**
* [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html) = basic Material design layout with a set of pre-configured widgets
  * It's possible to use a Drawer without a Scaffold, in which case it's not modal (see <https://material.io/components/navigation-drawer/flutter>)
  * `drawerEdgeDragWidth`
* PreferredSizeWidget = base interface for widget that have an ideal size when unconstrained, such as **AppBar**
* [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html) = top menu (_leading_, _title_, _actions_, _bottom_)
* [Material](https://api.flutter.dev/flutter/material/Material-class.html)

* [BottomNavigationBar](https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html) with **BottomNavigationBarItem**s (Material 2)
* [NavigationBar](https://api.flutter.dev/flutter/material/NavigationBar-class.html) with **NavigationDestination**s (Material 3 w/ _useMaterial3_)
  * See [Material 3 navigation bar](https://m3.material.io/components/navigation-bar/overview) = nav menu (available)
  * See [Material 3 bottom app bar](https://m3.material.io/components/bottom-app-bar/overview) = 4 icons & FAB (in progress)

## Buttons

* **ElevatedButton**, **TextButton**, **OutlinedButton**, **IconButton**
  * `TextButton.icon()` = button with both text AND icon
* **InkWell** = rectangle with touch responses (_on(Double)Tap_, _onLongPress_, _onHover_)
* **RawMaterialButton** = base for a button with a child widget (eg a `Text()`; properties: _fillColor_, _splashColor_, _shape_)

## Scroll

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

## Containers & Layout

* **ColoredBox**
* **RadioListTile** = literally Radio + (tappable anywhere) ListTile
* **Card** = Material rectangle shape with rounded corners and z-axis (_elevation_) shadow; size depends on the child unless its parent specifies
  * This is actually a simplified [Material](https://api.flutter.dev/flutter/material/Material-class.html) widget, which can take other shapes

* Clips = wraps a _child_ widget to only show its parts covered by built-in (**ClipOval**, **ClipRRect**) shape or custom (**ClipPath**) path
  * **ClipOval** = auto-adaptative circle/oval cutting (_clipper_ `extends CustomClipper<Rect>`), can be animated for fun effects
  * **ClipRRect** (**R**ounded) = rounded rectangle (_child_, _borderRadius_, _clipBehavior_)
  * **ClipPath** = create own (svg-like) shape (`clipper: KokoClipper()` where `class KokoClipper extends CustomClipper<Path>`)
    * [Example](https://stackoverflow.com/a/70820679) basic
    * [Example](https://stackoverflow.com/a/69476516) using `quadraticBezierTo(…)`

* **CircleAvatar** = circle container (_back/foreground_ with text fallback, append `.image` to **Image**), usually for user pfp

* Lists & Grids = ListView, DataTable, Table, GridView, ListTile, GridTile (with GridTileBar as _header_ or _footer_)
  * **GridView** = grid layout; usually via `GridView.count()` constructor (_crossAxisCount_, _mainAxisSpacing_, _crossAxisSpacing_)
* Wrappers = Container, Column/Row, Stack, FittedBox, SizedBox, LimitedBox, ConstrainedBox, UnconstrainedBox, OverflowBox, Wrap, FractionallySizedBox
  * **Container** has no `createRenderObject()` method; it is a compositional wrapper for other layout widgets ~ its properties (see its `build()` source code)
  * **Column**/**Row** (inheriting from **Flex**)
    * They are flex spaces, giving unbounded constraints to all their children to let them choose their space (& usually asking them to shrinkWrap)
      * The space given to their _flexible_ children is the remaining space = parent_constraints - fixed_items
    * They themselves take up max size in their main axis by default (ie `mainAxisSize: MainAxisSize.max`)
  * [Flex](https://api.flutter.dev/flutter/widgets/Flex-class.html) = base class for Column & Row
* Positioning = Align, Center, Positioned, Expanded, Flexible
* `BoxConstraints.loose()` (min<max), `BoxConstraints.tightFor[Finite]()` (min==max), `BoxConstraints.expand()` (max)
* **EdgeInsets** = padding (_zero_, `all()`, `symmetric(vertical, horizontal)`, `only(right)`)
* ShapeBorder = **RoundedRectangleBorder**, **StadiumBorder**

## [Animations](https://docs.flutter.dev/ui/animations)

* `Color.lerp()`
  * Use [colors linear interpolation](https://stackoverflow.com/a/66385071/3559724) between tabs transitions (via **TabController**'s _offset_)

### Implicit

Performed automatically when a property updates (via setState()), non-repeating, continuous, single.

* **Animated-Foo** widgets
  * **AnimatedCrossFade** = A/B fade transition (_crossFadeState_), use custom _layoutBuilder_ to avoid layout jumps
  * **AnimatedList** = ListViews with built-in visual feedback on adding/removing item
  * **ImplicitlyAnimatedWidget** = base class
    * **AnimatedAlign** = alignment update transition
    * **AnimatedContainer** = versatile linear interpolation (`transform: Matrix4.identity()..translate()..multiply()`)
    * **AnimatedOpacity** = opacity animation (_curve_, _duration_, _opacity_ via `setState()`)
    * **AnimatedPadding** = padding animation (_curve_, _duration_, _padding_ via `setState()`)
    * **AnimatedPositioned** = animated **Positioned** reacting to properties change; useful to implement custom slider
    * **AnimatedPhysicalModel** = animated _borderRadius_, _color_ & _elevation_
    * **AnimatedRotation**
    * **AnimatedSlide** = offset transition
    * **AnimatedScale**
* **TweenAnimationBuilder\<T>** = custom implicit animation (_tween_, _duration_, _builder_, _curve_, _onEnd_), pass _child_ for performance
  * It always chases its _tween_'s end point, which can be adjusted (if set to a state variable) as the animation is playing
  * That means it can be somehow controlled, or at least its end target can, via state (eg _driven by_ a user slider)
  * Can be used for _continuous_ (ie pulsating) repeating animations using its `onEnd` callback set the end point to the start value and back
  * Tweens are mutable, so if value range never changes, place tweens (eg _ColorTween_) in a `static final` variable (ie outside of `build()`)

### Explicit

To be started/piloted manually, for infinitely repeating, discontinued, or multi-widgets animations.

* Requires a **AnimationController** (and its proper disposal within a StatefulWidget's State)
* **Animation\<T>** = anything of type _T_ (double, Color, Size) that changes over time
* **AnimatedBuilder** = full-custom explicit (ie coded by the developer) animation using Tweens (provide _child_ to optimize rendering)
  * Set its _child_ property to an inert widget to more efficiently rebuilding only the parts that animated
  **AnimatedIcon** = (`icon: AnimatedIcon.play_pause, progress: _controller`)
* **AnimationController** = animation pilot/player (`vsync: this`, _(reverse)Duration_, _isCompleted|Dismissed_, _value_)
  * The containing widget must mixin **(Single)TickerProviderStateMixin** to allow for `vsync: this` (see Deep Dive about tickers)
  * `add(Status)Listener()`, `forward()`, `fling()`, `repeat()`, `reverse()`, `dispose()`, `animateTo(double value)` similar to TweenAB's end
  * It's possible to use controllers without AnimatedBuilder by using a Listener that setState()s a state variable (though it is less efficient)
  * Listening widgets don't _actually_ have to use the controller's `value` (but makes sense they do); they just get refreshed while it's playing
* **AnimatedWidget** = abstract base class for built-in & custom **Foo-Transition**s, with a single _listenable_ property
  * Can be extended, in which case its _listenable_ property expects an animation, which is typically an **AnimationController**
* **Foo-Transition** = built-in explicit animations (where Foo = Size, Fade, Align, Scale, DecoratedBox, DefaultTextStyle, Positioned, Slide, Rotation)

* Curves
  * **CurvedAnimation** = wraps a controller with a curve `CurvedAnimation(parent: _controller, curve: Curves.bounceIn)`
    * Can be used in places where an **AnimationController** is expected eg `tween.animation(…)`
  * `easeIn|Out`, `elasticIn|Out`, `linear`

## Transitions

* **AnimatedSwitcher** = child transition animation (_duration_, _child_ via `setState()`, _transitionBuilder_); use keys if same type
* **Hero** = morphing animation between navigation routes (_child_, _tag_)
* **Transform** = custom (PowerPoint-like) transitions (`.rotate()` with _angle_, `scale()`, `translate()`, or 4x4 custom matrix)

## [Flutter: Widgets of the Week](https://www.youtube.com/watch?v=lkF0TQJO0bA&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=129)

1. **SafeArea** = checks MediaQuery to ensure we get a neat uncut rectangle on the screen (no obstructing system status bar or hardware objects)
2. **Expanded** = expands a child widget to take up all available space in its parent
3. **Wrap** = "word wrap" children (_direction_, _alignment_ _spacing_, _runSpaching_); good for buttons & chips
4. **AnimatedContainer** = implicit (ie built-in) animations via linear interpolation (_color_, _shadow_, layouts, _curve_ & _duration_)
5. **Opacity** & **AnimatedOpacity** = alpha (0 is like CSS' `invisiblility: hidden`)
6. **FutureBuilder** = display something while loading a future's result and something else when it's done
7. **FadeTransition** = explicit opacity animation via _animationController_ (clean it up in dispose())
8. **FloatActionButton** (aka **FAB**) = Scaffold stacked button; use _floatingActionButtonLocation_ to embed in _bottomNavigationBar_
9. **PageView** = left-right swipable pages via PageController (_initialPage_, _scrollDirection_)
10. **Table** = simpler fixed grid layout (_defaultVerticalAlignment_, _defaultColumnWidth_, _columnWidths_, _border_ )
11. **SliverAppBar** = scroll-reactive top menu using **CustomScrollView** (_expandedHeight_, _flexibleSpace_, _floating_, _pinned_)
12. **SliverList** & **SliverGrid** = advanced scrolling control (_delegate_: `Sliver[Child|Builder]ListDelegate`, `.count()` & `.extent()` ctors)
13. **FadeInImage** = placeholder for images (_placeholder_ from directory/memory, _fadeInDuration_, _fadeInCurve_, **transparent_image** package)
14. **StreamBuilder** = rebuilds its children whenever stream data arrives (_initialData_, `snapshot.connectionState|data|error`, `snapshot.hasData|Error`)
15. **InheritedModel**`<T>` = more granular **InheritedWidget** but on specific fields (via _aspect_), `@override updateShouldNotifyDependent()`
16. **ClipRRect** = (R for) **r**ounded corners rectangle (_child_, _borderRadius_, _clipBehavior_), similar to **ClipOval**, **ClipPath**
17. **Hero** = morphing animation between navigation routes (_child_, _tag_)
18. **CustomPaint** = low-level paint calls (_size_, _painter_); surround with `FittedBox(SizedBox(width: image.width.toDouble(), height:…))`, see [Flutter mini-series n°2 Episode 4: Advanced UI with CustomPainter](https://www.youtube.com/watch?v=vvI_NUXK00s)
19. **Tooltip** = accessibility-friendly alt text (_child_, _message_, _verticalOffset_, _height_), some Widgets have a _tooltip_ property
20. **FittedBox** = make child fit smaller parent with (no-wrap) scaling (_fit_ = `BoxFit.{value=contain|cover|fitH/W|fill|none}`, _alignment_)
21. **LayoutBuilder** = provide **constraints**-aware _builder_ function, useful to make adaptative layout
22. **AbsorbPointer** = disable all pointer/touch events over a widgets group (_absorbing_, _ignoringSemantics_ for screen readers ignoring)
23. **Transform** = custom (PowerPoint-like) transitions (`.rotate()` with _angle_, `scale()`, `translate()`, or 4x4 custom matrix)
24. **BackdropFilter** & ImageFilter class = image blur/rotate/skew/stretch effects (`blur()`, `matrix()`), use with parent **Stack** & _fill_
25. **Align** = position a child within its parent (_t/b/r/l_, or specific _double_ value) à la HTML relative position (see **AlignmentTween** & **AnimatedAlign**)
26. **Positioned** = position children within a **Stack** (_t/b/r/l/heigh/width_, `fill()`) à la HTML absolute position
27. **AnimatedBuilder** = explicit (ie coded by the developer) animation using Tweens (provide _child_ to optimize rendering)
28. **Dismissible** = left/right swipeable items (_key_, (secondary)_background_, _direction_ , `onDismissed()` to remove underlying item)
29. **SizedBox** = give child a size (_w/h_, `double.infinity` == max, `SizedBox.expand()` == max _w/h_), use empty for spacing
30. **ValueNotifier** & **ValueListenableBuilder** = Observer pattern replacing `setState()` (set optional _child_ to const subtree for performance)
31. **Draggable\<T>** (_data_, _child(WhenDragging)_, _feedback_) & **DragTarget\<T>** (_builder_, _onWillAccept_, _onAccept_, _onLeave_)
32. **AnimatedList** = `itemBuilder: (context, index, animation) {…}`, _initialItemCount_ if not empty, `AnimatedListState.insert/removeItem()`
33. **Flexible** = give child widgets a percentage of the available space within their parent **Column**/**Row** (_flex_, _fit_)
34. **MediaQuery** = Object used to retrieve info about screen size, orientation, text scaling
35. **Spacer** = add custom spaces within Column/Row beyond their simple _mainAxisAligment_ (_flex_ distributes available space)
36. **InheritedWidget** = passing data from ancestors to descendants via the **BuildContext**
37. **AnimatedIcon** = (`icon: AnimatedIcon.play_pause, progress: myAnimation`, `myAnimation.forward/reverse()`)
38. **AspectRatio** = preserve box ratio (_aspectRatio_ as `width/height` for readability, _child_), incompatible w/ **Expanded** (**Align** between)
39. **LimitedBox** = give limited constraints (_maxH/W_) to child with infinite parent (**ListView**/**Column**/**Row**/**UnconstrainedBox**)
40. **Placeholder** = temporary stand-in while building the UI (use _fallbackHeight/Width_ inside unbounded parent, _color_, _strokWidth_)
41. **RichText** = multiple styles per line (`text: TextSpan(style: …, children: <TextSpan>[…]`) for when standard **Text** is not enough
42. **ReordableListView** = drag & drop list items (_children_, `onReorder: (old, new) {setState()}`, optional _header_); use with **ListTile**
43. **AnimatedSwitcher** = child transition animation (_duration_, _child_ via `setState()`, _transitionBuilder_); use keys if same type
44. **AnimatedPositioned** = animated **Positioned** reacting to properties change; useful to implement custom slider
45. **AnimatedPadding** = animated **Padding** reacting to properties change (_curve_, _duration_, _padding_ via `setState()`)
46. **IndexedStack** = **Stack** showing one of several _children_ widgets at a time (_index_ via `setState()`)
47. **Semantics** = provide child Widget with (lots of) meta-information, improving accessibility
48. **ConstrainedBox** = adds min & max h/w constraints to its parent's (the resulting constraints are the more restrictive ones eg the screen)
49. **Stack** = z-axis stacking (_fit_ to children `StackFit.loose` by default, or to parent `StackFit.expand`, _alignment_, _overflow_)
50. **AnimatedOpacity** = implicit (ie piloted via property) opacity animation (_duration_, _opacity_ via `setState()`, _curve_)
51. **FractionallySizedBox** = size by percentage (_heigh/widthFactor_), align in parent or wrap in **Flexible**; use no child for whitespacing
52. **ListView** = scrollable list (_scrollDirection_, _reverse_, _physics_, _addAutomaticKeepAlives_, _cacheExtent_, `ListView.builder` with _itemBuilder_ & _itemExtent_, `ListView.separated` with _separatorBuilder_ & _itemCount_, `ListView.custom` with _childrenDelegate_ sliver)
53. **ListTile** = Material List item (up to 3 lines _title_/_subtitle_/_isThreeLine_, _dense_, `tap`, `onLongPress`, `ListTile.divideTiles()`)
54. **Container** = wraps child widget in margin/padding/size/color/decoration/shape (_aligment_ will fit parent, _constraints_, _transform_)
55. **SelectableText** = (_showCursor_, _cursorWidth_, _cursorColor_, _cursorRadius_, _toolbarOptions_, _onTap_, _scrollPhysics_, `.rich()`)
56. **DataTable** = grid-like (_columns_, _rows_, _sortColumnIndex_, _sortAscending_; **DataColumn** _label_, _numeric_, **DataRow** _selected_, _cells_; **DataCell** _showEditIcon_, _placeholder_, and all cells are widget themselves => customizable), wrap in **SingleChildScrollView**
57. (Material) **Slider**, **RangeSlider**, **CupertinoSlider** = sliders (_onChanged_, _min/max_, _divisions_, _label_, `Slider.adaptive()`)

* **(Cupertino)AlertDialog** = pop-up (_title_, _content_ (any), _actions_, _elevation_, _backgroundColor_, _shape_, _barrierDismissible_)
* **AnimatedCrossFade** = fade transition (_first/secondChild_, _duration_, _crossFadeState_, _abcCurve_), use _layoutBuilder_ for custom
* **DraggableScrollableSheet** = draggable container (_builder_ => pass `scrollControlller` to **SingleChildScroll/ListView**, _abcSize_)
* **ColorFiltered** = apply color filter over images/widgets groups (eg: `colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation)`)
* **ToggleButtons** = on/off/radio buttons (_isSelected_ = `List<bool>`, _onPressed_ controls selection logic, _abcColor_, _abcBorder_)
* **CupertinoActionSheet** = iOS-themed actions sliding from the bottom
* **TweenAnimationBuilder** = custom implicit animation (_duration_, _builder_, _curbe_, _onEnd_), pass _child_ for performance
* **Image** = image (_fit_, _colorBlendMode_, _semanticLAbel_) via asset (sizes in _pubspec.yaml_), network (_loadingBuilder_), file, memory
* **DefaultTabController**, **TabBar**, **TabBarView** = tabbed widgets
* **Drawer** = **Scaffold** `(end)drawer:` (`child:` col of **DrawerHeader** & **ListTile**s), open via `Scaffold.of(context).open(End)Drawer()`
* **SnackBar** = pop-up a temporary (widget) message, open via `Scaffold.of(context).showSnackBar()` (use a **Builder** to pass it _context_)
* **ListWheelScrollView** = price-is-right 3D carousel list (_itemExtent_, _diameterRatio_, _offAxisFraction_, _userMagnifier_ & _magnification_)
* **ShaderMask** = apply color/gradient/image masks (`shaderCallback(bounds) => abcGradient().createShader(bounds)`)
* **NotificationListener** = listen to some descendant widget's notifications. Custom notifications can also be sent
* **Builder** (not to be confused with the usual _builder_ property) = a widget used to access an (InheritedWidget) ancestor's **BuildContext**, from **within the same `build()` method** (the ancestor is usually **Scaffold**, **Navigator**, **ThemeData**, **MediaQuery**, **Provider\<T>**)
* **ClipPath** = custom (svg-like) shape (_clipper_ `extends CustomClipper<Path>`)
* **Circular/LinearProgressIndicator** = Material (in)determinate progress (_value_, _value/bgColor_, `ThemeData.accentColor` by default)
* **Divider** = basically HTML's `<hr>` (_thickness_, _(end)Indent_), set once for all via **MaterialApp**'s **ThemeData**'s _dividerTheme_
* **IgnorePointer** = ignore pointer/touch events on a specific child (but [click can bubble up](https://stackoverflow.com/a/55431032/3559724))
* **CupertinoActivityIndicator** = Apple's counterpart for **CircularProgressIndicator**
* **ClipOval** = auto-adaptative circle/oval cutting (_clipper_ `extends CustomClipper<Rect>`), can be animated for fun effects
* **AnimatedWidget** (abstract class) = custom transition that is not one of the built-in (**Size/Fade/Align/Scale/DecoratedBox/DefaultTextStyle/Positioned/Slide/Rotation-Transition**)
* **Padding** = padding
* **CheckboxListTile** = literally Checkbox + (tappable anywhere) ListTile (`secondary`, `controlAffinity`, `value`, `onChanged`, coloring)
* **AboutDialog** = boring legalese stuff (`showAboutDialog()`, `application`, `children`, `LicenseRegistry.addLicense()`)
* (_async_ package)
* (_url\_launcher_ package)
* (_sqflite_ package)
* **SliverAppBar** (again) = AppBar reacting to scroll, now with new effects (zoom, blur)
* **InteractiveViewer** = lets user interact (ie pan/scale/zoom) with content larger than the device
* **GridView** = Grid (`.builder()`, `.count()`, `.extent()`, `crossAxisCount`, `main|crossAxisSpacing`)
* **SwitchListTile** = literally Switch + (tappable anywhere) ListTile (`value`, `onChanged` with `setState()`, `(in)activeThumbImage`)
* (_location_ package)
* (_device\_info_ package)
* **ImageFiltered** & **BackdropFilter** = filters (blur, scale, translate, skew, rotate)
* **PhysicalModel** = custom 3D shadow effects
* (_animations_ package)
* (_flutter\_slidable_ package)
* **RotatedBox** = affects layout (ie moves everything around it, `quarterTurns`); in contrast, `Transform.rotate()` affects rendering, not layout (ie acts as if original was still in place)
* **ExpansionPanel** & **ExpansionPanelList** = expandable _v_ widget (`animationDuration`, `elevation`, `expandedHeaderPadding`, `canTabOnHeader`)
* **Scrollbar** = add scrollbar to _finite_ scrollable widget (**List|Grid|CustomScrollView**) (`isAlwaysShown`, `showTrackOnHover`, ScrollbarTheme)
* **Connectivity**
* **FlutterLogo** (100th Widget of the Week!) = built-in Flutter logo (`size`)
* (_animated\_text\_kit_ package)
* **MouseRegion**
* (_sensor\_plus_ package)
* **Collection**
* **HeroMode**
* (_html_ package)
* **RefreshIndicator** = pull-to-refresh
* (_font\_awesome\_flutter_ package)
* **Flow**
* **TabPageSelector**
* **Theme**
* **CachedNetworkImage**
* **GestureDetector** = detects user taps, long presses, drags, etc.
* **Freezed**
* (_path\_provider_ package)
* (_get\_it_ package)
* **Baseline**
* **Badges**
* **DropDownButton**
* **ScaffoldMessenger**
* **StatefulBuilder** = rebuild only a subtree by using a scoped StateSetter (`builder: (ctx, setState)`); can even be used in a Stateless widget!
* **RepaintBoundary**
* (_google\_fonts_ package)
* (_shared\_preferences_ package)
* **FocusableActionDetector**
* (_mason_ package)
* **NavigationRail**
* **AutoComplete**
* **LinearGradient**
* (_flutter\_rating\_bar_ package)
* **TextStyle**
* **Focus**
* **Shortcuts**
* **Actions**
