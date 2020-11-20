# [Elixir](https://en.wikipedia.org/wiki/Elixir_(programming_language))

Dynamic functional general-purpose programming language that runs on Erlang BEAM virtual machine.
Possesses the same qualities as Erlang: concurrency & communication, scalability, failure management.

## Immutability

In Elixir, data is immutable, which means it is never updated, but rather duplicated.
That enforces the fact that existing data never gets altered, and when changes are requested, a new copy is made.

That feature enables peace of mind for concurrency...
Makes data reuse super safe, and therefore memory usage super efficient, since it is safely reusable (e.g. the compositional nature of list data structures).

## Environment

### Installation

TODO.

## Syntax

### Pattern Matching

=	# Actually not an assignation, but a pattern matching operation!
	# If the left side is a variable that currently contains no value, it will indeed get assigned.
_ 	# Disregard the corresponding pattern matched value. Is actually a (forever unbound) variable.

### API

i(nspect) 	# Displays type information
div()
rem()
IO.puts() 	# Displays the string value of the parameter
byte_size()	# Gives memory space allocation

### Numbers

There is actually no limit to the size of numbers (other than the system memory).

+ - * /
123
1_000_000_000
0xff
0b111

### Atoms

Similar to Ruby's Symbols.
In C#, the closest thing is an Enum, and/or the nameof() construct, where the name of the _constant_ is also its value.
Atoms are used in pattern matching, and are very memory efficient.
For instance atom comparison doesn't compare their actual name, but their index number in the table where they're stored (similar to Enums).

:koko
:"koko kontan"
:true 	# Elixir uses atoms for boolean types
false 	# Valid as well, and is still actually an atom, thanks to synctactic sugar
:nil	# Akin to :false when in condition e.g. short-circuit `nil || false || expression` returns `expression`
nil 	# aka :nil

### Strings

Unicode strings are supported natively e.g. `byte_size("€")` returns 3, while `byte_size("$")` returns 1.
Strings are actually binaries e.g. `"€" <> <<0>>` returns `<<226, 130, 172, 0>>`.

```Elixir
<<65, 66, 67>>		# Binary data
<<0>>				# String termination character
"Hello" <> "koko"	# String concatenation
"Hello #{koko} ~"	# String interpolation
String.length()
```

### Tuples

Tuples are a set of associated values passed together, and are frequently used in functions and pattern-matching.
E.g. the function that reads file returns either `{:ok, content}` or `{:error, reason}`.

elem(tuple, i)	# Gets the (0-based) _i_th value in a tuple.
put_elem(tuple, i, new_value)	# Creates a new updated tuple with the _i_th value replaced. The original tuple is left untouched.

### Lists

Lists are implemented as Single-Linked lists data structures, i.e. one-way link forward => earlier elements are faster to get than latter ones due to traversal.
Working with lists rely heavily on manipulation their head & tail.

Adding a new head for instance is a very fast operation since a new list is created with that head, and a pointer to the old list.
Note that in that example, the new list doesn't contain all the individual elements of the old list, just a pointer to it as its second element.
This type of list composition is guaranteed to lead to no adversarial side-effects thanks to data immutability: the old list will never change, so we'll be able to keep pointing to it safely.

```Elixir
[]				# Empty list
l = [1,2,3]
[:ok, 1, "koko", l]	# [:ok, 1, "koko", [1, 2, 3]]
hd([1,2,3])		# 1
tl([1,2,3])		# [2,3]
[1 | [2,3]]		# [1,2,3]
[a,b,c] = [1,2,3]
[head | tail] = [1,2,3]	# 1 and [2,3]
options = [{:a, true}, {:b, true}, {:c, false}]	# Keyword list aka a list of (atomkey/value) tuples.
options[:c]	# false

List.insert_at([1,2,3], 4, 3)	# [1,2,3,4]
```

## EOF
