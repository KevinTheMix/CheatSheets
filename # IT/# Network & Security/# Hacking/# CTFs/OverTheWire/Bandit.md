# [Bandit](https://overthewire.org/wargames/bandit)

## Quick Tips

* Connect using `ssh bandit@bandit.labs.overthewire.org -p 2220`, then type/paste password
* All passwords are in _/etc/bandit\_pass_ (of course each user can only see his)
  * So we can always use `cat /etc/bandit_pass/bandit{N}` instead of `echo {password}`
* For convenience, create a directory _/tmp/koko_ at the start (`mkdir /tmp/koko;chmod 777 /tmp/koko`)

## Levels

* Level 0 = `ls` then `cat readme` (**ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If**)
* Level 1 = `ls` then `cat ./-` (**263JGJPfgU6LtdEvgfWU1XP5yac29mFx**)
* Level 2 = `ls` then `cat "spaces in this filename"` (**MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx**)
* Level 3 = `ls -a` then `cat inhere/...Hiding-From-You` (**2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ**)
* Level 4 = `file inhere/*` then `cat inhere/-file07` (**4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw**)
* Level 5 = `ls` then `ls inhere/* -al` then `find inhere -size 1033c` (**HWasnPhtq9AVKe0dmk45nxy20cvUa6EG**)
* Level 6 = `find / -size 33c -user bandit7 -group bandit6 2>/dev/null` (**morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj**)
  * That last part filters out all 'Permission denied' error messages
* Level 7 = `cat data.txt | grep millionth` (**dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc**)
* Level 8 = `cat data.txt | sort | uniq -u` (**4CKMh1JI91bUIZZPXDqGanal4xvAg0JM**)
* Level 9 = `strings data.txt | grep -Px ==+.*` (**FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey**)
* Level 10 = `base64 -d data.txt` (**dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr**)
* Level 11 = `tr 'A-Za-z' 'N-ZA-Mn-za-m' < data.txt` (**7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4**)
* Level 12
  * `cp data.txt /tmp/koko/data.txt` then `cd /tmp/koko`
  * `xxd -r data.txt data.gz` = hex un-dumps
  * `gzip -dN data` = unzip, `-N` restores original zipped file name (_data2.bin_)
  * `bzip2 -d data2.bin` (_data2.bin.out_)
  * `gzip -dN data2.bin.out -S 'out'` = unzip again, indicating the suffix (_data4.bin_)
  * `tar -xf data4.bin` = untars from archive file (_data5.bin_)
  * `tar -xf data5.bin` = untars from archive file (_data6.bin_)
  * `tar -xf data6.bin` = untars from archive file (_data8.bin_)
  * `tar -xf data8.bin` = untars from archive file (_data8.bin_ again)
  * `gzip -dN data8.bin -S 'bin'` = final unzip (_data9.bin_ ASCII text filed)
  * `cat data9.bin` (**FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn**)
  * `rm -rf /tmp/kokoriko`
* Level 13
  * (locally) `scp -P 2220 bandit13@bandit.labs.overthewire.org:~/sshkey.private .\bandit14.pem` = downloads RSA PRIVATE KEY file
  * (locally) `ssh bandit14@bandit.labs.overthewire.org -p 2220 -i .\bandit14.pem` = pass key as argument while connecting (no password sent)
  * (now logged as bandit14) `cat /etc/bandit_pass/bandit14` (**MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS**)
* Level 14 = (still logged from previous level) `echo MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS | nc localhost 30000` (**8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo**)
* Level 15 = `echo 8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo | ncat --ssl localhost 30001`
(**kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx**)
  * Alternatively `openssl s_client localhost:30001`
* Level 16
  * `nmap localhost -p31000-32000` = locate listening ports
  * `nmap --script ssl-enum-ciphers localhost -p 31046,31518,31691,31790,31960` = analyze found ports
  * `echo kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx | ncat --ssl localhost 31518` = wrong, returns the string
  * `echo kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx | ncat --ssl localhost 31790` = bingo (see RSA PRIVATE KEY)
  * `mkdir /tmp/kokoriko`
  * `echo kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx | ncat --ssl localhost 31790 > /tmp/kokoriko/sshkey.private`
  * (locally) `scp -P 2220 bandit16@bandit.labs.overthewire.org:/tmp/kokoriko/sshkey.private .\bandit17.pem` (then connect with bandit16 &  `rm /tmp/kokoriko -rf`)
  * (locally) `ssh bandit17@bandit.labs.overthewire.org -p 2220 -i .\bandit17.pem`
