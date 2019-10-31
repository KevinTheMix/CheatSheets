# WPF

Stands for Windows Presentation Foundation.

Follows the previous Windows Forms (WinForm) technology.
Unlike WinForm, it's not based on Windows API but built from sratch.
All controls act as containers and can be nested inside each other => modularity of design

Combination of XAML for markup and any code-behind .NET language.
XAML stands for eXtensible Application Markup Language and is MS' variant of XML for designing GUIs.
In WinForms, the GUI was defined in the same language as the code-behind and usually maintained through the IDE.
Now the GUI can be easily edited as HTML-like text.

Most of the API is contained in the PresentationFramework DLL that contains the System.Windows namespaces.

## Styling & Templating

* DataTemplate = How data is displayed. The data in question is a class instance, which is usually a VM.
* ControlTemplate = How a GUI visual control (i.e. System.Windows.Controls, e.g. a button or a panel) is displayed.
* Style = WPF's CSS, but can also applies templates, etc. Basically can be used to change any property of a control.
* ContentControl = base class for all controls that have a "Content" property.
* Content = property of a ContentControl that can be anything.
  * E.g.: the Content of a Textblock is its Text.
  * The Content of a control is rendered at the location of the ControlPresenter within its ControlTemplate.
* ContentPresenter = element within a ControlTemplate that acts as a placeholder and defines where the content of the templated control will be displayed.
  * See <https://stackoverflow.com/a/1288006>

Within a Template, there's one more level to go up to reach the DataContext:

* using specific Element
    ElementName=[Element], Path=DataContext.[Property]
* going back to root DataContext:
    <Element [Property]="{Binding RelativeSource={RelativeSource AncestorType=UserControl, Mode=FindAncestor}, Path=DataContext.[Property]}">

## XAML

### Namespace

WPF XML namespace (System.Windows, System.Windows.Controls, etc.)
Usually used as prefix-less root, so no need to prefix all framework elements
XAML language namespace (System.Windows.Markup, XAML parser/parser directives). Usually given 'x' prefix.

See <http://schemas.microsoft.com/winfx/2006/xaml/presentation>

See <http://schemas.microsoft.com/winfx/2006/xaml/>

Don't specify Assembly if the namespace is located in the local assembly.

### Element

Controls and attributes names are case-sensitive since they have to match their framework types.

### Property

Can be defined as an XML attribute or a child XML element

    <Element Property="" />
    <Element><Element.Property></Element.Property></Element>

### Content

Content can be defined inside a control or via an attribute.

     <Element></Element>
     <Element Content="" />

As child element

    <Element><Element.Content></Element.Content></Element>

If the control supports it, this format allows more complex content than plain text (i.e. other controls).
In the case of multiple child controls, we must use a container since the Content property only allows for a single one.

    <Element><Element.Content><WrapPanel><Control*n></WrapPanel></Element.Content></Element>

Same result with shorter syntax (without <Element.Content>)

    <Element><WrapPanel><Control*n></WrapPanel></Element>

### Markup Extension

    x:Key       # E.g. define and then refers to a resource in the XAML (Dictionary Key)
    x:Name      # Defines a name for a control that can be accessed from Code-behind or binded in XAML via ElementName
    x:Static    # Referes to static data (e.g. SystemColors Enum value)
    x:Type      # Equivalent to C# typeof. Used in ControlTemplate.TargetType

Will replace the default template of all controls of type [Type] to be displayed using the new template:
<https://msdn.microsoft.com/en-us/library/system.windows.controls.controltemplate.targettype%28v=vs.110%29.aspx>
<https://stackoverflow.com/a/13559167>

    <ControlTemplate x:Key="[TemplateName]" TargetType="{x:Type [Type]}">
    <ControlTemplate x:Key="[TemplateName]" TargetType="[Type]">
  
Unless the template is referred to explicitly by x:Key.
Applying the template to a specific control:

    <Element Template="{StaticResource [TemplateName]}" />

## Data Binding

Any {...} in XAML is called markup extensions.
The most used is the XAML extension for data binding: {Binding ...}.
Note that the entire Bindings markup are surrounded with quotes i.e. Property="{Binding ...}" so it's kinda similar to interpolation.
The WPF engine simply parses that string to make things happen dynamically.

