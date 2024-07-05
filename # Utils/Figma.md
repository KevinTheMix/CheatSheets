# Figma

Online UI design for apps & websites, with collaborative & prototyping capabilities.

## Glossary

* **Auto layout** = adjust elements to fit/resize together (eg a rectangle enlarges as its inner text gets longer)
  * Note that the inner content must initially fit _within_ a larger parent and not overflow when applying this option
* **Component** = reusable element of design (à la Flutter widget), changes to _original_ (only) propagate to all cloned instances
  * They appear in left tree as purple elements (original has a different icon), and also under _Assets_ tab
* **Constraints** = anchoring/resizing strategy (editable eg in a rectangle properies)
* **Edit Mode** = select as wireframe
* **FigJam** = collaborative whiteboard & diagrams, mind maps & timelines
* **File** = set of pages
* **Frame** = container for UI elements
* **Page** = UI elements view (can be used to design themes/variations eg different devices)
* **Project** = set of files
* **Prototype** = set up static navigation connections/animations
* **Stroke** = border

## Menu & Shortcuts

* Drafts > + > _New design file_

* `Alt + Hover over elements` = display red lines (padding values)
* `Drag number sideways` (eg Stroke density or Blur intensity) = set number

### Designer

* `Double Click` = select an (inner) element, or set Edit Mode
* `Middle Click + Drag` = pan
* `Alt + Drag` = resize around center
* `Ctrl + D` = duplicate
* `Ctrl + G` = group selection of multiple elements
* `Shift + Click/Drag` = snap-align or maintain element proportions while creating/resizing
* `Shift + Click` multiple elements = multi-selection
* `Shift + X` = swap Fill & Stroke properties

#### Left (tree) Panel

* The vertical order of elements/layers translates their priority in the z-axis

* `Double Click` an element icon = zoom to that element

#### Top Panel

* Main menu
  * _Back to files_
  * File > _Export…_ = `Ctrl + Shift + E`
  * File > _Export frames to PDF…_
* Move tools
  * Move = `V`
  * Scale = `K`
* Region tools
  * Frame = `F`
  * Slice = `S`
  * Section = `Shift + S`
* Shape tools
  * Rectangle = `R`
  * Line = `L`
  * Arrow = `Shift + L`
  * Ellipse = `O`
  * Polygon
  * Star
  * Place image/video… = `Ctrl + Shift + K`
* Creation tools
  * Pen = `P`
  * Pencil = `Shift + P`
* Text = `T`
* Resources = `Shift + I`
* Hand tool = `H` (or `Space + Drag` or `Two fingers`)
* Add comment = `C`

* Select matching layers = `Ctrl + Alt + A`
* Components
  * Create component = `Ctrl + Alt + K`
  * Creat multiple components
  * Create component set
* Use as mask = `Ctrl + Alt + M` (mask applies to element/layer directly above it)
* Boolean Groups = merge multiple shapes according to some strategy
  * Union selection
  * Subtract selection
  * Intersect selection
  * Exclude selection
  * Flatten selection = `Ctrl + E`
* Mark as ready for dev

* Multiplayer tools
* Share
* Dev Mode = `Shift + D`
* Present = `Ctrl + Alt + Backspace`
* Missing fonts
* Zoom/view options
  * Zoom to fit = `Shift + 1`
  * Zoom to selection =`Shift + 2` (note: selection can be a particular element)

#### Right Panel

Design Properties (and Prototype).

* Align left = `Alt + A`
* Align horizontal centers = `Alt + H`
* Align right = `Alt + D`
* Align top = `Alt + W`
* Align vertical centers = `Alt + V`
* Align bottom = `Alt + S`
* More options (when selecting multiple elements)
  * Tidy up = `Ctrl + Alt + Shift + T`
  * Distribute vertical spacing = `Alt + Shift + V`
  * Distribute horizontal spacing = `Alt + Shift + H`
