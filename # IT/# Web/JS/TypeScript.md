# TypeScript

Superset of JavaScript, transpiled to JavaScript by **tsc** TypeScript compiler.
Can use all of JS features, and adds a layer of OO classes, static typing, casting, etc.

## Quick Tips

[Understanding TypeScript compilation & tsconfig.json](https://medium.com/jspoint/4cb15f7244bc)

## Glossary

* **Abstract Syntax Tree** (AST) = tree‑shaped data structure that represents code after parsing but before type‑checking or emitting JS
* **Emitting** = producing JS during/after compilation
* **Intersection Type** = value being both A and B (eg `any & Date` or `type AB = {a:'koko'} & {b:123}`)
* **Union Type** = value being either A or B (eg `type hybridType = string | number` or reassigning a variable `let x; x = 1; x = 'koko';` now both string & number)

## Environment

* _.d.ts_ = declaration file, containing type information only (à la C++ _.h_ header file)
* _tsconfig.json_ = a [JSON5](https://json5.org) configuration file used by TypeScript compiler to determine which/where files to compile
  * **files** = manual list of exact files to include (no globs)
  * **include**/**exclude** = set of glob patterns (ie pattern matching format using wildcards) telling which files to consider/ignore
    * `?` = one character
    * `*` = multiple characters
    * `**` = traverses multiple layers of directory hierarchy (note: directory path is treated as all-including glob eg `./src/` equals `src/**/*`)
  * **compilerOptions** = all actual TypeScript compiler settings

## CLI

* `tsc` = TypeScript compiler CLI
  * `<file.ts>` = compile a single file (ignores _tsconfig.json_)
  * `-w` = watch mode
  * `--noEmit` = don't compile (ie no JS output), type-check only (ie statically analyze project code)

## API

* [TypeScript Variable Declaration](https://www.typescriptlang.org/docs/handbook/variable-declarations.html)
* OO `class Child extends Parent { ... }`
