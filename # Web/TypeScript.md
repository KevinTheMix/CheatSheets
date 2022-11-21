# TypeScript

Superset of JavaScript, transpiled to JavaScript by **tsc** the TypeScript compiler.

## tsconfig.json

A [JSON5](https://json5.org/) configuration file the TypeScript compiler uses to determine which & where files to compile.

* _tsconfig.json_
  * `files`
  * `include`
  * `exclude`
  * `compilerOptions`

### Root-level Options

`include` & `exclude` use glob pattern.
Wild cards:

* `?` = one character
* `*` = multiple characters
* `**` = traverses multiple layers of directory hierarchy

Shorthands:

* `.ts` suffix can be ignored => `src/**/*` == `src/**/*.ts` + `src/**/*.d.ts`
* directory path treated as glob => `./src/` == `src/**/*`

### Compiler Options

[TODO](https://medium.com/jspoint/typescript-compilation-the-typescript-compiler-4cb15f7244bc#d276)
