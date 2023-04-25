# C++

* [Array vs Vector](https://en.wikipedia.org/wiki/Sequence_container_(C%2B%2B))
  * Array is compile-time fixed size
  * Vector can resize upon appending elements
* [Unions](https://www.tutorialspoint.com/cprogramming/c_unions.htm) = _struct_-like data type with mutually exclusive members (of potentially hybrid types)
  * It's actually a memory location that gets overriden every time one of its members get assigned
  * It occupes as much memory as its largest member
* `sizeof(variable)` = returns the number of bytes occupied by variable
* 0123 = octal number
* 0x12 = hexadecimal number
* `friend` = in a class, grants an another class/external function access to private/protected members

## I/O

```C++
int koko;
cin >> koko

cin.get();  // Similar to C#'s Console.ReadKey() to pause a conosle program until a key is pressed.
```
