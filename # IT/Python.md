# Python

## Quick Tips

* [PyPI](https://pypi.org) = packages
* There is no brackets in python, indentation matters
* Variables can be declared in a sub-scope and be used outside (eg declared locally within `if` block & used underneath)
* On Windows, disable default aliases/redirections to Microsoft Store to avoid interferences with local install (eg in **PowerShell** & virtual environment)
  * In _Settings > Apps > Advanced app settings > App execution aliases_ > toggle off **App Installer** (for both python.exe & python3.exe)

## Glossary

* **Django** = Python's full-fledged web framework
* **Dunder Method** (Double Under) or **Magic Methods** = built-in methods starting with double leading & trailing underscores
  * Commonly overriden (eg `__init__`), listable via `dir({class})`
* **Flask** = light & extensible web framework (`flask`)
* **Kivy** = cross-platform (one codebase for desktop & mobile, but non-native look) mobile/touch-oriented Python UI framework (uses OpenGL)
* **PyPI** (Python Package Index) = official repository of Python packages (default for `pip`)
* **PyQt** = Python bindings for Qt framework (older, widely used)
* **PySide** = Python bindings for Qt framework (more permissive license, officially supported by Qt)
* **Tkinter** = Python built-in GUI library and binding/wrappper around Tcl/Tk
* **Virtual Environment** = standalone self-contained local install including all versioned dependencies, sourced in command prompt, prevents intereference with global install
* **Web Server Gateway Interface** (WSGI) = server-to-application calling/forwarding convention for Python applications
* **wxPython** = Python bindings for wxWidgets

## CLI

* **python**
  * `python - <<'PY'{Enter}{code}{Enter}PY` = execute inline Python code from a Bash here-document
  * `python -c {command}` = executes inline Python code passed as a string argument to `-c`
  * `python -m {module}` = runs Python _.py_ module file as a script (eg _pip_, _venv_)
  * Eg `python -m venv {directory}` = creates a virtual environment
    * `source {venv}/bin/activate` (or `.\{venv}\Scripts\Activate.ps1` in PowerShell) = change prompt to virtual environment
    * `deactivate` = exit virtual environment (return to system-wide python install)
  * Eg `python -m pip install {package}`
* **python-is-python3** = small Debian/Ubuntu system package that creates a symlink for convenience
* **pip(3)** = Python (3) package manager (installed as part of Python environment)
  * `pip freeze > {file}` (eg _requirements.txt_) = list every package currently importable/usable into a requirements file (one package per line)
  * `pip (un)install`
    * `--upgrade-pip` = upgrades itself
    * `-r {file}` = install from a requirements file
    * `"pandas[excel]"` = install current Excel-related stack from PyPI (pandas, openpyxl, xslxwriter)
* **pyinstaller** = (pre-)compile Python code (`-F` aka `--onefile` to create single file bundle exe)
  * `--icon={icon.ico}` = add custom icon to final _.exe_
  * `--noconfirm` = don't ask when overwriting _build_ & _dist_ folders
  * `--noconsole` (alias `--windowed`) = no console window appears (for GUI apps)
  * `--onefile` = bundle everything into a single _.exe_

## API

* `:=` (walrus operator) = assign & use in same expression (returns right value)
* `""" {comment} """` = function comment (as first line following under name)
* `\` = (multi-)line continuation
* Built-in variables
  * `__file__` = current script file
  * `__name__` = name of current module, varies depending on whether executed directly (ie `__main__`) or imported

* _None_ = **NoneType** (à la null)
* `pass` = no op, ie placeholder statement for contexts where a statement is required by syntax but not implemented yet (eg in a if/else block)
* `_field` = meant informatively that an attribute/method is intended for use inside that class only
* `field_` = single trailing underscore avoid conflicts with reserved keyword (by convention)
* `__field` = name mangling (ie replaced with `_classname__field`)
* `#` = comment
* `input(text)` = displays optional prompt text & returns user input
* `print(arg(s))` = prints argument (concatenates them if multiple)
* `type(value)` = returns type (eg `<class 'str'>`)
* `eval(code)` = returns result of Python code string dynamically

### Numbers

* `1234` = **int**eger number
* `12.34` = **float**ing-point number
* `int(text, {base})` = convert to integer (in optional base)
* `float(text)` = convert to float
* `/` = floating-point division
* `//` = floor integer division (result is still a float, just rounded down)
* `{n} ** {exponent}`
* `() ** * / + -` = order of operation
* `abs(n)` = absolute value
* `bin(n)` = binary
* `hex(n)` = hexadecimal
* `oct(n)` = octal
* `round(n, digits)`

### Strings

Strings are list of (1-char long) strings.

* `chr(integer)` = converts integer into corresponding ASCII character
* `ord(char)` = returns a single char Unicode index
* `'text'` or `"text"` = **str**ing
* `"""text{Enter}text"""` = multi-line string (outputs newlines)
* `"text/{Enter}text"` = line continuation (does not output newlines)
* `"text" + "text"` = concatenation
* `"text * {n}"` = multiply a string (number can be before/after)
* `str({n})` = convert to string
* `f"{variable}"` = interpolation (using curly braces)
* `{separator}.join({list})` = concatenate (eg `', '.join(['a', 'b', 'c'])` gives _a, b, c_)
* `"{pattern}".format({n})` = format using pattern (eg _:10.4f_ for float or _:02X_ for hexadecimal)
* `.count({needle})` = number of occurences of needles in string
* `.isalpha()` = True if text represents text
* `.isdigit()` = True if text represents a number
* `.replace(from,to(,max))` = replace all (or max) occurrences of a substring wit another
* `.split(({separator}))` = split (default separator is whitespace chars)
* `.strip({characters})` = trim whitespaces (or any provided characters)
* `.translate(translation_table)` = replace multiple characters in a string using a translation table
  * `str.maketrans({dic})` = creates a translation table from a dictionary (eg `{'o': 'O', 't': 'T'}`)
* `.lower()`
* `.upper()`

### Flow

* _True_/_False_ = **bool**ean
  * `[]` = False (list in a boolean context)
  * `[123]` = True (list in a boolean context)
* `~` = bitwise NOT operator
* `not {condition}`
* `if {condition}: … (elif {condition}: …) (else: …)` (if alone works as a single line as well)
* `{v1} if {condition} else {v2}` = inline ternary operator
* `match {expression}: case {value}: … case _: …` = switch-case
* `a <= n <= b` = chained inequalities
* `a == b == c == d` = chained equality
* Loops
  * `range(start, stop, step)` = default start is 0, default step is 1

### Collections

* `iter({collection})` = get an iterator for the dictionary
* `next(iterator)` = retrieve next item from iterator (eg `next(iter(dic))` first dic key)
* `enumerate({collection})` = adds a counter to collection loop (eg `for i, name in enumerate({list})`)
* `{needle} in {haystack}` = find in collection (works for strings, à la C# `Contains()`)
* `print(*t)` = print space-separated items

#### Lists

Ordered & changeable collection of (hybrid, but should be used to handle homogenous) data objects.
There is no built-in arrays (but tools like **NumPy** exist).

* `[1, 'a', True]` = **list**
* `[a, b, c] = {list|tuple}` = multi assign (similar to tuple unpacking), assign multiple variables at once
* `[1, 2, 3] + [4, 5]` = concatenates lists
* `[{items}] * {n}` = clone items  (eg `['abc']*3` is `['abc', 'abc', 'abc']`)
* `[x for x in {list} if {condition}]` = list comprehension (returns a list with items satisfying a condition)
* `[f(one) for one in list if condition]` = remap a subset of a list (eg `digits = [int(ch) for ch in ip if ch.isdigit()]` gives list of int digits from a string IP address)
* `list[(start):(end):(step)]` = slices into a new sublist (_start_/_end_/_step_ all optional, default to first/last/1), safely empty if range outside bounds
  * `list[-{n}]` = nth-to-last element (eg `list[-1]` for last item)
  * `list[:-1]` = don't take last character
  * `list[::-1]` = inverts list
* `.append(item)` = add item at the end
* `.clear()` = delete all items
* `.extend(list)` = add list to this list (in place, returns None)
* `.insert(index, item)` = insert item at index (can be negative, where _-1_ actually means second-to-last)
* `.pop((index))` = remove & return item at index (or last if not specified)
* `.remove(item)` = remove first matching item (by value)
* `.sort()` = sort a list in place
* `list(map)` = convert to list (à la `toList()`)
* `map(function, list)` = select
* `sorted(list)` = sort a list
* `sorted(list, key={lambda})` = sort by custom key (which can be a tuple for multi-criteria sorting, with negative values for descending order)

#### Set

Unordered collection **unique** heterogenous elements.

* `{a, b, c}` = **set**

#### Dictionary

* `{a:b}` = **dict**ionary
* `.get({key}, {default})` = retrieves value at key, or default if not found

#### Tuple

Ordered collection of immutable heterogenous data.
Immutability makes them non-growable, which makes it memory-effcient & fast.
Can be used as a record in place of a full-blown class object.
Returned by libraries such as SQL libraries (eg `fetchone()` & `fetchall()`).

* `(1, 'a', True)` = **tuple**
* `1, 'a', True` = also a valid tuple (parentheses are optional)
* `(1,)` (or just `1,`) = single element tuple (with mandatory comma)
* `(name, age, bow) = ("Koko", 17, "bare")` = tuple unpacking, assign multiple variables at once
* `tuple[index]` = returns item at index
* `if i (not) in {tuple}` = checks for (not) membership

### Functions

* `def koko():  {body}` = definition

### OOP

* `class Koko({Parent})` = class inheritance
* `__init__(self, {args})` = constructor
* `def koko(self, {args})` = instance method, receiving instance as first argument (named _self_ by convention)
* `isinstance({varialble}, {class})` = check if instance is of type class (eg `isinstance(text, str)`)

### Built-ins

* **datetime** (eg `from datetime import datetime, timedelta`)
* **io**
* **math**
  * `math.comb(n,k)` = binomial coefficient
* **re** (regular expressions)
* **os**
* **pickle**
* **platform** = get OS name
* **subprocess** = execute a shell command
* **time**

### Libraries

* **http.server** = basic HTTP server
* **krb5** = wraps Kerberos 5 C API
* **matplotlib** = create static, animated, interactive visualizations (`matplotlib.pyplot`)
* **NumPy** (Numerical Python) = arrays manipulation
* **openpyxl** = read/write Excel 2010 xlsx/xlsm/xltx/xltm files
* **pandas** (panel data) = open source data manipulation & analysis, especially data structures/operations for numerical tables & time series (see <https://pandas.pydata.org>)
  * `df.dropna(how='all')` = remove missing values
  * `df.iloc[start:end]` = subset splicing
  * `df.isin({collection})` = check if DataFrame has values in collection (eg `df[~df.isin([excluded_values])]`)
  * `dg.reset_index(drop=True)`
* **plotly** = open-source interactive data visualization
* **pyngrok** = Ngrok API
* **seaborn** = statistical data visualization
* **scikit-learn** = modules for machine learning & data mining (`from sklearn import preprocessing`, see <https://scikit-learn.org>)
* **SQLAlchemy** = SQL toolkit & ORM
* **statistics**
* **statsmodels** = statistical computation & models (`from statsmodels.graphics.mosaicplot import mosaic`)
* **timeit** = measure performances (eg `timeit.timeit(stmt={treatment}, number={n})`)
* **winkerberos** = high-level interface to SSPI for Kerberos client auth
* **xlsxwriter**
