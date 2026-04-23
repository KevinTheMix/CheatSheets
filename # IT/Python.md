# Python

High-level general purpose dynamically type-checked garbage-collected programming language empasizing code readability with use of significant indentation.

## Quick Tips

* `__init__.py` = makes containing directory behave like a package (can be imported, initialized via this file), and is mandatory when using relative imports
* [PyPI](https://pypi.org) (Python Package Index) = official repository of Python packages (default for `pip`)
* There is no brackets in python, indentation matters
* Same variable can be reassigned new values of different types
* Variables can be declared in a sub-scope and be used outside (eg declared locally within `if` block & used underneath)
* On Windows, disable default aliases/redirections to Microsoft Store to avoid interferences with local install (eg in **PowerShell** & virtual environment)
  * In _Settings > Apps > Advanced app settings > App execution aliases_ > toggle off **App Installer** (for both python.exe & python3.exe)

## Glossary

* _.pyi_ file = Python type stub file, provides type information to type checkers, IDEs & tools (mirrors structure of a _.py_ file, only signatures/definitions)
* **Callable** = anything you can call with parentheses (eg `something(…)`)
* **Decorator** = any callable that takes a function/class and returns/replaces it with another function/class (ie syntactic sugar for `f = decorator(f)`)
  * Decorators with parameters (hence parentheses) are expressions evaluated immediately (with _None_ func parameter), yet **applied** later at same time argument-free would
* **Dunder** (Double under) = special reserved names with double leading & trailing underscores used to implement certain behaviors
  * Although not recommended, custom attributes can also use that format (eg for metadata-type variables like `__version__`, `__project_name__`)
* **Module** = a single file of Python code
* **Monkey Patch** = dynamic languages technique to dynamically alter runtime code (eg add a custom method to a built-in type like _str_ or modify value of _math.pi_)
* **Package** = a folder containing multiple modules
* **Poetry** = manages dependencies, virtual environments, packages (à la Docker for Python), using a single declarative _pyproject.toml_ file (replaces old _setup.py_ & _requirements.txt_)
* **Python Development Master** (PDM) = similar goal as Poerty but faster/lighter/more modern, also uses _pyproject.toml_
* **Python Enhancement Proposal** (PEP) = official design documents that define how Python works (syntax, packaging, environments, runtime, community conventions) by Python core team
* **setuptools** = legacy standard Python packaging library to build/package/install/distribute Python projects (uses a _setup.py_ config file to define included modules & required dependencies)
* **Type Hint** = hint (ie not enforced) to humans & tools about what type a variable/parameter should be
* **Virtual Environment** = standalone self-contained local install including all versioned dependencies, sourced in command prompt, prevents intereference with global install

### Frameworks

* **Anaconda** = Python, Jupyter & data science packages manager
* **Conda** = CLI tool for package & environment management on Linux/macOS/Windows
* **Django** = Python's full-fledged web framework
* **Flask** (`flask`) = lightweight "micro" web framework for small/medium application bundling only minimal essential features (routing, request handling, templating), extensible via extensions
* **Kivy** = cross-platform (one codebase for desktop & mobile, but non-native look) mobile/touch-oriented Python UI framework (uses OpenGL)
* **Miniconda** = free miniature version of Anaconda Distribution (includes only conda plus minimal dependencies)
* **PyQt** = Python bindings for Qt framework (older, widely used)
* **PySide** = Python bindings for Qt framework (more permissive license, officially supported by Qt)
* **wxPython** = Python bindings for wxWidgets

### Modules

* `import <module> (as <alias>)` = import whole module (access to member is prefixed with module name eg `<module>.<symbol>`)
* `import <module> import *` = import everything but pollutes namespace (controlled by `__all__` inside module)
  * `__all__` = list of (symbol) names a module explicitly chooses to export when using `import *` (eg `__all__ = ["<sym1>", "<sym2>"]`)
* `from <module> import <symbol(s)>` = import any symbol that exists at top level of a module (function, class, variable/constant, (sub)module, exception, annotation)
* `from .<module> import <symbol(s)>` = import a symbol in current package (requires `__init__.py` file to turn parent folder as a package)
* `from ..<module> import <symbol(s)>` = moves up one package
* `from <package>.<submodule> import <symbol(s)>`

#### Python Standard Library

Over 200 built-in modules.

* **copy** = `copy.deepcopy(…)` (deep copy compared to shallow reference copy using regular `.copy()` on instances)
* **dataclasses** = `@dataclass` automatically generates `__init__`, `__repr__`, `__eq__`
* **datetime** = **date** (eg `from datetime import datetime, timedelta`)
* **functools** = function tools
  * partial = function that creates a new function with some of original function's arguments pre‑filled
* **io**
* **logging**
  * Logging pipeline = `logger.info("…")` creates a LogRecord (> logger-level filters eg `logger.addFilter(…)` ) > Handler(s) > Filters > Formatter
  * filters = filters log records (ie what to log), and also modify them on-the-fly (eg add attributes)
  * formatters = how log messages look
    * _asctime_ = formatted timestamp (created at format time)
    * _created_ = timestamp as a float
    * _levelname_ = "INFO", "ERROR", etc.
    * _message_ = the final rendered log message
    * _msecs_ = milliseconds
    * Others = _name_, _pathname_, _lineno_, _funcName_, etc
  * handlers = where do logs go (eg console, splunk)
* **math**
  * `math.comb(n,k)` = binomial coefficient
* **re** (regular expressions)
  * `re.compile(<pattern>)` = compile a regular expression pattern into a regex object to perform matches on strings
* **os**
* **pickle**
* **platform** = get OS name
* **subprocess** = execute a shell command
* **time**
* **typing** = type-related annotations
  * Dict = provide an explicit type (ie type-hint) for dictionary variables beyond built-in `dict` type (no longer relevant since Python 3.9 that lets `dict` behave like Dict)
  * Optional = nullable type (`Optional[T]` means _T_ or _None_)
  * Union = value that can be either of two types (eg `Union[str, Path]` or `str | Path`)

#### External Packages

* **attrs** = declarative type-like class/attribute definitions without boilerplate
* **azure-storage-file** = client SDK for azure file storage
* **bleach** = HTML sanitizer that removes unsafe tags/attributes
* **certifi** = mozilla-maintained ca bundle for ssl verification
* **flask** = lightweight Python web microframework
* **flask_csv** = CSV export helper for flask routes
* **flask-restx** = Flask extension for quickly building REST apis with minimal setup & swagger docs
  * `reqparse` (_deprecated_) = request argument parsing & validating (considered legacy, use marshmallow + apispec or model-based validation with @api.expect() for new projects)
* **http.server** = basic HTTP server
* **jinja2** = template engine library used to generate text (HTML, config files, YAML, etc) dynamically using variables, logic & templates
* **krb5** = wraps Kerberos 5 C API
* **matplotlib** = create static, animated, interactive visualizations (`matplotlib.pyplot`)
* **mypy** = static (compile-time) type checker
* **NumPy** (Numerical Python) = arrays manipulation
  * `array.astype(<type>)` = cast each value in an array to another type (à la map)
* **openpyxl** = read/write Excel 2010 xlsx/xlsm/xltx/xltm files
* **oracledb** = oracle's official Python driver
* **pandas** (panel data) = open source data manipulation & analysis, especially data structures/operations for numerical tables & time series (see <https://pandas.pydata.org>)
  * **DataFrame** = 2D table, of which each column is a Series
  * **Series** = 1D labeled array (à la enhanced list with indexes & data types), supporting vectorized operations
  * `df.dropna(how='all')` = remove missing values
  * `df.iloc[start:end]` = subset splicing
  * `df.isin(collection)` = check if DataFrame has values in collection (eg `df[~df.isin([excluded_values])]`)
  * `df[column] <condition>` = creates a boolean Series (row mask) that can be applied a dataframe (eg `df[mask]`) to obtain a subset of its rows
  * `df.loc[mask]` = filters rows (same as `df[mask]`)
  * `df.loc[mask, column]` = filters rows & selects columns (returns a column if single column provided, or a DataFrame if column is a list)
  * `dg.reset_index(drop=True)`
* **plotly** = open-source interactive data visualization
* **pymongo** = official MongoDB driver
* **pyngrok** = Ngrok API
* **pyodbc** = ODBC database connectivity driver
* **requests** = standard HTTP client for python
* **riskpy** = financial utilities for risk analysts, validators, checking statistical models
* **seaborn** = statistical data visualization
* **scikit-learn** = modules for machine learning & data mining (`from sklearn import preprocessing`, see <https://scikit-learn.org>)
* **singleton** = tiny helper implementing the singleton pattern
* **SQLAlchemy** = open-source SQL toolkit & ORM
* **statistics**
* **statsmodels** = statistical computation & models (`from statsmodels.graphics.mosaicplot import mosaic`)
* **timeit** = measure performances (eg `timeit.timeit(stmt={treatment}, number={n})`)
* **tkinter** = Python built-in GUI library and binding/wrappper around Tcl/Tk
* **tzlocal** = detects system's local timezone reliably
* **winkerberos** = high-level interface to SSPI for Kerberos client auth
* **Web Server Gateway Interface** (WSGI) = server-to-application calling/forwarding convention for Python applications
* **xlsxwriter**

##### Testing

* **freezegun** = freezes time in tests to control datetime behavior
* **mockito** = mockito-style mocking framework for python
* **mongomock** = in-memory mongodb mock for tests
* **pytest** = python test runner
* **pytest-cov** = code coverage plugin for pytest

## CLI

* **python**
  * `python - <<'PY'{Enter}{code}{Enter}PY` = execute inline Python code from a Bash here-document
  * `python -c {command}` = executes inline Python code passed as a string argument to `-c`
  * `python -m {module}` = runs Python _.py_ module file as a script (eg _pip_, _venv_)
  * Eg `python -m venv {directory}` = creates a virtual environment (or `py -3.11 -m venv .venv` for a specific local Python version)
    * `source {venv}/bin/activate` (or `.\{venv}\Scripts\Activate.ps1` in PowerShell) = change prompt to virtual environment
    * `deactivate` = exit virtual environment (return to system-wide python install)
  * Eg `python -m pip install {package}`
* **python-is-python3** = small Debian/Ubuntu system package that creates a symlink for convenience
* **pip(3)** = Python (3) package manager (installed as part of Python environment)
  * `pip freeze` = list packages name & version in a key-value format, usually followed by `> {file}` (eg _requirements.txt_)
  * `pip (un)install`
    * `--upgrade-pip` = upgrades itself
    * `-e` = in editable mode
    * `-r {file}` = install from a requirements file
    * `"pandas[excel]"` = install current Excel-related stack from PyPI (pandas, openpyxl, xslxwriter)
  * `pip list` = list packages name & version in tab-separated format
* **pyinstaller** = (pre-)compile Python code (`-F` aka `--onefile` to create single file bundle exe)
  * `--icon={icon.ico}` = add custom icon to final _.exe_
  * `--noconfirm` = don't ask when overwriting _build_ & _dist_ folders
  * `--noconsole` (alias `--windowed`) = no console window appears (for GUI apps)
  * `--onefile` = bundle everything into a single _.exe_

## API

* `*` & `**` = argument unpacking operators (`*` iterable, `**` mapping/dict)
* `:=` (walrus operator) = assign & use in same expression (returns right value)
* `""" {comment} """` = function comment (as first line following under name)
* `\` = (multi-)line continuation
* Built-in variables
  * `__file__` = current script file
  * `__name__` = name of current module, varies depending on whether executed directly (ie `__main__`) or imported

* _None_ = **NoneType** (à la null)
* `pass` = no op, ie placeholder statement for contexts where a statement is required by syntax but not implemented yet (eg in a if/else block)
* `field_` = single trailing underscore avoid conflicts with reserved keyword (by convention)
* `#` = comment
* `input(text)` = displays optional prompt text & returns user input
* `print(args, sep=<separator>)` = prints argument (concatenates them using separator (default is single space) if multiple)
* `type(value)` = returns type (eg `<class 'str'>`)
* `eval(code)` = returns result of Python code string dynamically
* `callable(koko)` = True/False whether argument is callable
* `version('<package>')` = returns named version for given package

### Numbers

* `1234` = **int**eger number (or `123_456_789` as underscores are ignored)
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

### Dates

* `.strftime(<format>)` = format date as a string (eg `date.strftime("%Y%m%d")` gives _20260325_)

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
* `f"…{<expression>}…"` = interpolation (using curly braces)
* `r"…"` or `R"…"` = raw string literal (don't treat backslashes `\` as escape characters)
* `u"…"` = Unicode string literal
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
* `is` = compares identity (not equality)
* `not {condition}`
* `if <variable>` = False if _None/False/0/""/[]/{}/set()/()/range(0)_
* `if {condition}: … (elif {condition}: …) (else: …)` (if alone works as a single line as well)
* `{v1} if {condition} else {v2}` = inline ternary operator
* `match {expression}: case {value}: … case _: …` = switch-case
* `a <= n <= b` = chained inequalities
* `a == b == c == d` = chained equality
* Loops
  * `range((start), stop, (step))` = default start is 0, default step is 1

### Collections/Iterables

* `any(col)` = true if (iterable not empty and) at least one element is truthy
* `iter(col)` = get an iterator over a collection
  * `next(iterator)` = retrieve next item from iterator (eg `next(iter(dic))` first dic key)
* `len(col)` = count
* `sorted(col)` = return a new list containing all items from iterable in ascending order
  * `key=lambda item: item["<field>"` = specifies which object field to use as sorting key
  * `reverse=True|False` = reverse sort order
* `enumerate(col)` = adds a counter to collection loop (eg `for i, name in enumerate(list)`)
* `{needle} in {col}` = True/False if needle is in haystack (works for strings, à la C# `Contains()`)
* `*col` = unpacks as separate arguments (eg `print(*[1, 2, 3])` becomes `print(1, 2, 3)` which prints _1, 2, 3_)

#### Lists

Ordered & changeable collection of (hybrid, but should be used to handle homogenous) data objects.
There is no built-in arrays (but tools like **NumPy** exist).

* `[1, 'a', True]` = **list**
* `[a, b, c] = <list|tuple>` = multi assign (similar to tuple unpacking), assign multiple variables at once
* `l1 + l2` = concatenates lists (eg `[1, 2, 3] + [3, 4, 5]` gives `[1, 2, 3, 4, 5]`)
* `[{items}] * {n}` = clone items  (eg `['abc']*3` is `['abc', 'abc', 'abc']`)
* `[f(item) for item in <list> if condition]` = list comprehension, builds a new filtered & remapped subset list in memory (eg `digits = [int(c) for c in ip if c.isdigit()]` gives list of int digits from a string IP address)
* `(f(item) for item in <list> if condition)` = generator expression, builds items lazily one at a time, single throwaway use, no indexing (eg no `gen[0]`)
* `list[(start):(end):(step)]` = slices into a new sublist (_start_/_end_/_step_ all optional, default to first/last/1), safely empty if range outside bounds
  * `list[-n]` = nth-to-last element (eg `list[-1]` for last item)
  * `list[-n:]` = take last n characters
  * `list[:-n]` = don't take last n characters
  * `list[::-1]` = inverts list
* `.append(item)` = add item at the end
* `.clear()` = delete all items
* `.extend(list)` = add list to this list (in place, returns None)
* `.insert(index, item)` = insert item at index (can be negative, where _-1_ actually means second-to-last)
* `.pop((index))` = remove & return item at index (or last if not specified)
* `.remove(item)` = remove first matching item (by value)
* `.sort()` = sort a list in place
* `list(col)` = convert collection (eg generator, map, set) to list (à la `toList()`)
* `map(function, list)` = select
* `sorted(list)` = sort a list
* `sorted(list, key=<lambda>)` = sort by custom key (which can be a tuple for multi-criteria sorting, with negative values for descending order)
* `sum(list)` = built-in sum function

#### Set

Unordered collection of **unique** heterogenous elements.

* `set()` = empty set
* `{a, b, c}` = **set**
* `set(list)` = creates a set
* `set1.intersection(set2)` = intersection (ie only items in both sets)
* `set1.union(set2)` = union (ie combines multiple sets, discards any duplicates)
* `set1 | set2 | set3` = chained unions with `|` operator
* `set1 & set2` = intersection (equivalent to `set1.intersection(set2)`)
* `set(list1 + list2 + list 3)` = set formed from items of all lists (with duplicates removed)
* `frozenset(iterable)` = immutable set that cannot be modified (no add/remove/update)

#### Tuple

Ordered immutable collection of heterogenous data.
Immutability makes them non-growable, which makes it memory-effcient & fast.
Can be used as a record in place of a full-blown class object.
Returned by libraries such as SQL libraries (eg `fetchone()` & `fetchall()`).

* `(1, 'a', True)` = **tuple** (parentheses are optional eg `1, 'a', True` is also a valid tuple)
* `(1,)` (or just `1,`) = single element tuple (with mandatory comma)
* `(name, age, bow) = ("Koko", 17, "bare")` = assign multiple variables at once (**tuple unpacking**)
* `tuple[index]` = returns item at index
* `if i (not) in {…}` = checks for (not) membership

#### Dictionary

* `{}` = empty dictionary (not a set)
* `{key:value}` = **dict**ionary
* `dict(k1=v1, k2=v2, …)`
* `dic[key]` = get value (_KeyError_ if key not present)
* `if "key" in dic` = check key presence
* `for key in dic` = iteration over a dictionary defaults to iterating over its keys
* `for key, value in dic.items()` = iterates over both key & value
* `for value in dic.values()` = iterates over values
* `dic.get(key[, default])` = retrieves value at key (_None_/_default_ if key not present)
* `dic.setdefault(key, default)` = return value at key (set it first with provided default value if not exists yet)
* `dic.update({key: value})` = creates/updates value for key

### Functions

* `def koko(): …` = definition
* `def koko(): return 1,2` = functions can return (a tuple of) multiple values or objects
* `def koko(*args, **kwargs)` = function with argument unpacking operators (use eg `kwargs["key"]`)

### OOP

* **Attributes** = instance or class fields or methods
* `class Koko({Parent})` = class inheritance
* `_attribute` = naming convention meant to treat attribute as internal/non-public/for use inside that class only (not enforced whatsoever)
* `__attribute` = name mangling (ie replaced with `_classname__attribute` making it less accessible from outside, closest thing to a `private` member)
* **Magic Methods** = dunder names for commonly overriden methods (listable via `dir({class})`)
  * `__bool__(self)` = truth value of an object (ie inherent True/False value, uses `__len__` as a fallback when not explicitly defined with _0_ meaning False)
  * `__eq__(self)` = defines how two objects are equal (by vaue)
  * `__len__(self)` = defines behavior of built-in `len()` function for custom objects
  * `__init__(self, *args, **kwargs)` = constructor, within which all instance variables are declared (eg `self._koko = …`)
  * `__iter__(self)` = returns an iterator (ie an object with a `__next__(self)` method) for loops/comprehensions/etc
  * `__repr__(self)` = string representation, mainly for debugging
    * Any variable defined outside a class constructor is a class (ie static) attribute, _inherited_ by instances, which can override in a per-instance basis
* `def koko(self, {args})` = instance method, receiving instance as first argument (named _self_ by convention)
* `isinstance({variable}, {class})` = check if instance is of type class (eg `isinstance(text, str)`)
* **Method decorators** = special functions that wrap another function, applied vertically bottom to up
  * `@property def koko(self) -> …` = turns method into a property
  * `@staticmethod` = plain function placed inside class namespace, callable via either a class (`Koko.f(777)`) or an instance (`koko.f(777)`)
  * `@classmethod` = basically a static method in other languages (receives `cls` ie class itself eg `@classmethod def koko(cls): …`)
* `@ThreadSafeSingleton class Koko: def __init__(self): …` = class decorator to create a thread-safe (ie using a lock) single instance (ie singleton)
