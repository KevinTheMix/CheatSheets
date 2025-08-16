# Excel

## Quick Tips

* [8 Excel tips](https://www.instagram.com/p/CnhQwTjonpC/)

* _Data > Filter_ = Make header into sort/filter cell
* Sequence auto-continuation
  * Select 2 (or more) sequential cells
  * Drag & slide the square at the bottom-right dot of the selection
  * This will continue the current series and generate values for the sequence

* Select Column/Row > Right Click > Hide/Unhide
* Regional Settings for comma/dot separator = _File > Options > Advanced > Editing Options > (Uncheck) Use System Separater_
* [Edit a macro](https://support.microsoft.com/en-us/office/edit-a-macro-ed9e8c3d-58fd-47a1-83eb-bdee680376bb)
  * File extension must be `.xslm`
* Formulas > _Show Formulas_ = toggle displaying cell formulas/values
* Formulas > _Name Manager_ = CRUD cell names
* Page Layout -> Page Setup -> Print Area -> _Set Print Area_

* Change default format
  * In Excel, File > Options > _When creating new workbooks_ (note: only for new wb created from within Excel itself)
  * In Windows, replace **EXCEL12.XLSX** template in _C:\Program Files\Microsoft Office\root\vfs\Windows\SHELLNEW_ (make backup first)

* Color rows depending on one column value (Conditional formatting)
  * Select whole range/table
  * _Home > Conditional Formatting > New Rule > formula_
  * Enter formula (eg `=$C2="Value"`) & format to apply (eg font color)
* Remove table = _Table Design > Tools (group) > Convert to Range_

## Shortcuts

* `'` = Format cell value as string
* `$` = cell coordinate _freeze_ when copy-pasting
  * Eg _$A1_ = Freeze a column's reference (when copy-pasting a cell horizontally)
  * Eg _A$1_ = Freeze a row's reference (when copy-pasting a cell vertically)
  * `F4` = cycle through column/row dollar freezing combinations in current formula

* `Alt + =` auto-sum adjacent cells (both horizontalliy & vertically, at the same time)
* `Alt + H + O + I`
* `Alt + Down` = easy fill cell using dropdown of all previous column cells values
* `Alt + F1` = generate a bar chart using the selected data
* `Alt + F11` = Open Visual Basic editor
* `Alt + W + V + G` = toggle gridlines

* `Ctrl + '` (or `Ctrl + "`) = clone above value
* `Ctrl + Enter` = paints active cell's content (eg formula) into selected cells (active cell must be in edit mode eg click formula bar)
* `Ctrl + Up/Down` = go to top/bottom of current column (add `Shift` to select range)
* `Ctrl + Left/Right` = go to start/end of current row (add `Shift` to select range)
* `Ctrl + E` = Flash Fill (fill based on pattern eg other columns bodies based on 1st column & column header)
* `Ctrl + F` = Search
  * Search in _Values_ = search displayed values (otherwise hidden by underlying formulas)
* `Ctrl + G` = Go To
  * Go to Special allows quick selection of cells on blanks, errors, etc.
* `Ctrl + T` = Format as Table (works with a single cell selected)
  * All table references (Charts, formulas, pivot) are automatically updated as the table's data is changed
  * _Table Design_ > table theme (colours) dropdown > _Clear_ = strip table style (formatting)
  * _Table Design_ > _Convert to Range_ = remove table
  * (Additionally, remove: Data > _Filter_)
* `Ctrl + V, Ctrl, V` = copy values
* `Ctrl + Z` = cancels last auto-formatting upon pasting

* `Shift + Alt + Left/Right` (or _Data > Outline > Group_) = Group/Ungroup
* `Shift + F11` = Add new sheet

### EN

* `Ctrl + D(own)` = copy down topmost cell into selected cells below
* `Ctrl + N` = go to last row

### FR

* `Ctrl + B(as)` = copy-paste up cell
* `Ctrl + D` = copy-paste left cell
* `Ctrl + N` = create new book

## API (Formulas)

* `INDIRECT({text})` = returns a reference (eg _C2_) given by text expression (eg `=INDIRECT("C" & ROW())`)
* `ROW()` = current row

## Extensions

* [Analysis ToolPak add-in](https://support.microsoft.com/en-us/office/use-the-analysis-toolpak-to-perform-complex-data-analysis-6c67ccf0-f4a9-487c-8dec-bdb5a2cefab6)
  * [Descriptibe Statistics](https://www.excel-easy.com/examples/descriptive-statistics.html)
