# HTML (HyperText Markup Language)

## Glossary

* Data Attributes = custom user-defined HTML tags in the form `data-*` (where `*` is in _kebab-case_) that are then referenceable via JS via an element's `dataset` property (always exists for any element)'s subproperty (in _camelCase_)
  * Eg `<button data-koko-kontan="hello">Click</button>`, then `kokoButton.dataset.kokoKontan`

## API

* Characters
  * `&nbsp;` = Non-breaking Space
  * `&copy;` = Copyright
* Links
  * `<head><base href="https://www.example.com"></head>` = specify a base URL for all relative URLs on a page
  * `<a href="file:///\\sourcesafe.be.bvdep.net\CUSTO\_Custo\Wiki\Portals\Commercial">Link</a>` = link to File =  (2011.11.21)
  * `<a target="_blank">` = open link a new Window (or tab in modern browsers)
  * `<a href="https://www.koko.com" target="koko">Koko</a>` = change an iframe's content
* `<body onLoad="javascript:start();">` = body onLoad
* `<iframe src="frame.htm" name="koko" title="Kontan"><p>Your browser does not support iframes</p></iframe>` = nested HTML iframe
* `<script src={path} defer></script>`= script Defer, downloads script while parsing the page, runs it when the page is ready
* Tables
  * `<table>`, `<tr>` (Table Row), `<th scope="[col(group)/row(group)]">{title}</th>` (Table Header), `<td>{cell content}</td>` (Table Data)
  * `<thead>`, `<tbody>`, `<tfoot>` (can be specified before `<tbody>` and will still be displayed at the end) = static heading/footer & only body changing for results spanning multiple pages
* `<script type="text/javascript" src="script.js" async="true" />` = loads script asynchronously (ie non-blocking, executed once it's ready but execution order becomes non-deterministic)

## Accessibility

* `<img src=".." alt="meaningful description eg his image shows .." />`= alternate description, for when images cannot be displayed (2011.04)
* `<abbr title="Koko Kontan">koko</abbr`= abbreviation (2010.11.30)
* `<acronym title="Beau gosse">bg</acronym>` = acronym (2010.11.30)
* `<strong>` = for (semantically) important text in a document
* `<em>` = fir emphasized text (usually displayed in _italic_, narrated with an emphasis using verbal stress)

### HTML 4

* Body background color: `<body bgcolor="red">` (_deprecated_)
* `<table border="{#}>` (_deprecated_)

#### DocTypes (2011.02.08)

```HTML
<!-- HTML 4.01 Strict, Loose, Frameset -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<!-- XHTML 1.0 Strict, Transitional, Frameset -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<!-- XHTML 1.1 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<!-- XMLNS -->
<html xmlns="http://www.w3.org/1999/xhtml">
```
