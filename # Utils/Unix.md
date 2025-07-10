# Unix

## Quick Tips

* `({cmd1}; {cmd2})` = creates new shell (_sh_), executes both commands, close shell
* [Bash Prompt HOWTO](https://tldp.org/HOWTO/Bash-Prompt-HOWTO/index.html)

## Glossary

* _.{file}_ = hidden file
* _.bashrc_ = personal script automatically configuring environment everytime a new terminal window is opened
* **Bash** (Bourne Again Shell) = an interactive CLI & scripting language shell for UNIX-like OSs (1989)
* **Bourne shell** = shell CLI interpreter by Stephen Bourne at Bell Labs (1979)
* **CLI Shell** = command interpreter running inside a terminal that reads/parses/executes commands & print results
  * Provides built-in commands (eg `alias`, `cd`, `echo`), external utilities (`ls`, `cp`, `grep`, `ssh`) & kernel services (`read()`, `write()`, `open()`, `fork`, `clone`)
* **Console** = physical keyboard/display/teletype directly attached to a computer, that receives kernel messages an login prompts
* **ELF** (Executable and Linkable Format) = an executable file
* **IPC** (Inter-Process Communication)
* **POSIX** (Portable Operating System Interface) = family of standards for compatilibity between OSes (eg APIs, CLI shells commands, utility interfaces )
* **Root** = built-in administraive user account (effectively, a superuser ie with UID _0_) in Unix/POSIX
  * Can read/write/execute anything and change any system setting
  * Home directory is _/root_ (kept outside of _/home_ so always available even if user partitions are not mounted)
* **Shell** = technically, any outer layer that mediates between a user and a kernel's services
* [Signal](https://en.wikipedia.org/wiki/Signal_(IPC)#POSIX_signals) = asynchronous message/notification sent to process to trigger specific behavior (eg quitting, error handling)
  * _SIGINT_ = interrupts aprocess (like via `Ctrl + C`)
  * _SIGKILL_ = terminates immediately & forcibly, without time to cleanup
  * _SIGTERM_ = signal to terminate (can be ignored by the process)
* **Sourcing** = load & execute a file's contents into current shell session (rather than in a subshell, eg `. ~/.bashrc`)
* **Superuser** = any process running with special UID _0_ (eg **Root** or via `sudo`, but more can be added to _/etc/passwd_)
* Terminals
  * **Hardware Terminal** = physical device (keyboard + printer/screen) letting a human talk to a multi-user computer/mainframe over a serial line
  * **TTY** (Teletypewriter) = in Unix, any (hardware or software) text terminal, a special kernel device file (eg _/dev/tty_, _/dev/tty1_, _/dev/pts/3_, etc) from which interactive/login shells can read inputs
  * **Terminal Emulator** = software GUI that imitates vintage hardware terminals by opening a pseudo-terminal so programs think they interact with a real tty, and translating stream of I/O control codes into pixels
  * **Pseudo-Terminal** (PTY) = a master-slave pair of kernel objects
    * Master end  (_/dev/ptmx_) = owned by terminal emulator
    * Slave end  (_/dev/pts/N_) = looks exactly like a real tty device to whatever program is launched (eg `shell`, `ssh`, `top`, `vim`)
* **Useless Use Of Cat** (UUOC) = jargon describing piping a cat command (`cat file | cmd`) in place of a more efficient yet less legible shell open (`cmd < file`)

* _BusyBox_ = several (300) Unix common command utilities in a single executable file (aka _"The Swiss Army knife of Embedded Linux"_)
* _Cygwin_ = FOSS & Linux-like tools for Windows
* _WebMin_ = web-based (ie webpages) server management control panel for Unix systems (eg users, disk quotas, services, config files)
* _Wine_ = FOSS compatibility layer between Windows applications/games and Unix-like OSes (ie Linux & macOS)

### Distros

* **Alpine Linux** = security-oriented lightweight Linux distribution
* **Arch Linux** = minimal base system offering rapid update cycle of its software (via rolling-release model, à la Firefox)
* **CentOS** = Linux distribution (_discontinued_)
* **Lubuntu Alternate** = Even lighter Lubuntu for low-RAM PC/laptops
* **Lubuntu Desktop** = Lightweight Linux distribution based on Ubuntu
* **Tails** (aka _The Amnesic Incognito Live System_) = secure DVD/USB Debian Linux Tor network based OS, writes to RAM not HDD (_1300MB_)

## File System

* **ext*** = informal shorthand for Linux extended-filesystem family
  * **ext** (**extfs**) = first native, 16MB files, no journaling (1992)
  * **ext2** = 2TB volumes, 4GB files, stable but not journaled (1993)
  * **ext3** = **ext2** + metadata journal enabling faster recovery after crashes (2001)
  * **ext4** = 1EB volumes, 16TB files, extents, delayed allocations, checksums, online defrag (2008-present)
* **Directory** = special file mapping other file names to inodes
* **File-type Indicator** = file (_-_), directory (_d_), symlink (_l_), devices (_c_ & _b_), FIFO/pipe (_p_), socket (_s_)
* **File Mode (String)** = User/Group/Other `rwx` Permissions + Optional attribute
  * **User** = creator, **Group** = group User belongs to, **Other** = everyone who has access (ie an account) on the system
  * **Read** = can view & copy contents
  * **Write** = can modify & delete (needs execute permission as well) content
  * Eg `d-wx` = can add new files, or move/delete existing ones by name (if known), and `cd` to it, but `ls` is not permitted
  * **Execute** = can run an exe file, enter directory (`cd`), and list their permissions (`ls -l`)
  * _s_ = **Owner/Group Execute** (set-UID/GID) = (if user can execute) use owner/group permissions when executing this file
    * Set via octal value _2000_ (group) & _4000_ (owner)
  * _t_ = **Sticky Bit** = special mode (_drwxrwxrwt_) for directories (& rarely files) that restricts unlinking (aka deleting) & renaming its entries
    * Only entry's owner, directory's owner or _root_ can delete/rename entries (no other users even with write persmissions)
    * Eg world-writable directories such as _/tmp_ or _/var/tmp_ where everyone can write but not tamper with others files
    * Set via octal value _1000_
* **Hard Link** = directory entry associating a name with a file (ie another name to same inode)
  * Hard links to directories are usually not permitted (as they can cause a circular structure and interferences with programs)
* **Inode** = data structure in a Unix-style file system that describes a file-system object (metadata, permissions)
* **Inode Table** = Kernel-managed mapping of inodes to their content on disk
* **Journaling** = crash-consistency using a write-ahead log/journal where sets of planned updates are first written
* **Mounting** = attaching a filesystem (regardless of provenance) to a specific directory
* **Soft Link** or **Symbolic Link** = file containing a (filesystem) path to another (potentially moved/erased) file
* _/_ (root) = top
* _boot_ = static files needed for initial boot stage (ie kernel images, bootloader configuration)
* _bin_ & _sbin_ = minimal set of essential user command binaries (eg `ls`, `cp`, `sh`) & system binaries (eg `fsck`, `iptables`), available during boot/rescue
* _dev_ = devices nodes providing user-space interfaces to kernel devices (ie they can be read/written to like a regular file)
  * _/dev/fd0_ = floppy drive
  * _/dev/null_ = special device that discards anything written to it and immediately returns EOF when read
  * _/dev/sda_ = device-file handle for first SCSI-class block disk Linux kernel discovers at boot/when hot-plugged
* _etc_ = host-specific system-wide configuration files & startup scripts (_/etc/ssh/sshd\_config_)
  * _/etc/passwd_ = plain-text mapping database of user names to IDs & defaults, only editable by **root** (via `vipw`)
  * _/etc/group_ = plain-text mapping database of group names to IDs & defaults, only editable by **root** (via `vigr`)
* _home_ = default location for regular users personal directories & data (ie _/home/{user}_)
* _lib_ & _lib64_ = shared libraries & kernel modules needed by programs in _/bin_ & _/sbin_
* _lost+found_ = automatically created at top of each ext* filesystems; recovered orphaned files found by `fsck`
* _media_ = mount points for removable media (CD-ROMs, USB drives), auto-mounted by desktop environments
* _mnt_ = generic mounting point for temp mounting filesystems by administrator
* _opt_ = optional ad-on software packages installed outside system's package manager (eg _/opt/{package}_)
* _proc_ = pseudo-filesystem exposing kernel & process informations as files (eg _/proc/cpuinfo_, per-PID directories)
* _root_ =  home directory for the _root_ user (keep separate from _/home_ for security & availability during single-user maintenance reasons)
* _run_ = early-boot temporary state like PID files & sockets, cleared at reboot
* _srv_ = system-served data (eg web, FTP, rsync repos)
* _sys_ = another virtual filesystem presenting hardware/driver details, reflecting the kernel's device-model tree
* _tmp_ = temporary files that may be deleted at reboot
* _usr_ = read-only shareable data & programs for normal operation
  * _/usr/bin_ contains ordinary user programs (not required for boot/rescue)
* _var_ = variable data that changes at run-time (eg logs, spool files, caches, mail queues, DBs, PID files)
  * _/var/spool_ = location where producer-consumer can meet & queue/consume data, surviving reboots (unlike _/tmp_)

## API

### [Commands](https://en.wikipedia.org/wiki/List_of_Unix_commands)

* `command $` = run in background
* `(command(s))` = runs one or more commands in a subshell
* `$(command(s))` = Command Substitution (aka string interpolation of command output), can be `echo`-ed or set to a variable

* [`AWK`](https://en.wikipedia.org/wiki/AWK) = full-fledged domain-specific progrmaming language for text processing (filter & pattern search) and data extraction/reporting tool
* `bash` = (opens a new) bash process
* `base64` = base64 encode/decode
* `bc` (basic calculator) = arbitrary-precision arithmetic language
* `bzip2` = (_bz2_) file compressor (Burrows-Wheeler block sorting text compression algorithm), better than gzip
* `cal` = calendar (eg `cal 9 1752` = specific month)
* `cat` (con**cat**enate) = read file content, outputs to standard output
  * `>newfile.txt` = create a new file _newfile.txt_ in edit mode; press `CTRL+D` to finish
  * `koko1 koko2` = concatenate two text files and display the result in the terminal
* `cd {path}` (change directory)
  * `cd ~` or just `cd` (without argument) = go to user directory
* `chmod` = change access rights (via octal value or specific right eg `chmod +x {file}`)
* `chown {user} {file}` = change owner
* `cmp` = compare two files byte by byte (see `diff`)
* `cp {file} {path}` = copy
* `cron` = job scheduler (_minute hour day month weekday_ (as 0-6), `@reboot` once at reboot)
* `crontab` = maintain crontab files for individual users
* `curl` = web request
* `cut` = split (`-d '{delimiter}'`) & splice (`-b {byte_range}`, `-c {char_range}`, `-f {fieldid_range}`)
  * `-f {fields}` = select only these fields
* `date` = system date
* `DATE`
* `deluser` & `delgroup` = remove a user or group from system
* `df` (disk free) = displays disk space (`-h` for human-readable)
* `diff` = content differences between two files files (see `cmp`)
* `du {file}` = disk usage (`-h(uman-readable)` = adds unit (_K, M, G_))
* `echo abc` = outputs _abc_ (`echo "koko kontan" > file` outputs to new or existing file)
* `env` = print current environment, or run a program in a modified environment (ie set environment variables then execute command in that altered context)
  * Used in scripts shebang (ie `#!/usr/bin/env {command}`) to let `env` find best fitting command
* `exit` = close session
* `fg ({job_id})` = brings background job to foreground (most recently backgrounded/stopped job if no argument given)
* `file` = determine file type
* `find {directory} {pattern}` = find files/folders under directory (eg `/` for everything, `.` for current, `home`)
  * `-empty` = find empty directory
  * `-perm` = find by permission
    * `664` = match exactly (_-rw-rw-r--_)
    * `-664` = match those and the rest can be whatever (_.rw.rw.r.._)
    * `/222` = any of those match (either user, group or other must have read permission)
    * `/a+x` = executable by all
  * `user {uname}` = owned by uname (numeric user ID allowed)
  * `group {gname}` = belonging to group gname (numeric group ID allowed)
  * `-type d` = find directory
  * `-type f` = find regular file
  * `-type l` = find symbolic link
* `finger` = inspects user (eg last logged in)
* `free` = displays available (RAM/swap) memory
* `fsck` (File System Consistency Check) = check & repair Linux filesystems
* `gdb` = GNU Debugger
* `gpasswd` = administer _/etc/group_ & _/etc/gshadow_
* `grep` (g/re/p aka global regular expression print) = match lines using regular expression patterns
* `gzip` = (_gz_) compress/expand files (Lempel-Ziv coding LZ77)
* `head` = displays just the beginning (see `tail`)
* `history` = CLI history
* `htop` = like `top` with more colors
* `ifconfig` or `ip address` = displays network interfaces (IP address & co)
* `info` = complete documentation about a command in Info format (more comprehensive than `man`)
* `iptables` = firewall information (see `ufw`)
* `jobs` = list jobs (`-l` adding process IDs, `-p` only process IDs)
* `kill {pid}` or `kill %{job_id}` = sends a signal a process (see `pkill`)
  * `kill -9` = SIGKILL signal
* `ldd {file}` = print shared object/libraries dependencies
* `less` = displays page by page
* `ln` = creates a link file to an existing file/directory
* `ln -s {file1} {file2}` (symbolic) = creates a soft link
* `ls` = liste folder content
  * `/` = lists root files
  * `-a` = all
  * `-A` = all except special entries (_._ & _.._)
  * `-h` = human-readable
  * `-i` = inode number
  * `-l` = long format (file type - file mode bits - # hard links - owner - group - size - timestamp - filename)
  * `abc*` = lists files starting with _abc_
* `man {command}` = help on command, by higher section number priority
  * `1` = user commands & programs (eg `crontab(1)`)
  * `2` = system calls (eg `open(2)`)
  * `3` = C library functions (eg `printf(3)`)
  * `4` = special files & device drivers (eg `radom(4)`)
  * `5` = file formats & configuration files (eg `crontab(5)`)
  * `6-9` = games, admin commands, kernel interfaces, etc (~ OS)
  * `man man` for help on help
* `md5sum` = compute & check MD5 (128-bit) message checksum/digest
* `mkdir` = make directory (`-p /a/b/c` = creates nested folders if they don't exist)
* `(un)mount {path eg /dev/floppy}` = (un)mount
* `mv {source} {target}` = rename/move
* `nc` (aka `netcat`) = open/send/listen to TCP/UDP/sockets connections, scan ports
  * `-l (-p) {port}` = listens on a given port (if data is sitting in inbound pipe buffer, it is sent as soon as client connects & a socket opens)
  * `-l -k` = keep listening (when a connection is completed, listen for another one)
* `netstat` (net statistics) or `ss` = displays open ports
  * `-tulpn` = TCP/UDP, listening, PID/Program name for sockets, don't resolve names
* `nmap` (Network Mapper) = network exploration & port scanner
* `od` = (octal) dumping aka display file content in DUMP format (`-tx1` for hexadecimal)
* `passwd` = change password
* `ping` = ICMP (`-c` count, `-s` packet size)
* `pkill {process_name}` = kill by name
* `ps` = lists processes
  * `aux(ww)` = every process on system (BSD syntax, _ww_ prevents truncation)
  * `-a` = all processes (except session leaders and those not associated with a terminal)
  * `-e` = every process on system
  * `-l` = long format
  * `-y` = don't show flags
* `pwd` (print working directory) = displays current directory name
* `reboot` (with `sudo`)
* `rm` (remove) = delete
  * `{file/dir} -f` (force) = without confirmation
  * `{dir} -r` (recursive) = deletes a directory and its content
* `rmdir` = remove directory
* `scp` = OpenSSH secure file copy
  * Eg upload a public SSH key `scp -P 2220 ~/.ssh/id_ed25519.pub bandit8@bandit.labs.overthewire.org:/tmp/mykey.pub`
* `screen` = full-screen window manager multi-plexing physical terminal between several processes (ie interactive shells)
* `sed` (**s**tream **ed**itor) = parse and transform text
  * `sed s` = substitute (eg `echo Sunday | sed 's/day/night/'` outputs _Sunnight_)
* `setgid` (Set Group Identity) = access rights flags allowing to run executable with group permissions
* `setuid` (Set User Identity) = access rights flags allowing to run executable with owner permissions
* `shred {file}` = replaces file content with random data
* `shutdown` (with `sudo`) = turn off computer (`-h now` for immediately)
* `socat` (SOckect CAT) = establishes bidirectional byte streams & transfers data between them
* `sort` = sort alphabetically
* `ss` = dump socket statistics (similar to `netstat`)
* `ssh {user}@{remote}` = connects to remote SSH server (interactively)
  * `'{command}'` = does not create a terminal, runs command immediately, exits
    * `-t` = force creating a terminal in that case when a command was provided
  * `-d` = SOCKS proxy
  * `-i {rsa_private_key}` = authenticate using a private key (ie receive a challenge that only it can meet)
  * `-p {port}`
  * `-v(v(v))` = (increasingly) verbose mode
  * `--noprofile --norc --rcfile {file}` = skips remote _.profile_ & _.bashrc_ launch configuration
  * Note that there is no option to pass a password immediately; that is to avoid it being visible in plaintext (via prompt history, or running process original arguments eg: `ps -eo args`)
* `ssh-keygen` = generates a pair of keys (in _~/.ssh_)
  * `-b` = number of bits
  * `-t [dsa | ecdsa | ecdsa-sk | ed25519 | ed25519-sk | rsa]` = key type
* `sshd` = OpenSSH daemon (ie a SSH server)
* `stat {file}` = file inode information
* `su` (switch user)
* `sudo` (superuser do) = runs a program with another user's priviledge (by default a superuser)
* `systemctl` = manage services (`start`, `stop`, `status`)
* `tail` = displays just the end (see `head`)
* `tar` = archiving utility
* `test` or `[` = check file types & compare values (returns _0_ for true, _1_ for false, see [Shell Scripting](#shell-scripting))
* `tmux` = terminal multiplexer
* `touch` = change file access & modification times
* `top` = running processes with PID, CPU, memory usage (à la Windows Task Manager, see `htop`)
* `touch {file(s)}` = creates one or moremultiple empty files
  * `one two three` = creates multiple files
  * `prefix{i..n}` = creates multiple files
  * `-d tomorrow koko` = creates file with given creation date
* `tr` = (translate/delete) characters manipulation
* `traceroute`
* `tty` = print file name of the terminal (if any) connected to (my program's) standard input
* `type {command}` = display information about command type
* `ufw` = sets firewall config (uses `iptables`)
* `uname` = display system information (`-a`=all, `-n`=system (host) name, also see `neofetch` utility)
* `uniq` = report/omit repeated lines (`-u` only unique lines)
* `vigr` = edit _/etc/group_
* `vipw`= edit _/etc/passwd_
* `wait` = blocks calling shell until one or more child processes (usually background jobs) have finished
* `wall` = write a message to all users
* `wc` = counts a file's total lines, words, bytes/characters, by default as a 4-columnar output
* `wget` = web request
* `whatis {command}` = one-line summary of command
* `whereis {command}` = displays all locations where command is located
* `which {command}` = display location of an executable
* `who` = information about users currently logged in
  * `-q` = all login names & number of users logged on
* `whoami` = user name associated with current effective user ID
* `write` = sends a message to another user
* `xxd` = hex dump (& reverse)
* `(un)zip`

### Pipes & Streams

* `a | b` = connects output of _a_ as input of _b_
* `> {target}` = points **stdout** to given file/device (this is processed _before_ that command runs, file is (re)created first)
* `>> {target}` = append to file
* `> {target} 2>&1` = points **stdout** to target, then redirects file-descriptor 2 (ie **stderr**) to same target as file-descriptor 1 (ie **stdout**), ie same target
* `&> {target}` = points both **stdout** & **standard** error to same file/device (note: bash-specific, non-POSIX-required)
* `&>> {target}` = same for append
* `>|` & `&>|` = force-overwrite
* `<(command)` = process substitution, feeds command result as a temporary read-only pseudo file
  * Eg `diff <(command1) <(command2)` = creates two temp files, diff them, then deletes them

### Variables

* `read {var}` = reads a line from stdin into variable
* `set` = display variables & functions
* `unset {var}` = deletes both shell & environment copies (if present) of a variable

* `var={value}` = defines a local variable (not inherited by children unless exported to _~/.bashrc_ ie `export var(={value})`)
* `$variable` = parameter expansion, use shell or environment variable
* `$-` = special Bash variable containing current shell flags
* `$?` = exit status (aka return code) of most recently executed command
* `$$` = current PID
* `$HOME` = user directory
* `$LOGNAME` = username
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
* `$TERM` = what kind of terminal (emulator) is it (eg _xterm-256color_, _vt100_, _linux_, or _dumb_)
* `$UID` = user ID

### Shell Scripting

* `?` = exactly one character
* `*` = zero or more characters
* `[abc]` & `[!abc]` = chaacter classes (one of these & not one of these)
* `{a,b,c}` = brace expansion
* Eg `for f in * .[!.]* ..?*; do … done` = loop on entries in a directory, excluding current (_._) & parent (_.._)
  * `.[!.]*` = all names starting with a single dot following by a char that is not a dot (then some stuff)
  * `..?*` = all names starting with two dots and at least one character (then some stuff)
* `[ expression ]` = POSIX-style test command (note: spaces are mandatory)
  * `[` = a synonym (ie either a hard link, or just a copy) for `test`, returns _0_ for true, _1_ for false
  * `]` = basically useless (but required) last argument to make `[` command look like a balanced expression
  * `if` = shell keyword that uses exit status of `[` (_0_ means success, non-zero means failure)
  * `-a` = logical AND (note: more legible to use `&&` with multiple `[…]` blocks)
  * `=` = string equality (works in all shell, POSIX compliant)
  * `==` = string equality (only in bash/ksh/zsh but not sh/dash)

```bash

```
