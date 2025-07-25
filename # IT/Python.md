# Python

## Quick Tips

* There is no brackets in python, indentation matters
* Variables can be declared in a sub-scope and be used outside (eg declared locally within `if` block & used underneath)

## Glossary

* **Django** = Python's web framework
* **Dunder Method** (Double Under) or **Magic Methods** = built-in methods starting with double leading & trailing underscores (eg `__init__`), commonly used for operator overloading, listable via `dir({class})`
* **Flask** = light & extensible web framework (`flask`)
* **Web Server Gateway Interface** (WSGI) = server-to-application calling/forwarding convention for Python applications

### Libraries

* **NumPy** (Numerical Python) = arrays manipulation
* **openpyxl** = read/write Excel 2010 xlsx/xlsm/xltx/xltm files
* **pandas** (panel data) = data manipulation & analysis, especially data structures/operations for numerical tables & time series
* **timeit** = measure performances (eg `timeit.timeit(stmt={treatment}, number={n})`)

## API

* _None_ = null
* `_field` = meant informatively that an attribute/method is intended for use inside that class only
* `field_` = single trailing underscore avoid conflicts with reserved keyword (by convention)
* `__field` = name mangling (ie replaced with `_classname__field`)
* `#` = comment
* `type(value)` = returns type (eg `<class 'str'>`)
* `input(text)` = displays text & returns user input

### Numbers

* `1234` = **int**(eger) number
* `12.34` = **float**(ing-point) number
* `int(text)` = convert to integer
* `float(text)` = convert to float
* `/` = floating-point division
* `//` = floor integer division
* `{n} ** {exponent}`
* `() ** * / + -` = order of operation

### Strings

* `'s'` or `"s"` = **str**(ing)
* `"""s{Enter}s"""` = multi-line string (outputs newlines)
* `"s/{Enter}s"` = line continuation (does not output newlines)
* `"s" + "s"` = concatenation
* `"s * {n}"` = multiply a string (number can be before/after)
* `f"{variable}"` = interpolation (using curly braces)
* `str({number})` = convert to string
* `strip(s)` = trim
* `s.isdigit()` = True if text represents a number
* Strings are list of (1-char long) strings

### Flow

* _True_/_False_ = **bool**(ean)
* `not {condition}`
* `if {condition}: … (elif {condition}: …) (else: …)`
* `{v1} if {condition} else {v2}` = inline ternary operator
* `[]` = False (list in a boolean context)
* `[123]` = True (list in a boolean context)
* `match {expression}: case {value}: … case _: …` = switch-case

### Collections

* `iter(list)` = creates an iterator
* `next(iter)` = returns next iterated item

#### Lists

Ordered & changeable collection of (hybrid, but should be used to handle homogenous) data objects.
There is no built-in arrays (but tools like **NumPy** exist).

* `[1, 'a', True]` = **list**
* `[a, b, c] = {list|tuple}` = multi assign (similar to tuple unpacking), assign multiple variables at once
* `[1, 2, 3] + [4, 5]` = concatenates lists
* `[x for x in {list} if {condition}]` = list comprehension (returns a list with items satisfying a condition)
* `list[(start):(end)]` = slices into a new sublist (_start_ and/or _end_ are optional, default to first/last item), safely empty if range outside bounds
* `list[-{n}]` = nth-to-last element (eg `list[-1]` for last item)
* `.append(item)` = add item at the end
* `.insert(index, item)` = insert item at index (can be negative, where _-1_ actually means second-to-last)
* `.remove(item)` = remove first matching item (by value)
* `.pop((index))` = remove & return item at index (or last if not specified)
* `.clear()` = delete all items
* `.extend(list)` = add list to this list (in place, returns None)
* `map(function, list)` = select
* `list(map)` = convert to list (à la `toList()`)
* `sorted(list)` = sort a list

#### Tuple

Immutable (ie non-growable, which makes it memory-effcient & fast) grouping of heterogenous data.
Can be used as a record in place of a full-blown class object.
Returned by libraries such as SQL libraries (eg `fetchone()` & `fetchall()`).

* `(1, 'a', True)` = **tuple**
* `1, 'a', True` = still a tuple (parentheses are optional)
* `1,` = still a valid tuple (ie `(1,)`)
* `(name, age, bow) = ("Koko", 17, "bare")` = tuple unpacking, assign multiple variables at once
* `tuple[index]` = returns item at index

### OO
