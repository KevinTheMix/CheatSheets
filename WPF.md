# Introduction
Stands for Windows Presentation Foundation.

Follows the previous Windows Forms (WinForm) technology.
Unlike WinForm, it's not based on Windows API but built from sratch.
All controls act as containers and can be nested inside each other => modularity of design

Combination of XAML for markup and any code-behind .NET language.
XAML stands for eXtensible Application Markup Language and is MS' variant of XML for designing GUIs.
In WinForms, the GUI was defined in the same language as the code-behind and usually maintained through the IDE.
Now the GUI can be easily edited as HTML-like text.

Most of the API is contained in the PresentationFramework DLL that contains the System.Windows namespacess.

# XAML
## Namespace
	http://schemas.microsoft.com/winfx/2006/xaml/presentation	# WPF XML namespace (System.Windows, System.Windows.Controls, etc.)
																# Usually used as prefix-less root, so no need to prefix all framework elements
	http://schemas.microsoft.com/winfx/2006/xaml/				# XAML language namespace (System.Windows.Markup, XAML parser/parser directives). Usually given 'x' prefix.

## Element
Controls and attributes names are case-sensitive since they have to match their framework types.

	<Element></Element>
	<Element />

## Property
Can be defined as XML attribute (within the corresponding control) or as child XML element (note the Element.Property notation)

	<Element Property="" />										# Property Attribute
	<Element><Element.Property></Element.Property></Element>	# Property Element

### Content
Content can be defined inside a control or via an attribute.

	<Element></Element>
	<Element Content="" />

	// As child element
	<Element><Element.Content></Element.Content></Element>

	// If the control supports it, this format allows more complex content than plain text (i.e. other controls)
	// In the case of multiple child controls, we must use a container since the Content property only allows for a single one.
	<Element><Element.Content><WrapPanel><Control*n></WrapPanel></Element.Content></Element>

	// Same result with shorter syntax (without <Element.Content>)
	<Element><WrapPanel><Control*n></WrapPanel></Element>

	

## Markup Extension
{...} in XAML are markup extensions.

### Data Binding
{Binding ...} is the XAML extension for data binding.
 
	{Binding} 						# Default current data context
	{Binding Path=NameOfProperty} 	# Specific property in current data context
	{Binding NameOfProperty}		# Same (Path= is default property of Binding)
	{Binding Property, ElementName}	# Specify an UI element as source

#### DataSource
##### Data Context
Object available to all children of a control where it is set (they can in turn override it locally and for their children).
Used as data source when no source is specified => we can load anything we want once (null at first) and bind it many times.

##### Source
	
	xmlns:system="clr-namespace:System;assembly=mscorlib"
	..
	Source={x:Static system:DateTime.Now}
	
##### ElementName

	ElementName=Element, Path=Attribute

#### Options

	UpdateSourceTrigger	# Timing when to update the source, as part of bi-directional binding.
						# TextBox.Text's Default is LostFocus => set to PropertyChanged to react to each key press.						
						# {Default, PropertyChanged, LostFocus, Explicit}

#### Converters
Type conversion Binding, e.g. "Yes"/"No" to true/false.
See http://stackoverflow.com/questions/505397/built-in-wpf-ivalueconverters for built-in ones.
	
	Converter={StaticResource MyConverter}
	class MyConverter {Convert(){}, ConvertBack(){}}

#### StringFormat
Similar to Converters, but just affect the display. Accepts prefix/postfix.

	StringFormat=ABC{0:format}XYZ
	StringFormat={}{0:format}		# Without prefix, add curly braces to avoid confusion with Markup Extensions.

See .ToString("format"): http://msdn.microsoft.com/en-us/library/dwhawy9k.aspx
See DateTime formatting http://msdn.microsoft.com/en-us/library/az4se3k1.aspx

	ConverterCulture='ja-JP'

	
	

	
# API
## Application
	
## Controls
Controls are entities that can hold other controls.
ContentControls (< Control) can only hold a single child (=> use container e.g. panel if need more).
	
### Window
Root level control. ControlContent.
Can contain the following attributes:
	
	Icon
	ResizeMode				# Size & Minimize settings
	ShownInTaskbar			# Tray-like
	SizeToContent			# Shrink
	Topmost					# Z-index
	WindowStartupLocation	# Screen position. If true, uses Top/Left properties
	WindowState				# Min/Maximized on start
	
