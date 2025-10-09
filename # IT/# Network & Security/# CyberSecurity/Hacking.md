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
* **Buffer Overflow** = manipulates a region of memory to inject malicious code, then sets execution to that address (eg overwrites a function return address or function pointer)
* **Exploit** = method/code that takes advantage of vulnerabilities, typically for malicious purposes
* **Magic Numbers** (or **MAgic Bytes**) = first few bytes identifying a file content type
* **Man-in-the-Middle** (MitM) = more than just snooping on a line, can intercept and pretend to be the other party (ie a secure channel with an attacker isn't secure at all)
* **Reverse shell** = remote shell execution, from target to attacker thus bypassing protection measures blocking ingoing-only requests (eg firewalls, IDS, IPS)
  * Precondition = attacker has access to target's shell, launching an interactive `bash` listening to commands served by attacker (via _ncat_)
 **Supply Chain Attack** = targets less secure (software or hardware) elements in supply chain (eg software 3rd party libraries)
* **Threat** = potential negative action/event enabled by a vulnerability, resulting in unwanted impact
* **Virus** = replicates itself when executed by modifying other programs with its own code
* **Vulnerability** = flaw/weakness in a system's design/implementation/management that can be exploited
* **Worm** = standalone program that replicates itself and spreads to other computers

## Tools

* _Burp Suite_ (by _PortSwigger_) = proprietary software for security assessment & penetration testing (eg brute-force boolean SQLi)
* _Dirty COW_ (Copy-On-Write) = copy-on-write vulnerability existing in older (created before 2018) Linux kernels (eg Android earlier than version 7 Nougat)
* _Flipper Zero_ = open-source & customizable portable multi-tool for hackers/pentesters (RFID, radio protocols, access control systems, GPIO pins hardware)
* _Kali Linux_ = professional penetration testing (ie hacking) OS, with built-in [tools](https://www.kali.org/tools)
* _KON-BOOT_ = Bypass Windows/Mac logon (_active_)
* _Metasploit_ = security testing & vulnerability management framework, provides information about find/exploit/validate vulnerabilities & pentesting, security auditing
* _Nessus_ = (OS, network, hypervisors, DB, web servers) vulnerability scanner, plugins written in the Nessus Attack Scripting (NAS) language
* _OpenVAS_ = vulnerability scanner, security issues, un/authenticated testing, detailed reports, free (GNU), plugins written in the Nessus Attack Scripting (NAS) language
* _Parrot (Security) OS_ = FOSS portable Debian-based OS with 600 tools (for pentesting, security & development)
* _PEASS_ (Priviledge Escalation Awesome Scripts Suite) = scans & reports possible privilege escalation (due to misconfiguration) paths on Windows/Unix/MacOS
* _Pwnbox_ = customized online Parrot Security Linux distribution with many hacking tools pre-installed
* _PwnKit_ = Linunx systems' `pkexec` utilty privilege escalation vulnerability
* _Teensy_ = a programmable USB board that can spoof any USB type of device (eg emulate a keyboard)
* _Volatility_ = FOSS RAM forensic analysis tool

### Cracking

* _Cain & Abel_ = password cracking/recovery
* _ihashgpu_ = Hash (MD4, MD5, SHA1) cracking CLI (_discontinued_)
* _hashcat_ = fastest hash/password cracking & recovery, (CPU & GPU) hardware-accelerated, works on 200+ hash algos
* _Hydra_ (THC Hydra) = parallelized login cracking (brute force, dictionary attack)
* _John the Ripper_ = FOSS fast password cracker, brute force, common passwords, dic attacks, 20+ (human) languages
* _MDCrack_ = Cracks MD4, MD5 & co Hash password
* [Ophcrack](https://ophcrack.sourceforge.io) = free multi-platform Windows (XP/Vista/7) password cracker based on rainbow tables
* _RockYou.txt_ = large (multi-GB) wordlist for password crackers

### Network

* _Aircrack-ng_ = Wi-Fi packet monitoring/sniffing & cracking tools suite, WEP/WPA key recovery, replay attacks, deauthentication, fake access points via packet injection, CLI
  * _aircrack-ng_ = cracks WEP keys
  * _airdecap-ng_ = decrypts WEP/WPA encrypted capture files
  * _airmon-ng_ = enable monitor mode on wireless interfaces or kill network managers
  * _airodump-ng_ = packet sniffer
  * _airserv-ng_ = access other computers' wireless card
  * _easside-ng_ = communicate to access point without WEP key
  * Other CLI commands = _airmon-ng_, _aireplay-ng_, _airtun-ng_, _packetforge-ng_, _ivstools_, _airbase-ng_, _airdecloak-ng_, _airolib-ng_, _buddy-ng_, _tkiptun-ng_, _wesside-ng_
* _bettercap_ = (Go-based) hacking tool for WiFi, Bluetooth Low Energy, wireless hijacking
* _Fiddler Classic_ = log & edit HTTP(S) web traffic
* _LOIC_ (C# rewrite) = DoS and DDoS for stress-testing
* _Nmap_ (Network Mapper) = FOSS Linux network discovery/scanning, device identification, ports scanning
  * _Ncat_ (reimplementation of _Netcat_) = CLI network utility to read/write data via TCP/UDP
  * _Ndiff_ = compare scan results
  * _Nping_ = packet generation & response analysis
  * _Zenmap_ = result viewer GUI
* _NukeNabber_ = commonly attacked TCP/UDP ports listener (Windows XP _discontinued_)
* _PCAP_ (Packet Capture) = API for capturing network traffic (packet sniffing)
  * _libpcap_ = Unix implementation of pcap API (base driver)
  * _WinPcap_ = Windows port of libpcap (_discontinued_)
  * _Npcap_ = Windows 7 port of libpcap
* _Pwnagotchi_ (for _Raspberry Pi Zero W_) = WiFi cracking (via AI + bettercap, [Guide](https://www.reddit.com/r/pwnagotchi/comments/sl2rv1/guerrilla_guide_to_pwnagotchi_v1552022))
* _tcpdump_ = Unix Packet analyzer (uses _libcap_, ie privilege controls)
* _TMeter_ = free network packet traffic analyzer with built-in firewall & NAT capabilities
* _WiFi Pineapple_ = pentesting router (monitoring, AP spoofing, targeted captive portals)
* _WinDump_ = Windows port of tcpdump (uses WinPcap)
* _Wireshark_ = network packets analyzer (uses WinPcap or Npcap)
  * Protocol inspection, live capture & offline analysis, rich VoIP analysis, multi-platform, multiple capture file formats, decryption support, GUI & CLI (TShark)
