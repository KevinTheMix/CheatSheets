# C++

## Quick Tips

* [MIT - Practical Programming in C](https://ocw.mit.edu/courses/6-087-practical-programming-in-c-january-iap-2010)
* [MIT - Introduction to C++](https://ocw.mit.edu/courses/6-096-introduction-to-c-january-iap-2011)

## Glossary

* [Sequence container](https://en.wikipedia.org/wiki/Sequence_container_(C%2B%2B))
  * **Array** = compile-time fixed size
  * **Vector** = can resize upon appending elements
* [Unions](https://www.tutorialspoint.com/cprogramming/c_unions.htm) = _struct_-like data type with mutually exclusive (potentially hybrid types) members sharing the same memory location
  * It occupes as much memory as its largest member, and gets overriden every time one of its members get assigned

### Keywords

* `friend` = in a class, grants an another class/external function access to private/protected members
* `static` = in a (non-class) function, defines a variable whose lifetime extends until the end of the program, whose values carries over subsequent calls, and that gets initialized only once
* `virtual` = makes function child-overridable, actual function to be called is determined at runtime based on objet instance (dynamic) type
  * In C++, `virtual` avoids the multiple inheritance [dreaded diamond](https://www.cs.technion.ac.il/users/yechiel/c++-faq/mi-diamond.html)

## API

* `0123` = octal number
* `0x12` = hexadecimal number
* `sizeof(variable)` = returns the number of bytes occupied by variable
* `cin >> koko` = read input
* `cin.get()` = pause a console program until a key is pressed (à la C#'s `Console.ReadKey()`)

## Extensions

* [Borland C++ (5.02)](https://archive.org/details/BorlandC5.02) = C/C++ IDE (_discontinued_ in 1997)
* **Borland C++ Builder** = C/C++ IDE (continuation of Borland C++, _$415_ trialware)
* **Borland C++ Compiler** = C++ CLI compiler & binder (based on Builder)
* **Code::Blocks** = C/C++ IDE very extensible via plugins
* [CppDoc](https://download.cnet.com/CppDoc/3000-2383_4-10055397.html) = C++ HTML documentation generator (_discontinued_)
* **LCC** = C Compiler