Default binds to the current data context:

    {Binding}

A specific public property (not a variable!) in current data context ("Path=" is default property of Binding):

    {Binding NameOfProperty}
    {Binding Path=NameOfProperty}

Binds to (the Attribute i.e. Dependency Property of) another XAML UI element:

    {Binding NameOfAttribute, ElementName=Element}

Using CLR type:

    xmlns:system="clr-namespace:System;assembly=mscorlib"
    ..
    Source={x:Static system:DateTime.Now}

Use **RelativeSource** to refer to an element relative to the one in which the binding is called.
Can even bind to Self e.g. to display its current Width as Text.
Default **RelativeSource** attribute is *Mode* (whose values are *Self*, *FindAncestor*, *PreviousData*, *TemplatedParent*).

### Dependency Property

Binding in WPF relies on Dependency Properties, which is a class property augmented with WPF dependency mechanism.

This enables many things on which WPF relies, including all data bindings and the hiearchical retrieval of properties based on their (string) names - as well as default values & conversion.

The containing class inherits from DependencyObject (as do all of WPF UI Controls), which provides the required SetValue() & GetValue() methods.

DPs are typically encapsulated by CLR properties that provide a shorthand for calling GetValue() & SetValue(). This is purely conventional and optional.

Note that it is only the _target_ property that needs to be a Dependency Property. The source can be either a dependency property or a CLR property (but still has to invoke PropertyChanged event to benefit from continuous data binding - not only as one-time on creation/initialization).

In practice, unless you are creating your own controls, you will not need to create your own dependency properties. See <https://blog.scottlogic.com/2012/04/05/everything-you-wanted-to-know-about-databinding-in-wpf-silverlight-and-wp7-part-one>

An **Attached Property** is a similar construct and uses a static method instead of a Property setter/getter, so that it can be called from other classes statically.

### Data Context

Object available to all children of a control where it is set (they can in turn override it locally and for their children).
Used as data source when no source is specified => we can load anything we want once (null at first) and bind it many times.

### UpdateSourceTrigger

Timing when to update the source, as part of bi-directional binding.
Values are {Default, PropertyChanged, LostFocus, Explicit}
TextBox.Text's Default is LostFocus => set to PropertyChanged to react to each key press.

### Converters

Type conversion Binding, e.g. "Yes"/"No" to true/false.
Converters use a StaticResource (not a string).
See <http://stackoverflow.com/questions/505397/built-in-wpf-ivalueconverters> for built-in ones.
  
    class KokoConverter : IValueConverter {Convert(){}, ConvertBack(){}}
    ..
    Converter={StaticResource KokoConverter}

#### Type Converters

Those are the converters that WPF uses to parse (case insensitive) strings into the types expected by the properties to which those values are assigned.

    KokoTypeConverter : TypeConverter

### StringFormat

Similar to Converters, but just affect the display. Accepts prefix/postfix.

    StringFormat=ABC{0:format}XYZ

Without prefix, add curly braces to avoid confusion with Markup Extensions.

    StringFormat={}{0:format}

