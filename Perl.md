# Perl

    perldoc # Manual page (q to exit)

    #!/usr/bin/perl -w  # Must be the first line of the file. See `which perl` shell command for Perl local installation directory.
    "./script.pl"       # Run
    "perl script.pl"    # Run (also makes shebang line unnecessary)

    $ = scalaire (scalar())
    @ = tableau
    % = hash
    my $var         # Declaration or re-declaration (which makes new local variable scope)
    my ($a, $b);    # Multideclaration. my $a, $b; incorrect (cfr Erlang tuple)

    undef
    defined()

## {}

    {Instruction block}

## String

    "${var}stuff"   # As variable name delimiters within a string

### Print Method

    @{[expression]} # Expression can be a variable or function or calculation e.g. @{[$var + 1]}

### Hashtables

    $hashtable{key}             # Value
    @h{key1, key2}              # Slice
    $href = {key => 'val'}      # Reference declaration
    %{$href->{key}}             # Reference
    $$href{key}; $href->{key};  # Reference value

### Array reference

    @{$subtref->[]} # {} delimit reference for @

### Other

    sort() grep() map() {criteria}

### Regex quantifier

    {1,3}

## Pragma (Preprocessor)

    use strict;
    use constant NAME => value;
    use constant PI => 4 * atan2(1, 1);
    use constant DEBUG => 0;    # instruction if DEBUG;

## Global

    %ENV $ENV{PATH} $ENV{HOME}
    @0      # Nom du programme (e.g. main.pl)
    @_      # Function parameters
    @ARGV   # Program arguments
    $ARGV   # Name of current file being read
    $.      # Last read file line number
    $!      # errno
    $_      # chomp + foreach + grep + map + =~ (bind)
    $a $b   # sort({} @liste);

## Scalars

    scalar(@t)
    int(10/3);
    ++
    **
    x   # Following a scalar: copy-paste the preceding scalar x number of times.
    chr($int) <-> ord($char)
    hex('0xabc') -> 0xabc

### Strings

    ""                  # Parses $ @
    ''                  # As-is => '\n' will not be a end line char.
    q(Koko est kontan); # As-is, similar to '...' but now we can use ' inside

    uc() & ucfirst()    # Uppercase string & first character

    substr()        # L-Value
    length()
    chop (LastChar) # Cfr pop(@liste)
    chomp (TrimEnd) # Chomps $_ if no argument provided
    reverse()
    index($s, $substring, $startpos)/rindex()
    print()
    say()           # print() with \n
    printf(format, variables)   # see "man 3 printf"
    sprintf()       # printf() into string
    quotemeta()     # Escapes '\' special characters

    qq[...]         # Quotes. Similar to "..." for when ... contains quotes characters.

## Conditions

    if(cond) {expr}
    expr if(cond);
    elseif
    unless

### true

    1
    "ok"
    null

### false

    0, "0", '0'
    "", ''
    undef
    [Empty Array]   # => while(@tableau)

### Equality

    ==
    eq  # Used to compare Strings, because == compares only 1st letters

### Inequality

    !=
    ne  # Same, don't use !=

    <   lt
    >   gt
    <!  le
    >=  ge
    <=> cmp # Sorting respectively by numerical and lexical

