# Unix

## Quick Tips

* `~{user}` = shortcut for _/home/{user}_ (of course `~` is shorter for self)
* `~/.bash_history` = user history of Bash commands
* [bash](https://git.savannah.gnu.org/git/bash.git)
* [GNU Core Utilities](https://github.com/coreutils/coreutils)
* [Bash Prompt HOWTO](https://tldp.org/HOWTO/Bash-Prompt-HOWTO/index.html)
* `({cmd1}; {cmd2})` = creates new shell (_sh_), executes both commands, close shell

## Glossary

* **ELF** (Executable and Linkable Format) = a Unix executable file
* **GNU** (GNU's Not Unix) = collection of free software launched by Richard Stallman in 1983, a set of user-space tools added to most Linux kernels (eg gcc, Bash) under GNU GPL
* **Here Document** = file or input stream literal
* **Here String** = one-line heredoc
* **EUID** (Effective User ID) = actual user ID a process is running under, usually same as UID (but can be different when eg `sudo`)
* **IPC** (Inter-Process Communication) = eg pipes
* **Linux** = independant open-source re-implementation of Unix-like kernel by Linus Torvalds in 1991, released under GNU GPL
* **Orphan Process** = child process whose parent has died (terminated before child), automatically adopted & cleaned by `init` or more modern `systemd` (ie common ancestor of all processes with PID _1_)
* **Pipe** = kernel(-space) managed memory buffered stream between one process _stdout_ to another _stdin_ (ie a unidirectional synchronous IPC)
  * Producer process must first feed a pipe, ie flushing its internal user-space data into kernel-space pipe
  * **Anonymous Pipe** = stored in memory, exists only during lifetime of pipe-using processes (eg `a | b`)
  * **Named Pipe** (aka **FIFOs**) = appear as FS node but data actually also passed in memory via which unrelated processes can read/write (exist until deleted)
* **POSIX** (Portable Operating System Interface) = family of standards for compatilibity between OSes (eg APIs, CLI shells commands, utility interfaces )
* **Root** = built-in/default administrative (super)user account in Unix/POSIX
  * All root users are superusers (with UID _0_) but the opposite is not true (they are all equivalent in power)
  * Home directory is _/root_ (kept outside of _/home_ so always available even if user partitions are not mounted)
* **Shebang** = starting characters of a script used by OS kernel to determine which shell/utility will run that script
  * `#!/usr/bin/{command} -w` = specify command absolute location (with warnings `-w`)
  * `#!/usr/bin/env {command}` = use the environment to find command (can differ per user, and arguments eg `-w` cannot be provided)
* [Signal](https://en.wikipedia.org/wiki/Signal_(IPC)#POSIX_signals) = asynchronous message/notification sent to process to trigger specific behavior (eg quitting, error handling)
  * _SIGINT_ = interrupts aprocess (like via `Ctrl + C`)
  * _SIGKILL_ = terminates immediately & forcibly, without time to cleanup
  * _SIGTERM_ = signal to terminate (can be ignored by the process)
* **Standard I/O/Err** = special file descriptors associated with a (single) process (not actual disk files, actually connected to terminal, pipes, sockets, etc, but managed by OS like file handles so we can read/write)
* **Stream** = continuous flow of data where programs can read/write (concurrently in some cases eg pipes) in real-time, typically through standard I/O, pipes & files
* **Superuser** = any process running with special UID _0_ (eg **Root** or via `sudo`, but more can be added to _/etc/passwd_)
  * Any user/process with UID _0_ has full control over the system (ie can read/write/execute anything and change any system setting)
* **Syscall** = request by a user-space program to a kernel service (eg `read()`, `write()`, `fork()`, `execve()`, `mmap()` memory allocation, `open()`, `unlink()`, `socket()`, `bind()`)
* **Teletypewriter** = an ancient electromechanical printer-keyboard device
* Terminals
  * **Hardware Terminal** = old-ass physical device (keyboard + printer/screen) letting a human talk to a multi-user computer/mainframe over a serial line
  * **TTY** (Teletypewriter) = any (hardware or software) text terminal, a special kernel device file (eg _/dev/tty_, _/dev/tty1_, _/dev/pts/3_, etc) from which shells can read/write
  * **Terminal Emulator** = software GUI that imitates vintage hardware terminals by opening a pseudo-terminal so programs think they interact with a real tty, translating stream of I/O control codes into pixels
  * **Pseudo-Terminal** (PTY) = pair of kernel objects making (master) applications (eg `ssh`, `tmux`, a new terminal tab) believe they interact with a human (TTY) whereas it is another (slave) program
    * Master end  (_/dev/ptmx_) = owned by terminal emulator
    * Slave end  (_/dev/pts/N_) = looks exactly like a real tty device but real I/O originates from another program launched by user (eg `shell`, `ssh`, `top`, `vim`)
* **tmpfs** = RAM-based filesystem (stores files in memory, not disk)
* **Unix** = original OS family developed by AT&T Bell Labs in 1970, with most variants being propriertary (eg Solaris)
* **Useless Use Of Cat** (UUOC) = jargon describing piping a cat command (`cat file | cmd`) in place of a more efficient yet less legible shell open (`cmd < file`)
* **Zombie Process** = completed but its entry still exists in process table (until parent uses `wait()`)

* _BusyBox_ = several (300) Unix common command utilities in a single executable file (aka _"The Swiss Army knife of Embedded Linux"_)
* _Cygwin_ = FOSS & Linux-like tools for Windows
* _WebMin_ = web-based (ie webpages) server management control panel for Unix systems (eg users, disk quotas, services, config files)
* _Wine_ = FOSS compatibility layer between Windows applications/games and Unix-like OSes (ie Linux & macOS)

### Distros

* **Alpine Linux** = security-oriented lightweight Linux distribution
* **Arch Linux** = minimal base system offering rapid update cycle of its software (via rolling-release model, à la Firefox)
* **CentOS** = Linux distribution (_discontinued_)
* **Gnome** = FOSS desktop environment for Linux/Unix-like OS used by many distributions
* **Kali Linux** = Debian-based Linux distribution designed for digital forensics & pentesting
* **Lubuntu Alternate** = Even lighter Lubuntu for low-RAM PC/laptops
* **Lubuntu Desktop** = Lightweight Linux distribution based on Ubuntu
* **Parrot OS** = Debian-based Linux distribution for cybersecurity/hackers/sysadmins (with 600+ tools for blue/read team operations)
* **Tails** (aka _The Amnesic Incognito Live System_) = secure DVD/USB Debian Linux Tor network based OS, writes to RAM not HDD (_1300MB_)

## File System

* _.{file}_ = hidden file
* **ext** = informal shorthand for Linux extended-filesystem family
  * **ext** (**extfs**) = first native, 16MB files, no journaling (1992)
  * **ext2** = 2TB volumes, 4GB files, stable but not journaled (1993)
  * **ext3** = **ext2** + metadata journal enabling faster recovery after crashes (2001)
  * **ext4** = 1EB volumes, 16TB files, extents, delayed allocations, checksums, online defrag (2008-present)
* **File Descriptor** = a small non-negative integer that a process uses to refer to an open file object inside kernel
  * Every new process starts with three already-open descriptors (stdin _0_, stdout _1_, and stderr _2_ as a parallel channel to provide non-necessarily error-related feedback)
* **File Object** = anything that implements byte-stream interface (eg file, directory, block/character devices, pipes/fifos, sockets)
* **File-type Indicator** = file (_-_), directory (_d_), symlink (_l_), devices (_c_ & _b_), FIFO/pipe (_p_), socket (_s_)
* **File Mode (String)** = User/Group/Other `rwx` Permissions + Optional attribute
  * **User** = creator, **Group** = group User belongs to, **Other** = everyone who has access (ie an account) on the system
  * **Read** = can view & copy contents
  * **Write** = can modify & delete (needs execute permission as well) content
  * Eg `d-wx` = mailbox-style, can add new files or move/delete existing ones by name (if known) and `cd` to it, but `ls` not permitted
  * **Execute** = can run an exe file, enter directory (`cd`), and list their permissions (`ls -l`)
  * _s_ (eg _-rwsr-xr-x_) = **Owner/Group Execute** (set-UID/GID) = (if user can execute) use owner/group permissions when executing this file
    * Set via octal value _2000_ (group) & _4000_ (owner)
  * _t_ (eg _drwxrwxrwt_) = **Sticky Bit** = special mode for directories (& rarely files) that restricts unlinking (aka deleting) & renaming its entries
    * Only file owner, directory owner or _root_ can delete/rename entries (no other users even with write persmissions)
    * Eg world-writable directories such as _/tmp_ or _/var/tmp_ where everyone can write but not tamper with others files
    * Set via octal value _1000_
* _/_ (root) = top
* _boot_ = static files needed for initial boot stage (ie kernel images, bootloader configuration)
* _bin_ & _sbin_ = minimal set of essential user command binaries (eg `ls`, `cp`, `sh`) & system binaries (eg `fsck`, `iptables`), available during boot/rescue
* _dev_ = devices nodes providing user-space interfaces to kernel devices (ie they can be read/written to like a regular file)
  * _/dev/fd0_ = floppy drive
  * _/dev/null_ = special device that discards anything written to it and immediately returns EOF when read
  * _/dev/sda_ = device-file handle for first SCSI-class block disk Linux kernel discovers at boot/when hot-plugged
* _etc_ = host-specific system-wide configuration files & startup scripts (_/etc/ssh/sshd\_config_)
  * _/etc/group_ = plain-text mapping DB of group names to IDs & defaults, only editable by **root** (via `vigr`)
  * _/etc/nologin_ = presence of this file prevents unprivileged users from logging into the system (useful to temporarily disable all unprivileged login ie non-root users)
  * _/etc/passwd_ = plain-text mapping DB of user names to IDs & defaults (home dir, login shell), only editable by **root** (via `vipw`)
  * _/etc/os-release_ =  OS version information
  * _/etc/shells_ = list of valid login shells (any script can be added here, even those that exit immediately)
* _home_ = default location for regular users personal directories & data (ie _/home/{user}_)
* _lib_ & _lib64_ = shared libraries & kernel modules needed by programs in _/bin_ & _/sbin_
* _lost+found_ = automatically created at top of each ext* filesystems; recovered orphaned files found by `fsck`
* _media_ = automated mounting of removable media (CD-ROMs, USB drives), by GUI desktop environment or system services (eg `udisks`)
* _mnt_ = manual mounting by (sys)administrators
* _opt_ = optional ad-on software packages installed outside system's package manager (eg _/opt/{package}_)
* _proc_ = pseudo-filesystem exposing kernel & process informations as files
  * _/proc/{PID}_ = per-process information
  * _/proc/{PID}/maps_ = live view of every virtual memory region mapped by Kernel into process' address space
  * _/proc/cpuinfo_ = CPU cores information
* _root_ =  home directory for the _root_ user (keep separate from _/home_ for security & availability during single-user maintenance reasons)
* _run_ = early-boot temporary state like PID files & sockets, actually a tmpfs (ie stored in RAM) so cleared at reboot
* _srv_ = system-served data (eg web, FTP, rsync repos)
* _sys_ = another virtual filesystem presenting hardware/driver details, reflecting the kernel's device-model tree
* _tmp_ = temporary files that may be deleted at reboot
* _usr_ = read-only shareable data & programs for normal operation
  * _/usr/bin_ contains ordinary user programs (not required for boot/rescue)
* _var_ = variable data that changes at run-time (eg logs, spool files, caches, mail queues, DBs, PID files)
  * _/var/spool_ = location where producer-consumer can meet & queue/consume data, surviving reboots (unlike _/tmp_)

## API

### [Commands](https://en.wikipedia.org/wiki/List_of_Unix_commands)

* `Ctrl + c` = kill current process (sends _SIGINT_ interrupt to foreground process), except shell itself designed to stay running
* `Ctrl + d` = end of input (EOF), actually lets shell exit since it considers session is over
  * Has true EOF effect only when on a new blank line (if not, press it twice so first one signals partial EOF for current non-empty line)

* `adduser {user}` = create user on system
* `apt` = high-level CLI to package management system (requires `sudo`)
  * `sudo apt autoremove`
  * `sudo apt install python-is-python3` = create symlink
  * `sudo apt purge {packages}` = remove packages
* `awk` = flexible full-fledged domain-specific programming language & data extraction/reporting text processing tool (conditional, filter, regex pattern, calculated, à la C# Linq)
  * `awk {file} 'criteria{action(s)}'` = reads input from file/stidin and perform action on filtered data
  * Criteria = condition that can be empty (always true), _BEGIN_/_END_ before/after, comparison, regex, variables & (associative) arrays
  * _$i_ are split fields (or words), and _$0_ is whole line
  * _FILENAME_ = argument filename (if provided)
  * _FNR_ = file record number
  * _FS_ = field separator (` ` by default)
  * _NF_ = field number
  * _NR_ = record (aka line/row) number
  * _OFS_ = field print output separator (` ` by default)
  * _ORS_ = line print output separator (`\n` by default)
  * `ls -l | awk 'BEGIN{print"Printing file names…"}{print $9}` = print file names
  * `ls -l | awk 'BEGIN{print "Large files"}$5>100000{print}`
  * `ls -l | awk 'NR%2==0{print}` = print all of even numbered lines
  * `ls -l | awk 'NF>2{print}'`
  * `ls -l | awk 'BEGIN{print "End of July large files"}(NF>2)&&($5>10000)&&($6="July")&&($7>15){print}'`
  * `ls -l | awk 'BEGIN{printt "Les fichiers PDF"} $9 ~ /.*pdf/{print}'` = regex pattern search (ie `~ /{pattern}/`)
  * `ls -l | awk 'BEGIN{sum=0}(NR>1){sum=sum+$2}END{print "Total = ",sum}'` = define variables
  * `ls -l | awk 'NR>1{print $(NF-1)}'` = access fields by relative index
  * `ls -l | awk 'BEGIN{i=0}(NR>1)&&(NR<=NF){print $(i+1); i++}'` = calculated variable & index
  * `kill $(ps -aux | awk '$1="user"{print $2}')` = kills all processes linked to given user (ie awk can map/fetche PID per user)
* `bash ({script})` = starts a new bash process (interactive shell, or interprets script if provided)
  * `-c '{string}'` = runs string in new Bash subprocess (environment is isolated, positional parameters _$i_ via eg `bash -c 'echo $1' -- "hello"`)
* `base64` = base64 encode/decode
* `bc` (basic calculator) = arbitrary-precision arithmetic language
* `bzip2` = (_bz2_) file compressor (Burrows-Wheeler block sorting text compression algorithm), better than gzip
* `cal` = calendar (eg `cal 9 1752` = specific month)
* `cat` (con**cat**enate) = read & displays (to _stdout_) contents of files or _stdin_
  * `cat > {file}` = (re)create file in edit mode (`Ctrl + d` to finish, or `Enter` then `Ctrl + c`)
  * `koko1 koko2` = concatenate two text files and display the result in the terminal
* `chattr` = change file attributes on a Linux file system (eg `+i`/`-i` toggle immutable so cannot be deleted/renamed, even by root)
* `chmod` = change access rights (via octal value or specific right)
  * `chmod +x {file}` = adds execute rights for everyone (owner, group & others)
* `chown {user} {file}` = change owner
* `chsh` = change user login shell (only for own account, unless superuser)
* `cmp` = compare two files byte by byte (see `diff`)
* `cp {file} {target}` = copy (target may be a file, or directory in which case source file is added to that directory)
* `cron` = job scheduler (_minute hour day month weekday_ (as 0-6), `@reboot` once at reboot)
* `crontab` = maintain crontab files for individual users
* `curl` = transfer data from/to a (mail or web) server using URLs
  * `-d` = data to send in a HTTP POST request
  * `-s` = silent/quiet mode (no progress/error messages)
  * `-H {header}` = header (eg `accept: application/json` or `Content-Type: application/json`)
  * `-X` = request method to use when starting the transfer
  * Eg `curl http://wttr.in/brussels?format=3` for local weather
* `cut` = split (`-d '{delimiter}'`) & splice (`-b {byte_range}`, `-c {char_range}`, `-f {fieldid_range}`)
  * `-f {fields}` = select only these fields
* `date` = system date
* `DATE`
* `dd` = carve out, convert, copy a file
* `deluser` & `delgroup` = remove a user or group from system
* `df` (disk free) = displays disk space (`-h` for human-readable)
* `diff` = content differences between two files files (see `cmp`)
* `dir` = list directory contents (identical to `ls`)
* `du {file}` = disk usage (`-h(uman-readable)` = adds unit (_K, M, G_))
* `env` = print current environment, or run a program in a modified environment (ie set environment variables then execute command in that altered context)
  * Used in scripts shebang (ie `#!/usr/bin/env {command}`) to let `env` find best fitting command
* `file` = determine file type
* `find {directories}` = recursively find all files/directories under one or more directories
  * `.` = current directory (default if none specified)
  * `/` = everything
  * `/{path}` = a directory by absolute path
  * `{dir}` = local directory
  * `-delete` = delete found files (warning: deletes everything that matches, if permission to do so)
  * `-empty` = find empty directory
  * `-group {gname}` = belonging to group gname (numeric group ID allowed)
  * `-user {uname}` = owned by uname (numeric user ID allowed)
  * `-perm` = find by permission
    * `664` = match exactly (_-rw-rw-r--_)
    * `-664` = match those and the rest can be whatever (_.rw.rw.r.._)
    * `/222` = any of those match (either user, group or other must have read permission)
    * `/a+x` = executable by all
  * `-type` = find by type (`d` directory, `f` regular file, `l` symbolic link)
* `finger` = inspects user (eg last logged in)
* `free` = displays available (RAM/swap) memory
* `fsck` (File System Consistency Check) = check & repair Linux filesystems
* `gdb` = GNU Debugger
* `gpasswd` = administer _/etc/group_ & _/etc/gshadow_
* `grep {pattern} {file}` (g/re/p aka global regular expression print) = match lines using regular expression patterns
  * `-i` = ignore case
  * `-P` = use regular expressions
  * `-x` = pattern must match whole line (eg regex `^pattern$`)
* `gzip` = (_gz_) compress/expand files (Lempel-Ziv coding LZ77)
* `head` = displays just the beginning (see `tail`)
* `help {command}` = (shell builtin) help about a command
* `history` = CLI history
* `htop` = like `top` with more colors
* `id ({users})` = print user & group information for user(s) (or current process when none provided)
* `ifconfig` or `ip address` = displays network interfaces (IP address & co)
* `info` = complete documentation about a command in Info format (more comprehensive than `man`)
* `init` or `systemd` = system & service manager, acts as init system bringing up userspace services when run as first process on boot (as PID _1_)
* `iptables` = firewall information (see `ufw`)
* `ldd {file}` = print shared object/libraries dependencies
* `less` = displays page by page (more efficient than `more`, used by `man` to display its help)
* `ln {target} {name}` = creates a link file to an existing file/directory
  * `-s` aka `--symbolic` = creates a soft link
* `login` = begin session on system (should be invoked via `exec login` from shell, so shell gets replaced and newly logged user does not return to caller previous shell session after exiting)
  * `nologin` = politely refuse a login
* `ls` = liste folder content
  * `/` = lists root files
  * `-a` = all (hidden, _._ & _.._)
  * `-A` = all except special entries (_._ & _.._)
  * `-h` = human-readable
  * `-i` = inode number
  * `-l` = long format (file type - file mode bits - # hard links - owner - group - size - timestamp - filename)
  * `abc*` = lists files starting with _abc_
* `man ({section}) {command}` or `man {command}(.{section})` = help on command (section number indicate category, not priority/popularity)
  * `1` = user commands & programs (eg `crontab(1)`)
  * `2` = system calls (eg `open(2)`)
  * `3` = C library functions (eg `printf(3)`)
  * `4` = special files & device drivers (eg `radom(4)`)
  * `5` = file formats & configuration files (eg `crontab(5)`)
  * `6-9` = games, admin commands, kernel interfaces, etc (~ OS)
  * `man man` for help on help
* `md5sum` = compute & check MD5 (128-bit) message checksum/digest
* `mkdir` = make directory (`-p /a/b/c` = creates nested folders if they don't exist)
* `mkfifo` = create FIFOs (ie named pipes)
* `mktemp` = create temp file, or directory (`-d`)
* `modprob` = add/remove modules from Linux Kernel
* `more` = display file contents in a terminal with paging (read whole file upfront, see `less`)
* `mount {path eg /dev/floppy}` & `unmount` = (un)mount a filesystem
* `mv {source} {target}` = rename/move
* `nano` = small friendly editor
* `nc` (aka `netcat`) = open/send/listen to TCP/UDP/sockets connections, scan ports
  * `-l (-p) {port}` = listens on a given port (if data is sitting in inbound pipe buffer, it is sent as soon as client connects & a socket opens)
  * `-l -k` = keep listening (when a connection is completed, listen for another one)
* `netstat` (Net Statistics) or `ss` (Socket Statistics, see below) = displays open ports
  * `-tulpn` = TCP/UDP, listening, PID/Program name for sockets, don't resolve names
* `nmap` (Network Mapper) = network exploration & port scanner
* `od` = (octal) dumping aka display file content in DUMP format (`-tx1` for hexadecimal)
* `passwd` = change password
* `pgrep` = look up processes by name
* `pidwait` = wait processes by name
* `ping` = sends ICMP ECHO_REQUEST to hosts (`-c` max count, `-q` quiet, `-s` packet size, `-W` timeout in seconds)
* `pkill {name}` = kill processes by name
* `ps` = lists processes
  * `aux(ww)` = every process on system (BSD syntax, _ww_ prevents truncation)
  * `-a` = all processes (except session leaders and those not associated with a terminal)
  * `-e` = every process on system
  * `-f` = full-format (adds columns, displays command arguments)
  * `-l` = long format
  * `-o {format}` = output format (eg `ps -o ppid` displays parent PID, `ps -o comm=` displays commands without path/arguments/column header)
  * `-p {pid(s)}` = select by pid (eg `ps -p $$` returns about current shell process)
  * `-u {user}` = select by user (eg `ps -u $USER` returns all current user processes)
  * `-y` = don't show flags
  * `--forest` = ASCII art process tree
* `reboot` (with `sudo`)
* `reset` = initialize/reset terminal state
* `rm` (remove) = delete
  * `{file/dir} -f` (force) = without confirmation
  * `{dir} -r` (recursive) = delete directory & its content
* `rmdir` = remove directory
* `scp` = OpenSSH secure file copy (`-P {port}` with uppercase P unlike `ssh -p {port}`)
* `screen` = full-screen window manager multi-plexing physical terminal between several processes (ie interactive shells)
* `sed` (**s**tream **ed**itor) = parse & transform text (reads pipe stream line by line, not an entire file in memory)
  * `sed s` = substitute (eg `echo Sunday | sed 's/day/night/'` outputs _Sunnight_)
* `setgid` (Set Group Identity) = access rights flags allowing to run executable with group permissions
* `setuid` (Set User Identity) = access rights flags allowing to run executable with owner permissions
* `sftp` = OpenSSH secure file transfer
* `sh` = (opens a new) dash process (_/bin/sh_)
* `shred {file}` = replaces file content with random data (`-n 1` for single pass)
* `shutdown` (with `sudo`) = turn off computer (`-h now` for immediately)
* `sleep {n}({suffix})` = delay for a specific amount of time (`s` second default suffix, `sleep {time} &` in background)
* `socat` (SOckect CAT) = establishes bidirectional byte streams & transfers data between them
* `sort {file}` = sort alphabetically
* `ss` = dump socket statistics (similar to `netstat`)
* `ssh {user}@{remote}` = connects to remote SSH server (interactively)
  * `-d` = SOCKS proxy
  * `-i {rsa_private_key}` = authenticate using a private key (ie receive a challenge that only it can meet)
  * `-p {port}`
  * `-v(v(v))` = (increasingly) verbose mode
  * `--noprofile --norc --rcfile {file}` = skips remote _.profile_/_.bashrc_ launch configuration
  * `{command}` = does not create a terminal, runs command immediately, exits (unless `-t` is specified which creates a terminal)
  * Transmits data securely, byte-for-byte (therefore binary data works too)
  * Everything is encrypted and sent to server, command results are sent back to local shell's _stdout_/_stderr_ via ssh tunnel (so shell can handle potential `> {file}` over that output)
  * Note that there is no option to pass a password immediately; that is to avoid it being visible in plaintext (via prompt history, or running process original arguments eg: `ps -eo args`)
* `ssh-keygen` = generates a pair of keys (in _~/.ssh_)
  * `-b` = number of bits
  * `-t [dsa | ecdsa | ecdsa-sk | ed25519 | ed25519-sk | rsa]` = key type
* `sshd` = OpenSSH daemon (ie a SSH server)
* `stat {file}` = file/file system status (inode number, permissions, owner, group, timestamps, etc)
  * `-c "{format}"` or `--format "{format}"` = manage outputs (eg `%a` octal permissions, `%i` inode #, `%U` owner username)
  * Basically a more targeted `ls` on a single file, with access to individual properties
* `su` (switch user) = start new (nested) login session as user (exit back to previous shell)
* `sudo` (superuser do) = runs a program with another user's privilege (by default a superuser)
  * Useful to limit surface area by limiting direct root usage (ie disable direct login as root, especially remotely eg via ssh)
  * Incarnates least privilege principle: normal users (with admin rights) don't need superuser powers all the time
  * sudo calls are logged, so there's built-in auditability/traceability
* `systemctl` = manage services (`start`, `stop`, `status`)
* `tail` = displays just the end (see `head`)
* `tar` = archiving utility
* `tee` = read _stdin_, write to _stdout_ & files simultaneously (ie useful for logging, `-a` append)
* `timeout {duration} {command}` = run a command with a time limit (ie start command & kills it if still running after duration)
* `tmux` = terminal multiplexer (create & access several terminals from a single screen, actually a shell itself)
  * `tmux ls` or `tmux list-sessions` = list all sessions managed by server
  * `tmux attach -t {session_id}` = re-enter a session
  * `tmux kill-session -t {session_id}` = kill a session
  * `Ctrl + b` = prefix key to launch a control commands
    * `"` = split window vertically
    * `{arrow}` or `o` = select pane
    * `d` = detach current client (session keeps on running)
  * Also offers scripting commands
* `top` = running processes with PID, CPU, memory usage (à la Windows Task Manager, see `htop`)
* `touch {file(s)}` = creates one or multiple empty files, or update existing files access/modification times
  * `f1 f2 f3` = creates multiple files
  * `prefix{i..n}` (literal curly braces) = creates multiple files
  * `-d tomorrow koko` = creates file with given creation date
* `tr {from} {to}` = (translate/delete) characters manipulation (eg `tr a-z A-Z` uppercase, `tr 'A-Za-z' 'N-ZA-Mn-za-m'` ROT13)
* `traceroute`
* `tty` = print file name of the terminal (if any) connected to (my program's) standard input
* `ufw` = sets firewall config (uses `iptables`)
* `uname` = display system information (`-a`=all, `-n`=system (host) name, also see `neofetch` utility)
* `uniq {file}` = report/omit repeated lines (`-u` only unique lines)
* `vi(m)` = Vi IMproved
* `vimtutor` = Vim tutorial
* `vigr` = edit _/etc/group_
* `vipw`= edit _/etc/passwd_
* `wall` = write a message to all users
* `wc` = counts a file's total lines, words, bytes/characters, by default as a 4-columnar output
* `wget` = web request
* `whatis {command}` = one-line summary of command
* `whereis {command}` = displays all locations where command is located
* `which {command}` = locate a command (eg `which $SHELL`)
* `who` = information about users currently logged in
  * `-q` = all login names + number of users logged on
  * Eg `who | awk '{print $1}' | sort | uniq` = display sorted unique login names
* `whoami` = user name associated with current effective user ID
* `whois` = opens a TCP socket, calls a WHOIS server, and prints result
* `write` = sends a message to another user
* `xxd` = hex dump (& reverse)
* `(un)zip`

#### System Calls

* `brk()`/`sbrk()` = (_obsolete_) controls heap size
* `exec_()` = standard C library functions family
  * This creates a new process in same memory space, replacing existing segments in memory, but keeping original PID
* `execve(file, argv, envp)` = executes program by path, replacing current process
* `execvp(file, argv)`
* `fork()` = creates a new process (**returns** _0_ in child and child's PID in parent) with virtual memory copy of its parent until a write operation is performed (aka copy-on-write)
  * Children inherit their parent's file-descriptor table entries, so all stdout arrive in same open-file object (so all outputs go to same terminal/file)
* `mmap()` = maps a region of of a process virtual memory (address space) & a source of data (ie a file/device or anonymous memory via local pointer)
* `wait()` = wait for first child to die
* `waitpid({pid})` = wait for specific pid