* [Numeric Format](http://msdn.microsoft.com/en-us/library/dwhawy9k.aspx)
* [Date and Time Format](http://msdn.microsoft.com/en-us/library/az4se3k1.aspx)
* [DateTimeOffset.ToString](https://docs.microsoft.com/en-us/dotnet/api/system.datetimeoffset.tostring?view=netframework-4.8)
* [DateTime Predefined Formats](https://stackoverflow.com/a/5046460)
  * Dependent on culture => use ConverterCulture='ja-JP' in Binding.

## Components

### Controls

Controls are entities that can hold other controls.
ContentControls (< Control) can only hold a single child (=> use container e.g. panel if need more).

### Window

Root level control. ControlContent.
Can contain the following attributes:

* Icon
* ResizeMode (Size & Minimize settings)
* ShownInTaskbar (Tray-like)
* SizeToContent (Shrink)
* Topmost (Z-index)
* WindowStartupLocation (Screen position. If true, uses Top/Left properties)
* WindowState (Min/Maximized on start)

### Containers

* Canvas = WinForm-like using absolute container coordinates (OK for painting).
* WrapPanel = Position children relatively, unify size horizontally (default) or vertically
* StackPanel = Expands children to take all the room. Doesn't scroll. Default Orientation is Vertical
* DockPanel = Dock children to sides (default Left), precedence by markup, last one fills remaining space (unless .LastChildFill = False)
* Grid = Table-like grid division of the available space.
  * Children fill all available space by default (set their Horizontal & Vertical Alignment = Stretch)
  * Without cell division, stack everything on top of each other.
  * Col/Row size indication can be in pixels #, auto (fit to content) or n* (share of free space)
  * .ColumnDefinitions, .RowDefinitions, .Column, .Row, .ColumnSpan, .RowSpan
  * Use GridSplitter to allow user col/row resizing (.ResizeDirection if can't figure out orientation)
* UniformGrid # Same with same cell size

### I/O & co

* Border (.BorderBrush, .BorderThickness)
* Button
* RadioButton
* TextBlock = Multi-line, text only (Text). Not actually a Control (FrameworkElement).
* Label = Single-line. ContentControl
  * Essentially paired with another Control. Converted to TextBlock if purely text
  * Allows mnemonics access keys by targeting a Control and prefixing desired key with '_'
  * E.g. &lt;Label Content="Your _Name" Target="{Binding ElementName=tbxName}" /&gt;
  * Target also works with just the element name (without binding)
  * Use AccessText property if the content is more complex
* TextBox = Single or multi-line (.AcceptsReturn, .TextWrapping) input text field, with spellchecking functionalities.
  * Insert a newline using &#x0a; character in Text property
* CheckBox = ContentControl. Content is what's displayed next to it and clicking anywhere on it toggles CheckBox.
  * Use .IsThreeState for "Toggle All" (Note: CheckBoxes with .IsThreeState == False are still nullable in code-behind).
* RadioButton = ContentControl => Plain text as TextBlock, otherwise &lt;Content&gt; (click anywhere toggles it). Last found IsChecked RadioButton is checked. Group by GroupName.
* PasswordBox # .PasswordChar, .MaxLength
* ToolTip = .ToolTipService.ShowDuration, .HasDropShadow , .ShowOnDisabled. See <http://msdn.microsoft.com/en-us/library/system.windows.controls.tooltipservice.aspx>
* ListBox = .DisplayMemberPath="Name" for non-string objects, indicates attribute to display (overrides .ToString() if also defined)
* ListView = ListBox with built-in column management (using GridView)
* DataGrid = Excel-like
* TreeView = Hierarchy with toggable arrows

## Attributes

* Content = the content displayed at the location where the ContentPresenter is defined within a ContentControl.
* ToolTip (< FrameworkElement)
* HorizontalAlignment/VerticalAlignment
* Margin="0,0,0,0"
* ItemSource
* TextTrimming
* TextWrapping
* TextOptions.TextFormattingMode {Ideal, Display}
* TextOptions.TextRenderingMode {Auto, Aliased, ClearType, GrayScale}
* Orientation
* Parent (Dom-like Hierarchy)
* DisplayMemberPath = Attribute of the bound row to display for that cell (the whole row = the entire item (in a collection))
* IsReadonlyBinding (Telerik Grid) = Specify at the grid level which (boolean) attribute of the row item indicates if the row is read-only

## Documents

* Inline (HTML-style)
  * Span (Blank text canvas that can be customized via attributes)
    * Bold (FontWeight)
    * Italic (FontStyle)
    * Underline (TextDecorations)
  * Run (Span-like that can only contain plain text)
  * LineBreak
  * Hyperlink
  * AnchoredBlock
  * InlineUIContainer

## Shapes

* Ellipse
* Rectangle
  * .Panel.ZIndex

## Media

* Brushes.{Color}
* LinearGradientBrush

## Resources

Resources are data (e.g. text, objects, or even hierarchies of Controls) that belong to Controls or the Application.
They allow to define items once and using them several times in different places (e.g. styles or templates)

Static resources are resolved only once when the XAML is loaded and further changes are dismissed.
Dynamic resources are resolved when they are used and can also be created from code-behind.

Different resources with the same name can be defined at different scope levels.
Example: with Level being either a Control, Window or Application

    <Level.Resources>
      <Type x:Key="ID" />*n
    </Level.Resources>

### Usage

Resources can only be used within their scope (child hierarchy).
The resource is found in the immediate container, or the search goes up the tree up to the Application, or Exception.

Using a markup extension.

    {StaticResource ID}
    {DynamicResource ID}

From Code-Behind, using FindResource() that returns an object

    this.ctrl.FindResource("") = A Control in this window
    this.FindResource("") = This Window
    Application.Current.FindResource("") = Application

## Troubleshooting

Debugging WPF can be tricky, because most errors are met during execution rather than at compilation time.
The following resources and techniques are very valuable to unearth the cause of an issue.

* Visual Studio Output window
* Visual Studio Live Visual Tree
* Implementing a hollow DebugConverter

## Third-Party (NuGet)

* Extended WPF toolkit

### Telerik

* GridViewDataColumn can be edited
* GridViewBoundColumnBase are read-only (kinda one-way binding)
* GridViewCheckBoxColumn are checkboxes, but aligned left on edit

    <telerik:GridViewBoundColumnBase.HeaderCellStyle>
        <!-- Provide a template for the header, in order to add a button to toggle the RDVs -->
        <!-- See https://docs.telerik.com/devtools/wpf/styling-and-appearance/styling-apperance-editing-control-templates -->
        <Style BasedOn="{StaticResource {x:Type telerik:GridViewHeaderCell}}" TargetType="telerik:GridViewHeaderCell">
            <Setter Property="Template">
                <Setter.Value>
                    <!-- Starts new Template -->
                    <ControlTemplate TargetType="telerik:GridViewHeaderCell">
                        <StackPanel Orientation="Horizontal">
                            <!-- The following ContentPresenter element acts as a placeholder for WPF to know where to display the Content. What content? The one belonging to this control we're styling! -->
                            <!-- See https://stackoverflow.com/a/1288006 -->
                            <ContentPresenter Name="HeaderTextPresenter" TextBlock.Foreground="Navy" TextBlock.FontWeight="Bold" TextBlock.FontSize="16">
                                <ContentPresenter.Style>
                                    <Style>
                                        <Setter Property="TextBlock.Foreground" Value="Navy" />
                                    </Style>
                                </ContentPresenter.Style>
                                <ContentPresenter.Resources>
                                    <Style TargetType="TextBlock">
                                        <Setter Property="Foreground" Value="Navy" />
                                    </Style>
                                </ContentPresenter.Resources>
                            </ContentPresenter>
                            <!-- We're inside the (kinda) generic template of a Gridview Header Cell, so to find the Command in our VM and bind to it,
                            we must go back up the hierarchy to the Window (that is, our UserControl), and target its DataContext specifically, that contains our VM. -->
                            <!-- See https://stackoverflow.com/questions/5642501/wpf-binding-commands-in-styles-and-or-data-templates-mvvm -->
                            <!-- See https://stackoverflow.com/questions/34390920/how-to-bind-a-button-command-in-wpf-style -->
                            <!-- See https://stackoverflow.com/questions/84278/how-do-i-use-wpf-bindings-with-relativesource -->
                            <Button Command="{Binding DataContext.ToggleRDVsCommand, Mode=OneTime, RelativeSource={RelativeSource AncestorType={x:Type commonControls:UserControlAdv}}}"  Width="10">+</Button>
                        </StackPanel>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>
    </telerik:GridViewBoundColumnBase.HeaderCellStyle>

Telerik Watermark box on edit:

    <telerik:GridViewBoundColumnBase Header="{Binding CommonResources.MCodeIndication}" DataMemberBinding="{Binding MCodeIndication, UpdateSourceTrigger=PropertyChanged}" ColumnGroupName="SelectionFields">
      <telerik:GridViewBoundColumnBase.CellEditTemplate>
          &lt;DataTemplate>
              <telerik:RadWatermarkTextBox Text="{Binding MCodeIndication, Mode=TwoWay, UpdateSourceTrigger=PropertyChanged}" HorizontalContentAlignment="Left" HorizontalAlignment="Stretch"/>
