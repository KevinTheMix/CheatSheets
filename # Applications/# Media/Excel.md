# Excel

## Quick Tips

* **Change default format/template**
  * In Excel, File > Options > _When creating new workbooks_ (note: only for new workbooks created from within Excel itself)
  * In Windows, replace **EXCEL12.XLSX** template in _C:\Program Files\Microsoft Office\root\vfs\Windows\SHELLNEW_ (make backup first)
* [excelisfun](https://www.youtube.com/@excelisfun)
* [Find external links](https://www.ablebits.com/office-addins-blog/find-break-external-links-excel)
* [Leila Gharani](https://www.youtube.com/@LeilaGharani) = Excel shortcut keys you SHOULD know! (2022.02.21, already absorbed)

## Glossary

* **Spill** = when some values exceed their initial cell and overflow into adjacent ones
* **VLOOKUP** = find things in a table or a range by row
* **XLOOKUP** = improved VLOOKUP (any direction and returns exact matches by default, making it easier and more convenient to use)

## Menus

* Home
  * Styles > **Conditional Formatting** > _New Rule > Use a formula (…)_  = color selected range depending on one column's cell values
    * Enter formula (eg `=$C2="Value"`) & format to apply (eg font color)

* `Alt` = display tab menu shortcut labels
  * `A` = **Data**
  * `D` = **Legacy**
  * `E` = **Legacy**
  * `F` = **File**
    * `FT` = **Options**
      * _Advanced > Editing Options_ > untick 'Use system separators' to fix regional settings for Decimal/Thousands separators
      * _Customize Ribbon > Customize the Ribbon_ > tick 'Developer' checkbox in right Main Tabs list to add Developer tab (for Macros)
  * `H` = **Home**
    * `HL` = (Styles >) **Conditional Formatting**
    * `HN` = (Number >) **Number Format**
    * `HO` = (Cells >) **Format**
  * `L` = **Developer** (after activating it in Options menu)
  * `M` = **Formulas**
  * `P` = **Page Layout**
  * `W` = **View**
  * `AT` = _Filter_ (turn header into sort/filter cell)
  * `DFS` = _Clear Filter_ (clears current selection for all filters)
  * `HK` = _Comma Style_ (format as thousands separator, ideal for accounting large numbers)
  * `ES` = _Paste Special_ (after copying some cells, or from outside Excel, same as `Ctrl + Alt + V`)
  * `HLN` = _New Rule…_ (create formatting rule)
  * `HNS` = _Short Date_ (convert number to Short Date)
  * `HOA` = _AutoFit Row Height_
  * `HOH` = _Row Height…_
  * `HOI` = _AutoFit Column Width_ (automatically adjust columns width to contained data, same as legacy `OCA`)
  * `HOR` = _Rename Sheet_
  * `HOW` = _Column Width…_
  * `LAS` = _Macro Security_ (enable/disable macros, file extension must be `.xslm`)
  * `MH` = _Show Formulas_ (toggle formulas display)
  * `MN` = _Name Manager_ (add/delete/edit cell names)
  * `PRS`= _Set Print Area_ (select cells to print exclusively, `PRC` to clear)
  * `WVG` = _Gridlines_ (toggle gridlines)

## Shortcuts

Note: shortcuts including numbers require holding `Shift` on EU keyboard as num pad does not work (except for `+` & `-`)

* Down/Up/Right/Left = `Enter`, `Shift + Enter`, `Tab`, `Shift + Tab`
* `'` = Format cell value as string
* `$` = coordinate _freeze_ when copy-pasting cells
  * Eg _$A1_ = freeze a column's reference (when copy-pasting a cell horizontally)
  * Eg _A$1_ = freeze a row's reference (when copy-pasting a cell vertically)
  * `F4` (while in Edit mode) = cycle through column/row dollar freezing combinations in current formula
* `F2` = switch to Edit mode (alternatively, click Formula bar)
* `Alt + =` = auto-sum adjacent cells (both horizontally & vertically, at the same time)
* `Alt + ;` = select only visible cells if row/columns where hidden (easy way to detect that)
* `Alt + Down` = display dropdown showing all previous string values in same column (ie quick enum-like value selection)
* `Alt + Enter` (in Edit mode) = add newline inside a cell
* `Alt + F1` = generate a bar chart using the selected data
* `Alt + F11` = Open Visual Basic editor
* `Ctrl + +` or `Ctrl + -` = insert or remove a row/column (select an existing row/column beforehand to skip dialog, also insert after cut/copying to clone/move)
* `Ctrl + '` or `Ctrl + "` or `Ctrl + D` = clone down above cell value
* `Ctrl + ;`/`Ctrl + :` = insert current date/time
* `Ctrl + Enter` (in Edit mode after selecting multiple cells) = paints active cell's content (ie value or formula) into other selected cells
* `Ctrl + Left/Right/Up/Down` = go to first/last cell horizontally/vertically (add `Shift` to select range)
* `Ctrl + &` = surround with border
* `Ctrl + 1` = Format cells
* `Ctrl + 9` = hide current row(s)
* `Ctrl + 0` = hide current column(s)
* `Ctrl + E` = Flash Fill (ie fills data down a column based on detected pattern eg adjacent column substring)
* `Ctrl + F` = Search (search in _Values_ to search displayed values, otherwise hidden by underlying formulas)
* `Ctrl + G` or `F5` = _Go To…_ (select a cell or a range, _Go To Special…_ allows quick selection of cells on blanks/formulas errors/etc)
* `Ctrl + L` or `Ctrl + T` = create table (also in Home > Format as Table, works with a single cell selected)
  * All table references (Charts, formulas, pivot) are automatically updated as the table's data is changed
  * Strip table style/formatting = _Table Design > Table Styles > (dropdown) > Clear_
  * Remove table = _Table Design > Tools (group) > Convert to Range_ (alternatively Data > _Filter_)
* `Ctrl + N` = create new book
* `Ctrl + R` = copy value of left cell
* `Ctrl + V, Ctrl, V` = copy values
* `Ctrl + Z` = cancels last auto-formatting upon pasting
* `Ctrl + Alt + {n}` = creates a header-level text in Microsoft Word
* `Ctrl + Shift + L` = toggle filter
* `Ctrl + Shift + V` = paste without formatting (works in many other Windows applications)
* `Ctrl + Space` = select whole column
* `Shift + Space` = select whole row
* `Shift + Alt + Left/Right` (or _Data > Outline > Group_) = Group/Ungroup
* `Shift + F11` = Add new sheet
* `Right-Click` (on selected Column/Row) > Hide/Unhide
* `Drag Down` square at bottom-right dot of selection = fill handle (ie generates values continuing selected sequence/series, only in one dimension)
* `Drag a cell corder` = move selection (or insert if also holding `Shift`)

## API (Formulas)

* `COUNTA(range)` = counts non-empty cells
* `COUNTIF(range, pattern)` = counts only cells satisfying pattern (with wildcards)
* `INDIRECT(text)` = returns a reference (eg _C2_) given by text expression (eg `=INDIRECT("C" & ROW())`)
* `ROW()` = current row
* `SUMIF(range, criteria, [sum_range])` = adds only cells satisfying criteria (ie a string eg _">100_, with wildcards), from itself or another range
* `SUMIFS(sum_range, criteria_range1, criteria1, [criteria_range2, criteria2])` = adds cells based on multiple criteria of other columns (eg filter by rows & columns)
* `UNIQUE(range)` = distinct values
* **Curly Braces** = spilled array
  * `{a;b;c}` = will expand into a vertical array spilling down
  * `{a,b,c}` = will expand into horizontal array spilling right
  * Eg `=DATE(2025,{1;4;7;10})` will produce 4 quarterly cells
* **Range**
  * `{Cell}#` = indicates (growing) range of spilled array (eg `B2#` if _BE_ is first cell of spilled array)
* **Square Brackets**
  * `Table[Column]` = table column range reference (or just clicking table column header)
  * `Table[@Column]` = table cell on same row reference (or within table itself just `[@Column]`)
* **Wildcards** = `*` (many characters), ´?´ (one character), `??` (two characters), etc
  * `~` = escape character for wildcards (eg `*~?*` for a literal _?_ surrounded by stuff), including itself

## Extensions

* [Analysis ToolPak add-in](https://support.microsoft.com/en-us/office/use-the-analysis-toolpak-to-perform-complex-data-analysis-6c67ccf0-f4a9-487c-8dec-bdb5a2cefab6)
  * [Descriptibe Statistics](https://www.excel-easy.com/examples/descriptive-statistics.html)
