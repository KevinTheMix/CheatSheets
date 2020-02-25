# CSS

## [CSS Selectors](https://www.w3schools.com/cssref/css_selectors.asp)

```css
.class {}
.class1.class2 {} /* Both */
.class1 .class2 {} /* All (indirect) descendants */
#id {} /* Unique ID */
* {} /* All */
a {} /* All <a>'s */
a,b {} /* All <a>'s and <b>'s */
a b {} /* All descendants <b>'s */
a>b {} /* All direct child <b>'s */
a+b {} /* All <b>'s directly after an <a> */
a~b {} /* All <b>'s somewhere after an <a> */
[att] {} /* Any with att="" */
[att=val] {} /* Any with att="val" */
[att~=val] {} /* Any with att="%val%" */
[att|=val] {} /* Any with att="val%" */
el[att^=val] {} /* All <el>s with att="val%" */
el[att$=val] {} /* All <el>s with att="%val" */
el[att*=val] {} /* All <el>s with att="%val%" */
:x {}
:nth-child(odd)
::y {}
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
## SASS

[Difference between SASS & SCSS](https://responsivedesign.is/articles/difference-between-sass-and-scss/)

Stands for Syntactically Awesome Style Sheets
Augments regular CSS syntax with programming concepts (e.g. variables, OO, nesting)
Ultimately, the extended stylsheets are interpreted into regular CSS (e.g. all variables are replaced, unnest, evaluated expressions end up as values)

### Variables

`$var = #123456;`

### Evaluation

`darken([color], 75%)`

### Nesting

Actually interpreted to two separate block definitions (& refers to the parent selector)

`elem { inside { } }` equals `elem {}` + `elem inside {}`

## SCSS

Prefixing:

`.elem { &-sub {} }` equals `.elem {}` + `.elem-sub {}`
