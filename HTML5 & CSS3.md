# HTML5
	<a target="_blank">	// Opens a new Window (or tab in modern browsers)

## Accessibility
	<img alt="meaningful description" />
	<strong>
	<em>

## Characters
	&copy;

# CSS3
## Syntax
	selector {				// Css rule
		property: value;	// Css declaration
	}

## Selectors
	*							// All elements
	p 							// All paragraph elements
	#[id]						// Element with Id [id]
	.[class]					// Elements with class [class]
	[selector1], [selector2]	// Applies to both selectors
	[selector1] [selector2]		// Applies to selector2 directly under/within selector1

## Units
	px	// fixed (default = 16)
	pt	// fixed (default = 12)
	%	// relative % of container
	em	// ==  % (difference is Text-Size on IE)

## Color
	color: #A3B == #AA33BB
	rgb(255, 255, 255)
	hsl(360, 100%, 100%)	// Colour, Black-White, Dark-Light
	rgba(., {alpha})		// Alpha between 0.0 and 1.0
	hsla(., {alpha})		// Alpha between 0.0 and 1.0

## Font
	font-family: {font1st}, {font2nd}, sans-serif
	font-size: {#}{unit}
	line-height: {#}{unit}
	word-spacing: {#}{unit}
	letter-spacing: {#}{unit}
	text-transform: lowercase/uppercase/capitalized


## Box Dimensions
### Display
	display:			// See https://stackoverflow.com/questions/9189810/css-display-inline-vs-inline-block
		inline			// Align as if text (left/right, no top/bottom, no width/height)
		block			// Respects all margins, paddings & sizes & forces a line break
		inline-block	// Respects top/bottom & width/height
		none			// Remove box from tree (no attributed spot)
	visibility:
		visible			// Default
		hidden			// Show or hide box content
	box-sizing:
		content-box		// Default (Increase actual size with padding & border)
		border-box		// Box actual dimension stays the same (Decrease content size by including padding & border within)

### Position
	position:
		static		// Default (no move, no z-index)
		relative	// Same as static, but allowed to be moved (top/left & z-index)
		absolute	// Doesn't care about siblings (removed from child tree, no clipping => overlap)
		fixed		// Stuck to screen
	
	float: [left/right]	// There is no "float:center" => use "display: inline-block"
	
	clear: [none/left/right/both]	// Prevents friction with adjacent boxes on defined side by going under

### Border
	border-width: {#}{unit}
	border-style: [solid/double/dotted/dashed/groove/inset/outset]
	border-[top/right/left/bottom]-width
	border: {width} {style} {color}

	border-radius: {#}{unit}	// Radius of circle; if above 50% of box size (i.e. its diameter), is full circle.

### Margin & Padding
Padding = between border & inner content
Margin = between border & outside content.
For margin, values are {#}{unit} or [auto].

	margin: {all};
	margin: {top/bottom} {left/right}
	margin: {top} {right} {bottom} {left}

Center horizontally

	margin: auto;
	width: {#}{unit};	// Needed otherwise take 100% of container

	
### Images
They take up their original (image file) size => set to 100% to fit within parent box.
They are inline by default => use "display: block" + "margin: auto" + {set width} to center.

HTML <img> is for meaningful content
CSS background-image is for layout/style

#### Background Images
	background-image: url("http://.")	// Or gradient: -webkit-linear-gradient(#666CCC, #BC1324);
	background-repeat: [no-repeat/repeat-x/repeat-y/repeat]
	background-position: [left/center/right] [top/center/bottom]	// Works only if repeat is [no-repeat] & [center] is default if unspecified
	background: {image} {repeat} {position}
	
	background-size:
		content			// Expand as large as either width or height hit border
		cover			// Display the image in full => letterbox the image
		
	background-attachment:
		scroll	// Image is associated with content & will scroll
		fixed	// Image is fixed and will remain in place as content scrolls in front of it

### Tables
	<table>
		<tr>									// Table Row
			<th scope="[col/row]">{title}</th>	// Table Header
		</tr>
		<tr>
			<td>{cell content}</td>				// Table Data
		</tr>
	</table>
	
	<table border="{#}>	// Deprecated
	
For results spanning multiple pages, a static heading & footer structure can be defined, i.e. with only the body changing

	<thead>
	<tbody>
	<tfoot>	// Can be specified before <tbody> and will still be displayed at the end
	
## Tips & Tricks
### Reset all
Reset all browser (user-agent) defaults

	* {
		margin: 0;	// 0 => no need for unit
		padding: 0;	// 0 => no need for unit
	}

### Retrocompatibility
	rgb(.)
	rgba(.)	// Ignored if not handled => fallback to 1st
