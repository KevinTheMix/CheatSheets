# Definition
Erlang is a functional programming language written in C, Prolog & itself and intended primarily for telecom applications & companies.
It has therefore very high capabilities in concurrency & multi-threading and on the other hand lacks integrated support of concepts such as strings.

# Environment & Installation
Download exe and/or sources from Erlang.org

## Shell
	werl	# Windows Erlang Emulator shell. Based on Emacs text editor

	{Ctrl}+A		# Go to start of line
	{Ctrl}+E		# Go to end of line
	{Ctrl}+G		# User switch command
	c [job_number]	# Connects to given shell. Connects to current shell if no number specified
	h				# Lists commands
	i				# Stop code but keep shell
	j 				# Lists shell instances
	k [job_number]	# Terminate shell & code. Kills current shell if no number specified

	li {Tab}	# Displays modiles matchin li*, e.g. "lib", "lists"
	lists: {Tab}# Displays the methods within module lists

	help().		# Displays shell functions
	q()			# Quit. Aka init:stop()

## Special & Environment variables
_ 	# Dismiss expression during variable assignment. This variable is always considered unbound & act as wildcard for pattern matching.

## BIF
Built-in functions are usually functions that are not implemented in Erlang (but C/Prolog).

	hd()
	tl()
	length()


# Language
## Syntax
Each statement ends with a dot '.'
	
	[statement].[whitespace]	# Executes statement

Statements can be separated by commas, in which case only the last one is shown

	[s1],[s2],[s3].				# Executes all statements, show last one only

## Variables
### Equal
	1 = 1	# Returns the value if they're the same.
	1 = 2	# Error.

	Variable	# Uppercase (and '_' for dismissible values by convention)
	A = B		# Since A is unbound, assigns the value of B to A. Then proceed with '=' operator as usual since both operands now match
	A = B = 123
	f(Variable)	# Erase the variable (only in the shell)
	f()			# Erase all variables (only in the shell)

## Types & Operators
### Numeric
	123
	10.0

	+ - * /
	a div b
	a rem b
	[base]#a
	()	# Grouping.

### Atoms
Atoms are literals, aka constants whose only value is their own name.

	atom.
	atom_atom@erlang# Alphanumeric, underscore and '@' only valid characters
	'Atom'			# Enclose within '' all atoms comprising characters other than alphanumerics, '_' and '@'
	'atom'			# Same as atom (=> "atom = 'atom'" works and "'atom' = atom" works too)

### Boolean
	true/false	# Actually atoms => no numerical value (false /= true)

	and	# Or andalso to short-circuit right-side of operator if left-side is false
	or	# Or orelse to short-circuit right-side of operator if left-side is false
	xor
	not
	()	# Grouping.

### Comparison
Note that different types can be compared e.g. numbers & booleans. Useful for sorting.
More precisely, the total ordering is well-defined as
	number < atom < reference < fun < port < pid < tuple < list < but string

	=:=	# Exact equality.
	=/=	# Exact inequality.
	==	# Like =:= but more relaxed comparison (5 == 5.0 is true)
	/=	# Like =/= but more relaxed comparison (5 /= 5.0 is false)

	> < >= =<	# Note the last one is not "<=" like in other languages

### Tuples
	Point = {1,2}
	{A,B} = {1,2}
	{A,B} = Point
	{A,B,C} = Point	# Exception
	{A,_} = Point	# Wildcard & discard seconds element
	{a,_}			# Matchs all tuples starting with atom 'a'
	{a,_} = {b,_}	# Exception
	{a,A}			# Tagged tuple
	{A,{B,C}}		# Nested

### Lists
	[]
	[1,2,3]
	[65,66,67]		# "ABC" because strings are actually lists in Erlang

	[1,2] ++ [3,4]			# [1,2,3,4]
	[1,2,3,4] -- [1,4]		# [2,3]
	[1,2,3] -- [1,2] -- [3]	# [3] because ++ and -- are right-assicative (read right-to-left)

	length([1,2,3])		# 3
	hd([1,2,3])			# 1
	tl([1,2,3])			# [2,3]
	L = [H|T]			# Compose list from Head and Tail (a list) using pattern-matching
	L = [1|[2,3,4]]		# [1,2,3,4]
	[H|T] = L			# Separate Head from Tail
	[H|T] = [1,2,3,4]	# 1 & [2,3,4]. The expression [H|T] is actually =:= [1,2,3,4] => we can assign it again transitively


(Page 20)