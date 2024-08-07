# [Elixir](https://en.wikipedia.org/wiki/Elixir_(programming_language))

Dynamic functional general-purpose programming language (designed by Brazilian _José Valim_) that runs on Erlang BEAM virtual machine.
Possesses the same qualities as Erlang: concurrency & communication, scalability, failure management.

## Glossary

* **Immutability** = in Elixir, data is immutable, which means, a memory location once allocated is never subsequently updated
  * Therefore, something that points to the same place will always keeps the same value.
  * Note that unlike in Erlang or Haskell where reassigning (or rather pattern-matching) existing variables raises an error, variables in Elixir **can** be _rebound_ to a new value.
  * That characteristic makes data reuse super safe, especially in a concurrent setting
  * It also makes memory usage more efficient, since multiple parts of an application can use a single piece data, staving off duplication.
  * E.g. the compositional nature of lists (data structure), that can chain existing sublists in order to make new combined ones.
* **Plataformatec** = Elixir's company (José Valim)
* **Phoenix** = Elixir's web framework

## API

* `=` = actually not an assignation, but a pattern matching operation, if the left side is a variable that currently contains no value, it will indeed get assigned
* `_` # Disregard the corresponding pattern matched value. Is actually a (forever unbound) variable.

* `i(nspect)` = displays type information
* `div()`
* `rem()`
* `IO.puts()` = displays the string value of the parameter
* `byte_size()` = gives memory space allocation

* For numbers, there is actually no limit to the size of numbers (other than the system memory)

### Atoms

Similar to Ruby's Symbols.
In C#, the closest thing is an Enum, and/or the nameof() construct, where the name of the _constant_ is also its value.
Atoms are used in pattern matching, and are very memory efficient.
For instance atom comparison doesn't compare their actual name, but their index number in the table where they're stored (similar to Enums).

* `:koko`
* `:"koko kontan"`
* `:true` = Elixir uses atoms for boolean types (note: `true` is valid as well, and is still actually an atom, thanks to synctactic sugar)
* `:nil` (aka `nil`) = akin to :false when in conditions (eg short-circuit `nil || false || expression` returns `expression`)

### Strings

Unicode strings are supported natively e.g. `byte_size("€")` returns 3, while `byte_size("$")` returns 1.
Strings are actually binaries e.g. `"€" <> <<0>>` returns `<<226, 130, 172, 0>>`.

* `<<65, 66, 67>>` = binary data representing "ABC"
* `<<0>>` = String termination character
* `"Hello" <> "koko"` = String concatenation
* `"Hello #{koko} ~"` = String interpolation
* `String.length()`

### Tuples

Tuples are ordered collections of associated (but hybrid) values, frequently returned together, enabling pattern-matching.
E.g. the function that reads file returns either `{:ok, content}` or `{:error, reason}`.

* `elem(tuple, i)` = gets the (0-based) _i_th value in a tuple.
* `put_elem(tuple, i, new_value)` creates a new updated tuple with the _i_th value replaced. The original tuple is left untouched.

### Lists

Lists are implemented as Single-Linked lists data structures, i.e. one-way link forward => earlier elements are faster to get than latter ones due to traversal.
Working with lists rely heavily on manipulation their head & tail.

Adding a new head for instance is a very fast operation since a new list is created with that head, and a pointer to the old list.
Note that in that example, the new list doesn't contain all the individual elements of the old list, just a pointer to it as its second element.
This type of list composition is guaranteed to lead to no adversarial side-effects thanks to data immutability: the old list will never change, so we'll be able to keep pointing to it safely.

* `[]` = empty list
* `l = [1,2,3]` then `[:ok, 1, "koko", l]` == `[:ok, 1, "koko", [1, 2, 3]]`
* `hd([1,2,3])` == `1`
* `tl([1,2,3])` == `[2,3]`
* `[1 | [2,3]]` == `[1,2,3]`
* `[a,b,c] = [1,2,3]`
* `[head | tail] = [1,2,3]` == `head = 1` and `tail = [2,3]`
* `options = [{:a, true}, {:b, true}, {:c, false}]` = keyword list aka a list of (atomkey/value) tuples
* `options[:c]` == false

* `List.insert_at([1,2,3], 4, 3)` == `[1,2,3,4]`

## Extensions

* **Phoenix** = Elixir's web framework