## Arrays & Lists

    ```Perl
    @t                  # Can coexist with a scalar named $t even after assignation. $t[] will properly be distinguished from $t.
    $#t                 # Last index
    scalar(@t) == size  # Also $size = @t. Note @t = 5 === t[0] = 5;
    $t[-1] = $t[$#t]    # Last element
    if index > size, item value == undef
    $t[1000] = 8;       # Assigns specific index. This enlarges the array => scalar(@t) now worth 1001 and missing elements are all undef
    
    exists($t[index]) == check item exists in tab (index within range)
    defined($t[index]) == check item value is undef (item can exists)
    
    ($a,$b) = (1,2);    # Cette instruction affecte une valeur à chacune des variables de la liste de gauche : $a reçoit 1 et $b reçoit 2.
    ($a,$b) = (1,2,3);  # Les mêmes affectations sont effectuées ici, la valeur 3 n'étant d'aucune utilité.
    ($a,$b) = (1);      # L'affectation à $a de la valeur 1 est effectuée et $b est mis à undef (son ancienne valeur est perdue).
    ($a,$b) = @t;       # Les variables citées à gauche reçoivent les premières valeurs du tableau @t : $a en reçoit le premier élément ou undef si @t est vide ; $b reçoit le deuxième élément ou undef si @t il ne     contient qu'un élément.
    @t = (1,2);         # Cette instruction réinitialise le tableau @t (dont les anciennes valeurs sont toutes perdues, y compris celles d'indice diffèrent de 0 et 1) en lui affectant les valeurs de droite : on obtient     donc un tableau à deux éléments.
    @t = (1..10);
    @t = (2..$n);
    ($a,$b) = Fonction();   # Nous verrons un peu plus loin comment écrire une fonction, et comment lui faire renvoyer une liste : ici l'affectation se fait dans les mêmes conditions que pour les trois premiers cas.
    ($a,$b) = ($b,$a);      # Cette instruction est la plus savoureuse : on peut échanger deux variables Perl sans avoir à en utiliser une troisième � (Ai-je déjà dit que Perl s'occupe lui-même de la mémoire ?)
    
    ($a,@t) = @s;           # Absorbtion. $a = $s[1] et @t = le reste de @s
    (@t, @u, $val) = @s;    # Absorbtion par @t de @s => tout ce qui suit est vide () et undef
    @u = (3, 4); @t = (1, 2, @u);   # Aplatissement. @t == (1, 2 ,3, 4)
    ```

