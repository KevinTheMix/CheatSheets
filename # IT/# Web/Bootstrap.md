# Bootstrap

Reusable & extendable web design framework.
Reusability is achieved by semantic class naming i.e. _why_ instead of _what_ (e.g. "warning" instead of "yellow_text"), as well as having small units of styles with a single purpose which then permits modular composition (`class="a b c"` => features from a + b + c).

Finally, Bootstrap uses conventions to specify how common elements get displayed, and predefines aritrary size ranges, dividing content into even areas.

## Package

* _./css/_ contains the core css, as well as the reactive one for multi-devices support.
* _./img/_ must remain at the same relative location to the _./css/_ folder.
* _./js/_ is used for images carousel, etc., and requires jQuery (it has to be included just before/above).

## Layout

Bootstrap uses a Grid system, of 12 columns and 940 pixels: 12 columns of 60 pixels & 11 intercolumn spaces of 20px (aka _gutters_).

### Fluid Design

Fixed Grid = pixels
Fluid Grid = %
Fluid means that the content will fill the entire space available, extending or shrinking.

### Responsive Design

Responsive Web Design makes the design react to the environment.

This is achieved using the `@media` CSS directive that allows to specify sections of a stylesheet that get applied only when certain conditions are met (usually related to a device's width).

Bootstrap actually predefines (by convention) a set of classes to manipulate how the elements on the page get displayed when the page is of a certain size, or even show or hide elements only to specific device formats.

An additional stylesheet (bootstrap-responsible.[min.]css) is required to enable those functionality.

## Classes

`class="inline"`

## Misc

HTML5's _placeholder_ attribute
`<dl><dt>Koko</dt><dd>is Kontan</dd></dl>`
[Color Palette](http://colormind.io/bootstrap/)
[Bootstrap Theme Creator](https://pikock.github.io/bootstrap-magic/)
[Bulma](https://bulma.io/)
