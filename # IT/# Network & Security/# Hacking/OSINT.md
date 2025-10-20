# OSINT

## Quick Tips

* Facebook bait using CRSF = get someone's name
* "Forgot Password?" = grab last digits of email/phone
* [Google Dorks](https://www.exploit-db.com/google-hacking-database) = Google search hacks (also Bind, Yandex, DuckDuckGo may turn up different results)
  * `inurl:"ViewerFrame?Mode=" -inurl -intitle` = unsecured network cameras
  * `intitle:index.of (mp3) {artiste.title}` or `intitle:"index of" mp3 -inurl:htm -inurl:html` = search old-school mp3 index pages
  * `"{target name} -"site:instagram.com/{target profile}"` = check if target has posted on other accounts
  * `"CV" OR "Curriculum Vitae" filetype:PDF "{firstname}" "{lastname}"` = find target's resume
* [IntelTechniques](https://inteltechniques.com) = OSINT resources & tools

## Glossary

* **OSINT** (Open-Source Intelligence) = collection/analysis of data (from public or covert sources, eg find information about anyone) to produce actionable intelligence
* **SOCMINT** (Social Media Intelligence) = specialized form of OSINT

## Tools

* [Autosploit](https://github.com/NullArray/AutoSploit) = automate exploitation of remote hosts identified via Shodan, Censys & Zoomeye
* _Censys_ = scanned entire internet to provide information about Internet-connected hosts, websites, certificates, and other Internet assets (IP, hostname, services & protocols)
* [Facebook ExtractFace](https://github.com/mrpnkt/ExtractFace)
* [Facebook Sleep Stats](https://github.com/sorenlouv/fb-sleep-stats)
* [Have I Been Pwned](https://haveibeenpwned.com) (HIBP) = enter target email
* _Maltego_ = OSINT tool for link analysis & data visualization of relationships between people/groups/websites/domains/networks, real-time data mining, information as node-based graph to identify patterns
* _Shodan_ = IoT search engine (servers, routers, webcams, unprotected devices)
* [TinEye](https://www.tineye.com) = reverse image search
* _Wayback Machine_ (by _Internet Archive_) = investigate (now possibly erased) past
* [WiGLE](https://wigle.net) = information about wireless hotspots around world
* _Zoomeye_ = analyze devices connected to internet (dynamic maps of assets, ports & protocols)
