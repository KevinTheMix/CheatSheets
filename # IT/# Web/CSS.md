# CSS

## Quick Tips & Tricks

* `curor: pointer;`
* `* { margin: 0; padding: 0; }` = Reset all browser (user-agent) defaults (0 => no need for unit)

## Glossary

* **CSS Transitions** = easing effect for property values modifications

## [CSS Selectors](https://www.w3schools.com/cssref/css_selectors.asp)

Identify target(s) of a CSS Rule.

[Specifishity](http://specifishity.com/) aka priority

```css
* {} /* All */
a {} /* All <a>'s */
a,b {} /* All <a>'s and <b>'s */
a b {} /* All descendants <b>'s */
a>b {} /* All direct child <b>'s */
a+b {} /* All <b>'s directly after an <a> */
a~b {} /* All <b>'s somewhere after an <a> */
.class {}
.class1.class2 {} /* Both */
.class1 .class2 {} /* All (indirect) descendants */
[att] {} /* Any with att="" */
[att=val] {} /* Any with att="val" */
[att~=val] {} /* Any with att="%val%" */
[att|=val] {} /* Any with att="val%" */
el[att^=val] {} /* All <el>s with att="val%" */
el[att$=val] {} /* All <el>s with att="%val" */
el[att*=val] {} /* All <el>s with att="%val%" */
:x {}
:nth-child(odd) {} /* e.g. p:nth-child(5n) applies to each 5*nth child that is also a paragraph */
:first-line {} /* first line of text element */
:first-letter {} /* first letter of text element */
:first-child {} /* first child element*/
:link {} /* virgin links */
:visited {} /* visited links */
:hover {} /* links getting hovered over right now */
:active {} /* links getting clicked right now */
:focus {} /* eg while being focused by tab key */
::y {}
#id {} /* Unique ID */
style="" /* inline */
```

Via JS:

```js
document.all('lienA').innerHTML
document.getElementById(id).style.display = 'block'
```

```html
<tr onMouseOver="javascript:this.style.background='#E8E8E8'" />
```

## [Declarations](https://en.wikipedia.org/wiki/CSS#Declaration_block)

### Units

* `p` = fixed (default = 16)
* `pt` = fixed (default = 12)
* `%` = relative % of container
* `em` = like `%` (difference is Text-Size on IE)

### Color

* `color: #A3B` == `color: #AA33BB`
  * `rgb(255, 255, 255)`
  * `hsl(360, 100%, 100%)` Hue (which color 0/360 red, 120 green, 240 blue), Saturation (how colourful) & Lightness (how dark/bright)
  * `rgba(., {alpha})` with alpha between 0.0 and 1.0
  * `hsla(., {alpha})` with alpha between 0.0 and 1.0

Alpha modifiers not supported by older browsers, so specify both with & without e.g. first `rgb()` then `rgba()` (overrides `rgb()` or ignored).

### Font

* `font-family: {font1st}, {font2nd}, sans-serif`
* `font-size: {#}{unit}`
* `line-height: {#}{unit}`
* `word-spacing: {#}{unit}`
* `letter-spacing: {#}{unit}`
* `text-transform: lowercase/uppercase/capitalized`

### Layout

* [**display**](https://stackoverflow.com/questions/9189810/css-display-inline-vs-inline-block)
  * `inline` = align as if text (left/right, no top/bottom, no width/height)
  * `block` = respects all margins, paddings & sizes & forces a line break
  * `inline-block` = respects top/bottom & width/height
  * `none` = remove box from tree (no attributed spot)
* **visibility**
  * `visible` (default)
  * `hidden` = show or hide box content
* **box-sizing**
  * `content-box` (default) = increase actual size with padding & border
  * `border-box` = box actual dimension stays the same (Decrease content size by including padding & border within)
* **position**
  * `static` (default) = no move, no z-index
  * `relative` = same as static, but allowed to be moved (top/left & z-index)
  * `absolute` = doesn't care about siblings (removed from child tree, no clipping => overlap)
  * `fixed` = stuck to screen
* `float: [left/right]` = there is no `float:center` => use `display: inline-block`
* `clear: [none/left/right/both]` = prevents friction with adjacent boxes on defined side by going under

### Margin & Padding

Padding = between border & inner content
Margin = between border & outside content. Values are {#}{unit} or [auto].

* `margin: {all};`
* `margin: {top/bottom} {left/right}`
* `margin: {top} {right} {bottom} {left}`

Center child horizontally:

```css
center {
  margin: auto;
  width: {#}{unit}; /* Needed otherwise take 100% of container */
}
```

Aligning/centering images:

```css
center {
  display: block; /* they are inline by default */
  margin: auto`;
  /* set width; 100% to fit within parent, otherwise the image has original file size */
}
```

### Background

Use `background-color` when using `background-image`.

* `background: {image} {repeat} {position}`
  * `background-image: url("http://.")`, or `gradient: -webkit-linear-gradient(#666CCC, #BC1324);`
  * `background-repeat: [no-repeat/repeat-x/repeat-y/repeat]`
  * `background-position: [left/center/right] [top/center/bottom]`
    * `[center]` is default if unspecified
    * works only if repeat is `[no-repeat];`
* `background-size`:
  * `content` = expand as large as either width or height hit border
  * `cover` = display the image in full => letterbox the image
* `background-attachment`:
  * `scroll` = image is associated with content & will scroll
  * `fixed` = image is fixed and will remain in place as content scrolls in front of it

### Borders

* `border: {width} {style} {color}`
  * `border-width: {#}{unit}`
  * `border-style: [solid/double/dotted/dashed/groove/inset/outset]`
  * `border-[top/right/left/bottom]-width`
* `border-radius: {#}{unit}` =radius of circle; if above 50% of box size (i.e. its diameter), is full circle.

## [Animations](https://www.w3schools.com/css/css3_animations.asp)

```css
.koko { animation: appear 5s }
@keyframes appear { 0% { color: white; } 10% { color: green; } 50% { color: red; } }  /* tween/transitions */
```

## Methods

* [repeat()](https://developer.mozilla.org/en-US/docs/Web/CSS/repeat)
* [Gradients](https://developer.mozilla.org/en-US/docs/Web/CSS/repeating-linear-gradient)
  * Specify colors by fraction of the container (e.g. 0 --> 10, 10 --> 20, 20 --> 100). If fraction smaller than whole, the gradient repeats.
  * [Stripes](https://css-tricks.com/stripes-css/)
  * <https://cssgradient.io/>

## [Flexbox](<https://css-tricks.com/snippets/css/a-guide-to-flexbox/>)

```css
.container {
  display: flex;
  flex-direction: row | row-reverse | column | column-reverse;
  flex-wrap: nowrap | wrap | wrap-reverse;
  flex-flow: <‘flex-direction’> || <‘flex-wrap’> /* Shorthand for 2 above */
  justify-content: flex-start | flex-end | center | space-between | space-around | space-evenly  | start | end | left | right ... + safe | unsafe;
  align-items: stretch | flex-start | flex-end | center | baseline | first baseline | last  baseline | start | end | self-start | self-end + ... safe | unsafe;
  align-content: flex-start | flex-end | center | space-between | space-around | space-evenly |  stretch | start | end | baseline | first baseline | last baseline + ... safe | unsafe;
}
.item {
  order: <integer>; /* default is 0 */
  flex-grow: <number>; /* default 0 */
  flex-shrink: <number>; /* default 1 */
  flex-basis: <length> | auto; /* default auto */
  flex: none | [ <'flex-grow'> <'flex-shrink'>? || <'flex-basis'> ] /* Shorthand for 3 above */
  align-self: auto | flex-start | flex-end | center | baseline | stretch;
}
```

## [Grid](https://css-tricks.com/snippets/css/complete-guide-grid/)

```css
.container {
  display: grid | inline-grid;
  grid-template-columns: <track-size> ... | [<line-name(s)>] <track-size> ...;
  grid-template-rows: <track-size> ... | [<line-name(s)>] <track-size> ...;
  grid-template-areas: "<grid-area-name> | . | none | ...";
  grid-template: none /* Initial values */ | <grid-template-rows> / <grid-template-columns>; /* Shorthand for 3 above (grid-template-areas gets set to none) */
  grid-column-gap: <line-size>;
  grid-row-gap: <line-size>;
  grid-gap: <grid-row-gap> <grid-column-gap>; /* Shorthand for 2 above */
  justify-items: start | end | center | stretch;
  align-items: start | end | center | stretch;
  place-items: <align-items> / <justify-items>; /* Shorthand for 2 above */
  justify-content: start | end | center | stretch | space-around | space-between | space-evenly;
  align-content: start | end | center | stretch | space-around | space-between | space-evenly;
  place-content: <align-content> / <justify-content>; /* Shorthand for 2 above */
  grid-auto-columns: <track-size> ...;
  grid-auto-rows: <track-size> ...;
  grid-auto-flow: row /* Default */ | column | row dense | column dense;
  grid: /* Shorthand for grid-template-rows, grid-template-columns, grid-template-areas, grid-auto-rows, grid-auto-columns, and grid-auto-flow */
}
.item {
  grid-column-start: <number> | <name> | span <number> /* For <number> */ | span <name> /* Until <name> */ | auto;
  grid-column-end: <number> | <name> | span <number> /* For <number> */ | span <name> /* Until <name> */ | auto;  
  grid-column: <start-line> / <end-line> | <start-line> / span <value>; /* Shorthand for 2 above */
  grid-row-start: <number> | <name> | span <number> /* For <number> */ | span <name> /* Until <name> */ | auto;
  grid-row-end: <number> | <name> | span <number> /* For <number> */ | span <name> /* Until <name> */ | auto;
  grid-row: <start-line> / <end-line> | <start-line> / span <value>; /* Shorthand for 2 above */
  grid-area: <name> | <row-start> / <column-start> / <row-end> / <column-end>; /* Shorthand for 2 above */
  justify-self: start | end | center | stretch;
  align-self: start | end | center | stretch;
  place-self: <align-self> / <justify-self>; /* Shorthand for 2 above */
}
```

## Extensions

* [98.css](https://jdan.github.io/98.css) = build Windows 98 looking UIs
* [Difference between SASS & SCSS](https://responsivedesign.is/articles/difference-between-sass-and-scss/)
* [Difference between SASS & SCSS](https://stackoverflow.com/a/5732683)
* **SASS** (Syntactically Awesome Style Sheets) = augments regular CSS syntax with programming concepts (eg variables, OO, nesting, Mixins), transpiled to regular CSS
  * Variables `$var = #123456;`
  * Evaluation `darken([color], 75%)`
  * Nesting `elem { inside { } }` equals `elem {}` + `elem inside {}` (actually interpreted as two separate block definitions)
  * [Mixins](https://responsivedesign.is/articles/helpful-sass-mixins)
* **SCSS**
  * Prefixing `.elem { &-sub {} }` equals `.elem {}` + `.elem-sub {}`
* **Tailwind CSS** = FOSS CSS framework providing a list of granular single-purpose composable utility classes (eg _flex_, _pt-4_, _text-center_ and _rotate-90_)
  * **daisyUI** = **Tailwind CSS** components library (eg accordions, alerts, avatars, carousel)
  * `@apply` = gather utility classes under one common larger rule (only use to avoid repetition, not as default use)
