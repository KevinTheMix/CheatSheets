# OverTheWire

Wargames

## Glossary

## Bandit

* Connect using `ssh bandit{N}@bandit.labs.overthewire.org -p 2220`, then type/paste password
* All passwords are in _/etc/bandit\_pass_ (of course each user can only see his)
  * So we can always use `cat /etc/bandit_pass/bandit{N}` instead of `echo {password}`

* Level 0 = `ls` then `cat readme` (**ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If**)
* Level 1 = `ls` then `cat ./-` (**263JGJPfgU6LtdEvgfWU1XP5yac29mFx**)
* Level 2 = `ls` then `cat "spaces in this filename"` (**MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx**)
* Level 3 = `ls -a` then `cat inhere/...Hiding-From-You` (**2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ**)
* Level 4 = `ls -a` then `cat inhere/-file07` (**4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw**)
* Level 5 = `ls` then `ls inhere/* -al` then `find inhere -size 1033c` (**HWasnPhtq9AVKe0dmk45nxy20cvUa6EG**)
* Level 6 = `find / -size 33c -user bandit7 -group bandit6 2>/dev/null` (**morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj**)
  * That last part filters out all 'Permission denied' error messages
* Level 7 = `cat data.txt | grep millionth` (**dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc**)
* Level 8 = `cat data.txt | sort | uniq -u` (**4CKMh1JI91bUIZZPXDqGanal4xvAg0JM**)
* Level 9 = `strings data.txt | grep -Px ==+.*` (**FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey**)
* Level 10 = `base64 -d data.txt` (**dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr**)
* Level 11 = `tr 'A-Za-z' 'N-ZA-Mn-za-m' < data.txt` (**7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4**)
* Level 12
  * `mkdir /tmp/kokoriko` then `cp data.txt /tmp/kokoriko` then `cd /tmp/kokoriko`
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
  * Two terminals solution
    * (from a secondary terminal) `nc -l 2097` = star a TCP server
    * `./suconnect 2097` = connects client to server
    * (in secondary terminal) `0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO` (**EeoULMCra2q0dSkYj561DX7s1CpBuOBt**)
  * Single terminal solution
    * `( echo 0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO | nc -l 2097 > /tmp/koko ) &` = starts background TCP listen with data sitting in pipe buffer
    * `./suconnect 2097`
    * (optional) `wait`, however netcat will prompty terminates on its own (since it's not configured to keep running after first connection eg via `-k`)
    * `cat /tmp/koko` (**EeoULMCra2q0dSkYj561DX7s1CpBuOBt**)
    * (optional) `rm /tmp/koko`
* Level 21
  * `ls /etc/cron.d` = check out cron directory as indicated by objective
  * `cat /etc/cron.d/cronjob_bandit22` = open specific crontab
  * `cat /usr/bin/cronjob_bandit22.sh` = check out script run by crontab every minute
  * `cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv` = contains a copy of password (**tRae0UfB9v0UzbCdn9cY0gQnds9GF58Q**)
* Level 22
  * `ls /etc/cron.d`
  * `cat /etc/cron.d/cronjob_bandit23`
  * `cat /usr/bin/cronjob_bandit23.sh` = see script source, adapt parts of it for next command
  * `cat /tmp/$(echo I am user bandit23 | md5sum | cut -d ' ' -f 1)` (**0Zf11ioIjMVN551jX3CmStKLYqjk54Ga**)
* Level 23
  * `ls /etc/cron.d`
  * `cat /etc/cron.d/cronjob_bandit24`
  * `cat /usr/bin/cronjob_bandit24.sh` = script that deletes stuff in a certain directory
  * `ls /var/spool/bandit24/foo -l` = defnied
  * `ls /var/spool/bandit24/ -l` = _drwxrwx-wx_, We can add new files to that directory
* Level 24 = 
* Level 25 = 
* Level 26 = 
* Level 27 = 
* Level 28 = 
* Level 29 = 
* Level 30 = 
* Level 31 = 
* Level 32 = 
* Level 33 = 
* Level 34 = 

Ask ChatGPT to repond a monosyllabic YES, and the nuances only if necessary
