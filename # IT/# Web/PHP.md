# PHP (Personal Home Page, PHP:Hypertext Preprocessor)

Dynamic typing server-side scripting language, written in C & C++.

## Glossary

* [Error Control Operators](https://www.php.net/manual/en/language.operators.errorcontrol.php) = suppresses error messages by preceding any expression (methods, etc.) with `@`
* [Expression](https://www.php.net/manual/en/language.expressions.php) = anything that has a value (eg `123`, `$var`, `f()`: all user-defined functions return at least _null_)
* `===` = same value and type
* `#` or `//` = comments
* `??` (PHP7) = à la .NET `?.` operator
* `mixed var` = accepts all types ([Mixed](https://www.php.net/manual/fr/language.types.mixed.php))
* `void` = function return value indicating no value (but the function will still return `null`)
* Reference = address (eg `&$reference`)
* Variable = variable (eg `$alphanumeric_`, must start with letter or _underscore_)
* LAMP = Linux Apache MySQL PHP
* WAMP = Windows Apache MySQL PHP

## API

* `die($message)` or `exit($message)` = (outputs message) & exits script
* `echo($text)` = prints on screen, can take multiple parameters, not really a function and returns no value thus **cannot be used as expression**
* `print($text)` = prints on screen, takes one parameter, return value _1_, slower than echo

* `var_dump($koko)` = raw view of variable
* `gettype($koko)` = gets variable type as string
* `unset($koko)` = remove variable from existence
* `isset($koko)` = true if variable is set and is not null
* `empty($koko)` = true if varialbe is `null`, `false`, `0`, `"0"`, `""`, _unset_ (not set at all)
* `is_null($koko)` = true if variable is null

### Strings

* `"Koko=".$kontan` = concatenation
* `"Koko=$kontan"` = interpolation
* `explode($separator, $string, $limit)` = splits a string
* `strlen($string)` = string length/size
* `strrchr($haystack, $needle)` = returns the end of haystack that follows the last occurence of needle (eg `strrchr(file.htm,'.')` yields `".htm"`)
* `substr($string, $start, $end=null)` = returns a string segment
* `eregi($pattern, $string)` (_deprecated_) = case-insensitive regular expression match
* `preg_match($pattern, $subject, &$matches)` = regular expression match

### Collections

Arrays are actually ordered maps (aka hashtables ie values-keys associations), and are used to implement of variety of collections (array, list/vector, hashtable, dictionary, collection, stack, queue, etc.)

* `$many = array(1,2,'a')` or `$many = [1,2,'a']` = definition
* `$many = array('a' => '1', 2 => '2')`
* `$many[] = 'a'` = adds to array (auto-vivifies it first if doesn't exist)
* `$many[$key] = 'a'` = adds to array using non-default indice

* `count($many)` = number of elements
* `sizeof($many)` = number of elements
* `in_array($needle, $haystack)` = true if a value (case-sensitively for strings) appears in an array

* `reset($many)`
* `each` = returns an array with two items (key,value) and advances cursor
* `list` = Tuple-like lvalue (kinda opposite of `array()`)
* `list($vat1, , $var3) = $many`
* `while(list($key, $value) = each($many))`

### OO

* `class A extends B { }`
* `class A implements Interface { }`

### I/O

* `realpath($path)` = canonicalized absolute pathname
* `@opendir($directory)` = opens a directory and gets its handle (here with `@` error control operator)
* `readdir($handle)` = reads an entry (name) from a directory handle
* `closedir($handle)` = close directory handle

* `fopen($filepath)` = opens file (or URL) and returns a file pointer resource
* `fgets($filestream)` = reads file current line
* `fclose($filestream)` = closes file
* `is_file($path)` = true if path is to a real file
* `unlink($filepath)` = deletes a file
* `move_uploaded_file($filepath)` = moves uploaded file
* `$_FILES` = associative array of items uploaded via HTTP POST

* `$_GET` = associative array of parameters passed from URL query string (get one via `$_GET["parameter"]`)
* `$_POST` = associative array of parameters passed via HTTP POST (get one via `$_POST["parameter"]`)
* `$_SESSION` = superglobal associative array containing session variables (see [Session functions](https://www.php.net/manual/en/ref.session.php))

## Extensions

* **Apache HTTP Server** = closs-platform web-server
  * Config file _httpd.conf_ is located in _C:\Program Files\WAMP\bin\apache\Apache2.4.4\conf_
  * Improper config can be discovered in _Windows Event Viewer_
  * _DocumentRoot_ = Server web directory (default: _www_)
* **CodeIgniter** = MVC for PHP
* **EasyPHP** = Apache, MySQL, Php(MyAdmin) web server
* **phpMyAdmin** = MySQL administration portable web app in PHP
* **PhpStorm** = PHP + JavaScript IDE (contains WebStorm, _$199_)
* **WampServer** = WAMP (Apache, MySQL, PHP)
* **Zend Framework** = PHP framework (OO, MVC, coding best practices)
