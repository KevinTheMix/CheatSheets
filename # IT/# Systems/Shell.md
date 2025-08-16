# Shell

Technically, any outer layer that mediates between a user and a kernel's services.

## Glossary

* **Bash** (Bourne Again Shell) = an interactive CLI & scripting language shell for UNIX-like OSs (1989)
* **Bourne Shell** = shell CLI interpreter by Stephen Bourne at Bell Labs (1979)
* **CLI Shell** = REPL command interpreter running inside a terminal that reads/parses/executes commands & print results
  * Exposes built-in commands (eg `alias`, `cd`, `echo`), external utilities (`ls`, `cp`, `grep`, `ssh`) & kernel services (`read()`, `write()`, `open()`, `fork`, `clone`)
* **Dash** = `sh` shell (in _/bin/sh_)
* **Globs** = wildcard patterns for filenames/paths (not a full-fledged regex)
  * `?` = exactly one character
  * `*` = zero or more characters
  * `[abc]` = any one of those characters
  * `[!abc]` = none of those characters
  * `[a-z]` = characters in range
* **Interactive Shell** = connected to a TTY, not started with `-c {command}`, nor a script shebang
* **Login Shell** = started when first logged in (eg console, `ssh`, `tty`), starting with a `-` (eg `-bash`), reads/sets global config (_etc/profile_, **$PATH**)
* **Non-Interactive Shell** = started via `cron`, `systemd`, `-c`, a script
* **Non-Login Shell** = started after already logged in (eg `bash`, or opened as a terminal window in desktop GUI environment eg _Gnome_)
* **REPL** (Read-Eval-Print Loop) = interactive programming environment taking single inputs, executes them & returns result to user (eg CLI shells)
* **Sourcing** = load a file's content/execute script into current shell session (vs in a subshell as a new process, ie all changes present in file affect current shell)
* **Standard Shell** = CLI interpreter conforming to widely accepted specification (typically POSIX shell standard)
  * Must handle commands interactively or not, support scripting (flow) features, process/command substitution, provide a read-eval loop in interactive mode
* **Trap** = command set up to run automatically in response to signals or shell events (eg `trap 'echo "exiting now"' EXIT` on _EXIT_)

## Environment

* _~/.bashrc_ = personal environment configuration script for interactive non-login shells (everytime a new terminal window is opened)
* _~/.bash\_history_ = stores command history (access via arrow keys or `history`)
* _~/.bash\_logout_ = run when a login shell exits
* _~/.bash\_profile_ = general initialization script for login shells (sets environment variables, sources _.bashrc_, starts daemons)
  * _~/.bash\_profile_ > _~/.bash\_login_ > _~/.profile_ (more portable across shells) = startup script by order of priority (only one is used)

## API

### Keywords

* `;` can be replaced with a newline

* `[[` = (Bash extension) enhanced conditional expression (eg `if [[ $answer == 'y' ]]; then … fi`)
* `if` & `elif` (followed with `then`, ends with `if`) = uses exit status of `[` (_0_ means success, non-zero means failure)
* `for`, `while`, `until`, `do`, `done` = loops
  * `for {var} in {values}; do …; done` = for loop
    * Values eg `1 2 3 4 5` explicit, `{from..to(..step)}` range, `this is a sequence of words`, `$(cat {file})` file content
    * Eg `for f in * .[!.]* ..?*; do … done` = loop on entries in a directory, excluding current (_._) & parent (_.._)
    * `.[!.]*` = all names starting with a single dot following by a char that is not a dot (then some stuff)
    * `..?*` = all names starting with two dots and at least one character (then some stuff)
  * `until [ {condition} ]; do … done` = runs until condition becomes true
  * `while [ {condition} ]; do … done` = runs while condition is true
* `case {expression} in 1) …;; 2) …;; esac` = multi-branch conditional
* `function` = declares a function
* `select` = menu-based loop (Bash only)
* `time` = measure execution time of a command

### Builtins

* `alias {command}`/`unalias {command}` = create/remove alias for a command
* `bg` = resume a suspended background job
* `break` = exit a loop
* `cd {path}` (change directory)
  * `cd ~` or just `cd` (without argument) = go to user directory
* `continue` = resume next iteration of a loop
* `declare` = declare variables (Bash-specific)
* `echo {arg(s)}` (quotes optional, arg can have newlines) = display a line of text (`-e` enable interpretation of backslash escapes eg `\n`)
* `eval` = execute string argument in current shell (as if it was typed right there)
* `exec {command}` = replaces shell with given command (ie no forked subshell is created, eg `exec more $1`)
* `exit` = exit shell with status code
* `export {variable(=value)}` = set environment variable to be inherited by child processes
* `fg ({job_id})` = brings background job to foreground (most recently backgrounded/stopped job if no argument given)
* `hash` = remember/display commands location (avoid repetitive _$PATH_ lookups - a marginal performance gain)
* `help` = help for builtin commands (bash-specific)
* `history` = access shell history (from _.bash\_history_)
* `jobs` = list jobs (`-l` adding process IDs, `-p` only process IDs)
* `kill {pid}` or `kill %{job_id}` = sends a signal a process (see `pkill`)
  * `kill -9` = SIGKILL signal
