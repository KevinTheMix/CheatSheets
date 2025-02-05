# Visual Basic

## Quick Tips

* Add Toolbars via `View > Toolbars`
  * _Edit_ toolbar is especially useful to comment/uncomment code

## Glossary

* `:=` = specify a named parameter of a method
* `Not` = invert condition (eg ´If Not koko Is Nothing Then´, note how Not is before variable, and not _Nothing_)
* `Set` = mandatory in order to assign an **object** reference to a variable (eg Ranges, Workbooks, Worksheets, and custom classes)
* `With (…) End With` = shorthand to execute multiple statements (using its methods/properties) on a single object (eg `With koko .Method … .Property … End With`)

## VBA

* [Conditional expression are evaluated fully before using their result](https://social.msdn.microsoft.com/Forums/en-US/80ce2cf9-c95d-4055-ae96-8cec7d1dff6b/vba-excel-andor-condition-behavior?forum=isvvba) => check for null beforehand

## Visual Basic 6.0

* Double-Click Form = _Load
* `Shift + F2` = Go to definition
