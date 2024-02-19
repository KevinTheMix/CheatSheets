# Network & Security

* Access paywalled research papers = install a useragent switcher extension and set it to Googlebot (they let SEs read their content)
  * <https://www.reddit.com/r/reddit.com/comments/6o84t/who_else_is_sick_of_sites_hosting_research_papers/c04f3xz/>

## Glossary

* **InfoSec** (Information Security) = protecting information by mitigating risks
* **OAuth** = authorization framework standard for access delegation
* **OpenID Connect** = authentication layer for OAuth 2.0
* **OPSEC** (Operation Security) = military analysis of whether critical information is accessible to the enemy
* **OSINT** (Open-Source Intelligence) = collection/analysis of data (from public or covert sources, eg find information about anyone) to produce actionable intelligence
* **OTP** (One-Time Pad) = encryption technique that's uncrackable (even with quantum computing), but necessitate a single-use pre-shared key that's longer than the message
* **SAML** (Security Assertion Markup Language) = authentication & authorization exchange standard between id & service provider (enables SSO across different domains)
* **SOCMINT** (Social Media Intelligence) = specialized form of OSINT
* **Virus** = replicates itself when executed by modifying other programs with its own code
* **Worm** = standalone program that replicates itself and spreads to other computers
* _HitmanPro_ = portable antimalware removing files & registry entries (for rootkits, trojans, viruses, worms, spyware, adware, randonware)
* _Kali Linux_ = professional penetration testing (ie hacking) OS, with built-in [tools](https://www.kali.org/tools) (such as _bettercap_, _hashcat_, _cewl_)
* _Norton Power Eraser_ = small portable executable that scans a computer system (via _Norton Insight_)
* _Norton Insight_ = whitelists files based on reputation
* _Enigma Protector_ = protects executable files (from modding eg for DRM), VM
* [Exploit Database](https://www.exploit-db.com) = large collection of exploits for pentesters
* [Google Dorks](https://www.exploit-db.com/google-hacking-database) = Google search hacks (also Bind, Yandex, DuckDuckGo may turn up different results)
  * `inurl:"ViewerFrame?Mode=" -inurl -intitle` = unsecured network cameras
  * `intitle:index.of (mp3) {artiste.title}` or `intitle:"index of" mp3 -inurl:htm -inurl:html` = search old-school mp3 index pages
  * `"{target name} -"site:instagram.com/{target profile}"` = check if target has posted on other accounts
  * `"CV" OR "Curriculum Vitae" filetype:PDF "{firstname}" "{lastname}"` = find target's resume
* [IntelTechniques](https://inteltechniques.com) = OSINT resources & tools

### Crypto

* **AES** (Advanced Encryption Standard, aka Rijndael) = data encryption specification (via matrix transformation)
* **Key Derivation** = process to generate cryptographically strong produce keys from one or more values (eg keys, passphrases)
* **Key Partitioning** = dividing a single key into a set of keys (eg splitting a 256-bit key into two keys of 128 bits each)
* **On-the-fly encryption** = method used by some disk encryption tools (eg _VeraCrypt_) where data gets automatically de/encrypted as it is loaded/saved
* **PBKDF** (Password-Based Key Derivation Function) = turn human-friendly text passphrases into strong cryptographic keys with a sliding computational cost to reduce vulnerability to brute-force attacks
* _CeWL_ (Custom Word List generator) = crawls a website to extract a keywords list, which can be fed as potential contextal passwords fragments to a cracker
* _hashcat_ = hash/password cracker
* _RockYou_ = large (multi-GB) wordlist for password crackers

### Networks & Wi-Fi

* **AAA Key** (Authentication, Authorization & Accounting) aka **MSK** (Master Session Key) = additional key so that each client has a separate session
* **AP** (Access Point) = router
* **DMZ** (De-Militarized Zone) = network area that's neither internal or public, where public-facing (email/web) servers get placed
  * Traffic with a DMZ is mostly one-way towards it, i.e. it has very limited connectivity towards the internal network (as much as the firewall allows basically)
  * In a DMZ, clients still connect _directly_ (through the firewall) to different servers within the DMZ. That is unlike a reverse proxy that hides all the internal servers behind it
* **EAPOL** (Extensible Authentication Protocol) = authentication framework frequently used in (inter)network connections, via variety of methods (TLS, PSK)
* **EAPOL-Key**
* **GMK** (Group Master Key)
* **GTK** (Group Temporal Key)
* **IEEE 802** = family of standards for LAN, PAN & MAN
* **IEEE 802.11** = WLAN (Wi-Fi)
* **Monitor Mode** (& Packet Injection) = features of some WiFi routers (such as Taiwanese Alfa Network AWUS1900)
* **PMKID** = unique key used by AP to keep track of PMKs used by clients (for cacheing purposes, derived from AP MAC, Client MAC, PMK, PMK Name)
* **PMK** (Pairwise Master Key) = 256-bit key used to encrypt WiFi data between a client & router, it is composed of a Pre-shared Key (and additional AAA Key for _WPA-Enterprise_)
* **Proxy (Server)** = intermediary in a client-server network, can be forward (at client) or reverse (at server)
  * **Reverse Proxy (Server)** = retrieves resources on behalf of clients (can be used for security (eg a DMZ), caching, logging, monitoring user (employee) activty)
* **PSK** (Pre-shared Key) = PBKDF2-derived key from a personal WiFi passphrase (only one needed for _WPA-Personal_)
* **PTK** (Pairwise Transient Key)
* **STA** (Station) = a WiFi client
* **SNonce** (STA Nonce)
* **TKIP**
* **WEP** (Wireless Equivalent Pricavy) = early encryption protocol to secure WLAN (started as _802.11_ in 1985, used a single key for everything)
* **WiFi** = implementation of WLAN
* **WLAN** (Wide Local Area Network) = wireless LAN (eg WiFi), as defined by various protocols in _IEEE 802.11_ (a, b, j, y, ac, …, specifying frequency & bandwidth)
* **WPA** (Wi-Fi Protected Access) = Wi-Fi Alliance security protocols (implements a subset of a _802.11i_ draft ie early WPA2 in 1999), introduces 4-way handshake and a hierarchy of keys
* **WPA2** (Wi-Fi Protected Access II) = replaces WPA (defined in 2004 in _IEEE 802.11i-2004_ as an amendment to original _IEEE 802.11_), introduces **AES**
* **WPA3** (Wi-Fi Protected Access III) = replaces WPA2 (mandates stronger cryptographic algorithms, announced in 2018)
* **WPA-Personal** (aka WPA-PSK) = PSK-encrypted WiFi
* **WPA-Enterprise** = requires additional (so called _802.1X_-defined _RADIUS_) authentication server

* _Aircrack-ng_ = tools suite for packet sniffing & WiFi cracking
* _bettercap_ = (Go-based) hacking tool for WiFi, Bluetooth Low Energy, wireless hijacking
* _ESP32_ = low-cost low-power system-on-a-chip MCU (Microcontroller Unit, ie an electronic board/chip) with integrated WiFi & Bluetooth (by _Espressif Systems_)
* _Flipper Zero_ = open-source & customizable portable multi-tool for hackers/pentesters (RFID, radio protocols, access control systems, GPIO pins hardware)
* _Raspberry Pi Zero W_ > _Pwnagotchi_ = WiFi cracking (via AI + bettercap, [Guide](https://www.reddit.com/r/pwnagotchi/comments/sl2rv1/guerrilla_guide_to_pwnagotchi_v1552022))
* _WiFi Pineapple_ = pentesting router (monitoring, AP spoofing, targeted captive portals)
* _WireGuard_ = FOSS VPN (Ubuntu native)
* _Wireshark_ = network analyzer
