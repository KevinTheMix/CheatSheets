# HTML

* Script Defer e.g. `<script src={path} defer></script>` = downloads script while parsing the page and runs it when the page is ready
* `<a target="_blank">` = open link a new Window (or tab in modern browsers)
* Accessibility
  * `<img alt="meaningful description" />`
  * `<strong>`
  * `<em>`
* Characters
  * `&nbsp;` = Non-breaking Space
  * `&copy;` = Copyright

## Tables

* `<table>`
  * `<table border="{#}>` (_Deprecated_)
  * `<tr>` = Table Row
  * `<th scope="[col/row]">{title}</th>` = Table Header
  * `<td>{cell content}</td>` = Table Data

For results spanning multiple pages, a static heading & footer structure can be defined, i.e. with only the body changing

* `<thead>`
* `<tbody>`
* `<tfoot>` = can be specified before `<tbody>` and will still be displayed at the end