* Level 17 = `diff passwords.old passwords.new` (**x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO**)
* Level 18
  * (optional) `scp -P 2220 bandit18@bandit.labs.overthewire.org:~/.bashrc .\bashrc.txt` (retrieves offending rc file)
  * `ssh -t bandit18@bandit.labs.overthewire.org -p 2220 ls` (_~/readme_)
  * `ssh -t bandit18@bandit.labs.overthewire.org -p 2220 cat readme` (**cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8**)
* Level 19 = `./bandit20-do cat /etc/bandit_pass/bandit20` (**0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO**)
* Level 20
  * Two terminals solution (ie two Windows Terminal, or via `tmux`, `Ctrl + b, "`, `Ctrl + b, ↑↓`)
    * (from a secondary terminal) `nc -l 2097` = star a TCP server
    * `./suconnect 2097` = connects client to server
    * (in secondary terminal) `0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO` (**EeoULMCra2q0dSkYj561DX7s1CpBuOBt**)
  * Single terminal solution (uses a temp file)
    * `( echo 0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO | nc -l 2097 > /tmp/koko/bandit21.pass ) &` = starts background TCP listen with data sitting in pipe buffer
    * `./suconnect 2097`
    * (optional) `wait`, however `netcat` will prompty terminates on its own (since it's not configured to keep running after first connection eg via `-k`, and parent shell will wait for it)
    * `cat /tmp/koko/bandit21.pass` (**EeoULMCra2q0dSkYj561DX7s1CpBuOBt**)
* Level 21
  * `ls /etc/cron.d` = check out cron directory as indicated by objective
  * `cat /etc/cron.d/cronjob_bandit22` = open specific crontab
  * `cat /usr/bin/cronjob_bandit22.sh` = check out script run by crontab every minute
  * `cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv` = contains a copy of password (**tRae0UfB9v0UzbCdn9cY0gQnds9GF58Q**)
* Level 22
  * `ls /etc/cron.d`
  * `cat /etc/cron.d/cronjob_bandit23`
  * `cat /usr/bin/cronjob_bandit23.sh` = see script source, adapt parts of it (see next command)
  * `cat /tmp/$(echo I am user bandit23 | md5sum | cut -d ' ' -f 1)` (**0Zf11ioIjMVN551jX3CmStKLYqjk54Ga**)
* Level 23
  * `ls /etc/cron.d`
  * `cat /etc/cron.d/cronjob_bandit24`
  * `cat /usr/bin/cronjob_bandit24.sh` = script that executes (bandit23's) then deletes all scripts in foo directory
  * `ls /var/spool/bandit24/foo -l` = foo content is denied
  * `ls /var/spool/bandit24 -l` = foo itself is _drwxrwx-wx_, so we can add new files/scripts
  * `cd /var/spool/bandit24/foo`
  * (optional) `echo -e '#!/bin/bash\nls -l > /tmp/koko/out;chmod 777 /tmp/koko/out' > koko.sh; chmod +x koko.sh` = script to `ls`
  * `echo -e '#!/bin/bash\ncat /etc/bandit_pass/bandit24 > /tmp/koko/out;chmod 777 /tmp/koko/out' > koko.sh; chmod +x koko.sh` = script to password steal
  * `cat /tmp/koko/out` (**gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8**)
  * (optional) `rm /tmp/koko/out`
* Level 24
  * `nc localhost 30002` = connects, sees prompt asking for password & pin
  * `(for pin in {1..9999}; do echo "gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8 $pin"; done) | nc localhost 30002 2> /dev/null` (**iCi86ttT4KSNe1armKiwbQNmB3YJP3q4**)
* Level 25
  * `ls -l` (_bandit26.sshkey_), `exit`
  * `scp -P 2220 bandit25@bandit.labs.overthewire.org:~/bandit26.sshkey ./bandit26.pem`
  * `ssh bandit26@bandit.labs.overthewire.org -p 2220 -i bandit26.pem` = get kicked out immediately
  * (logged as bandit25) `cat /etc/passwd | grep bandit26` (shell _/usr/bin/showtext_)
  * (logged as bandit25) `cat /usr/bin/showtext` = startup shell script
  * `ls -l /usr/bin/showtext /home/bandit26/text.txt`
  * (locally) resize terminal windows until it is smaller than ASCII logo, redo ssh = `more` now pauses "interactively
  * `v` = launches Vim
  * `:e /etc/bandit_pass/bandit26` = edit given file, ie bandit26 password (**s0773xxkk0MXfdqOfPRVr9L3jJBUOgCZ**)
* Level 26
  * Same interactive `more` resize trick into Vim
  * `:set shell=/bin/bash` = set shell to use with next command
  * `:shell` = start an Vi-embedded shell
  * `ls -l bandit27-do` = owner execute (via setuid bit) is set, so we can execute that script as bandit27
  * `./bandit27-do id` = `id` command confirms this script runs with bandit27 euid (effective uid)
  * `./bandit27-do cat /etc/bandit_pass/bandit27` (**upsNCc7vzaRDx6oZC6GiR6ERwe1MowGB**)
* Level 27
  * `git clone ssh://bandit27-git@bandit.labs.overthewire.org:2220/home/bandit27-git/repo`
  * `cat repo/README` (**Yz9IpL0sBcCeuG7m9uQFt8ZNpS4HZRcN**)
  * (optional) `rm repo -rf`
* Level 28
  * `git clone ssh://bandit28-git@bandit.labs.overthewire.org:2220/home/bandit28-git/repo`
  * `cd repo`
  * `cat README.md` = seems to hold a password
  * `git log` = investigate history, apparently there was some data leak (commit **fb0df13**)
  * `git checkout fb0df13` (or newer `git switch fb0df13 --detach`)
  * `cat README.md` (**4pT1t5DENaYuqnqvadYs1oE4QLCdjmJ7**)
  * (optional) `rm repo -rf`
* Level 29
  * `git clone ssh://bandit29-git@bandit.labs.overthewire.org:2220/home/bandit29-git/repo`
  * `cat README.md` = not in production, sooo in other branches?
  * `git log --oneline --graph --all --decorate` = display commit history
  * `git checkout a97d0db` ("add data needed for development")
  * `cat README.md` (**qp30ex3VLz5MDG1n91YowTv4Q8l7CDZL**)
* Level 30
  * `git clone ssh://bandit30-git@bandit.labs.overthewire.org:2220/home/bandit30-git/repo`
  * `git log --all` = there are no other branches
  * `git tag` = a _secret_ tag seems to be present
  * `git show secret` = display annotated tag message (**fb5S2xb7bRyFmAvQYQGEqsbhVyJqhnDy**)
* Level 31
  * `git clone ssh://bandit31-git@bandit.labs.overthewire.org:2220/home/bandit31-git/repo` (actually from _localhost_, from /tmp/koko)
  * `cat > key.txt <<< 'May I come in?'`
  * `git status` (_nothing to commit_, so is probably getting ignored)
  * `ls -a` (_.gitignore_)
  * `rm .gitignore`
  * `git add key.txt`
  * `git commit -m 'added key file'`
  * `git push` = remote response (**3O9RfhqyAlVBEZpVb6LYStshZoqoSx5K**)
* Level 32
  * (logged as another bandit) `cat /etc/passwd | grep bandit32` (_/home/bandit32/uppershell_)
  * Here I thought, since we cannot use lowercase chars, we cannot start any commands
  * We can however set uppercase variables (`VAR=…`), and/or use non-alphabetic characters
  * I tried a few `&` & `$`, but the following gave us a shell, as it executes the name it holds (ie /bin/sh): `$0`
  * `cat /etc_bandit_pass/bandit33` (**tQdtbs5D5i2vJwkO8mEyYEyTL8izoeJ0**)
* Level 33 -> Level 34
  * _At this moment, level 34 does not exist yet_ (2025.07.15)
