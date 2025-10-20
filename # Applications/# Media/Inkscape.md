# Inkscape

Inkscape is a FOSS vector graphics editor, serving as alternative to Adobe Illustrator.

## Quick Tips

* Pull left menu bar to the right to align tools icons in multiple columns
* Alpha & Opacity are not the same (alpha is an intrinsic part of a RGBa color whereas opacity is an additional property)

## Glossary

* **Path** = basic vector object
* **Stroke** = line surrounding path, part of it (can be straight/rounded, colored, widened)

## Menus

* File > **Document Properties** = set canvas width, height, background color
* Edit > **Settings** (_Show Welcome dialog_)
* **Toolbox** (left) = Tools
* **Tool Control Bar** (top) = contextual (depends on chosen tool)
* **Command Bar** (right) = Quick actions (open, save, cut/copy)
* **Palette** (bottom)
  * `Click` = set Fill color, Shift + Click` = set Stroke color
* **Status Bar** (bottom) = contextual information (number of selected objects, scaling factor, rotation angle)

### Shortcuts

* `Ctrl + Shift + 4` = center view on page
* `Ctrl + Shift + A` = Align & Distribute
  * `Click` object to align first, then `Shift + Click` target second, then choose relative to _Last selected_
* `Ctrl + Shift + C` = object to path
* `Ctrl + Shift + D` = Document Properties
* `Ctrl + Shift + E` = Export (can export just selection)
* `Ctrl + Shift + F` = Fill & Stroke
* `Ctrl + Shift + L` = Layers and Objects
* `Ctrl + Shift + M` = Transform
* `Ctrl + Shift + O` = Object Properties
* `Ctrl + Shift + P` = Settings
* `Ctrl + +` = Union
* `Ctrl + -` = Difference
* `Ctrl + B` = toggle scrollbars
* `Ctrl + D` = Duplicate
* `Ctrl + R` = toggle rulers
* `Shift` = select multiple objects
* `Shift + Alt + P` = toggle Palette
* `Middle-Drag` = move canvas around
* `1` = zoom at 1:1
* `2` = zoom at 1:2
* `3` = zoom on selection
* `4` = zoom on content
* `5` = zoom on page
* `6` = zoom on page width
* `*` (Star) = draw star/polygon shapes
* `B` (Bézier) = draw line (`Click`) or Bézier curve (`Drag`) paths (`Ctrl` for 15° steps)
* `E` (Ellipse) = draw circle/ellipse/arc shapes (drag circle handle outside to draw a pie chart or outside to draw a straight arc)
* `N` (Nodes) = manipulate individual/**multiple** nodes of a path
  * Make selected nodes hard (click twice to reset), soft, symmetric, automatic
  * Manually adjust smoothness of curves, or enlarge some nodes as a group
* `R` (Rectangle) = draw rectangle shapes (drag circle handle to round corners, click _Make corners sharp_ to reset)
* `S` (Select)
  * `Click` = toggle between scaling & rotating/skewing handles (Status Bar shows angle/scale)
  * `Drag + Space` = Duplicate dragged object at current location
  * In scaling mode, `Ctrl` locks aspect ratio, `Shift` draws from center out
  * In rotating/skewing mode, `Ctrl` locks 15° steps, `Shift` uses opposite as pivot
    * Rotation/skewing center is movable (even outside, `Ctrl` to follow axes, `Shift + Click` to reset it)
* `X` (Boolean) = Shape Builder Tool, to add/subtract shapes
