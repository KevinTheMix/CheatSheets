# Excel

* [Analysis ToolPak add-in](https://support.microsoft.com/en-us/office/use-the-analysis-toolpak-to-perform-complex-data-analysis-6c67ccf0-f4a9-487c-8dec-bdb5a2cefab6)
  * [Descriptibe Statistics](https://www.excel-easy.com/examples/descriptive-statistics.html)
* _Data > Filter_ = Make header into sort/filter cell
* Sequence auto-continuation
  * Select 2 (or more) sequential cells
  * Drag & slide the square at the bottom-right dot of the selection
  * This will continue the current series and generate values for the sequence
* `'` = Format cell value as string
* `$` = cell coordinate _freeze_ when copy-pasting
  * _$A1_ = Freeze a column's reference when copy-pasting a cell horizontally
  * _A$1_ = Freeze a row's reference when when copy-pasting a cell vertically
  * `F4` = cycle through column/row dollar freezing combinations in current formula
* `Shift + F11` = Add new sheet
* `Ctrl + Up/Down` = go to top/bottom of current column
  * Add `Shift` to select range
* `Ctrl + Left/Right` = go to start/end of current row
  * Add `Shift` to select range
* `Ctrl + B/D` = Copy down topmost cell into selected cells below
  * Actual key depends on installed language (_**B**as_/_**D**own_)
  * Also via the _Home_ menu, the down arrow icon under the _Sum_ sign
* Regional Settings for comma/dot separator = _File > Options > Advanced > Editing Options > (Uncheck) Use System Separater_
* `Ctrl + T` = Format as Table
  * Tables references (Charts, formulas, pivot) are automatically updated as the table's data is changed
* Select Column/Row > Right Click > Hide/Unhide
* (Un)Group = `Shift + Alt + Left/Right` or _Data > Outline > Group_

## Development

* [Edit a macro](https://support.microsoft.com/en-us/office/edit-a-macro-ed9e8c3d-58fd-47a1-83eb-bdee680376bb)
* `Alt + F11` = Open Visual Basic editor
* File extension must be `.xslm`
