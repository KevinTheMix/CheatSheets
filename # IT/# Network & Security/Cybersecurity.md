# Cybersecurity

## Quick Tips

* [Exploit Database](https://www.exploit-db.com) = large collection of exploits for pentesters
* [PayloadsAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings) = list of payloads/bypass
* [Index of all web client & server security topics](https://portswigger.net/web-security/all-topics)
* Access paywalled research papers = install a useragent switcher extension and set it to Googlebot (they let SEs read their content)
  * <https://www.reddit.com/r/reddit.com/comments/6o84t/who_else_is_sick_of_sites_hosting_research_papers/c04f3xz>
* Where to look = source code (form input/hidden fields, directories & indexes), URL (parameters), cookie (-stored strings), _robots.txt_, _.htaccess_ & _.htpasswd_

## Glossary

* [CompTIA Security+](https://www.comptia.org/certifications/security) = cybersecurity certification
* **Clickjacking** = tricking user into clicking on something unintended (eg Facebook likejacking, where hidden button overlay induces a pagelike)
* **Directory Traversal** = abuses an input expecting eg a filename with a more elaborate parent hierarchy traversing path (to something interesting eg a filesystem index or password file)
* **File Inclusion** = abuses a page including another page (even PHP scripts) via its URL, loading/executing them with no boundaries/filters in place, bypassing same website policy
  * **Local** (LFI) = only local files are allowed, could still be used by files whose content can be maniplated by attacker (eg access logs)
  * **Remote** (RFI) = any remote file/page can be included (eg `index.php?page=http://www.google.com`, google them via `inurl:"index.php?page="`)
* **InfoSec** (Information Security) = protecting information by mitigating risks
* **OPSEC** (Operation Security) = military analysis of whether critical information is accessible to the enemy (trackability prevention)
  * Also refers to obfuscating/hiding techniques by hackers to evade security & getting found
* **OSCP** (Offensive Security Certified Professional) = ethical hacking certification (by _Offensive Security_ aka _Offsec_)
* **Reverse shell** = remote shell execution, from target to attacker thus bypassing protection measures blocking ingoing-only requests (eg firewalls, IDS, IPS)
  * Precondition = attacker has access to target's shell, launching an interactive `bash` listening to commands served by attacker (via _ncat_)
* **C/XSRF** (Cross-Site Request Forgery) = coerces a victim into browsing a legit page s/he's currently logged in via a specially crafted URL with parameters having an immediate effect
  * Caused by a lack of mechanisms to check the source of a request (URL referer or generated form token)
* **XSS** (Cross-Site Scripting) = abuses a legit page's lack of input (URL, form field) sanitization to insert a malicious (JS) script, accounts for 84% of all security vulnerabilities
  * **Persistent** = the script is saved and served back to the victim when she browses a page displaying unsanitized content (eg _MMQ_)
  * **Non-Persistent** = coerces a victim into browsing a volatile forged (**GET/POST**) URL holding payload as parameter which get displayed on a page without sanitization
    * Eg a (lousy) search engine results page: _You searched: `javascript:alert('oh no');`_
* **Virus** = replicates itself when executed by modifying other programs with its own code
* **Worm** = standalone program that replicates itself and spreads to other computers

* _Burp Suite Scanner_ = web app vulnerability testing/scanning graphical tool, server-side vulnerabilities, Interactive Application Security Testing (IAST), web proxy, web app crawler
* _KON-BOOT_ = Bypass Windows/Mac logon (_active_)
* _IronWASP_ = open-source web app vulnerability testing/scanning, reports, extensible
* _Nessus_ = (OS, network, hypervisors, DB, web servers) vulnerability scanner, plugins written in the Nessus Attack Scripting (NAS) language
* _OpenVAS_ = vulnerability scanner, security issues, un/authenticated testing, detailed reports, free (GNU), plugins written in the Nessus Attack Scripting (NAS) language
* _OWASP Zap_ = web app security testing, AJAX Spidering, Fuzzing, REST APIs testing, active/passive scan, Filters, Anti-CSRF tokens, WebSocket testing, HTTP sessions, Spider
* _SQLmap_ = open source automated SQL injection flaws penetration testing, DB fingerprinting, multi-platform (MySQL, MSSQL, etc), password hash dic attack, DB dump

### Crypto/Passwords

* **AES** (Advanced Encryption Standard, aka Rijndael) = data encryption specification (via matrix transformation)
* **Key Derivation** = process to generate cryptographically strong produce keys from one or more values (eg keys, passphrases)
* **Key Partitioning** = dividing a single key into a set of keys (eg splitting a 256-bit key into two keys of 128 bits each)
* **On-the-fly encryption** = method used by some disk encryption tools (eg _VeraCrypt_) where data gets automatically de/encrypted as it is loaded/saved
* **One-Time Pad** (OTP) = encryption technique that's uncrackable (even with quantum computing), but necessitate a single-use **pre-shared** key that's longer than the message
* **PBKDF** (Password-Based Key Derivation Function) = turn other keys or human-friendly passphrases into strong cryptographic keys with a sliding computational cost to reduce vulnerability to brute-force attacks
  * [Peanut Butter Keeps Dogs Friendly Too](https://blog.1password.com/defending-against-crackers-peanut-butter-keeps-dogs-friendly-too)

* _Cain & Abel_ = password cracking/recovery
* _ihashgpu_ = Hash (MD4, MD5, SHA1) cracking CLI (_discontinued_)
* _John the Ripper_ = FOSS fast password cracker, brute force, common passwords, dic attacks, 20+ (human) languages
* _MDCrack_ = Cracks MD4, MD5 & co Hash password
* _Ophcrack_ = Windows password cracker (rainbow tables)
* _RockYou.txt_ = large (multi-GB) wordlist for password crackers

### SQL Injection (SLQi)

[Types of SQL Injection](https://www.acunetix.com/websitesecurity/sql-injection2)

#### In-Band (Classic)

The attacker uses the same channel of communication to launch attacks & gather results

* **Error-based** = the attacker uses displayed (types of) error messages to deduce information about DB structure
  * Abuses a SQL query in the form `SELECT * FROM table WHERE user = '{user}' AND password = '{pass}'`
  * **Comment Payload** = set user to `admin'--` (and that's it!)
  * **OR Payload** = relies on inserting an `OR` statement to short-circuit the otherwise tight `AND` boolean logic
    * Set user to `admin' OR '1'='1` (note: no end quote) as user name (constraint: the user _admin_ must exist in the system)
    * The query becomes `SELECT * FROM table WHERE user = 'admin' OR '1'='1' AND password = whatever`
    * In boolean topology: _TRUE OR TRUE AND FALSE_ == _TRUE OR (TRUE AND FALSE)_ == _TRUE OR FALSE_ == _TRUE_
    * If we don't know any valid username, use this instead: `' OR user IS NOT NULL OR '1'='1` that adds an additional `OR` statement (so even the left condition can be _FALSE_)
* **Union-based** = abuses a SQL query in the form `SELECT * FROM products WHERE column(Id) LIKE '%{category}%'` whose result set gets displayed back on the page
  * Set parameter to `'--` => `SELECT * FROM products WHERE column(Id) LIKE '%'` = returns all
  * Set parameter to `' UNION ALL SELECT 1,2,3 --` = returns all & adds a few values (number of columns must match)
    * If that works, we can query columns from another table instead of constant values
    * A popular choice are system meta-tables containing info about other tables & columns

#### Inferential (Blind)

The attacker reconstructs DB structure in the dark by sending one payload after another, observing application responses & DB server behavior.
Takes longer to exloit but just as dangerous.

* **Boolean-based** = sends DB queries that force the application to return a different results depending on whether the query returns _TRUE/FALSE_
* **Time-based** = sends SQL query that forces the DB to wait for a certain time (in seconds), indicating whether the query result is _TRUE/FALSE_
  * Eg `AND/OR SLEEP(1)` (for MySQL)

#### Out-of-Band (OOB)

The attacker is unable to use the same channel to launch the attack and gather results, uncommon, requires features being enabled on the DB server.
The attacker tries to send data outside the DB, eg by having the DB make direct DNS/HTTP requests containing data to the attacker (eg MSSQL `xp_dirtree`).
These offer an alternative to inferential time-based techniques when the server responses are not very stable (making time-based attacks unreliable).