* `let` = evaluate arithmetic expressions
* `local` = declares a local variable in a function
* `pwd` (print working directory) = displays current directory
* `read ({variables})` = read one line (until next newline) from standard input (_stdin_), splits that line into given variable(s) (or _$REPLY_ if none), returns _0_ (success) or _1_ (failure/EOF)
  * `-p` = prints a message for prompt
  * `-r` = treats backslashes as literals (so they don't escape any characters)
  * Uses _$IFS_ variable, so set it beforehand (eg `IFS= read` prevents stripping leading/trailing whitespaces)
  * Eg `while (IFS=) read (-r) {line}; do … done < {file}` = read file line (or fields) by line (common Bash idiom)
* `readonly` = makes variables read-only
* `return` = return from a shell function
* `set ({option})` = display variables & functions, or set shell option/positional parameter (ie _$1_, _$2_, _$#_, _$@_, _$*_)
* `shift` = shift positional parameters
* `source` or `.` = read/execute command in current shell environment (not a subshell)
* `test` or `[` = (POSIX-compliant) evaluate conditional expression (returns _0_ for true, _1_ for false)
  * `[ expression ]` (spaces are mandatory) = POSIX-style test command
  * `[` = functionally identical to `test` (same command, different syntax)
  * `]` = basically useless (but required) last argument to make `[` command look like a balanced expression
  * `-a`/`-o` = logical AND/OR (note: it is more legible to use `[[]]` with `&&` and `||`)
  * `<`/`<=`/`>`/`>=`/`=` (POSIX-compliant)/`==` (Bash-specific) = string comparison
  * `-n` = check if string is non-empty (eg `[ -n "$VAR" ]` or shorthand `[ $VAR ]`)
  * `-z` = check if string length is zero (`[ -z "${variable+x}" ]` = checks whether a variable is set)
  * `-eq` = number equality
  * `-ne` = number unequality
  * `-ge` = number greater than or equal
  * `-gt` = number greater than
  * `-le` = number less than or equal
  * `-lt` = number less than
* `times` = displays cumulative user/system time for shell & children
* `trap` = specify commands to run on signal/exit
* `type {command}` = display type of a command (shell builtin/keyword, function, file, alias)
* `unset {variable}` = deletes shell environment variable or function
* `wait` = blocks calling shell until one or more child processes (usually background jobs) have finished

### Environment Variables

* `var={value}` (no spaces) = defines a variable (not inherited by children unless exported via `export var(={value})` or configured in _~/.bashrc_)
* **Parameter Expansion** = string interpolation
  * `"$var"` or `"${var}"` (but not `'$var'` single quotes, which treats it literally)
  * `${var+alt}` = use alt if variable is set (can be empty/null)
  * `${var:+alt}` = use alt if variable is set and not empty/null
  * `${var:-default}` = use default if variable is unset or null
  * `${var:=default}` = same as :- but also assigns default to variable
  * `${var:?message}` = print message and exit if variable is unset or null
  * `${#var}` = length of variable
  * `${var:offset}` = substring from variable starting at offset
  * `${var:offset:length}` = substring of length starting at offset
  * `${var#pattern}` = remove shortest match of pattern from start
  * `${var%pattern}` = remove shortest match of pattern from end
  * `${var##pattern}` = remove longest match of pattern from start
  * `${var%%pattern}` = remove longest match of pattern from end

* `$-` = special Bash variable containing current shell flags
* `$?` = exit status/return code of last (foreground) command
* `$!` = PID of last background command
* `$$` = PID of current shell (or process)
* Positional
  * `$0` = name of running shell or script (`$1` first argument, `$2` second argument, etc)
  * `$#` = number of positional parameters passed to a script/function
  * `$@` = all positional parameters, treated as separate words
  * `$*` = all positional parameters, treated as a single word (unless quoted)

* `$HOME` = user directory
* `$HOSTNAME` = host (computer) name
* `$IFS` (Internal Field Separator) = controls how Bash splits strings into fields (default value <code> \t\n</code>)
* `$LANG` = character enchoding
* `$LOGNAME` = username (alternatively `$(whoami)`)
* `$PATH` = path environment variable
* `$PS1` = primary shell prompt (use quotes `""` to use shorthands)
  * `\$` = displays _$_ for regular users, _#_ for **root**
  * `\d` = current date
  * `\h` = hostname
  * `\n` = newline
  * `\t` = time (hh:mm:ss)
  * `\u` = username
  * `\w` = current working directory
  * `\[\e[COLORm\]` = prefix to add color (_00m_ white, _32m_ green, _33m_ blue)
* Eg for default _user@host:current path$_
  * Basic = `"\u@\h:\w$ "`
  * Colored = `"\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "`
* `$PWD` = user directory path
* `$RANDOM` = a (pseudo-)random number between 0 and 32767 (ie 15-bit unsigned integer)
* `$SHELL` = displays login shell configured in _/etc/passwd_ (not necessarily currently running one)
* `$TERM` = terminal (emulator) type (eg _xterm-256color_, _vt100_, _linux_, or _dumb_), affects how terminal-based programs behave (eg `more`)
* `$UID` = user ID

### Invocation, Pipes & Streams

They all use `fork()` under the hood to spawn sub-processes.

* `command &` = run in background
* `A & B` = run A in background and B in foreground immediately after
* `command;command` = runs commands one after the other
* `{ command; command; }` = **Commands Grouping**
* `(commands)` = runs one or more commands in a subshell
* `$((expression))` = **Arithmetic Expression** (ie integer math, Bash-specific)
  * Variables within do not require _$_
  * `** * / + - ~` = operators (last one is bitwise NOT)
  * `++i`/`i++`/`--i`/`i--` = variable pre/post-inc/decrement
* `$(command)` = **Command Substitution** (ie captures command output as string, à la string interpolation)
* `<(command)` = **Process Substitution** (when a command expects a filename, not a string, eg `diff`, `sort`, `uniq`)
  * Uses a temporary named pipe or _/dev/fd/*_ under the hood, containing command output
  * Eg `diff <(sort a.txt) <(sort b.txt)` = creates two temp files, diff them, then deletes them
* `{a,b,c}` = **Brace Expansion** (ie expands into multiple strings, runs command once for each one)

* File Redirection Operators
  * They redirect _stdin_/_stdout_/_stderr_ of a (sub)process (spawned by shell) to other files
  * `0< {file}` or just `< {file}` = redirects _stdin_ from a file
  * `1> {file}` or just `> {file}` = redirects _stdout_ to file (this is processed _before_ that command runs & file is (re)created first)
  * `> {file} 2>&1` = redirects _stdout_ to file, then redirects _stderr_ to same target
  * `>> {file}` = append to file
  * `2> {file}` = redirects _stderr_ to file
  * `&> {file}` = redirects both _stdout_ & _standard_ error to same file (note: non-POSIX bash-specific)
  * `&>> {file}` = same for append
  * `<< {delimiter}{content}{delimiter}` = pass a here document (ie file literal) as _stdin_ to pointed command
    * Useful to provide inline multi-line content (whether directly in prompt, or in a script)
    * Delimiter is often _END_ or _EOF_ (but can be anything)
    * Effectively creates a temporary file created from delimited content
    * [Full explanation](https://old.reddit.com/r/bash/comments/132dgu9/comment/ji4ytg6)
  * `<<< '{string}'` = here string (similar to `<< {delimiter}{string}{delmiter}`)
  * `>|` & `&>|` = force-overwrite

* It is important to understand that commands such as `cat` either read from a file(name) passed as argument, or from _stdin_, but **don't pass a filename via stdin**
  * `cat <(echo file.txt)` won't work: output of subshell ( "_file.txt_") is written as-is in a temp file, and that content is passed as-is to `cat`
  * `echo "file.txt" | cat` won't work: output of echo ("_file.txt_") is passed as-is to `cat`
  * `cat "$(echo file.txt)"` works: echo output is string interpolated, and `cat` receives a filename as argument
  * `cat` (without arguments) simply plugs _stdin_ into _stdout_, hence mirrors everything typed

### Launch

When a script is launched via `./script.sh`:

1. current shell (eg `bash`) recognizes file as executable (provided via path name, ie a custom not built-in script)
2. current shell forks itself and `wait()` for child exit status
3. child shell calls `execve("./script.sh", ["./script.sh", ...], env)` entering kernel, effectively ceasing to exist as a shell
4. OS kernel takes over, sees script is not binary, reads shebang for interpreter, executes `{interpreter} script.sh` (via another internal `execve()` with script name as _$0_ & arguments)
5. interpreter (eg `bash`/`python`) has now replaced child process image (keeping its PID), executes script in parent inherited environment/FDs but in own process/working directory
6. script ends (exit or EOF), original shell `wait()` reaps and sets `$?` (status of last fg command)

When a script is launched via `bash script.sh`:

1. current shell looks up `bash` command in _$PATH_
2. current shell forks & `wait()` for child exit status
3. child shell calls `execve("/usr/bin/bash", ["bash","script.sh",…], envp)` entering kernel
4. kernel executes `bash` ELF (but not _script.sh_)
5. `bash` interpreter opens/reads _script.sh_ argument as data (which must be readable, but not executable, so does not require `chmod +x`)
6. _script.sh_ is interpreted, shebang is seen as comment & ignored
