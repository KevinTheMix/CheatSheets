# Team Red

## Quick Tips

* [Exploit Database](https://www.exploit-db.com) = large collection of exploits for pentesters
* [PayloadsAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings) = list of payloads/bypasses
* **Bypass company firewall** (2014.04)
  * Remote desktop to home computer
  * SSH Tunnel + Proxy Socks via PuTTY (_Laurent D'Havé_ & _Frédéric Branger_)
  * [Warning: following this advice may get you fired](https://old.reddit.com/r/bestof/comments/d4hl1/comment/c0xibzi)
* [Sticky notes for pentesting](https://exploit-notes.hdks.org)
* [Active Directory Security](https://adsecurity.org)

## Glossary

* **Advanced Persistent Threat** (APT) = typically state-sponsored group of hackers striving to remain undetected for an extended period
* **Attack Surface** = sum of different points (attack vectors) where attackers can try to enter/extract/control
* **Attack Vector** = specific path/method/scenario that can be exploited
* **Broadcast Storm** = accumulation of broadcast/multicast traffic on a network, leading to potential DOS
* **Buffer Overflow** = manipulates a region of memory to inject malicious code, then sets execution to that address (eg overwrites a function return address or function pointer)
* **Cryptojacking** = uses your CPU to mine coins and perform proof of work computation (even via Javascript running in a web browser)
* **Denial Of Service** (DOS) = rendering a system inoperational (via overloading it, crashing it or simply turning it off)
* **Exploit** = method/code that takes advantage of vulnerabilities, typically for malicious purposes
* **Infostealer** = malicious software that breaches systems to steal sensitive information (login, financial, personally identifiable information) sent back to attacker
* **Keylogger** = logs keyboard keys (eg login URLs, passwords, e-mail messages), bypassing encryption at source, and other data (clipboard, screen, messaging, SE queries)
* **Magic Numbers** (or **MAgic Bytes**) = first few bytes identifying a file content type
* **Malware** = any undesired software with negative effects (eg access, disrupt, leak, steal, encrypt, deprive access)
* **Man-in-the-Middle** (MITM) or **On-Path Attack** = more than just listening, can plug itself & act as other party (ie a secure channel with an attacker isn't secure at all)
  * **ARP Poisoning** (or Spoofing) = listen to local IP subnet traffic (ARP has no built-in security)
  * **Wireless Evil Twin** = mirrors an existing public Wi-Fi access point to bait connections (ie same/similar SSID and/or captive portal)
  * Thwarted by using HTTPS and/or a VPN
* **Potentially Unwanted Program** (PUP) = software often installed with other software, showing ads but not malicious (eg aggressive browser toolbar, SE highjacker)
* **Ransomware-as-a-Service** (RaaS) = provides ransomware services to affiliates (via subscription fees, gains sharing)
* **Ransomware** = encrypt and/or steal data for money
* **Reverse shell** = remote shell execution, from target to attacker thus bypassing protection measures blocking ingoing-only requests (eg firewalls, IDS, IPS)
  * Precondition = attacker has access to target's shell, launching an interactive `bash` listening to commands served by attacker (via _ncat_)
* **Rootkit** (_root_ as in Unix superuser account) = embeds itself as part of OS kernel, so near invisible to antiviruses & OS itself (eg TaskManager)
  * UEFI Secure Boot mitigated this by detecting OS has been modified
* **Spyware** = advertises, captures, monitors, spies, steals
* **Supply Chain Attack** = targets less secure (software or hardware) elements in supply chain, ie compromising external providers/manufacturing/distribution of a product by installing malware or hardware spying components
* **Threat** = potential negative action/event enabled by a vulnerability, resulting in unwanted impact
* **Virus** = replicates itself when executed by modifying other programs with its own code
  * **Boot Sector Virus** = virus embedded in boot loader, running before OS starts, mitigated by UEFI SecureBoot
* **Vulnerability** = known or unknown flaw/weakness in a system's design/implementation/management that can be exploited
* **Worm** = standalone program that replicates itself and spreads to other computers
* **Zero-Day** = vulnerability that has not been detected/published and that attackers may keep to themselves
  * Eg remote code execution in Java-based logging utility _Apache Log4j_ used on million of servers around the world (introduced in 2013, dormant for 8 years until 2021)

### Groups

* **GhostSec** (Ghost Security) = anti-ISIS vigilante (eg Charlie Hebdo)
* **Hive** = was a RaaS (2021-2023)
* **LockBit** = RaaS
* **REvil** (aka Sodinokibi) = was a Russia RaaS
* **Stormous** = pro-russia RaaS (eg Duvel)
* **Wizard Spider** = Russia-based using _Conti_ malware (now a full-fledged RaaS)

### Social Engineering

In person or electronic.

* **Business Email Compromise** (BEC) = befriend/spear fish a target over email (after OSINT research), who has access to data and/or money (eg accounting team)
* **Dumpster Diving** = wealth of information such as names/emails/phones list to elaborate impersonation scenario, based on pickup schedule
* **Impersonation** = pretend to be someone else (eg a person with higher rank/authority), by using information found in dumpster, quickfiring a barrage of technical terms, or just being friendly/charming
* **Phishing** = vishing, smishing, spear fishing (ie target important target eg C-level executives), whaling (CEO or CFO specifically), public (hijackable) QR codes are no longer safe
* **Shoulder Surfing** = spying by being physically behind someone (easy in airports, flights, trains, coffee shops) or from afar (eg binoculars/telescopes from another building)
  * Mitigated by privacy filters (ie screen appears black to everyone else but person in front it it), or just turning screen away from view
* **Tailgating**/**Piggybacking** = use an authorized person to gain unauthorized access to a building (tailgating is unnoticed, piggybacking is with victim's consent)

### Games

* **Capture The Flag** (CTF) = exercise to find flags (ie text strings) secretly hidden in purposefully vulnerable programs/websites, for educational/competitive purposes
* **Hack The Box** (HTB) = online cybersecurity courses & certifications
* **Hack This Site** = old
* **Hacksplaining** = free, comprehensive security training for web developers (fake bank)
* **OverTheWire** = bandit, natas, …
* **picoCTF** (_Carnegie Mellong University_) = CTFs courses & competitions
* **TryHackMe** = CTFs (more beginner friendly than HTB)
* **WebGoat** (OWASP) = deliberately insecure application to test for vulnerabilities

## Tools

* [Bash Bunny](https://shop.hak5.org/products/bash-bunny) = multi-vector payload attacks USB Key ($200)
* **DartComet-RAT** (Remote Access Trojan) = keylogger
* **Dirty COW** (Copy-On-Write) = copy-on-write vulnerability existing in older (created before 2018) Linux kernels (eg Android earlier than version 7 Nougat)
* **KON-BOOT** = Bypass Windows/Mac logon (_active_)
* **Pegasus** = spyware designed to be covertly & remotely installed on iOS/Android mobile phones, developed by Israeli cyber-arms company _NSO Group_
* **PwnKit** = Linux systems' `pkexec` utilty privilege escalation vulnerability
* **Teensy** = a programmable USB board that can spoof any USB type of device (eg emulate a keyboard)

### Cracking

* **Cain & Abel** = password cracking/recovery
* **ihashgpu** = Hash (MD4, MD5, SHA1) cracking CLI (_discontinued_)
* **hashcat** = fastest hash/password cracking & recovery, (CPU & GPU) hardware-accelerated, works on 200+ hash algos
* **Hydra** (THC Hydra) = parallelized login cracking (brute force, dictionary attack)
* [John the Ripper](http://www.openwall.com/john) = FOSS fast password cracker, brute force, common passwords, dic attacks, 20+ (human) languages
* **MDCrack** = Cracks MD4, MD5 & co Hash password
* [Ophcrack](https://ophcrack.sourceforge.io) = free multi-platform Windows (XP/Vista/7) password cracker based on rainbow tables
* **RockYou.txt** = large (multi-GB) wordlist for password crackers

### Network

* **Aircrack-ng** = Wi-Fi packet monitoring/sniffing & cracking tools suite, WEP/WPA key recovery, replay attacks, deauthentication, fake access points via packet injection, CLI
  * **aircrack-ng** = cracks WEP keys
  * **airdecap-ng** = decrypts WEP/WPA encrypted capture files
  * **airmon-ng** = enable monitor mode on wireless interfaces or kill network managers
  * **airodump-ng** = packet sniffer
  * **airserv-ng** = access other computers' wireless card
  * **easside-ng** = communicate to access point without WEP key
  * Other CLI commands = `aireplay-ng`, `airtun-ng`, `packetforge-ng`, `ivstools`, `airbase-ng`, `airdecloak-ng`, `airolib-ng`, `buddy-ng`, `tkiptun-ng`, `wesside-ng`
* **bettercap** = (Go-based) Swiss Army knife for WiFi, Bluetooth Low Energy, wireless hijacking, MITM attacks
* **Ettercap** = FOSS MITM attacks on a LAN
* **Fiddler Classic** = log & edit HTTP(S) web traffic
* **Flipper Zero** = open-source & customizable portable multi-tool for hackers/pentesters (RFID, radio protocols, access control systems, GPIO pins hardware)
* **LOIC** (C# rewrite) = DoS and DDoS for stress-testing
* **Nmap** (Network Mapper) = FOSS Linux network discovery/scanning, device identification, ports scanning
  * `ncat` (richer reimplementation of `netcat`, designed to be compatible with it) = CLI network utility to read/write data via TCP/UDP
  * `ndiff` = compare scan results
  * `ning` = packet generation & response analysis
  * **Zenmap** = result viewer GUI
* **NukeNabber** = commonly attacked TCP/UDP ports listener (Windows XP _discontinued_)
* **PCAP** (Packet Capture) = API for capturing network traffic (packet sniffing)
  * **libpcap** = Unix implementation of pcap API (base driver)
  * **WinPcap** = Windows port of libpcap (_discontinued_)
  * **Npcap** = Windows 7 port of libpcap
* **Pwnagotchi** (for _Raspberry Pi Zero W_) = WiFi cracking (via AI + bettercap, [Guide](https://www.reddit.com/r/pwnagotchi/comments/sl2rv1/guerrilla_guide_to_pwnagotchi_v1552022))
* **tcpdump** = Unix Packet analyzer (uses _libcap_, ie privilege controls)
* **TMeter** = free network packet traffic analyzer with built-in firewall & NAT capabilities
* **WiFi Pineapple** = pentesting router (monitoring, AP spoofing, targeted captive portals, [Guide](https://www.troyhunt.com/the-beginners-guide-to-breaking-website))
* **WinDump** = Windows port of tcpdump (uses WinPcap)

### Pentesting & Vulnerabilities

* **Burp Suite** (by _PortSwigger_) = proprietary software for security assessment & penetration testing (eg brute-force boolean SQLi)
* **Kali Linux** = professional penetration testing (ie hacking) OS, with built-in [tools](https://www.kali.org/tools)
* **Metasploit** = security testing & vulnerability management framework, provides information about find/exploit/validate vulnerabilities & pentesting, security auditing
* **Nessus** = (OS, network, hypervisors, DB, web servers) vulnerability scanner, plugins written in the Nessus Attack Scripting (NAS) language
* **OpenVAS** = vulnerability scanner, security issues, un/authenticated testing, detailed reports, free (GNU), plugins written in the Nessus Attack Scripting (NAS) language
* **Parrot (Security) OS** = FOSS portable Debian-based OS with 600 tools (for pentesting, security & development)
* **PEASS** (Priviledge Escalation Awesome Scripts Suite) = scans & reports possible privilege escalation (due to misconfiguration) paths on Windows/Unix/MacOS
* **Pwnbox** = customized online Parrot Security Linux distribution with many hacking tools pre-installed
