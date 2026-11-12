# Inkscape

Inkscape is a FOSS vector graphics editor, serving as alternative to Adobe Illustrator.

## Quick Tips

* Pull left Toolbox menu bar to the right to enlarge it & align tools icons as multiple columns
* Alpha & Opacity are not the same (alpha is an intrinsic part of a RGBa color whereas opacity is an additional property)

## Glossary

* Areas
  * **Background** = surroundings
  * **Border** = around page
  * **Canvas** = infinite workspace
  * **Document** = net
  * **Page** = everything within background
* **Fill** = object color
* **Path** = basic vector object
* **Stroke** = surrounding line color, part of path (can be straight/rounded, colored, widened)

## GUI

* Top
  * Menus
    * **File** > *Document Properties* = set canvas width, height, background color
    * **Edit** > *Settings* (*Show Welcome dialog*)
    * **Object** = (un)group, raise/lower, rotate, flip
  * **Tool Control Bar** = contextual (depends on chosen tool)
* Left = Toolbox
* Right = **Command Bar** = Quick actions (open, save, cut/copy)
* Bottom
  * **Palette**
    * `Click` = set Fill color, Shift + Click` = set Stroke color
  * **Status Bar** = contextual information (number of selected objects, scaling factor, rotation angle)

## Shortcuts

* `Ctrl + Shift + 4` = center view on page
* `Ctrl + Shift + A` = Align & Distribute
  * `Click` object to align first, then `Shift + Click` target second, then choose relative to *Last selected*
* `Ctrl + Shift + C` = object to path
* `Ctrl + Shift + D` = Document Properties
* `Ctrl + Shift + E` = Export (Document, Page, Selection, Custom)
* `Ctrl + Shift + F` = Fill & Stroke
* `Ctrl + Shift + G` = ungroup
* `Ctrl + Shift + L` = Layers and Objects
* `Ctrl + Shift + M` = Transform
* `Ctrl + Shift + O` = Object Properties
* `Ctrl + Shift + P` = Settings
* `Ctrl + +` = Union
* `Ctrl + -` = Difference
* `Ctrl + B` = toggle scrollbars
* `Ctrl + D` = Duplicate
* `Ctrl + G` = Group
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
* `H` = flip selection horizontally
* `V` = flip selection vertically

### Tools

* `*` (Star) = draw star/polygon shapes
* `B` (Bézier) = line or curve paths
  * `Click` = draw line
  * `Drag` = Bézier curve
  * `Ctrl` = use 15° steps
* `D` = colour picker
  * `Click` = capture Fill
  * `Shift + Click` = capture Stroke
  * `+ Drag` = capture area average colour
  * `+ Alt` = capture inverse colour
  * `Ctrl + C` = copy colour under mouse to clipboard
* `E` (Ellipse) = draw circle/ellipse/arc shapes
  * `Drag Circle Handle` = draw a pie chart
  * `Drag Outside` = draw a straight arc
* `N` (Nodes) = manipulate individual/**multiple** nodes of a path
  * Make selected nodes hard (click twice to reset), soft, symmetric, automatic
  * Manually adjust smoothness of curves, or enlarge some nodes as a group
* `R` (Rectangle) = draw rectangle shapes (drag circle handle to round corners, click *Make corners sharp* to reset)
* `S` (Select)
  * `Click` = toggle between scaling & rotating/skewing handles (Status Bar shows angle/scale)
  * `Drag + Space` = Duplicate dragged object at current location
  * (In scaling mode) `Ctrl` = locks aspect ratio
  * (In scaling mode) `Shift` = draws from center out
  * (In rotating/skewing mode) `Ctrl` = locks 15° steps
  * (In rotating/skewing mode) `Shift` = uses opposite as pivot
  * (In rotating/skewing mode) `Drag Center` = move center (even outside)
    * `Ctrl` = follow axes
    * `Shift + Click` = reset
* `X` (Boolean) = Shape Builder Tool (to add/subtract shapes)
