# Network

## Quick Tips

* **Bypass company firewall** (2014.04)
  * Remote desktop to home computer
  * SSH Tunnel + Proxy Socks via Putty (_Laurent D'Havé_ & _Frédéric Branger_)
    * <https://securitymusings.com/article/462/how-to-set-up-a-socks-proxy-using-putty-ssh>
* [DNSstuff tools](https://www.dnsstuff.com/freetools)

## Glossary

* **DMZ** (De-Militarized Zone) = network area that's neither internal or public, where public-facing (email/web) servers get placed
  * Traffic with a DMZ is mostly one-way towards it, ie it has very limited connectivity towards the internal network (as much as the firewall allows basically)
  * Clients connect _directly_ (through the firewall) to different servers **within the DMZ**; that is unlike a reverse proxy that hides all the internal servers behind it
* **gRPC** = cross-platform open source RPC framework (by Google) using HTTP/2 for transport & Protobuf to encode data, usually connecting microservices or mobile clients to backends
  * Faster than HTTP, cannot be used with IIS
* **HTTP/2** = major revision of HTTP (developed by Google), derived from (obsolete) SPDY communication protocol, supported by nearly 100% of browsers
* **HTTPS** = TLS layer between HTTP & TCP, attested via a digitally signed server certificate, initiated via public crypto key handshake
* **OAuth** = authorization framework standard for access delegation
* **OpenID Connect** = authentication layer for OAuth 2.0
* **Protocol Buffers** (aka _Protobuf_) = FOSS cross-platform data format (by Google) used to serialize structured data, described via a WSDL-like Interface Description Language (IDL)
* **Proxy (Server)** = intermediary in a client-server network, can be forward (at client) or reverse (at server)
* **Reverse Proxy** = retrieves resources on behalf of clients, as if they originated from them, can be used for security (eg DMZ), caching, logging, monitoring user activty
* **SSH** (Secure Shell Protocol) = crypto protocol for network services over unsecured network (eg remote login & CLI execution)
* **SSL** (Secure Sockets Layer) = deprecated encryption protocol replaced with **TLS**
* **SSO** (Single Sign-On) = use one login on multiple system, whether personal (eg Google Account SSO, or OAuth 2.0 social login), or entreprise-wide (using SAML-based SSO eg Azure AD or Okta)
* **Telnet** = bi-directional client-server application protocol to access virtual terminals of remote system on LAN/Internet
* **TLS** (Transport Layer Security) = cryptographic protocol to provide communications security over a network
* **TLS Handshake** = client initiates an asymmetric connexion, then sends a (faster & more efficient for large amounts of data) symmetric key encrypted using server public key found in its certificate

### Tools

* **cURL** = CLI for data transfer (FTP, HTTP, Email & co)
* **Cyberduck** = (S)FTP, WebDAV (aka HTTP) & cloud storage (S3, Azure) client
* **Fiddler Classic** = log & edit HTTP(S) web traffic
* **FileZilla Portable** = no-install FTP
* **FileZilla Server** = FTP Server
* **HTTrack** = Web crawler/copier (also as no install)
* **LeechFTP** = multi-threaded FTP client
* **LOIC** (C# rewrite) = DoS and DDoS for stress-testing
* **Nmap "Network Mapper"** = Linux Network discovery
* **NukeNabber** = Windows XP TCP/UDP ports listener (_discontinued_)
* **OpenSSH** = setsuite of tools to encrypt all traffic to eliminate eavesdropping, remote login (via SSH), SSH tunneling, file transfer, BSD licence
* **OpenVPN** = FOSS client/server VPN using OpenSSL encryption library
* **PCAP** (Packet Capture) = API for capturing network traffic (packet sniffing)
  * **libpcap** = Unix implementation of pcap API (base driver)
  * **WinPcap** = Windows port of libpcap (_discontinued_)
  * **Npcap** = Windows 7 port of libpcap
* **Putty** = FOSS SSH & telnet client
* **tcpdump** = Unix Packet analyzer (uses libcap)
* **TMeter** = free network packet traffic analyzer with built-in firewall & NAT capabilities
* **WebMin** = web-based server management control panel for Unix systems (eg users, disk quotas, services, config files)
* **Wget** = HTTP(S)/FTP CLI to GET files from web servers
* **WireGuard** = communication protocol & FOSS encrypted VPN (native on Ubuntu)
  * Cfr Florent depuis machine locale (Vue sur Nginx avec IP dynamique) via tunnel bi-directionnel (en tant que connexion réseau Windows virtuelle) à machine (virtuelle) publique (droplet DigitalOcean pour l'IP fixe)
* **Wireshark** = network packets analyzer (uses WinPcap or Npcap)
  * Protocol inspection, live capture & offline analysis, rich VoIP analysis, multi-platform, multiple capture file formats, decryption support, GUI & CLI (TShark)
* **WinDump** = Windows port of tcpdump (uses WinPcap)

## Wi-Fi

* **AAA Key** (Authentication, Authorization & Accounting) aka **MSK** (Master Session Key) = additional key so that each client has a separate session
* **AP** (Access Point) = router
* **EAPOL** (Extensible Authentication Protocol) = authentication framework frequently used in (inter)network connections, via variety of methods (TLS, PSK)
* **EAPOL-Key**
* **GMK** (Group Master Key)
* **GTK** (Group Temporal Key)
* **IEEE 802** = family of standards for LAN, PAN & MAN
* **IEEE 802.11** = WLAN (Wi-Fi)
* **Monitor Mode** (& Packet Injection) = features of some WiFi routers (such as Taiwanese Alfa Network AWUS1900)
* **PMKID** = unique key used by AP to keep track of PMKs used by clients (for cacheing purposes, derived from AP MAC, Client MAC, PMK, PMK Name)
* **PMK** (Pairwise Master Key) = 256-bit key used to encrypt WiFi data between a client & router, it is composed of a Pre-shared Key (and additional AAA Key for _WPA-Enterprise_)
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
* **Yagi(–Uda) antenna** = directional antenna

* _ESP32_ (_Espressif Systems_) = low-cost low-power Wi-Fi & Bluetooth system-on-a-chip (SoC) MCU (Microcontroller Unit, ie an electronic board/chip)

* _Aircrack-ng_ = WiFi packet monitoring/sniffing & cracking tools suite, WEP/WPA key recovery, replay attacks, deauthentication, fake access points via packet injection, CLI
  * _aircrack-ng_ = cracks WEP keys
  * _airdecap-ng_ = decrypts WEP/WPA encrypted capture files
  * _airmon-ng_ = enable monitor mode on wireless interfaces or kill network managers
  * _airodump-ng_ = packet sniffer
  * _airserv-ng_ = access other computers' wireless card
  * _easside-ng_ = communicate to access point without WEP key
  * Other CLI commands = _airmon-ng_, _aireplay-ng_, _airtun-ng_, _packetforge-ng_, _ivstools_, _airbase-ng_, _airdecloak-ng_, _airolib-ng_, _buddy-ng_, _tkiptun-ng_, _wesside-ng_
* _bettercap_ = (Go-based) hacking tool for WiFi, Bluetooth Low Energy, wireless hijacking
* _Flipper Zero_ = open-source & customizable portable multi-tool for hackers/pentesters (RFID, radio protocols, access control systems, GPIO pins hardware)
* _Pwnagotchi_ (for _Raspberry Pi Zero W_) = WiFi cracking (via AI + bettercap, [Guide](https://www.reddit.com/r/pwnagotchi/comments/sl2rv1/guerrilla_guide_to_pwnagotchi_v1552022))
* _WiFi Pineapple_ = pentesting router (monitoring, AP spoofing, targeted captive portals)
