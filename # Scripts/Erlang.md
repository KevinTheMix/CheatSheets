# [Erlang](https://www.erlang.org/)

Erlang is a functional programming language written in C, Prolog & itself and intended primarily for telecom applications & companies.
It has very high capabilities in concurrency & multi-threading and on the other hand lacks integrated support of concepts such as strings.

## Glossary

* **BIFs** (Built-In Functions) = methods defined in the built-in _erlang:_ module
* **EPMD** = Erlang Process Manager Daemon
* **ERTS** = Erlang Runtime System
* **OTP** = Open Telecom Platform
* **LYME** = Erlang's LAMP framework

## Environment

### CLI/shell

* `werl` = Windows Erlang Emulator shell. Based on Emacs text editor
* `werl -s name KOKO` = becomes distributed node via EPMD
  * `-setcookie {cookie}`
  * `connect_all false`

* `Ctrl + A` = Go to start of line
* `Ctrl + C` = Mode BREAK
* `Ctrl + E` = Go to end of line
* `Ctrl + G` = User switch command
  * `c` or `c {job}` = connect to current or given job
  * `c` or `c {job}` = kill current or given job
  * `j` = lists all jobs (_+processes créés sauf group\_leader/2 machine locale_)
  * `s` = start new ob assigned new index X
  * `r {node}` = start job on remote node
  * `q` = quit Erlang/OTP
  * `?` or `h` = help

* `b().` = display all (variable) bindings
* `c(module)`
* `c {job_number}` = connects to given shell, or current shell if no number specified
* `e(cmd)` = command _cmd_ re-eval
* `erase().` = efface tous les objets
* `exit()`
* `f()` = forget all variables (only in the shell)
  * `f(Koko)` = forget variable (only in the shell)
* `get().` = get all objects value
  * `get(aa).` = get _aa_ value
* `h` = Lists commands
* `h().` = commands history
* `halt()`
* `help().` = Displays shell functions
* `i` = Stop code but keep shell
* `j` = Lists shell instances
* `k {job_number}` = Terminate shell & code. Kills current shell if no number specified
* `li + Tab` = Displays modules matchin _li*_ (e.g. "lib", "lists")
* `lists: Tab` = Displays the methods within module lists
* `module:function()`
* `put(aa, hello)` = stores _aa_ object in process dictionary
* `q()` or `init:stop()` = Quit
* `self()` = Pid
* `v(cmd)` = command result value

* `cover:compile(module)`
* `cover:analyse(module, coverage/calls, module/line/clause)`
* `cover:start()`
* `cover:analyse_to_file(module, "file.htlm", [html])`
* `compile:file(File, Options).`
* `c:c(File).`
* `catch Expr.` -> `{'exit', {Reason, St..}}`
* `maka:all().`
* `pman:start().` = process en cours, leur registered name et leurs messages en attente et leurs Pid

### Modules

* **erlang** = Built-In Functions aka BIFs, written in C/Prolog (the _erlang:_ prefix is assumed)
  * `atom_to_list('Erlang')`
  * `list_to_atom([65,66,67])` or simply `list_to_atom("abc")`
  * `binary_to_list(Bin)`
  * `integer_to_list()`
  * `length()`
  * `hd()` = head
  * `tl()` = tail
  * `node()` = node name (eg _USER@Hote_)
  * `tuple_size({a,b,c})`
  * `element(N, Tuple)` -> nth element in a tuple
  * `date()`
  * `now()`
  * `list_to_pid("<0.0.0>")`
  * `Pid = spawn(module, function, [params])` = créé nouveau process BG
  * `register(atom, Pid)` (see also global:register_name/2)
    * Returns true or failure if (Process already registered, Pid ~~exists~~, atom already used, atom is undefined)
    * A process is not associated with a function but with a program
    * Messages get sent to PROCESSES => at the first _receive_ encountered
  * `registered()` -> list ([]) of registered process names
  * `whereis(atom)` -> `<Pid>` = lookup registered Pid
  * `is_record(Var, person)`