### Containers

	Canvas		# WinForm-like using absolute container coordinates (OK for painting).
	WrapPanel	# Position children relatively, unify size horizontally (default) or vertically
	StackPanel	# Expands children to take all the room. Doesn't scroll. Default Orientation is Vertical
	DockPanel	# Dock children to sides (default Left), precedence by markup, last one fills remaining space (unless .LastChildFill = False)
	Grid		# Table-like grid division of the available space. 
				# Children fill all available space by default (set their Horizontal & Vertical Alignment = Stretch)
				# Without cell division, stack everything on top of each other.
				# Col/Row size indication can be in pixels #, auto (fit to content) or n* (share of free space)
				# .ColumnDefinitions, .RowDefinitions, .Column, .Row, .ColumnSpan, .RowSpan
				# Use GridSplitter to allow user col/row resizing (.ResizeDirection if can't figure out orientation)
	UniformGrid # Same with same cell size

### I/O & co

	Border		# .BorderBrush, .BorderThickness
	Button
	RadioButton
	TextBlock	# Multi-line, text only (Text). Not actually a Control (FrameworkElement).
	Label 		# Single-line. ContentControl
				# Essentially paired with another Control. Converted to TextBlock if purely text
				# Allows mnemonics access keys by targeting a Control and prefixing desired key with '_'
				# E.g. <Label Content="Your _Name" Target="{Binding ElementName=tbxName}" />
				# Target also works with just the element name (without binding)
				# Use AccessText property if the content is more complex
	TextBox		# Single or multi-line (.AcceptsReturn, .TextWrapping) input text field, with spellchecking functionalities.
				# Insert a newline using &#x0a; character in Text property
	CheckBox	# ContentControl. Content is what's displayed next to it and clicking anywhere on it toggles CheckBox.
				# Use .IsThreeState for "Toggle All" (Note: CheckBoxes with .IsThreeState == False are still nullable in code-behind).
	RadioButton # ContentControl => Plain text as TextBlock, otherwise <Content> (click anywhere toggles it).
				# Last found IsChecked RadioButton is checked. Group by GroupName.
	PasswordBox # .PasswordChar, .MaxLength
	ToolTip		# .ToolTipService.ShowDuration, .HasDropShadow , .ShowOnDisabled
				# See  http://msdn.microsoft.com/en-us/library/system.windows.controls.tooltipservice.aspx
	ListBox 	# .DisplayMemberPath="Name" for non-string objects, indicates attribute to display (overrides .ToString() if also defined)
	ListView	# ListBox with built-in column management (using GridView)
	DataGrid	# Excel-like
	TreeView	# Hierarchy with toggable arrows

## Attributes
	
	Name
	Title
	Content
	Text
	ToolTip (< FrameworkElement)
	FontWeight
	HorizontalAlignment
	VerticalAlignment
	Margin="0,0,0,0"
	Width
	Height
	Background
	Foreground
	ItemSource
	TextTrimming
	TextWrapping
	TextOptions.TextFormattingMode {Ideal, Display}
	TextOptions.TextRenderingMode {Auto, Aliased, ClearType, GrayScale}	
	Orientation
	Parent (Dom-like Hierarchy)

## Documents

	Inline				# HTML-style
		Span			# Blank text canvas that can be customized via attributes
			Bold		# FontWeight
			Italic		# FontStyle
			Underline	# TextDecorations
		Run 			# Span-like that can only contain plain text
		LineBreak
		Hyperlink
		AnchoredBlock
		InlineUIContainer

## Shapes
	
	Ellipse
	Rectangle
		.Panel.ZIndex
		
## Media

	Brushes.{Color}
	LinearGradientBrush
	
## Resources
Resources are data (e.g. text, objects, or even hierarchies of Controls) that belong to Controls or the Application.
They allow to define items once and using them several times in different places (e.g. styles or templates)

### Static vs Dynamic
Static resources are resolved only once when the XAML is loaded and further changes are dismissed.
Dynamic resources are resolved when they are used and can also be created from code-behind.

### Definition
Different resources with the same name can be defined at different scope levels.

	// <Level> = <Control>, <Window> or <Application>
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

	this.ctrl.FindResource("")				# A Control in this window
	this.FindResource("")					# This Window
	Application.Current.FindResource("")	# Application


	
## Third-Party (NuGet)
	Extended WPF toolkit





DataTemplate = How data (i.e. a class) is displayed
ControlTemplate = How a visual control (i.e. System.Windows.Controls, e.g. a button or a panel) is displayed
Style = WPF's CSS