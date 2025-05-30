# Unix

* `({cmd1}; {cmd2})` = creates new shell (_sh_), executes both commands, close shell

## Variables

* _HOME_ = user directory
* _PATH_ = path
* _PS1_ = prompt
  * `PS1 = \u \h \W \DATE` = sets prompt to _user machine currentfolder date_ (previous prompt can be saved in a variable and restored)
  * `PS1 = '[$LOGNAME / $UID: $$: ´PWD´ date + % ]>'` or `$(PWD)` or `$PWD`
  * `PS1 = "'$$'"`
  * `PS1 = '$$'`
  * `PS1 = "\$\$"`
* _TERM_ = ?
* _$$_ = process number

## [Commands](https://en.wikipedia.org/wiki/List_of_Unix_commands)

* [`AWK`](https://en.wikipedia.org/wiki/AWK) = full-fledged domain-specific language for text processing (filter & pattern search) and data extraction/reporting tool
* `cal` = calendar
  * `cal 9 1752` = specific month
* [`cat`](https://en.wikipedia.org/wiki/Cat_(Unix)) (con**cat**enate) = read file content & write it to standard output
  * `cat >newfile.txt` = create a new file _newfile.txt_ in edit mode; press `CTRL+D` to finish
  * `cat koko1 koko2` = concatenate two text files and display the result in the terminal
* `cd` = change directory
  * `cd {nothing}` = `cd ~` = go to user directory
* `chmod` = change access rights
* `chown {user} {file}` = change owner
* `cp` = copy
* `cron` = job scheduler (minute (0-59) hour (0-23) day (1-31) month (1-12) weekday (0-6))
* `date` = system date
* `DATE`
* `du {file}` = disk usage (`-h(uman-readable)` = adds unit (_K, M, G_))
* `echo abc` = outputs _abc_
* `exit` = close session
* `find` = find file
  * `find /-name {filename}`
  * `find /home '???*.c'`
* `fsck` = File System Consistency Check
* `grep` = match lines using regular expression patterns
* `less` = displays page by page
* `ln [-s] {file1} {file2}` = hard or soft (aka symbolic, via `-s` option) links
* `ls` = liste folder content
  * `ls /` = lists root files
  * `ls -a` = all
  * `ls -i` = inodes number
  * `ls -l` = long
  * `ls abc*` = lists files starting with _abc_
* `man`
  * `man {command}` = help on _command_ eg `man who`
  * `man man` = help on help
* `mkdir` = make directory (`-p /a/b/c` = creates folders in hierarchy if they don't exist)
* `(un)mount {path eg /dev/floppy}` = (un)mount
* `mv` = change name
* `od` = (octal) dumping aka display file content in DUMP format (`-tx1` for hexadecimal)
* `passwd` = change password
* `ps -al` = lists processes (-a=all, -l=long listing)
* `pwd` = current directory name
* `touch` = change file access & modification times
* `rm` = remove (delete)
  * `rm {dir} -rf` = delete directory without confirmation
* `rmdir` = remove directory
* `sed` (**s**tream **ed**itor) = parse and transform text
  * `sed s` = substitute eg `echo Sunday | sed 's/day/night/'` outputs _Sunnight_
* `stat {file}` = file inode information
* `uname` = display system information (`-a`=all, `-n`=system (host) name)
* `which {command}` = display the location of an executable
* `who` = who am I
  * `who -q`
  * `who -z`

### Streams

* `> koko` = (re)create file _koko_
* `>> koko` = append to file _koko_
* `cat /dev/fd0` = reads floppy drive
* `ls -l > /dev/fd0` = write to floppy drive
* `ls koko1 koko2 >o 2>&1` = ? (_o_ == screen content)
* `ls > /dev/null` = useless
