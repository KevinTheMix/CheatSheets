# Python

## Quick Tips

* There is no brackets in python, indentation matters
* Variables can be declared in a sub-scope and be used outside (eg declared locally within `if` block & used underneath)
* `python - <<'PY'{Enter}{code}{Enter}PY` = enter some inline python code in Bash

## Glossary

* **Django** = Python's web framework
* **Dunder Method** (Double Under) or **Magic Methods** = built-in methods starting with double leading & trailing underscores
  * Commonly overriden (eg `__init__`), listable via `dir({class})`
* **Flask** = light & extensible web framework (`flask`)
* **pip(3)** = Pyton (3) package manager
* **PyPI** (Python Package Index) = official repository of Python packages (default for `pip`)
* **Virtual Environment** = standalone self-contained local install including all versioned dependencies, sourced in command prompt, prevents intereference with global install
* **Web Server Gateway Interface** (WSGI) = server-to-application calling/forwarding convention for Python applications

## Environment

* On Windows: _Settings > Apps > Advanced app settings > app execution aliases_ > toggle off **App Installer** (for both python.exe & python3.exe)

### CLI

* `pip freeze > {file}` (eg _requirements.txt_) = list every package currently importable/usable into a requirements file (one package per line)
* `pip (un)install`
  * `--upgrade-pip` = upgrades itself
  * `-r {file}` = install from a requirements file
  * `"pandas[excel]"` = install current Excel-related stack from PyPI (pandas, openpyxl, xslxwriter)
* `python3 -m venv {directory}` = creates a virtual environment
  * `source {directory}/bin/activate` = change prompt to virtual environment
  * `deactivate` = exit virtual environment (return to system-wide python install)
  * `python -m pip install --upgrade pip`
* `python -c {command}` = executes inline Python code

### Libraries

* **NumPy** (Numerical Python) = arrays manipulation
* **openpyxl** = read/write Excel 2010 xlsx/xlsm/xltx/xltm files
* **pandas** (panel data) = data manipulation & analysis, especially data structures/operations for numerical tables & time series
  * `df.dropna(how='all')` = remove missing values
  * `df.iloc[start:end]` = subset splicing
  * `df.isin({collection})` = check if DataFrame has values in collection (eg `df[~df.isin([excluded_values])]`)
  * `dg.reset_index(drop=True)`
* **pyinstaller** = (pre-)compile Python code (`-F` aka `--onefile` to create single file bundle exe)
* **timeit** = measure performances (eg `timeit.timeit(stmt={treatment}, number={n})`)
* **xlsxwriter**

## API

* `\` = (multi-)line continuation
* Built-in variables
  * `__file__` = current script file
  * `__name__` = name of current module, varies depending on whether executed directly (ie `__main__`) or imported

* _None_ = **NoneType** (à la null)
* `pass` = placeholder statement for contexts where a statement is required by syntax but not implemented yet (eg an empty if/else block)
* `_field` = meant informatively that an attribute/method is intended for use inside that class only
* `field_` = single trailing underscore avoid conflicts with reserved keyword (by convention)
* `__field` = name mangling (ie replaced with `_classname__field`)
* `#` = comment
* `type(value)` = returns type (eg `<class 'str'>`)
* `input(text)` = displays text & returns user input
* `print(arg(s))` = prints argument (concatenates them if multiple)
* `isinstance({varialble}, {class})` = check if instance is of type class (eg `isinstance(text, str)`)

### Numbers

* `1234` = **int**eger number
* `12.34` = **float**ing-point number
* `int(text)` = convert to integer
* `float(text)` = convert to float
* `/` = floating-point division
* `//` = floor integer division
* `{n} ** {exponent}`
* `() ** * / + -` = order of operation

### Strings

Strings are list of (1-char long) strings.

* `'text'` or `"text"` = **str**ing
* `"""text{Enter}text"""` = multi-line string (outputs newlines)
* `"text/{Enter}text"` = line continuation (does not output newlines)
* `"text" + "text"` = concatenation
* `"text * {n}"` = multiply a string (number can be before/after)
* `f"{variable}"` = interpolation (using curly braces)
* `text.split()` = split
* `text.isdigit()` = True if text represents a number
* `text.join({list})` = concatenate (eg `', '.join(['a', 'b', 'c'])` gives _a, b, c_)
* `str({number})` = convert to string
* `text.strip({characters})` = trim whitespaces (or any provided characters)

### Flow

* _True_/_False_ = **bool**ean
* `~` = bitwise NOT operator
* `not {condition}`
* `if {condition}: … (elif {condition}: …) (else: …)` (if alone works as a single line as well)
* `{v1} if {condition} else {v2}` = inline ternary operator
* `[]` = False (list in a boolean context)
* `[123]` = True (list in a boolean context)
* `match {expression}: case {value}: … case _: …` = switch-case

### Collections

* `iter({collection})` = creates an iterator
* `next(iter)` = returns next iterated item
* `enumerate({collection})` = adds a counter to collection loop (eg `for i, name in enumerate({list})`)
* `{needle} in {haystack}` = find in collection (works for strings, à la C# `Contains()`)

#### Lists

Ordered & changeable collection of (hybrid, but should be used to handle homogenous) data objects.
There is no built-in arrays (but tools like **NumPy** exist).

* `[1, 'a', True]` = **list**
* `[a, b, c] = {list|tuple}` = multi assign (similar to tuple unpacking), assign multiple variables at once
* `[1, 2, 3] + [4, 5]` = concatenates lists
* `[x for x in {list} if {condition}]` = list comprehension (returns a list with items satisfying a condition)
* `list[(start):(end):(step)]` = slices into a new sublist (_start_/_end_/_step_ all optional, default to first/last/1), safely empty if range outside bounds
  * `list[::-1]` = inverts list
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

#### Set

* `{a, b, c}` = **set**

#### Dictionary

* `{a:b}` = **dict**ionary

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
