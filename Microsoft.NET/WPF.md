# WPF (Windows Presentation Foundation)

Unlike its predecessor WinForm, it's not based on Windows API but built from scratch/the ground up.
In WinForms used the same language for GUI (usually maintained through IDE tools) & code-behind.
WPF uses a combination of XAML for markup + any choice of .NET language as code-behind => the GUI can be easily edited as plain text (à la HTML).

All controls act as containers for other controls in a nested fashion, enabling modularity of design.
Most of the WPF API is contained in _PresentationFramework.dll_ which contains the _System.Windows_ namespaces.

## Quick Tips

## Glossary

* [Adorners](https://docs.microsoft.com/en-us/dotnet/framework/wpf/controls/adorners-overview)
  * Use Adorners to display a '_Loading..._' atop a target UI element
* **Attached Property** = a construct similar to a Dependency Property that uses a static method instead of a property get/setter, so that it can be called from other classes statically
* **Binding** = mechanism via which values can be provided from a source (ie an object) at runtime, via **Markup Extension** syntax
  * `{Binding}` = default without source specified binds to the whole current data context
  * `{Binding NameOfProperty}` (or `{Binding Path=NameOfProperty}` where _Path_ is the default property of Binding) = binds to a given **public property** (not a variable!) of the current data context
  * `{Binding NameOfAttribute, ElementName=Element}` = binds to the attribute (ie a Dependency Property since it has to react to change) of another element
  * `xmlns:system="clr-namespace:System;assembly=mscorlib"` then `Source={x:Static system:DateTime.Now}` = binds to a CLR value
  * [BindingMode](https://learn.microsoft.com/en-us/dotnet/api/system.windows.data.bindingmode) values = _Default_, _OneTime_, _OneWay_, _OneWayToSource_, _TwoWay_
  * **RelativeSource** = binds to an element relative to this one (see default property [mode](https://learn.microsoft.com/fr-fr/dotnet/api/system.windows.data.relativesourcemode), eg use _Self_ to display its current Width as Text)
  * [Colin Eberhardt - Everything about databinding](https://blog.scottlogic.com/2012/04/05/everything-you-wanted-to-know-about-databinding-in-wpf-silverlight-and-wp7-part-one)
  * Binding can be bypassed altogether and information passed from code-behind (à la WinForm) via controls names (eg `this.lbxUsers.Items.Add(new User("Koko"));`, but error if `ItemsSource` dependency property was set)
* [ContentControl](https://learn.microsoft.com/en-us/dotnet/api/system.windows.controls.contentcontrol) (inherits from **Control**) = base class for all controls that have a **Content** property
  * Content = the most useful property of a `ContentControl`; their nature (type) depend on the type of Control (e.g. the Content of a Textblock is its Text)
  * An intermediary container (eg `<Element><WrapPanel><Control*n></WrapPanel></Element>`) must be used in case multiple children are provided as (a parent's single child) Content
  * `ContentTemplate` property = sets the **DataTemplate** of a **ContentControl**
* [ContentPresenter](https://stackoverflow.com/a/1288006) = element within a **ControlTemplate** that acts as a placeholder and defines where the actual **Content** of the templated control will be displayed
* [ControlTemplate](https://docs.microsoft.com/en-us/dotnet/desktop/wpf/themes/how-to-create-apply-template)
  * Provides full customization over how a FrameworkElement gets displayed, beyond what the basic properties (e.g. _Background_, _FontFamily_) permit
  * `TargetType` property = use a `x:Type` to replace the default display template of all controls of type _Type_
    * Unless the template is referred to explicitly by `x:Key` or applied to a specific control: `<Element Template="{StaticResource [TemplateName]}" />`
    * Eg `<ControlTemplate x:Key="[TemplateName]" TargetType="{x:Type [Type]}">` (or just `<ControlTemplate x:Key="[TemplateName]" TargetType="[Type]">` with [inbuilt type conversion](https://stackoverflow.com/a/13559167))
* **Converters** = type conversion assisted binding (eg "True" => `true`)
  * First define the converter class that inherits from `IValueConverter` or `IMultiValueConverter` (eg `class KokoConverter : IValueConverter {Convert(){}, ConvertBack(){}}`)
    * Optionally specify a `[ValueConversion]` attribute to indicate input/output types, which [has some use cases](https://stackoverflow.com/a/26763137)
  * Second pre-declare it as resource, mapping a XAML key to that class (eg `<kokonamespace:KokoConverter x:Key="kokoConverter" />`)
  * Third, use it by referencing it (as `StaticResource`, not just a string) in a binding via that key (eg `{Binding Path=…, Converter={StaticResource KokoConverter}}`)
  * [Built-in Converters](http://stackoverflow.com/questions/505397/built-in-wpf-ivalueconverters)
  * **Type Converters** are converters used to (case insensitively!) parse a string into a value of the type corresponding to the assigned (dependency) property
    * Eg programmatically `b.Background = (Brush)System.ComponentModel.TypeDescriptor.GetConverter(typeof(Brush)).ConvertFromInvariantString("White");` (credit: _WPF 4 Unleashed_)
* **DataContext** = an object containing the properties bound to a control (and all its child elements - or they can use their own Data Context)
  * Can be bound directly from the XAML if there's a public constructor (eg `<UserControl.DataContext><local:KokoViewModel /></UserControl.DataContext>`, see <https://stackoverflow.com/a/2637830>)
  * Reaching the DataContext from within a Template requires additional steps:
    * Using a specific Element = `ElementName=[Element], Path=DataContext.[Property]`
    * Going back to root DataContext = `<Element [Property]="{Binding RelativeSource={RelativeSource AncestorType=UserControl, Mode=FindAncestor}, Path=DataContext.[Property]}">`
    * Using the DataContext proxy technique = `<commonResources:BindingProxy x:Key="dcProxy" Data="{Binding}" />` then `<element ItemsSource="{Binding Data.dcProperty, Source={StaticResource dcProxy}}">`
* [DataTemplate](https://wpftutorial.net/DataTemplates.html) = how _data_ (not a UI control) gets displayed, ie a class instance (usually a ViewModel)
  * Eg `<DataTemplate DataType="{x:Type local:KokoViewModel}"><local:KokoView /></DataTemplate>`
  * The default DataTemplate is simply a TextBlock, that displays the `ToString()` of the data class
  * Within a DataTemplate, the DataContext is set the data object itself
  * _Warning_: don't specify an x:Key if the template is to be applied to all instances of the x:Type
  * [Apply DataTemplates depending on property type](https://stackoverflow.com/a/5011728/3559724), polymorphic-style
* **Dependency Property** = a property augmented with WPF dependency mechanism, enabling binding capabilities (hierarchical retrieval, conversions, default values)
  * The containing class must inherit from `DependencyObject` (as do all of WPF UI Controls), which provides the `SetValue()` & `GetValue()` methods
  * DPs are typically (purely conventional and optional) encapsulated by CLR properties that provide a shorthand for calling `Get/SetValue()`
  * It is only the _target_ property (ie the receiver, on the left of the XAML assign) that needs to be a Dependency Property (eg `<element dep_prop={Binding clr_prop}`)
  * The source can be either a DP or a CLR property (but **has** to invoke `PropertyChanged` event to benefit from continuous data binding and not only as one-time on creation/initialization)
  * In practice, unless you are creating your own controls, you will not need to create your own dependency properties
* **FrameworkElement** = fundamental base class that for (UI) elements in the visual tree, presents common properties for width/height, margin, alignment
* **INotifyPropertyChanged** = interface that classes with right-side bound properties must inherit from, that presents a single public event to implement (`PropertyChanged`)
  * WPF (MVVM) frameworks typically package the boilerplate code to wrap those events in a generic fashion, but it can also be simply [coded by hand](https://stackoverflow.com/a/1316417) (and triggered from property setters)
* **ItemsControl** = base class for controls with **Items** & **ItemsSource** properties (eg Combo/ListBox, DataGrid, TabControl - but not panels)
  * **Items** = a static collection of (`FrameworkElement`) objects
  * **ItemsSource** = a bindable IEnumerable that can notify change
  * The base ItemsControl class has no default visual appareance and must be provided layouting templates
    * **Template** (ie **ControlTemplate**) must be provided, containing an **ItemsPresenter**, where the Items will get displayed
    * **ItemsPanel** (ie **ItemsPanelTemplate**) must be provided to be used by the **ItemsPresenter** (**StackPanel** is the default for the base class)
    * **ItemTemplate** (ie **DataTemplate**) must be provided to display each individual items
* [Lookless Controls](https://www.codeproject.com/Articles/1056014/WPF-Lookless-Controls)
  * A .cs class inheriting from _Control_, but doesn't have an associated XAML file (so kinda code-behind only)
  * Although called lookless, a default visual template gets automatically generated for it upon creation (in _Themes/Generic.xaml_), which can be easily modified or overriden
  * It is better than a regular UserControl because the visual representation is fully separate from its logic
  * Should be used when the UserControl is to be widely reused (<https://stackoverflow.com/a/2637830> & <https://stackoverflow.com/a/3334780>)
  * Note that a (custom) UserControl doesn't need a XAML file(!) if it just inherits from UserControl, it will behave like one, plus any additional local class properties & methods
* **Markup Extensions** = extends XAML features by get/setting properties values during the parsing process (dynamically at runtime, essential for eg **binding**, **resources**, via curly braces `{}` syntax)
  * Note how the entire Bindings markup are surrounded with quotes i.e. `Property="{Binding ...}"` so it's kinda akin to string interpolation/parsing by the WPF engine
* **ObjectDataSource** = can be used to bind to a (static or [instance](https://stackoverflow.com/a/639494)) method result (with `MethodName` & `MethodParameters`)
  * `<ObjectDataProvider x:Key="source" MethodName="GetValues" ObjectType="{x:Type system:Enum}"><ObjectDataProvider.MethodParameters><x:Type TypeName="domain:KokoEnum"/></ObjectDataProvider.MethodParameters></ObjectDataProvider>`
* **PropertyChanged** = see `INotifyPropertyChanged` interface
* **Resource** is an object that can be reused/shared (eg styles & templates, à la CSS), scoped (same resource name can be used at different scope levels) to the entire app or a particular control (and their children)
  * **Static Resources** are resolved once (when the XAML is loaded; further change is dismissed) whereas **Dynamic Resources** are resolved at runtime (and can also be created from code-behind)
  * From code-behind, use `FindResource()` on a window's control `this.ctrl.FindResource("")`, a window (`this.FindResource("")`, or the whole app `Application.Current.FindResource("")`
  * Resources also act as a bridge between XAML and code-behind (resources are accessible from code-behind, and code-behind classes & properties can be declared as resources)
* [Routed Events](https://docs.microsoft.com/en-us/dotnet/desktop/wpf/advanced/routed-events-overview) are to events what dependency properties are to properties: events can bubble up their parent control hierarchy
* **StringFormat** = format a value's output string representation using standard (eg `StringFormat=N2`) or custom formats (eg `StringFormat=A{0:format}Z` with pre/postfix)
  * Add curly braces when using a custom format without prefix to avoid confusion with Markup Extensions (eg `StringFormat={}{0:format}Z`)
  * For dates, the [culture is US by default](https://stackoverflow.com/a/5046460), so has to be manually set via code-behind or binding
  * For non-stringable contents, [use a StringFormatConverter instead](https://stackoverflow.com/a/18362876)
* [Style](https://docs.microsoft.com/en-us/dotnet/api/system.windows.frameworkelement.style) = defines values for certain properties to be applied to all controls of the same type, giving them common appearance (à la CSS)
  * Even templates can be set this way (note that `ControlTemplate`s can also be defined as (static) resources and referenced to as _Template_ from the Control itself, without using Styles)
* [TemplateBinding](https://stackoverflow.com/a/10597807)
  * (one-way, aka read-only) binds a template's property to one of the actual control's properties
  * Shortcut for `{Binding Koko, RelativeSource={RelativeSource TemplatedParent}`, which allows two-way binding in a ControlTemplate
  * [RelativeSource](https://stackoverflow.com/a/84317)
  * [FindAncestor](https://stackoverflow.com/a/605695)
    * `Binding RelativeSource="{RelativeSource Mode=FindAncestor, AncestorType={x:Type local:KokoButton}}"`
* **UpdateSourceTrigger** = when to update the source as part of bi-directional binding (values: `Default`/`PropertyChanged`/`LostFocus`/`Explicit`)
  * note: `TextBox.Text`'s default is `LostFocus` => set to `PropertyChanged` instead to react to _each_ key press
* **XAML** (eXtensible Application Markup Language) = Microsoft's XML variant for building GUIs
  * Element = XAML tag (note that element & attributes names are case-sensitive since they have to match their classes counterparts)
  * Properties can be defined as an XML attribute textual value (`<E Content="" />`) or a child XML element (explicitely `<E><E.Content>{content}</E.Content></E>` or implicitly `<E>{content}</E>`)
  * `x:` prefix denotes classes found in one of the XAML namespaces (classes in WPF namespaces don't have that prefix)
  * `x:Key` = defines/refers to a resource in the XAML (Dictionary Key)
  * `x:Name` = defines a name for a control that can be accessed from Code-behind or binded in XAML via `ElementName`
  * `x:Static` = refers to static data (e.g. `SystemColors` Enum value)
  * `x:Type` = equivalent to C# typeof

## API Controls

* Border (`.BorderBrush`, `.BorderThickness`)
* Button, RadioButton (group by `GroupName`), CheckBox (use `.IsThreeState` for "Toggle All", note: `.CheckBox.IsThreeState == False` are still nullable in code-behind)
* Text
  * TextBlock (not a FrameworkElement) = multi-line, text only
  * Label = single-line control (converted to TextBlock if purely text - no decoration) applied as label to another control
    * Allows anchor/mnemonics access to targeted Control by prefixing a key with `_` (e.g. `<Label Content="Your _Name" Target="{Binding ElementName=tbxName}" />` - also works with just the element name (w/o binding))
    * Use `AccessText` property if the content is more complex
  * TextBox = single or multi-line (`.AcceptsReturn`, `.TextWrapping`) input text field (`&#x0a;` character in Text property for newline), with spellchecking functionalities
* PasswordBox (`.PasswordChar`, `.MaxLength`)
* ToolTip = (see [ToolTipService](https://learn.microsoft.com/en-us/dotnet/api/system.windows.controls.tooltipservice) properties)

### Collections

* **Panels/Containers**
  * Canvas = WinForm-like using absolute container coordinates (OK for painting).
  * WrapPanel = position children relatively, unify size horizontally (default) or vertically
  * StackPanel = expands children to take all the room. Doesn't scroll. Default Orientation is Vertical
  * DockPanel = dock children to sides (default Left), precedence by markup, last one fills remaining space (unless .LastChildFill = False)
  * Grid = table-like grid division of the available space
  * UniformGrid = same with same cell size
  * [Resize to Window](https://stackoverflow.com/a/43785428)
* ListBox = list
* ListView = ListBox with built-in column management (using GridView)
* DataGrid = Excel-like
* TreeView = Hierarchy with toggable arrows

* `DisplayMemberPath="Name"` = indicates (by path aka name) which (textual) attribute to display (instead `.ToString()` by default) for each item
  * Useful to display non-textual data: tells WPF which property best represents the item

## Troubleshooting

Debugging WPF can be tricky, because most errors are met during execution rather than at compilation time.

* Visual Studio Output window: check the _Output_ Console from time to time to track Binding/DI errors
* Visual Studio Live Visual Tree
* Implementing a hollow DebugConverter

## Extensions

* [Fody's PropertyChanged](https://github.com/Fody/PropertyChanged) = takes care of the PropertyChanged boilerplate (applies to each class inheriting _INotifyPropertyChanged_)
* [Xceed's Extended WPF toolkit](https://xceedsoftware.github.io/wpftoolkit) = collection of WPF controls, components and utilities
* Telerik
  * Grid `IsReadonlyBinding` = specify at the grid level which (boolean) attribute of the row item indicates if the row is read-only
