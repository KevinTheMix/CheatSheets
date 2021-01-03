# Ruby

Ruby in written in C and thus allows the inclusion of C libraries. There exists implementations in other languages

## Environment & Installation

* [SSL Certificate issue](https://gist.github.com/fnichol/867550)
  * Download [certificate authority file](http://curl.haxx.se/ca/cacert.pem) and set the *SSL_CERT_FILE* environment variable to its path: `SSL_CERT_FILE=[certificate_file_path]`.
* Paths
  * User PATH environment variable to use ruby/irb/rspec/rails commands in shell:
    * Cygwin = `C:\Cygwin\bin;C:\Cygwin\home\[User]\bin`
    * RailsInstaller = `C:\RailsInstaller\Git\cmd;C:\RailsInstaller\Ruby2.0.0\bin`
* CLI
  * `gem env` = Displays Gem environment information (installation path, etc.)
  * `irb` = Interactive Ruby Shell. REPL = Read-Eval-Print-Loop. exit/quit/Ctrl+D to exit, load 'script.rb' to load the content of a Ruby file into the shell
  * `ri` = Ruby documentation. q to exist
* Shebang
  * `#!/usr/bin/ruby -w` = Shebang notation with warnings. Same as Perl
  * `#!/usr/bin/env ruby` = Use the environment to find the Ruby interpreter.
    * This can change per user, plus arguments (e.g. `-w`) cannot be provided.

## Syntax & Special variables

```Ruby
\#  # Comment
()  # Parentheses in methods definition and call are optional. Empty parentheses must directly follow the method name without space
;   # Statement separator can be used in place of the usual newline character. Allows one-liners e.g. class A; end
\   # Statement continuation character. At the end of a line, indicates that the statement continues next line
_   # Digit grouping (layout) character e.g. 1_000_000
@   # Class and Instances variables sign
$   # Global variables sign. Use it to define an accessible everywhere variable from inside a more reduced scope e.g. within a Class or Method

See http://blog.mattcallanan.net/2012/11/cryptic-ruby-global-variables.html
$!  #Exception message set by 'raise'
$,  # Kernel.print and Array#join() default field separator
$\  # Kernel.print and IO#write() default record separator

$VERBOSE = nil # Silences some warnings

self                # main (object from which we make the call)
self.class          # Object
self.class.ancestors# [Object, Kernel, BasicObject] (Kernel is a module mixed-in in Object)
$0                  # Name of the file that started the program
__FILE__            # Name of the current file
if __FILE__ == $0   # Execute the following code only if it's the entry-point of the application (not a class/lib)
Object::Constants   # Lists all top-level constants, as well as classes
```

## Variables & Types

```Ruby
a = b = c = 123 # Multiple assignments
var ||= default # Conditional assignment (variable is assigned default if == nil)
```

```Ruby
Constant # Must start with a capital letter (all uppercased by convention, except Class, Module names). Can actually be modified (issues a warning)
variable # Must start with a lowercase letter (all lowercase by convention)
nil
nil.class # NilClass

.dup       # Provides a copy of an object, useful when we want to manipulate a value without changing the original
.object_id # Note a = 5; b = 5 => a & b will have the same object_id (true for Symbol and Numeric)

.to_sym # Symbol (aka .intern)
.to_i   # Integer. Returns 0 if the object cannot be converted e.g. "abc".to_i)
Integer # Integer. ArgumentError Exception if the object cannot be converted
.to_int # Integer strict. To implement if an object is to behave like an Integer
        # Typical usage: 'a.to_i if (a.respond_to? ("to_int"))'
.to_f   # Float
.to_s   # String
.to_str # String strict. Only core String class has it by default
        # Whenever an object can be manipulated as if it is a String, not only as a printed representation
        # Note that this does NOT enable _implicit_ conversion,
        # just that when such an object respond_to? ("to_str"), its .to_s() can be applied in a String manipulation context
.to_a   # Array
.to_ary
.to_h   # Hash
.to_hash
.chr    # String (character from int e.g. 97.chr -> "a")
.ord    # Fixnum (int from character e.g. "a".ord -> 97)

<=>     # General comparison operator (spaceship operator)
        # Returns [-1,0,1] if left side [less, equal, greater] than right side
        # Compares objects according to the implementation for that type (Fixnum => sequential, String => alphabetical)
        # Can be implemented for any custom class => then include the Comparable mixin, which provides conventional comparison operators (< > <= etc.)
        # See http://jakeyesbeck.com/2016/02/28/ruby-spaceship-operator/
```

### Symbol

Symbols are String-like values that have the property of being immutable (unlike Strings) => using a symbol several times accesses the same space on the heap
In other languages, we would use instead constructs such as Erlang atoms, C# Enum.Value (enumeration & flags)
Symbols are values, not variables => can only be on the right-side of an assignment
Symbols are never marked for destruction by the GC => created once, used many. Actually indexed by Ruby in a dictionary i.e. puts Symbol.all_symbols.inspect
Symbols are also faster to compare since all is needed is to compare their .object_id
Symbols are used as an underlying mechanism for Ruby to identify methods and variables uniquely, since a method is actually a message sent to an object.
The intrisical value of symbols is their identity (their name): a symbol equals itself. Their have own name for value

```Ruby
:symbol
:"a symbol"
```

#### Conversion

```Ruby
:green.to_s         # "green" (without colon, same for print)
"green".to_sym      # :green
"green" == :green   # false
```

#### Unicity

```Ruby
"Hello".object_id   # 269067090
"Hello".object_id   # 268630540 (different)
:green.object_id    # 269688
:green.object_id    # 269688
"green".to_sym.object_id # 269688 (same)
```

#### Immutability

```Ruby
:sym << :sym2   # Error
```

### Number

```Ruby
(1..3)      # 1 2 3
(1...3)     # 1 2
(-3..3)     # -3 -2 -1 0 1 2 3
(1..3).to_a # [1, 2, 3]

123.class           # Fixnum < Integer < Numeric
1234567890.class    # Bignum < Integer < Numeric
0.123.class         # Float < Numeric
Math::PI.class      # Float
a=5; b=5    # a & b will have the same .object_id. If their value change, then changes back to 5, they regain initial .object_id too

5/2     # 2
5.0/2   # 2.5
5/2.0   # 2.5

quotient,remainder = divmod(number,divisor)

2*10        # 20 (Actually * is an operator => shortcut for 2.*(10)
2**10       # 1024

.succ   # See .next
.next   # Return next sequential Integer. Note that ++/-- operators does not exist in Ruby => use +=/-= instead. Note that next!() does not exist for Integer
.zero?
.even?
.odd?
.between?

i = 123
puts i          # 123
puts "#{i}"     # 123
puts i + "\n"   # Error => must call the number's .to_s() specifically or use a parameter list e.g. puts i, "\n"

rand()      # Returns a Float between 0.0 and 1.0
rand(0)     # Returns a Float between 0.0 and 1.0
rand(i)     # Returns an Integer between 0 and i (excluded)
rand(1..i)  # Returns an Integer between 1 and i (included)
rand(1..f)  # Returns a Float between 1.0 and f (excluded)
```

### Time

```Ruby
t = Time.new        # Time.now
t = Time.new(2015)  # 2000-01-01 00:00:00 +0100
.sec
.hour
.min
.wday .mday .yday   # Offset of the day in the week/month/year
.monday? .tuesday? .wednesday? .thursday? .friday? .saturday? .sunday?
.strftime("%A %m/%d/%Y at %I:%M%p") # Thursday 03/05/2015 at 03:49PM
.between?
```

### String

```Ruby
s = "abc"           # Shorthand for the following
s = String.new("abc")
s = String("abc")   # Alternate syntax
s= "\x41\x42\x43"   # "ABC" (Hex characters representation)

('a'..'c').to_a     # ["a", "b", "c"]
('aa'..'bb').to_a   # ["aa", "ab", .., "az", "ba", "bb"]

print   # Actually a Kernel class method (Kernel.print()). Equivalent to args.join($,) + $\
        # Also accepts several parameters and concatenates them calling .to_s() on each of them e.g. print s, " ", i
        # If the parameter is "concatenated" + "terms", don't forget to apply .to_s() to each (non-String) of them
        # Returns nil (=> evaluated as false if used as condition e.g. if print "ok"). Also "print nil" prints nothing
puts    # print with $, and $\ set to newline. Uses an object's .to_s() if its result is a String, otherwise uses .inspect()
p       # puts the .inspect of the string, which is nice for debugging. Same as 'puts object.inspect'
""      # Parses #{evaluate}.
''      # As-is (can still display variables using concatenation .+())
"aaa \  
bbb"    # Line continuation
%q[<a href="javascript:method('call')">link</a>]    # Custom %q separators
"Hello #{statement}"    # Interpolation. Calls to_s on statement that can be anything (var, method, yield) that will not be literally printed.
                        # Usable as a standalone String, i.e. outside puts usage.
"Hello #{variable}"     # Display the value of the variable. Numbers are automatically converted to Strings, so no need for to_s, e.g. #{i.to_s}

s1 + s2         # Concatenate. Non-String objects need to be converted first (to_s), unlike Perl.
s1 += s2        # Works but a new String is created each time => worse performance compared to s1 << s2
s1 << s2        # Append-concatenate. Same result as s1 += s2. << is an operator => s1.<<(s2) and returns its left-value (s1)
s[index]        # E.g. s1[index] = s1[index] + s2 to insert a String into another String
s[index, length]# Substring, can also be used in lvalue
s[start..end]   # If end is negative, indicates index backward from the end (until the end if -1).
s1[s2]          # The first occurence of s2 in s1

.include?(s)
.start_with?(s)
.equals?(s) # String comparison
('a'..'c') === 'a'  # true
('a'..'c') === 'd'  # false
('a'..'z') === 'ab' # false
.between?

*n      # Repeats n times
.succ   # See .next()
.next   # 'aa' => 'ab' (also .next!())
.chop   # Erases the last character of a String (both last characters if they are "\r\n")
.chomp  # Erases terminating newline (actually record separator $/). Useful when dealing with "gets" input.
.chomp! # Cfr Perl
.strip  # chomp leading & trailing
.strip! # Cfr Perl trim
.reverse    # Reverse the letters
.length
.capitalize # Uppercase 1st letter, lowercase the others
"abc def".capitalize # "Abc def"
"ABC DEF".capitalize # "Abc def"
.upcase     # Uppercase string
.downcase   # Downercase string
.center(n, chars)   # Center as n characters using optional padding chars (default is spaces)
.ljust(n, chars)    # Left justifies n characters using optional padding chars (default is spaces)
.rjust(n, chars)    # Right justifies n characters using optional padding chars (default is spaces)
.scan(/pattern/)    # Returns an array of the matching patterns iteratively found in the String
.gsub(regex, replacement)   # Global substitution. Search & Replace all regex with replacement
.gsub!(.)
.split(separator)   # Separator is String or Regex
/pattern/.match(s)  # Returns a MatchData object
```

### Array

```Ruby
t = []
t = Array.new
t = Array.new(size, default)
t = Array.new(size){default}
t = Array.new([])       # Array from another Array
t = Array.new([1,2,3])  # Array from another Array. Array.new() takes a [] as parameter => Array.new(1,2,3) will not work
t = [1,2,3]             # Shorthand
t = Array[1,2,3]        # Alternate syntax
t = (1..3).to_a # Array from Range
words = %w(A little sentence)   # Array from sentence. No quotes nor commas
t2 = t.clone    # t == t2

t = [1,2,3]     # Multi-assignment
a,b = t         # a=1 b=2 (parenthesis optional e.g. (a,b) = t)
a,b,c,d = t     # a=1 b=2 c=3 d=nil
t[1,2] = [3,2]  # [1,3,2]

puts t      # Calls the .to_s() for each item in the Array, separated by \n
puts t      # 1\n2\n3\n (inserting field and record separators)
puts t.to_s # [1, 2, 3] aka the to_s() representation of the array
puts "#{t}" # [1, 2, 3] aka same as above, because the string is replaced first then puts is called on the result

t[index]            # Returns an item
t[index, length]    # Returns an Array of length items starting at index
t[start..end]       # If end is negative, indicates index backward from the end (until the end if -1).
t.take(n)           # Returns an Array composed of the first n items or [] if t.empty? (n is required)
t.first([n])        # Returns an Array composed of the first n items or nil if t.empty?
t.last([n])         # Returns an Array composed of the last n items

t + t2          # Appends to the right (t += t2 works too)
t.push(item)    # Appends to the right
t.push(t2)      # Appends to the right. Use * operator on t2 to append its items one by one instead of an array as an item
t << item       # Appends to the right
t << t2         # Appends to the right. The * operator doesn't work for << because it accepts a single argument
t.pop           # Removes! and returns the right-most element of the Array (nil if empty)
t.shift         # Removes! and return the left-most element of the Array (nil if empty)
t.insert(index, t2) # Insert t2 in t at index. Use *splat for item-level insert

# Array splat operator expands an Array into a list of arguments or a list of arguments into an Array (not unlike the C# _params_ keyword).
# A method parameter with a splat absorbs the remaining arguments as an Array => we can loop on it
t = [3,4]
a, b, *c = 1,2, *t  # c == [3,4] and would be [[3,4]] without the *t

# Methods that also return an Array can be chained (à la Fluent LINQ IEnumerable).
# Filtering methods return a class instance of the same type as the array items.
# ! (bang) methods modify the original Array and return it (except uniq! who returns nil when no duplicates were found).
.eql?(t2)   # true if both Arrays refer to the same object or have the same content
.empty?
.length # See .size()
.size   # Alias for .length
.count  # Same as .size and .length
.count {|item| condition}   # Number of items satisfying condition
.reverse                # Returns a reversed Array (also .reverse!)
.join(separator)        # Returns a string of the items in t joined using the separator string. Uses the $, variable (empty) by default as separator (e.g. $, = "-")
.grep(pattern)          # Returns an Array of all matching items (pattern is String or Regex). Grep actually wraps .select() and ===
.collect                # See .map()
.map {|item| .. }       # Returns an array of same size formed by the .. block statements
.map!                   # Modifies and returns the array it iterates on
.sort                   # Sorts an array using the general comparison <=> operator on its items (also .sort!)
.sort {|a,b| a<=>b}     # Specifies the order of the sort
.sort_by {|item| .. }   # Sort an array by '..'
.sort_by(&:attribute)   # Sorts a collection of objects by comparing their specified attribute
.uniq                   # Returns a copy of array without duplicates
.uniq!                  # Removes duplicates and returns array. Returns nil if no duplicates
.any? {|item| condition}        # true if any value satisfies the condition
.any?                           # true if at least one value is not false or nil (implicit block {|item|item})
.all? {|item| condition}        # true if all value satisfy the condition
.all?                           # true if all the values are not false nor nil (implicit block {|item|item})
.find {}                        # See .detect()
.find_all {}                    # See .select()
.detect {|item| condition}      # Returns the first item satisfying a condition, nil otherwise. Same as .find()
.select {|item| condition}      # Returns an array of all the items satisfying a condition
.reject {|item| condition}      # Inverse of .select()
.partition {|item| condition}   # Returns an array of two arrays of items distributed according to a condition
.zip(t2,t3,..)                  # Array of Arrays of elements taken from each Array (instance and *parameters) sequentially one at the time, filling with nil
.ary(t2)                        # Union of the Array with t2, excluding duplicates, preserving Array order
.inject()                       # See reduce (synonym)
.reduce(initial, symbol)        # Returns a scalar value obtained by accumulating its items (e.g. Integers, Strings) using a binary operation symbol (e.g. :+, :*)
.reduce(initial) {|memo,item| memo+item}    # Assigns to memo the result of the block statement at each iteration
    # Default initial value is first item in the array => returns nil if unspecified and Array is empty
    # Initial value is necessary if it's a collection of class objects otherwise it will take the first object as initial value, while we actually need an expression of its attributes
    # If we're reducing an Array of numbers, then initial value isn't necessary (unless of course we want it different from intrisical neutral value 0/1 for +/*)
.flatten    # Reduces a multi dimension Array to a single dimension Array e.g. [[1,2],3] -> [1,2,3]
.sample     # Returns a random element from the Array
```

### Hash

```Ruby
h = {}                      # Empty
h = Hash.new                # Empty
h = Hash.new(default_value) # Provides a default value to return when accessing a key that is not in the Hash (instead of nil) => allows immediate += assignments
h = {'key'=>'value', ..}    # Order not kept, unlike arrays.
h = {:key => 'value', ..}   # Quotes mandatory except around key if it's a :symbol
h = {key: value, ..}        # Alternate syntax when the key is a :symbol. The two syntaxes can me mixed
h = Hash[t]                 # Initialization from Array. Only works if t is an Array of [key, value] pairs
h = Hash[k1, v1, k2, v2,..] # Initialization from even number of arguments. Arguments list can be obtained from an Array using splat operator e.g. Hash[*t]
h = {key: {..}}             # Nested Hash

.keys               # Array
.values             # Array
.to_a               # Returns an Array of [Key,Value] pairs
h['key']            # Square brackets (unlike Perl). In Ruby, {} is reserved for Hash definition and blocks
h.[]('key')         # Square brackets is actually an operator method
h = {}; h[:k] += 1              # Error because h[:k] is nil and nil doesn't have a += method. Unless the Hash was created with a default value
h = {}; h[:k] = 0; h[:k] += 1   # OK

h.has_key?(key)
h.delete(key)

.each {|k,v| ..}
.each_key {|k|}
.each_value {|v|}
.sort_by{|k,v| v}   # Returns an Array of sorted [key, value] pairs
.select{|k,v| cond} # Returns a Hash composed of the pairs satisfying the condition
h1.merge(h2)        # Appends or overwrites values of h2 onto h1

.method({key: value,..})
.method(key: value,..)   # Since {} are optional
```

## Flow

### Conditions

Other than nil and false, everything (numbers, strings) evaluates to true. Note that nil == false is false

```Ruby
var?
var.nil?
var.defined?
var.is_a?(Class)
var.respond_to? :to_str # String check (or at least can be used as one)
var.respond_to? :each   # Array check (Enumerable)
```

#### Operators

	not and/&& or/|| 	# and/&& and or/|| can be used for short-circuit evaluation (A || B => if A is true, B won't be run, same for A && B if A is false)
		var ||= SomeClass.new()	# Create if not exists
	==	# Equality operator /.==()/
		(1..5) == (1..5)	# true
		(1..5) == (1..10)	# false
	===	# Subsumption operator (a === b means "is b part of the set described by a?"). General object goes left, specific goes right
		# Order of operators matters because of object to which operator belongs (e.g. Fixnum#=== cannot take a Range but Range#=== can take a Fixnum)
		(1..5) === 1		# true
		(1..5) === 10		# false
		(1..5) === "koko"	# false
		Integer === 42          # => true
		Integer === "fourtytwo" # => false
		/ell/ === "Hello"   # => true
		/ell/ === "Foobar"  # => false
		/ell/ === :hello	# => true
		"Hello" === /ell/   # => false!
		Object === Array	# true

#### If

	if condition
		unless condition
		elsif	# As many as needed
		else	# Can only be one
	end

	statement if condition	# Statement modifier
	statement if condition unless condition

	var = if condition statement else statement end	# if returns the value of the last statement in matching branch, nil otherwise

#### Case

	case expr
		when 1	# Internally, compares 1 === expr
		when 2..5
		when 'exit','quit'
		when /pattern/
	end

#### Loops	# Iterators are methods that can can traverse a collection e.g. an Array

Most iterators are implemented internally using these basic methods
In the following statements, .. is NOT a block and the optional [do] is a reserved word (See http://www.tutorialspoint.com/ruby/ruby_loops.htm)
Difference between each and for is scoping: local variables exist outside for loop. This is because for doesn't use a block => the variable is not local

	while condition [do] .. end
	until condition [do] .. end
	for i in 0...size [do] .. end	# i exists after the for loop

	next if condition	# Jumps to next iteration
	break if condition	# Exits the loop

The following methods return an Enumerator when no block is provided (see following section)

	loop do .. end
	number.times {|index|}		# index starts at 0. Returns number itself (-> self) or nil in case of break
	start.upto(end) {|index|}	# index starts at start -> end (Works with Strings)
	start.downto(end) {|index|} # index starts at start -> end (Works with Strings)

#### Exceptions

```Ruby
unless condition    # Condition must be true
    raise ArgumentError, "No this and that"
end

raise AccessDenierError, "reason" unless condition  # One line

def f
    statement_susceptible_to_cause_an_error
rescue SomeError
    redo    # Restarts the method
end
```

## Blocks & Enumerable

Blocks are pieces of code that are called by a method and allows some customization, often a recurring treatment applied to each item provided by the method
Blocks cannot stand on their own: they can only follow a method call, however a block can be attached to any method (all methods have a default one)
Methods that don't use blocks can still get one attached, in which case nothing happens e.g. puts {puts "koko"} prints nothing
This construct is useful to change what happens during each iteration just by changing the block (and not the method)
=> From a design standpoint this is good because different concerns are decoupled

Variables defined inside the blocks are local to it, i.e. cannot be accessed when it ends
However, blocks can access existing variables defined before them and CHANGE THEIR VALUES because these variables are shared (=> sum = 0; t.each {|i| sum+=i})
Block parameters are different variables => not shared and don't modify existing variables with the same name
Blocks can return a value back to the method: the value of its last evaluated expression is returned by yield() => 'puts yield' or 'if yield(element)'

### Block Definition

```Ruby
{}          # Single line by convention. Also precedence (http://stackoverflow.com/questions/5587264/do-end-vs-curly-braces-for-blocks-in-ruby)
do .. end   # Multiple lines by convention. Works just as well for chaining methods like fn() do .. end .another_fn()
{|a| .}     # Block parameter
{|a,b| .}   # Block parameters
{|a;b| .}   # Protects existing variable b from being modified by the block in case a local variable with the same name is defined in the block
            # b is not a block parameter
{|a;b,c| .} # Same

yield()     # Invokes the method's provided block, which returns the value of the last statement in the block.
yield a,b   # Parentheses are optional
puts block_given? ? yield : "Does not compute"  # Handles LocalJumpError when calling a yield with no block provided.
```

### Enumerables & each()

When a Class includes ("mixes in") the Enumerable module, it has access to all the methods pertaining to collections e.g. .find, .select, etc.
All those Enumerable methods actually rely on the .each() method to iterate through the elements of the collection
Including Enumerable in a class requires the explicit definition of the each() method (Enumerable module doesn't provide any since it's class specific)
=> include Enumerable + define .each() and all the other Enumerable methods will make use of the custom .each()

Classes such as Array and Hash of course include the Enumerable module
But an .each method can actually be implemented in any Class (i.e. not Enumerable)
The role of the each() method is simply to yield items to the associated block
Typically, it will do so when looping through a collection of some sort (e.g. while < collection.size) and invoke yield on each of its elements
yield statements could even be hardcoded independantly from a collection e.g. `def each; yield 1; yield 2; yield 3; yield 42; end`
See <http://graysoftinc.com/early-steps/the-evils-of-the-for-loop>
Returns an Array of the iterated items

* `.each {|item| .. }` he type of item depends on the type of the items in the collection
  * `array.each {|item| .. }`
  * `hash.each {|key,value| .. }` Hash is a class that includes Enumerable and implements .each with 2 parameters
* `.each_with_index` Adds an extra parameter to a block in the form of an automatically incremented index (starting at offset)
* `.each_with_object`
* `.each_slice(n)` Iterates on object by slices of n elements
* `Enumerable.instance_methods`

### Enumerators

An Enumerator object provides some methods common to enumerations -- next, each, each_with_index, rewind, etc.
=> Calling the method without block gets the Enumerator
Calling an .each{} on the enumerator causes the initial method to be performed, using the block of the .each as if it was the unspecified block of the original method
Does Enumerator knows what method is to be accomplished when the eventual .each is called? Instead of doing it immediately => invoke it or something?

```Ruby
enum = array.map    # Block is not specified here
enum.each{...}      # Will actually do .map() using the code in the {...} block

enumerator.peek
enumerator.next			# Returns next object and moves internal position forward
enumerator.next_values	# Returns next object as an array and moves internal position forward
enumerator.with_index(offset){|param,index| ..}
enumerator.with_object(){|param,object| ..}
```

### Procs

	# Everything in Ruby is an Object, except Blocks, that can only be used once by the method they apply to.
	# Procs are Objects that fill that gap; they are reusable chunks of block-like code that can be used as block and also as methods
	# Used as a block, they can therefore be saved in variables for reuse. They can also be called just like a method by applying .call() to them

#### '&'

	# Apply the '&' operator to a Proc to pass it to a method as a block (note: it is actually passed as a method parameter)
	double = Proc.new {|n| n*2}	# Defines a Proc
	def f n; puts yield n; end 	# Defines a Method that takes one parameter
	f (5, &double)				# Proc-block is passed as a method parameter
	# Other uses of '&' include meta-manipulating a block from within a method, e.g. displaying its parameters
	# See <http://ablogaboutcode.com/2012/01/04/the-ampersand-operator-in-ruby/>

#### to_proc()

'&' converts the following object to a block using its .to_proc() method => .to_proc() implementation must return a block (a Proc)
Any Class can define a to_proc() method and the most used is the one predefined in the 'Symbol' class

#### Symbol#to_proc

The to_proc() method of the 'Symbol' class invokes its own instance (a :symbol) on its block parameter
I.e. block_parameter.send(:name) where :name is a method that exists for block_parameter
See <http://benjamintan.io/blog/2015/03/16/how-does-symbol-to_proc-work/>

	words.map &:length	# Symbol#to_proc invokes .length() for each String in the 'words' Array

### Lambda

Lambdas and Procs are very similar; the difference is the parameter checking and restituting control to the method by the lambda
If Procs are like inline-macro-methods, Lambdas are actual methods

Lambda

## Methods

Variables declared outside of a method are inaccessible to it. The only exceptions are globals ($LOAD_PATH) and instance variables (@member and @@static_member)
Methods have to be defined prior to behind used i.e. above in the code

Methods that take parameters by reference don't exist in Ruby. Closest thing is destructive instance .method!() that modify an instance object
Actually, a method such as swap() is unnecessary in Ruby: `a,b = b,a`.

Everything in Ruby is an objet and calling a method on an object means sending a message to that object (i.e. 'instance.send(:method)').
Example: in `object.method(..)`, the Receiver is the object, and the Message corresponds to the method name and parameters.

Every method is Ruby has a receiver, even if implicit (in which case we need to look at the context to determine what it is)
In an instance method it's the instance, and in a class method it's the Class itself
=> we can drop the 'self.' and 'Class.' prefixes when calling other methods with same receiver

Definition

```Ruby
# Standalone
def f .. end        # () are optional
def f p .. end      # () are optional but prefered in method definition
def f(p) .. end
def f(p = "default") .. end
define_method(:name)# Using reflection to create an instance method on the receiver (see <http://apidock.com/ruby/Module/define_method>)
# Convention for Destructive (aka bang!) & Predicate ('!' and '?' are part of their name)
def f!(p) .. end    # Destructive method (modifies the caller object in place)
def f?(p) .. end    # Predicate method (returns true/false)
## Instance/Class
def Class.method .. end
def instance.method .. end
class << Class; def method .. end; end
class << instance; def method .. end; end
# Returns
return expr
expr        # When no return keyword is present, the value of the last statement is returned (cfr Perl)
```

Call

```Ruby
f           # () are optional
f()
f param     # () are optional
f(param)
## By reflection
method(:f).call
object.send(:f, params) # object. can be self.
```

### Accessibility

Public (default) can be accessed from any object (e.g. instance.public_method)
Protected can only be accessed from within object (from instance methods, not Class methods) and subclasses (e.g. self.protected_method)
Private is like protected but the method cannot have an explicit receiver (not even 'self.')
These keywords have _no effect_ on Class methods (they remain public)

Defining multiple methods with a given accessibility:

```Ruby
private
def f; end
def g; end
```

Setting the accessibility of a previously defined method:

```Ruby
def f; end
private :f
```

## Class # State (instance variables) + Behavior (instance methods)

### File

	class_name.rb 	# Corresponding filename should be lowercase w/ underscores

### Definition

	class ClassName	# Class name is a (capitalized) Constant in CamelCase by convention
	end

### Initialize

Constructor-like method that defines the instance variables and initializes their state. Invoked by Class.new() after calling allocate()
initialize is a private instance method defined in an ancestor of all Classes => instance.respond_to?("initialize", true) == always true

	def initialize
	def initialize(param)
	def initialize(param = "default")
		@instance_variable = param
	end

### Constants

	CONSTANT	# Accessed outside the class using Class::CONSTANT (:: is the scope-resolution operator)

### Instance Variable

Look what 'self' refers to when a variable is used to identifies its nature (Class or Instance)
If it appears outside an instance method, it's a _class-level_ instance variable (initialized the first time the class is loaded)
See http://stackoverflow.com/questions/6043618/ruby-initialize-vs-class-body
Class-level instance variables are useful to define class variables that are independant in subclasses (unlike @@class_variables who are changed globally)
See http://www.railstips.org/blog/archives/2006/11/18/class-and-instance-variables-in-ruby/

	@instance_variable

### Class Variable

	@@class_variable

### Attributes (properties)

	def name; @name; end		# Reader (cannot be assigned anything => use writer)
								# Note: if the object read is a collection, the value of its elements can actually be modified
	def name=(n); @name=n; end	# Writer, as indicated by the equal sign part of the method name

#### Virtual attribute

A virtual attribute is an attribute that doesn't wrap a dedicated instance variable

	def time_in_minutes; @seconds/60; end

### Accessors

Accessor ease the task of writing readers/writers manually
attr_* are actually method calls creating attributes that get/set @instance_variables with the same name (given by Symbol or String)
See http://stackoverflow.com/questions/4370960/what-is-attr-accessor-in-ruby

	attr_reader :name		# Reader
	attr_writer "name"		# Writer
	attr_accessor (:name)	# Reader & writer

### Instance method

Has access to instance variables & instance methods (with or without 'self.' prefix), class variables and even class methods (with 'Class.' prefix)

	def method

### Class Methods (static)

Has only access to other Class methods there is no access to an Instance

	def Class.method

Alternate ways to define a class method, see http://www.railstips.org/blog/archives/2009/05/11/class-and-instance-methods-in-ruby/

	def self.method

### self

Class instance reference. In Perl, $self is the name of the variable that receives an instance in class methods

	self

### to_s (ToString())

Will be automatically called when printing the object e.g. puts instance
Also called on each item when printing an array of objects e.g. puts t = [Class.new, Class.new]; puts t

	def to_s
		print "My member is #{@instance_variable}."
	end

### <=> General comparison operator used by sort()

	def <=>(other)
		@instance_variable <=> other    # aka self.@instance_variable
	end

### each

	def each
		@instance_collection.each {|item| yield item}
	end

### Call

new() is a _Class_ method that allocates some memory to create an instance then calls instance.initialize() to set up its state

```Ruby
instance = Class.new
instance = Class.new()
instance = Class.new(param)
instance = Class.new param
instance.@member	# Forbidden
Class.method	# Class method

s = "abc"				# ?
s = String "abc"		# ?
s = String ("abc")		# ?
s = String.new "abc"	# Constructor
s = String.new ("abc")	# Constructor

MyClass.freeze		# Prevents further changes to the class
MyClass.allocate	# Creates a new object without calling the initialize method
```

### Reflection

```Ruby
Class.class					# Class (the class of a Class is Class)
Class.superclass			# Parent class
Class.ancestors				# Array of all the parent classes
Class.instance_methods		# Instance methods
Class.methods				# Static methods
Class.instance_variables	# Class instance variable (Class members)
Class.class_variables		# Static members
Class.constants				# Nested classes

instance.class				# The class of the instance
instance.methods			# The methods of the instance
instance.instance_variables	# Instance instance variables (Members specific to one instance e.g. initialized in .initialize())
instance.kind_of?(Class)	# See .is_a?
instance.is_a?(Class)		# true if instance is a Class or inherits from it
instance.instance_of?(Class)# true if instance is a Class (only direct Class, false if ancestor)
instance.respond_to?(:method, true/false) # true if instance has method (1st parameter can be String, 2nd true to include protected/private methods)
```

### Nested Class

	class A
		class B
		end
	end
	print A.constants	# B

### Extension

	class String	# Extends one of the core Ruby classes
		def dash_split
			self.split('-')	# self is optional since split is a String method and can be called from here.
		end
	end

### Inheritance

A Class can inherit from another Class (its superclass), but only one (no multiple inheritance). Use mixins to inherit common behaviours
The Child class has access to Parent constants, variables and methods and can override Parent methods
Use super(parameters) in an overriding Child method to call the Parent method with the same name
Tip: Don't completely override a parent method if there's a way to reuse it in the child => adapt super() instead

	class Child < Parent
		def my_method
			super() * 2	# Calls Parent#my_method
		end
	end	
	Child.superclass	# Parent

We can add child variables by overriding the initialize method and using super to pass along variables to parent constructor

	def initialize (old, new)
		super(old)	# Calls the parent initialize
		@new = new
	end

### <<

Appends .. to the object, which can be a Class or an Instance.

#### Class

 Creates a class method (i.e. static)

	class << object
		..
	end

#### Instance

Creates an instance method for that specific object instance only

	instance << object

## Struct

Struct are like behavior-less classes that hold a bunch of attributes together and saves us from having to write an explicit class
Defining a Struct defines its attributes and their read/write methods, and also defines an initialize() constructor method
Actually generates a Class object, just like a Class definition does. That object can either be assigned to a Constant (i.e. a Class), or inherited from
Although Struct objects behave like Classes, Ruby distinguishes between them and allows for example easy comparison of Struct objects by their attributes

### Struct Definition

```Ruby
Struct.new(:attributes)             # Returns a Class object
Struct.new("Constant", :attributes) # When a name is provided, the generated Class can be accessed by a Constant with that name in the Struct module
                                    # => Access via Struct::Constant. Also returns that Constant
Class = ..          # Assignment to a Constant (i.e. a Class). Use like a regular Class
class Class < ..    # Inheritance
Class.superclass    # Struct

Class = Struct.new(:a,:b)
a = Class.new('abc', 5)
b = Class.new('abc', 5)
a == b              # true, even though :a refers to different .object_id objects
                    # Struct objects are compared by the value of its attributes, unlike a regular Class instances that are compared by .object_id
```

## Modules

Modules are like stateless static classes that hold related Constants and Methods (also Classes) together under a common namespace
Namespacing == packaging all the related objects and specs within a common namespace (i.e. library, toolbox)
Objects defined inside Module can be accessed anywhere within same Module name scope (even if different file), and from outside via 'Module::'
Unlike classes, they CANNOT be instantiated => the "module methods" they contain are called through Module.method (same as with Class methods)
They also cannot be inherited from (but can be included (i.e. mixins) or extended)
The name of a module is in CamelCase whilst the name of file it is located in uses lowercase & underscores
E.g. MyModule => my_module.rb

### Requiring

Ruby is a dynamic language => if a module has been loaded in memory once during execution (e.g. in the 'main' file),
it will be available everywhere from then on, including other submodules that don't explicitely include it

	require_relative 'file_name'    # Looks for the filename file in the same directory (.rb extension optional)
	B require C
	A require B	# Will also includes C in A

### Module Definition

```Ruby
module Module
	class Class
	CONSTANT
	@member
	@@static_member
	def Module.method;end;
	def self.method; end;	# Since self. is the Module
	def self.get; @@static_member; end
	def self.set(param); @@static_member = param; end
end
if __FILE__ == $0	# Used to put some usage example code inside a class/module file that will only be when running that file directly
```

### Call

	Module.method 		# Module method
	Module::method 		# Module method via scope-resolution operator '::'
						# Actualy also works for Class methods and Instance methods (e.g. Class::method and instance::method)
	Module::CONSTANT	# Constant (only) via scope-resolution operator '::'

### Mixins (-Able behaviors)

Mixins allow integrating a Module structure into one or (typically) several Class
Used to share common properties amongst classes that are not meant to inherit from one another
Mixins provide instance methods (and variables, and constants) to the including classes, not lib-style Module methods like regular modules
Like other Modules, Mixins can not be instantiated either, so the internal properties will only be usable via the classes that include them
The included module can use @instance_variables although it can't initialize them. They can be initialized in the including classes
Comes between class and parent class in ancestor hierarchy e.g. Array > Enumerable < Hash
À la interfaces in C#/Java (except that mixins define more than a signature, they implement the method)

#### Module

	module Able
		CONSTANT
		def instance_method .. end
	end

#### Inclusion

	class Class
		include Able
	end
	Class::CONSTANT
	Class.new.instance_method

#### Reflection

	Class.class				# Class
	Class.superclass		# Object
	Class.ancestors			# [Class, Able, Object, ..]
	Class.included_modules	# [Able, Kernel]
	Class.include? module	# true/false
	Class < module			# true/false

### Extend

Module extension similar to mixins in the sense that the extending objects absorb the Module Instance methods (but not its CONSTANTS)
The difference is the Module Instance methods are extendend as Class methods if the extending object is a Class
It also allows object instances to be extended too => only one particular instance receives the methods
If the object getting extended is a Class, then the methods will become Class methods i.e. called via Class.method()
If the object getting extended is an instance, then the module methods will become instance methods instead i.e. called via instance.method()

Note that the extended methods in the module are defined without '.self', otherwise they wouldn't be extended (accessible only via Module.methods())

#### Extend Definition

	class Class
		extend Module
	Class.extend Module		# Alternate syntax
	instance.extend Module 	# Only that particular instance will gain all the methods from Module

## IO

Don't forget about .to_i() and Integer()

### ARGV

Command line parameters as an Array

### Definition

	ruby ./script.rb parameter	# No need for quotes around parameter

### Call

	ARGV.shift	# Returns the first parameter (also removes it)

### File

#### Open

	file = File::open("filename.txt", [mode])	# Default mode is 'r' (r,r+,w,w+,a,a+,b,t)
		while(line = file.gets)		# Read (.gets() returns nil if EOF reached)
		file.each_line {|line| ..}	# Read
		file << "content"} 			# Write
	file.close

Better construct to avoid forgetting closing a file: use a block and the file is closed at the end

	File::open("filename.txt", [mode]) do |file|
		.. # Read/Write (see above)
	end

#### Read

	File::read("filename.txt")		# Open/close the file and returns its whole content
	File::readlines("filename.txt")	# Open/close the file and returns an Array of all the lines => we can use .each {|line|} on it

#### Rename/Delete

	File::rename("old.txt", "new.txt")
	File::delete("filename.txt")

### Dir

	Dir::["path_with_files_pattern"]	# Array of names of matching files in the given directory
	Dir::[]("path_with_files_pattern")	# Just like with hashes, [] is a class operator => can use it as a method


## Regex

	s =~ /pattern/	# true/false

## Gems

	gem env 	# See the gems installation directory

### Packaging

Namespace the classes & modules of the application under a common name (e.g. Application) and organize the directories & files in a hierarchy such as this one:

	bin
		# In order for the main file to behave like a command-line program, remove its .rb extension and preface it with #!/usr/bin/ruby -w and chmod +x bin/main
		# We also need to change the targets of require_relative so that it goes into the library directory (=> ../lib/application/module)
		main	
		iofiles
	lib
		application
			classes
	spec
		# In the spec files, we must require the lib classes instead of require_relative (see http://stackoverflow.com/questions/3672586/what-is-the-difference-between-require-relative-and-require-in-ruby)
		# RSpec actually adds the lib/ and spec/ directories to Ruby's load path ($LOAD_PATH ($:)) => require 'application/module' and the files in those subdirectories will found
		# Using this organization, specification files can now all be run from the application directory using the 'rspec' command (no '.' necessary)
		application
			specs
	LICENSE.txt
	README.txt
	application.gemspec	# Gem specification file, a file written in domain-specific language to specify what the gem is and what it does

### Build

	gem build application.gemspec

### Install

	gem install gem_name.gem	# Install the gem and its dependancies

### Info

	gem list application -d

### Deploy	(rubygems.org)

	gem push application.gem
	gem search -r application # -r for remote
	gem install application

### Run

Command-line

	application

IRB

	require 'application/module'	# Loads the module into IRB. If other modules are required from this one, we can use them as well
	m = Application::Module.new()
	n = Application::SubModule.new()

### RSpec (Ruby Specification)
Unit testing

#### File

	file_spec	# Naming convention for the file containing the unit tests (notice it's *_spec, not *_rspec)

#### Call

	rspec [FILE] --color	# Add rspec to the environment path for this to work
	rspec . --color			# Runs all the *_spec.rb file in the current directory (.)

Definition

	describe Class do
		before do
			# Initialize state
		end
		

		context "something being done under certain circumstances" do 	# Set context for an entire subcategory of tests
		
			# Add or replace the state established in upper-level 'before' block
			before do
				*Initialize state*
			end

One test

			it "does something" do
				# Hijacks the return value of a given method
				# The method body is skipped altogether
				object.stub(:method).and_return(desired_value)
				allow(object).to receive(:method).and_return(desired_value)
			end
		end
	end
