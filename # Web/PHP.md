
# PHP

Dynamic typing server-side scripting language, written in C & C++.

Originally stood for **Personal Home Page**, it now stands for (the recursive) **PHP: Hypertext Preprocessor**.

## Environment

* LAMP = Linux Apache MySQL PHP
* WAMP = Windows Apache MySQL PHP

### Apache

Config file httpd.conf is in _C:\Program Files\WAMP\bin\apache\Apache2.4.4\conf_

Improper config can be found in Windows Event Viewer

* `DocumentRoot` = Server web directory (default: www)

## API

* `echo()` = prints on screen, no return value, can take multiple parameters, a little faster than print
* `print()` = prints on screen, return value _1_ => usable as expression, takes one parameter, slower than echo
* `die()` = see `exit()`
* `exit(message)` = outputs message & exits script

* `gettype($var)` = gets variable type as string
* `empty($var)` = true if: _null_, _false_, _0_, _"0"_, _""_, unset (not set at all)
* `isset($var)` = true if variable is set and is not null
* `is_null` = true if variable is null
* `var_dump` = Raw view of variable

list        # Tuple-like lvalue. Kinda opposite of array()
            # list($vat1, , $var3) = $t;
            # while(list($key, $value) = each($t))

## Syntax & Types

```PHP
expression  # Anything that has a value, e.g. 123, $var, f()
$variable   # Alphanumeric_ (must start with letter or underscore)
&$reference
@expression # Error Control Operator. Supresses error messages

===     # Same value and type
??      # See .NET ?. operator (PHP7)

#       # Comment
//      # Comment
```

### Numbers

1234567890
012345670
0x1234567890ABCDEF

### Arrays

```PHP
$t = array(1,2,3);
$t = array('a' => '1', 2 => '2');

$t[] = 'a';      // Add to array (auto-vivifies it first if doesn't exist)
$t['key'] = 'a'; // Add to array using non-default indice

count($t);      // Number of elements.
sizeof($t);     // Number of elements.

each    // Returns an array with two items (key,value) and advances cursor
        // See http://stackoverflow.com/a/3304932
```

## OO

```PHP
class A extends B { }
class A implements Interface { }
```