[List flattening](http://blogs.perl.org/users/aristotle/2017/11/perl5-refs-flattening.html).
This is akin to the ```params``` [params operator](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/params) in C#, ```*``` [splat operator](https://www.freecodecamp.org/news/rubys-splat-and-double-splat-operators-ceb753329a78/) in Ruby, ```...``` [spread operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) in Javascript, except in reverse: in Perl, splatting is the default and the ```\``` operator prevents it.

    my @x = (1, 2, 3, 4);
    my @y = (\@x, \@x); // @y => ([1, 2, 3, 4], [1, 2, 3, 4])

## Loops

    for(;;) while(){} instruction while(); do{} while() until()
    next (continue) last (break) redo (goto start)

    foreach my $var (1, 'a', @u) {} # Aplatissement
    foreach my $var (@liste) {}
    foreach (@liste) {$_}

    die("Usage: $0 <n> <n>\n")  if( !defined( $ARGV[1] ) );
    foreach my $i (1..$ARGV[0]) { foreach my $j (1..$ARGV[1]) { printf( "%4d", $i*$j ); } print "\n"; }

## Arrays & Lists (2)

    ```Perl
    unshift (@tableau, 1, 2, 3) $elem = shift (@tableau)    # Changes @tableau. Also shift @tableau with no ()
    push (@tableau, 4, 5, 6)    $elem = pop (@tableau)      # Changes @tableau
    @rev = reverse (@tableau)                               # @tableau not modified
    splice (@tableau, $offset, [$length], [@list])          # $offset can be negative

    @liste = qw (Une phrase);   # qw means _Quote word_. No quotes around [Une phrase]. Also qw/blahblah/;
    $string = join("separator", @tableau);
    @liste = split(/separator regex/, "phrase contenant le separateur");
    ($a, $b) = split(...)       # Also possible since it's a list of scalars
    ```

## Sort

Comparison result <0 if $a has to precede $b

    @triee = sort( {$a cmp $b} @liste );   # cmp is also the default when no {} is specified. $a & $b special variables. @liste not modified
    @triee = sort( {length($b) <=> length($a) or $a cmp $b} @liste );

### Grep

    @selected = grep {$_ criteria} @liste;   # No () or ','. @liste not modified unless assign $_ = something
    @selected = grep ('/regex/, @liste);
    $nb = grep {..} @liste;   # Number of elements retained

### Map

    @treated = map ({last $_ expression} @liste);    # No ','. @liste not modified unless assign $_ = something. E.g. map({$_*=4}@t);

## Fonctions

### Declaration

    sub maJolieFonction { my ($x, $y, $z) = @_;  return $z; }   # Copie local de @_ sinon modifie param�tres
    my ($x, @t) = @_;   # Absorption into @t
    my ($x) = @_;       # Only one. Must have () or will be assigned the size of @_
    my $x = shift;      # shift takes in @_ by default

### Call

    function($param); or function $param;
    $val = maJolieFonction(1, 2, 3);   # Also @liste =  fonction(..); or ($i, $j) = fonction(..);

## Hash

    ```Perl
    (key => value)  # All scalars. Value cannot be an array.

    my %h;
    my %h = ();
    my %h = ("I" => "Kevin", "You" => "Friend", "One" => "123");    # Key quotes can be omitted (thx to string context given =>)
    $value = $h{You};   # Add '' or "" if key is not alpha_numeric

    my @keys = keys(%h);    # All keys in any order
    my @vals = values(%h);  # Values in same order that keys() returns the keys, provided %h not changed
    foreach my $key (@keys) {$val = $h{$key}}
    foreach my $val (@vals) {}
    while (my ($key, $val) = each (%h) ) {}

    exists($h{key})
    delete ( $h{key} );
    if ( %h eq 0 )  # scalar(%h) vaut used/total ou vaut 0 si vide

    %h = @t     # Hashtable to list, 2 by 2, fills uneven with undef, last duplicate stands
    @t = %h     # List to hashtable, 2 by 2, in any order
    => == ','   # Forces left side as string e.g. toto => 'titi'
    %h = reverse(%h);   # Duplicate values undetermined
    ```

## Slices

    ```Perl
    @t[1,3] == ($t[1],$t[3])    # Note the '@' since splice is a list.
    (function())[1,3];          # Only selected elements from the returned list

    @h{'key1', 'key3'} == ($h{key1}, $h{key2})      # Note it's always a list '@' and not '%'!
    @t = qw(..); my %h; @h{@t} = (); @t = keys %h;  # Easy word duplicate deletion
    ```

## Files

### Operators (see perldoc -f -X)

Bool (0/1)

    -e # exist
    -f # file
    -d # directory
    -l # softlink
    -r # read
    -w # write
    -x # exectute
    -o # OP
    -z # empty

Values

    -s # size
    -M # days

### Liste glob == <>

    @files = glob('expression');    # expression is not a regex but OS wildcards. Cfr ls expression e.g. ls [A-Z]*.h
    @files = <expression>;

### Open

    open(HANDLE, "expression"); # expression == mode + filepath. Mode = < read > over-write >> append +> overwrite +< append
    if(!open(..)){exit(1)};     # 1 is error. 0 is normal end
    open(..) or die ("$!");     # or is lazy. $! is errno message in this litteral context

### Read

    $line = <HANDLE>;
    @lines = <HANDLE>;
    while (defined ($line = <HANDLE>)) {chomp $line; print "$.: $line";}    # $. == current line number of last read file
    while (defined ($_ = <HANDLE>)) {}; # $_ is also the default currently read line
    while (<HANDLE>);
    while (<>) {}       # Use ARGV filehandle, which is STDIN by default if no files given via command line
    print (<HANDLE>);   # Outputs the whole content of the file

### Write

    print (HANDLE "..");    # No ',' after HANLDE
    printf (HANDLE "format", $i);

### Close

    close (HANDLE);
    open (HANDLE, ..);  # When new open with same handle, the previous one is automatically closed

### Binary

    $c = getc(HANDLE);
    $sizeRead = read(HANDLE, $buffer, $sizeToRead); # $sizeRead == $siteToRead if no problem
    print/printf "0101110";

## Regex =~ !~

    m/motif/        # Matching. if( $v =~ m/sentier/) {..}
    s/motif/string  # Substitution of everything in the motif. $v =~ s/voiture/pieds/;
    / separator by default, then m is optional $v =~ /../;  # '=' for URL is simpler

    \ PIPE ( ) [ ] { } ^ $ * + ? .
    \n \r \t \f \e

    $var value inserted as-is => use quotemeta(..) to escape any regex special characters

### Sets

    . [a-z] [Ar-z23] [ -~] [a-z-] [^ao] [-+*/]  # . == [^\n]
    \d \D \w \W \s \S   # Digit (01239), Word (Alpha_num123), Space ([ \n\r\t\f]) and uppercase is everything but
    ^start end$ \b      # Assertions. Boundaries != characters

### Quantif (Atomic (fusing) & First found unless g option)

    * + ? {a} {a,} {,b} {a,b}   # Greedy        a 'b' c 'd' e -> 'b' c 'd'
    *? +? ?? {a,b}?             # Non-greedy    a 'b' c 'd' e -> 'b' + 'd'

### Regroupement () => correlation possible (cfr (\.\d+)? )

    meuh{3} != (meuh){3}    # meuhhh != meuhmeuhmeuh
    (\w+)                   # Captures the whole word
    (\w)+                   # Captures the last character of the word
    abcPIPEdef ghi != (abcPIPEdef) ghi  # Distributed
    (backref) \1 / $1
    (?:noncapturant)

    $&  # Entire original string match
    $`  # Before
    $'  # After

m/../ returns

    true/false (scalar) # Correspondance
    list of matches ($x, $y) = ( $v =~ m/^(A+).*(B+)$/ )        # Extraction. Can go > $9
    both        if( ($x, $y) = ( $v =~ m/^(A+).*(B+)$/ ) ) {..} # Correspondance + Extraction

### Separators Alternatively

    $v = m=http://blahblah=;

### Options

    i   Insensitive to case
    g   All substitutions instead of first found. Matches browsed sequentially in a while()
    e   Understand Perl expression in substitution
    o   Compile once (Use more memory)
    s   Single-line (. matches \n)
    m   Multi-line (^ $ match at \n)

### Variables

    $v =~ m/$s$/    # $s substituted as-is and special characters interpreted => use quotemeta()

### Transliteration

    $s =~ tr/abcde/01234    # Transliteration (one for one dictionary replacement)
    $s =~ tr/a-Z/A-Z/;      # Uppercase all letters. Note [] Optional

## References

Watch out for circular references! (Break the chain: $r->[1] = undef;)

### Reference Declaration

#### Reference Scalars

    my $ref = \$v;
    my $ref = \scalar;  # Anonymous. Referenced calar value is constant

#### Array

    my $tref = \@t;
    my $tref = [1,2,'a'];   # Anonymous. Note [1,2,'a'] != \(1,2,'a') == (\1,\2,\'a')

#### Hashtable

    my $href = \%h;
    my $href = {key => 'val'};  # Anonymous. Values can be nested hashtable addresses

#### Function

    my $ref = \&function;   # Address of the function within the code segment
    my $ref = sub {..};     # Anonymous function

### Reference Access (Dereferencing)

#### Reference Access Scalar

    $$ref

#### Reference Access Array

    @$tref          # e.g. in foreach(@$tref)
    @{$subtref->[]} # {} delimit reference for @
    $tref = $subtref->[]; @$tref

#### Reference Access ArrayItem

    $$tref[] OR $tref->[]
    $$subtref[][] OR $subtref->[]->[] OR $subtref->[][]

#### Reference Access Hash

    %$href          # foreach (keys %$href)
    %{$href->{key}} # {} delimit reference for %
    $href = $href->{key}; %$href

#### Reference Access HashItem

    $$ref{key} OR $ref->{key}
    $$href{key1}{key2} OR $href->{key1}->{key2} OR $href->{key1}{key2}

#### Reference Access Function

    &$ref(1,2 "param") OR $ref->(1,2, "param")

#### Reference Access Multi

    my @t = (1, \@t1, \@t2, 'a');   # Plus d'aplatissement dans ce cas => Multidimensional structure.

#### Reference Access Nameless

Create a local variable in a function and return its adress => local variable destroyed upon exit, value still accessible

#### Reference Access Display

    ref($ref)   # Indicates the type of the referenced object : "SCALAR" "ARRAY" "HASH" or empty string (== false) if not a reference

    use Data::Dumper;
    print Dumper($ref); # Also works with circular references. Don't forget to break the chain before releasing original ref

### Reference Files

    open(HANDLE, ">output.txt") or die("$!");
    $ref = \*HANDLE;
    print $ref "abc";
    close($ref);    # Note this is equal to close(HANDLE);

## Modules (CPAN)

### Definition

    Package Directory::Module;  # Name of module name mustn't be the same as file (use Filename; then Module::Member).
    our $var;       # "our" makes the variable public
    BEGIN {} END {} # Cfr C# Page_Load() & Page_Unload
    1;              # Last line expression result 1 if OK

### Inclusion

    use ModuleName; # Precedes usage. Typically grouped at the top
    use Math::Trig; # Trigonometric functions beyond predefined cos() & sin()
    use File::Copy; # Extended file copy operations
    use Net::FTP;   # FTP functionalities

### Usage

    $Module::Variable;
    Directory::Module::Function()

### Symbols (perldoc Exporter) Goal is simplifying calls to package members, getting rid of "Package::" prefix

    package Module;
    use strict;
    use Exporter;
    our @ISA = qw(Exporter);    # Inheritance "is a".

then next line is:

    our @EXPORT = qw($variable @list %hash &function);  # Default. '&' optional for functions
        use Module;
    our @EXPORT_OK = qw(..);        # Individual. Makes export OK for the symbols in the list.
        use Module qw(..);          # Effectively imports available symbols from the module. Disables default exports.
        use Module qw(:DEFAULT ..); # Re-enables default export as well as importing available ones.
    our %EXPORT_TAGS = (TAG1 => [qw(..)], TAG2 => [qw(..)]);    # Hashtable => reference -> symbols array
        use Module qw(:TAG1);       # Imports all symbols given by the key tag.
        use Module qw(:DEFAULT :TAG1 $export_ok_var);

### Private functions

    sub _function{}     # Simply by convention
    my $fref = sub {}   # Anonymous reference. $fref is limited to the module since declared using "my"
        $fref->(1,2);   # Call

### Doc (POD = Plain Old Documentation) (perldoc perlpod)

    =head1 NAME
    Module.pm - Useful functions    # perldoc Module to display the doc of this module
    =head1 SYNOPSIS
    use Module;
    fun("param");
    =head1 DESCRIPTION
    Blabla Blabla
    =head2 Methods
    =over
    =item :TAG1 Blabla
    =item :TAG2 Blabla
    =backref
    =cut    # POD end tag. To be added at the end of each POD block e.g. preceding each function

## OO

A class is a package containing a static method returning a blessed reference.
Often times, that reference is a hashtable containing the fields of the class.
Once the reference has been blessed, i.e. associated with a package, Perl knows where to find the methods called via the object e.g. $o->Method();
\_field is private by convention

Le nom de la classe est suivi d'une flèche, du nom de la méthode et des éventuels arguments entre parenth�ses.
N'écrivez pas Vehicule::getNbVehicules() car le nom de la classe n'est pas transmis et surtout car les m�canismes d'h�ritage ne sont pas mis en �uvre.
S'il est possible d'écrire Velo->getNbVehicules(), il n'est pas permis d'écrire Velo::getNbVehicules().

### Composition

$this->{FIELD} = [];    # Don't forget @{} around $this->{FIELD} for referenced array access

### Inheritance

    package Daughter;
    use strict;
    use Mother;
    our @ISA = qw(Mother);  # @ISA special inheritance variable.
    our @ISA = qw(MotherA MotherB); # Multiple inheritance.

    if(ref($o) eq 'Class))  # True if $o is a Class.

    use UNIVERSAL qw(isa);  # Importing isa() method from UNIVERSAL package.
    if(isa($o, 'Class'))    # True if $o is a Class or inherits from it.

### Static

    my $private
    our $public

Static methods can be called via class or object instance

    Class->Method() # Resolve inheritance if class is daughter and Method belongs to mother
    $o->Method()    # Then static method receives object reference instead of class as expected

To solve the case when a reference is provided to the static method expecting a class, do:

    $class = ref($class) || $class; # ref() returns empty string (aka false) if not a reference
    Constructor is actually a static method, so we can even call the constructor from another instance $o2 = $o1->new(..);