* [**io**](https://www.erlang.org/doc/man/io.html)
  * `format("Hello Hello\n").`
  * `format("{format_options}", [data]).` with options such as ~f (float data), ~n (newline), ~s (string syntax) or ~w (standard syntax)
* **gen_server** = client-server
  * `handle_call({request, _}, From, State) -> {reply, ok, NewState} or {noreply, NewState}`
* **et_viewer**
  * `start([])` -> {ok, Pid}
  * `get_collector_pid(Pid)` -> Pid
* **et_collector**
  * `report_event(Pid, Level, From, To, Label, Content)`
* **gen_trace**
  * `dump([Pid/Pname, Pid], "output mytace", [])` -> Pid
  * `proc_info("mytrace")` -> {[Pid, Pname], length_of_trace}
  * `Pid ! stoptracing.`
  * `show("mytrace")` -> display the content
  * `proc_select("mytrace", [Pid, Pname])` -> ok / mytrace_sel
  * `abstract(myabstract, "mytrace", [{tool, dot, "mytrace}])`

### [Preprocessor](https://www.erlang.org/doc/reference_manual/macros.html)

* Macros
  * `-define(Const, Replacement)` -> usage `?Const`
  * `-define(Fun(Var1, ...,Varn), Replacement)` -> usage `Func(Arg1, ..., Argn)`
  * `-define(TIMEOUT, 200)`  -> usage `?TIMEOUT`
  * `-define(TESTCALL(Call), io:format("Call ~s: ~w~n", [??Call, Call]))` = stringify macro arguments using `??` construction
    * Usage `?TESTCALL(myfunction(1,2))` == `io:format("Call ~s: ~w~n",["myfunction ( 1 , 2 )", myfunction(1,2)])`
    * In the format array, the first _??Call_ refers to the strinfified version of the method
    * In the format array, the second _Call_ is a literal call to the function => get its result
* Predifined Macros
  * `?MODULE` = name of current module
  * `?MODULE_STRING` = name of current module as string
  * `?FILE` = current module file name
  * `?LINE` = current line number
  * `?MACHINE` = machine name
* Macros Flow Control
  * `-ifdef(Macro)` & `-ifndef(Macro)` = if (not) defined
    * `else` = if else
    * `endif` = if end
  * `-undef(Macro)` = delete Macro
* Import/Export
  * `-module(mymodule)`
  * `-export([fun1/1, fun2/2])`
  * `-compile(export_all)`
  * `-include(File)` where included _File_ (eg _"file.hrl"_) often defines records
    * File path is absolute, or current working directory, or where the module is being compiled
  * `-include_lib(File)` = like _include_ but relative path, assuming the name of the application as path

## Language Syntax

* Each statement ends with a dot '.'
* `{statement}.{trailing_whitespace}` = executes statement
  * eg `1 + 2.`
* Statements can be separated by commas, in which case only the last one is shown
  * eg `[s1],[s2],[s3].` = Executes all statements, show last one only
* Variables & Assignment
  * Variables names are Capitalized
  * `A = B` = Since A is unbound, assigns the value of B to A. Then proceed with '=' operator as usual since both operands now match
  * `A = B = 123`
  * `1 = 1` = Returns the value if they're the same.
  * `1 = 2` = Error.
  * `Koko = koko_module.`
  * `Koko = koko_function().` eg `Koko = fun(X) -> 2*X end.` puis `Koko(2)`

* `_` is used as wildcard for pattern matching when the value is dismissible/irrelevant
* `_abc` for _named_ dismissble values (useful to indicate parameter name, even though it is unused)

### Bits, Booleans & Comparisons

Booleans are actually (_true/false_) atoms, not numerical values

* `bnot, band, bor, bxor, bsl, bsr`
  * eg `Bit0 = Num band 1` = last bit of a number
* `binary_to_list(Bin)`
* `size(Bin)`

* `and, or, xor, not`
* `andalso, orelse` to short-circuit right-side expression
* `if {condition} -> true; true -> false end`
  * there is no _else_; instead the `true ->` matches all remaining cases (à la _switch_'s _default_ case)
* `case f(x) of true -> 1; false -> 2 end`

* Comparisons
  * Variables of different types can be compared e.g. numbers & booleans (useful for ordering/sorting)
    * When ordering, the precedence is well-defined as **number < atom < reference < fun < port < pid < tuple < list < but string**
  * `=:=` = Exact equality.
  * `=/=` = Exact inequality.
  * `==` = Like `=:=` but more relaxed comparison (5 == 5.0 is true)
  * `/=` = Like `=/=` but more relaxed comparison (5 /= 5.0 is false)
  * `> < >= =<` = Note the last one is not "<=" like in other languages

### Numeric

* `10`
* `-234`
* `10.0`
* `base#value` where _base_ is in range 2..36 (eg `16#789ABC`)
* Operations
  * `+ - * /`
  * `a div b` = integer division
  * `a rem b` = integer remainder
  * `[base]#a`
  * `()` = Grouping.
* `round(Float)`
* `random:uniform().`
  * `{A1,A2,A3} = now(), random:seed(A1,A2,A3).` = use current time as seed

### Strings

* `length(Str)`
* `Str = "abcde".` where "…" is actually a **list** of ASCII integers (eg `"abcd"` is coded as `[97,98,99,100]`)
* `$A` = 65

### Atoms

Atoms are literals, aka constants whose only value is their own name.

* `atom` or `atom_atom@erlang` made of alphanumeric, underscore and '@' only valid characters
* `'Atom'` = enclose within `''` all atoms comprising characters other than alphanumerics, '_' and '@'
* `'atom'` = same as `atom` (=> `atom = 'atom'` works and `'atom' = atom` works too)

### Tuples

Tuples (& lists) can be used for pattern matching.

* `Point = {1,2}`
* `{A,B} = {1,2}`
* `{A,B} = Point`
* `{A,B,C} = Point` = Exception
* `{A,_} = Point` = Wildcard & discard seconds element
* `{a,_}` = Matchs all tuples starting with atom 'a'
* `{a,_} = {b,_}` = Exception
* `{a,A}` = Tagged tuple
* `{A,{B,C}}` = nested
* `erlang:element(N, Tuple)`

### [Lists](https://www.erlang.org/doc/man/lists.html)

It is important to attach new elements to the beginning of the list rather than the end (potentially concluding with a `reverse()` to properly order), so new Lists don't keep getting created (à la using StringBuilder instead of string in C#). See [Creating a List](https://www.erlang.org/doc/efficiency_guide/listhandling#creating-a-list)

* `[]`
* `[1,2,3]`
* `[65,66,67]` = "ABC" because strings are actually lists in Erlang
* `[H|T]` = concatenate a head and a list tail
  * eg `[1|[2,3,4]]` = `[1,2,3,4]`
* `[H|T] = L` = separates numerical Head from list Tail
  * eg `[H|T] = [1,2,3,4]` => H = 1 & T = `[2,3,4]`
* `[H|T]` is then =:= `[1,2,3,4]` => we can assign it again transitively
* [List Comprehensions](https://www.erlang.org/doc/programming_examples/list_comprehensions.html)
  * `[X || X <- [1, 2, 2, 3, 4], X > 3]` -> `[4]`
  * `[X || X <- […], is_integer(X), X > 3]` -> `[4]` with additional filter
  * `[{X,Y} || X <- […], Y <- […]]`
  * [Quick Sort example](https://www.erlang.org/doc/programming_examples/list_comprehensions.html#quick-sort)

* Operations
  * `[L1++L2]` = concatenate two lists into a **new list**
    * eg `[1,2] ++ [3,4]` -> `[1,2,3,4]`
    * eg `[a]++[]++[1]` -> `[a,1]`
  * `[L1--L2]` = remove items (eg `[1,2,3,4] -- [1,4] = [2,3]`)
  * ++ and -- are **right**-associative (they're read right-to-left)
    * eg `[1,2,3] -- [1,2] -- [3]` -> `[3]` (not `[]`)
* **erlang** BIFs
  * `length(List)`
  * `hd(List)` -> head (eg `hd([1,2,3])` -> `1`), similar to `[H|_] = List`
  * `tl(List)` -> tail (eg `tl([1,2,3])` -> `[2,3]`), similar to `[_|T] = List`
  * `list_to_atom(Koko)` = converts eg `"abcd"` to `abcd`
* **lists** module methods
  * `all(Pred, List)` = true/false if predicate function returns true for all elements
  * `any(Pred, List)` = true/false if predicate function returns true for at least one element
  * `append(A, B)` = equivalent to `A ++ B`
  * `append([A, B, C])` = concatenates sublists into a flat list
  * `concat(List)` (where _List_ is a list of atom, int, float, string) = concatenates the string representation of elements
  * `delete(elem, List)` = returns a copy of the list with its first encountered elem (if found) absent
  * `duplicate(N, Elem)`
  * `filter(Fun, List).`
  * `foldl(F, Accu, List)` = aggregate
  * `foreach(Fun, List)`
  * `last(List)`
  * `map(fun(Args) -> ... end, List)`
  * `mapfoldl(Fun, Acc, List)` = combines _map_ + _foldl_ in one pass
  * `member(elem, List)` -> true/false (à la C# `Contains()`)
  * `nth(Position, List)` = returns nth element in List
  * `reverse(List)`
  * `seq(1, 100).` = generates list of 100 integers
  * `sort(List)`
  * `sum(List)`
  * `zip(L1,L2)` = zips two lists of equal length into one list of two-tuples
  * `unzip(List)` & `unzip3(List)` = unzips a list of two/three -tuples into two/three lists

  * List of tuples (ie dictionary-like)
    * These methods locate tuples by a _key_, which is actually any value used to match a lookup field, specified by its _position_ within the tuples
    * `keymember(Key, Position, List)`
    * `keydelete(Key, Position, List)`
    * `keysearch(Key, Position, List)` -> `{value, found_tuple}` = return the tuple by its key
      * List can be process_info(Pid), which then returns a tuple with the process name `{value, { _, process_name }}`

### Functions

Function overloads are refered to by their number of arguments eg _koko()/2_

Functions can be defined on-the-fly (à la anonymous) eg `fun() -> result end`

* `Fun = fun(Var) -> ... end.`
* `fac(0) -> 1; fac(N) when N>0 -> N*fac(N-1).`
* `math:pow(a, n).`
* ``

### [Records](https://www.erlang.org/doc/reference_manual/records.html)

Structure translated to a **tuple** at compilation.

* `-record(person, {name[=value], phone[=value], address[=value]})` = definition
  * Record & field names must be atoms
  * Definition comes before use
  * Default values are optional (_undefined_ is used if not ment.)
* `#person { name=expr1, phone=expr2, _=expr3 }` = creation (aka instantiation)
  * Fields in any order
  * Fields are optional
  * if a `_` value is provided, it matches **all** omitted (ie not explicitely defined) fields instead of the default value provided at the record definition
* `#person.name` (without variable) -> position du field dans le record
* `Var#person.name` = evaluate the field of a record variable
* `is_record(Var, person)` -> true if Var is of type koko
  * `func(Var) when is_record(Var, person) -> a_person; func(_) -> not_a_person.`
* A record is represented as a tuple of size fields# + 1 (+1 accounts for the record name)
  * eg `-record(person, {name, phone, address}).` == `{person, X, Y, Z}`
* `record_info(fields, Var)` -> list of names of the fields
* `record_info(size, Var)` -> size (fields# + 1)

### Messages

* Send = `Pid ! {MessageA, tuple}`
* Receive = `receive MessageA -> doA(); messageB -> doB() end`
  * Receive with timeout = `receive Message -> do() after {milliseconds} -> handle() end`

## [Quickcheck](http://www.quviq.com/products/erlang-quickcheck/)

Records containing generators are themselves generators -> sample pick

* `include("eqc.hrl")`

* `?FORALL(X, Gen(), Prop)`
* `?IMPLIES(Pre, Prop)` where Pre is boolean -> X's = skipped
* `?WHENFAIL(Action, Prop`
* `?LET(N, int(), return(N*N))` => `N = int(), N*N`
* `?SIZED(N, resize(8*N, G))`
* `?SIZED(Size, choose(0, Size*2))`
* `?SUCHTHAT(X,G,P)` -> generate X from G with P true
* `?SUCHTHATMAYBE(X,G,P)` -> `{value, X}` or `false`
* **eqc** module methods (`-include_lib("eqc/include/eqc.hrl")`)
  * `fails(Prop)`
  * `quickcheck(Prop)`
  * `collect(Term, Prop)` = display Term at each passing test
* **eqc_gen** module methods
  * `int()`
  * `list()`
  * `oneof([…])`
  * `oneof([G, int])` where int is itself a generator -> basic types **or** G
  * `elements([…])`
  * `choose()`
  * `bool()`
  * `char()`
  * `real()`
  * `sample(G)`
  * `pick(G)` = `pick(G, 10)`
* **eqc_statem** (`-include("eqc_statem.hrl")`, `-include_lib("eqc/include/eqc_statem.hrl")` and `-behaviour(eqc_statem)`)
  * `initial_state()`
  * `command(S)`
  * `command(Mod)` -> `[Cmds]`
  * `run_commands(Mod, Cmds)` -> `{H, S, Res}`
  * `precondition(S, {call, Mod, Fun, [Params]})`
  * `next_state(S, V, {call, Mod, Fun, [Params]})`

  (_Handwritten documentation from small cahier in 2008.05.06_)

## TODO

(Page 20)
