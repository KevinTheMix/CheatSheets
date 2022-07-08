# Unix

* `({cmd1}; {cmd2})` = creates new shell (_sh_), executes both commands, close shell

## Variables

* _HOME_ = user directory
* _PATH_ = path
* _PS1_ = prompt
  * `PS1 = \u \h \W \DATE` = sets prompt to _user machine currentfolder date_ (previous prompt can be saved in a variable and restored)
* _TERM_ = ?
* _$$_ = process number

## [Commands](https://en.wikipedia.org/wiki/List_of_Unix_commands)

* [`AWK`](https://en.wikipedia.org/wiki/AWK) = pattern scanning and filtering (actually a full-fledged domain-specific language used as a data extraction and reporting tool)
* `cal` = calendar
  * `cal 9 1752` = specific month
* [`cat`](https://en.wikipedia.org/wiki/Cat_(Unix)) (con**cat**enate) = read file content & write it to standard output
  * `cat >newfile.txt` = create a new file _newfile.txt_ in edit mode; press `CTRL+D` to finish
  * `cat koko1 koko2` = concatenate two text files and display the result in the terminal
* `chmod` = change access rights
* `chown` = change owner
* `cd` = change directory
  * `cd {nothing}` = go to user directory
* `cp` = copy
* `date` = system date
* `DATE`
* `du` = file properties (size, ..)
* `echo abc` = outputs _abc_
* `exit` = close session
* `grep` = match lines using regular expression patterns
* `less` = displays page by page
* `ls` = liste folder content
  * `ls /` = lists root files
  * `ls -a` = all
  * `ls -l` = long
  * `ls abc*` = lists files starting with _abc_
* `man`
  * `man {command}` = help on _command_ e.g. `man who`
  * `man man` = help on help
* `mkdir` = make directory
* `mv` = change name
* `passwd` = change password
* `pwd` = current directory name
* `touch` = change file access & modification times
* `rm` = remove (delete)
* `rmdir` = remove directory
* `sed` (**s**tream **ed**itor) = parse and transform text
  * `sed s` = substitute e.g. `echo Sunday | sed 's/day/night/'` outputs _Sunnight_
* `uname`
  * `uname -a`
  * `uname -n`
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
