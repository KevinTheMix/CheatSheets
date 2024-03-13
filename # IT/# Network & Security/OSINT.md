# OSINT

* Wayback machine = Investigate the (now hidden) past
* Facebook bait using CRSF = Get someone's name
* "Forgot Password?" = grab last digits of email/phone
* [Shodan](https://www.shodan.io) = IoT search engine (webcams, unprotected devices)
* Censys
* Zoomeye
* [Autosploit](https://github.com/NullArray/AutoSploit)

* [Google Dorks](https://www.exploit-db.com/google-hacking-database) = Google search hacks (also Bind, Yandex, DuckDuckGo may turn up different results)
  * `inurl:"ViewerFrame?Mode=" -inurl -intitle` = unsecured network cameras
  * `intitle:index.of (mp3) {artiste.title}` or `intitle:"index of" mp3 -inurl:htm -inurl:html` = search old-school mp3 index pages
  * `"{target name} -"site:instagram.com/{target profile}"` = check if target has posted on other accounts
  * `"CV" OR "Curriculum Vitae" filetype:PDF "{firstname}" "{lastname}"` = find target's resume
* [CyberFlow - OSINT: How to Find Information about ANYONE!](https://www.youtube.com/watch?v=nd5W82KN9B8)
* [Facebook ExtractFace](https://github.com/mrpnkt/ExtractFace)
* [Facebook Sleep Stats](https://github.com/sorenlouv/fb-sleep-stats)
* [IntelTechniques](https://inteltechniques.com) = OSINT resources & tools

## Quick Tips

* [';--have i been pwned?](https://haveibeenpwned.com) = enter target email

## Glossary

* **OSINT** (Open-Source Intelligence) = collection/analysis of data (from public or covert sources, eg find information about anyone) to produce actionable intelligence
* **SOCMINT** (Social Media Intelligence) = specialized form of OSINT
