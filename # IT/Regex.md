# Regular Expressions

## Quick Tips

* `(?<![\w\\])_(?!\s)([^_\r\n]*?\S)(?<!\\)_(?![\w])` = find Markdown underscores italics (then replace with asterisks by `*$1*`)
  * Leaves expressions containing underscores alone (eg `path_to` is correctly ignored, but `_path\_to_` as well and must be fixed manually so look for `\_` afterwards)
  * Underscores within code blocks are also replaced, which may not be desirable

## Glossary

## API

* `^`/`$` = start/end anchors
* `\$` (or `$$` eg in VS Code replace) = literal _$_
* Capture
  * `$0` (or `$&`, or `\0`) = entire match
  * `$n` = n-th capture group
* Wildcards
  * `.` = any character (except newline)
  * Quantifiers
    * `*` = 0 to any (greedy)
    * `+` = 1 to any (greedy)
    * `*?` = 0 to any (lazy)
    * `+?`  = 1 to any (lazy)
    * `{n}` = exactly n
    * `{n,}` = n or more
    * `{n,m}` = between n & m
