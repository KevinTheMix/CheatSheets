# Shell

Technically, any outer layer that mediates between a user and a kernel's services.

## Glossary

* **Bash** (Bourne Again Shell) = an interactive CLI & scripting language shell for UNIX-like OSs (1989)
  * _.bashrc_ = personal script automatically configuring environment everytime a new terminal window is opened
* **Bourne Shell** = shell CLI interpreter by Stephen Bourne at Bell Labs (1979)
* **CLI Shell** = REPL command interpreter running inside a terminal that reads/parses/executes commands & print results
  * Exposes built-in commands (eg `alias`, `cd`, `echo`), external utilities (`ls`, `cp`, `grep`, `ssh`) & kernel services (`read()`, `write()`, `open()`, `fork`, `clone`)
* **Dash** = `sh` shell (in _/bin/sh_)
* **Interactive Shell** = connected to a TTY, not started with `-c {command}`, nor a script shebang
* **Login Shell** = started when first logged in (eg console, `ssh`, `tty`), starting with a `-` (eg `-bash`), reads/sets global config (_etc/profile_, **$PATH**)
* **Non-Interactive Shell** = started via `cron`, `systemd`, `-c`, a script
* **Non-Login Shell** = started after already logged in (eg `bash`, or opened as a terminal window in desktop GUI environment eg _Gnome_)
* **REPL** (Read-Eval-Print Loop) = interactive programming environment taking single inputs, executes them & returns result to user (eg CLI shells)
* **Sourcing** = load a file's content/execute script into current shell session (vs in a subshell as a new process, ie all changes present in file affect current shell)
* **Standard Shell** = CLI interpreter conforming to widely accepted specification (typically POSIX shell standard)
  * Must handle commands interactively or not, support scripting (flow) features, process/command substitution, provide a read-eval loop in interactive mode
* **Trap** = command set up to run automatically in response to signals or shell events (eg `trap 'echo "exiting now"' EXIT` on _EXIT_)

## API

### Builtins

* `alias {command}`/`unalias {command}` = create/remove alias for a command
* `bg` = resume a suspended background job
* `break` = exit a loop
* `cd {path}` (change directory)
  * `cd ~` or just `cd` (without argument) = go to user directory
* `continue` = resume next iteration of a loop
* `echo {text}` = display a line of text (`-e` enable interpretation of backslash escapes)
* `eval` = execute arguments a shell command
* `exec {command}` = replaces shell with given command (ie no forked subshell is created)
* `exit` = exit shell with status code
* `export` = set environment variables
* `fg ({job_id})` = brings background job to foreground (most recently backgrounded/stopped job if no argument given)
* `hash` = remember/display commands location (avoid repetitive _$PATH_ lookups - a marginal performance gain)
* `help` = help for builtin commands (bash-specific)
* `jobs` = list jobs (`-l` adding process IDs, `-p` only process IDs)
* `kill {pid}` or `kill %{job_id}` = sends a signal a process (see `pkill`)
  * `kill -9` = SIGKILL signal
* `let` = evaluate arithmetic expressions
* `pwd` (print working directory) = displays current directory
* `read ({variable})` = read a line from standard input (_stdin_)
* `return` = return from a shell function
* `set ({option})` = display variables & functions, or set shell option/positional parameter
* `shift` = shift positional parameters
* `source` or `.` = read/execute command in current shell environment (not a subshell)
* `test` or `[` = evaluate conditional expression (returns _0_ for true, _1_ for false)
* `times` = displays cumulative user/system time for shell & children
* `trap` = specify commands to run on signal/exit
* `type {command}` = display type of a command (shell builtin/keyword, function, file, alias)
* `unset {variable}` = deletes shell/environment variables or shell functions
* `wait` = blocks calling shell until one or more child processes (usually background jobs) have finished

### Scripting

* `?` = exactly one character
* `*` = zero or more characters
* `[abc]` & `[!abc]` = character classes (one of these & not one of these)
* `{a,b,c}` = brace expansion
* `[ expression ]` = POSIX-style test command (note: spaces are mandatory)
  * `[` = a synonym (ie either a hard link, or just a copy) for `test`
  * `]` = basically useless (but required) last argument to make `[` command look like a balanced expression
  * `if` = shell keyword that uses exit status of `[` (_0_ means success, non-zero means failure)
  * `-a` = logical AND (note: more legible to use `&&` with multiple `[…]` blocks)
  * `-z` = check if string length is zero
  * `=` = string equality (works in all shell, POSIX compliant)
  * `==` = string equality (only in bash/ksh/zsh but not sh/dash)
* `for v in range; do …; done` = for loop (_;_ can be replaced with newlines _\n_)
  * `for i in 1 2 3 4 5; do echo $i; done`
  * `for word in This is a sequence of words do … done`
  * `for i in {1..10}`
  * `for i in {0..32..4}` = 0 to 32 by steps of 4
    * Eg `for f in * .[!.]* ..?*; do … done` = loop on entries in a directory, excluding current (_._) & parent (_.._)
    * `.[!.]*` = all names starting with a single dot following by a char that is not a dot (then some stuff)
    * `..?*` = all names starting with two dots and at least one character (then some stuff)

```bash
#!/usr/bin/env bash
exec more $1
```

#### Launch

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
5. `bash` interpreter opens/reads _script.sh_ argument as data (which must be readable, but not executable)
6. _script.sh_ is interpreted, shebang is seen as comment & ignored

### Variables

* `var={value}` (no spaces) = defines a local variable (not inherited by children unless exported via `export var(={value})` or configured in _~/.bashrc_)
* `$variable` = parameter expansion, use shell/environment variable (warning: interpolation requires double quotes)
* `"$KOKO"` or `"${KOKO}"` = string interpolation (but not `'$KOKO'` single quotes, which treats it literally)
* `[ -z "${variable+x}" ]` = checks whether a variable is set (using parameter expansion incomprehensible syntax)
* `$-` = special Bash variable containing current shell flags
* `$?` = exit status/return code of last (foreground) command
* `$!` = PID of last background command
* `$$` = PID of current shell (or process)
* `$0` = name of running shell or script (`$1` first argument, `$2` second argument, etc)
* `$HOME` = user directory
* `LANG` = character enchoding
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
* `$SHELL` = displays login shell configured in _/etc/passwd_ (not necessarily currently running one)
* `$TERM` = terminal (emulator) type (eg _xterm-256color_, _vt100_, _linux_, or _dumb_), affects how terminal-based programs behave (eg `more`)
* `$UID` = user ID
