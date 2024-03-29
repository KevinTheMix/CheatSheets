# Kotlin

Google preferred language for Android app developers since 2019 (replacing Java), designed & developed by JetBrains.

Compiles to JVM, or JavaScript for IOS support.

## Glossary

* [Activity](https://developer.android.com/reference/kotlin/android/app/Activity)
* **Gradle** = build automation tool supporting Java, Kotlin, C/C++ & JavaScript

## API

[Basic Syntax](https://kotlinlang.org/docs/basic-syntax.html)

## Types

Obtain a variable's type as String using reflection:

* `kokoVar::class.simpleName`
* `kokoVar::class.qualifiedName`

<https://stackoverflow.com/a/45165263>

### Ranges

```js
0..10 // Type = kotlin.ranges.IntRange
in
!in
for (i in 1..n)
for (i in 1..n step s)
for (i in n downTo 0 step s)
```

### Lists

```js
listOf("a", "b", "c") // Type = java.util.Arrays.ArrayList
indices
lastIndex
size
```

### Automatic Casts

Nullable variables are automatically cast to their non-nullable counterpart after a null check.
Same for _Any_ variable cast as specific type immediately following an _is_ statement.

<https://kotlinlang.org/docs/basic-syntax.html#type-checks-and-automatic-casts>
