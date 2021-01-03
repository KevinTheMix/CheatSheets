
# PHP

Dynamic typing server-side scripting language, written in C & C++.

## Environment

* LAMP = Linux Apache MySQL PHP
* WAMP = Windows Apache MySQL PHP

### Apache

Config file httpd.conf is in C:\Program Files\WAMP\bin\apache\Apache2.4.4\conf
Improper config can be found in Windows Event Viewer

* `DocumentRoot` = Server web directory (default: www)

## API

```PHP
echo        # Prints on screen. No return value. Can take multiple parameters. Little faster than print.
print       # Prints on screen. Return value 1 => usable as expression. Take one parameter. Slower than echo.
die         # See exit()
exit        # Outputs message & exits script

gettype     # Gets variable type as string
empty       # True if null, unset, false, 0, "0", empty string
isset       # True if variable is set and is not null
is_null     # True if variable is null
var_dump    # Raw view of variable

list        # Tuple-like lvalue. Kinda opposite of array()
            # list($vat1, , $var3) = $t;
            # while(list($key, $value) = each($t))
```

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

each    // Returns an array with two items (key,value) and advances cursor
        // See http://stackoverflow.com/a/3304932
```

## OO

```PHP
class A extends B { }
class A implements Interface { }
```
