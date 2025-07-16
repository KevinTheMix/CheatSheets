# Network & Protocols

## Quick Tips

* [DNSstuff tools](https://www.dnsstuff.com/freetools)
* Florent = HTTP requests handled by local _Nginx_ serving Vue app through bi-directional VPN tunnel via _WireGuard_ (adding OS-level virtual network I/Os) between local (dynamic IP) machine and public remote (fixed IP) _DigitalOcean Droplet_ VM

## Glossary

* **Active Directory** (AD) = directory service for Windows domain networks using a number of standardized protocols to provide a variety of network services (eg DNS-based naming)
* **Directory Service** = maps network resources names to their respective network (eg IP) addresses (eg DNS)
* **DMZ** (De-Militarized Zone) = network area that's neither internal or public, where public-facing (email/web) servers get placed
  * Traffic with a DMZ is mostly one-way towards it, ie it has very limited connectivity towards the internal network (as much as the firewall allows basically)
  * Clients connect _directly_ (through the firewall) to different servers **within the DMZ**; that is unlike a reverse proxy that hides all the internal servers behind it
* **gRPC** = cross-platform open source RPC framework (by Google) using HTTP/2 for transport & **Protobuf** to encode data, usually connecting microservices or mobile clients to backends
  * Faster than HTTP, cannot be used with IIS
* **HTTP/2** = major revision of HTTP (developed by Google), derived from (obsolete) SPDY communication protocol, supported by nearly 100% of browsers
* **HTTPS** = TLS layer between HTTP & TCP, attested via a digitally signed server certificate, initiated via public crypto key handshake
* **ICMP** (Internet Control Message Protocol) = Network layer supporting IP suite protocol, used by routers (and some by users eg `ping`, `traceroute`) to send error messages and OK/NOK statuses
* **IPSec** (Internet Protocol Security) = network-layer protocol suite that secures IP packets by authenticating/encrypting each of them in a session
  * Uses IKE (Internet Key Exchange) to negotiate keys & settings
* **Lightweight Directory Access Protocol** (LDAP) = open neutral application protocol (OSI model layer 7) for accessing/maintaining distributed directory service over IP network
* **Protocol Buffers** (aka _Protobuf_) = FOSS cross-platform data format (by Google) used to serialize structured data, described via a WSDL-like Interface Description Language (IDL)
* **Proxy (Server)** = intermediary in a client-server network, can be forward (at client) or reverse (at server)
* **PuTTY** = FOSS (ssh, telnet, etc) terminal client for (OS/hardware) administration over networks, (originally) for Windows
* **Reverse Proxy** = accepts incoming client connections on behalf of server, hiding & representing it to outside world, for security (eg DMZ), caching, logging, monitoring user activty
* **Reverse SSH Tunneling** = have a (usually well-protected) remote computer open a connection back to local machine (with SSH started from local machine)
* **SSH** (Secure Shell) = client-server crypto protocol for network services over unsecured network (ie remote login, then CLI or GUI via X11 Forwarding-compatible apps, file transfer via **SFTP**)
  * Exchange shared secret (session key) over an insecure channel using ECDH (Elliptic Curve Diffie-Hellman)
  * Once that session key is shared, all traffic is encrypted using a faster symmetric cipher (eg AES)
  * Authentication is then established via either public key (eg ed25519) or password (less secure)
* **SSL** (Secure Sockets Layer) = deprecated encryption protocol replaced with **TLS**
* **Single Sign-On** (SSO) = login once and use multiple systems/applications, improving user experience (eg OAuth 2.0 google/facebook, or entreprise-wide SAML-based SSO eg Azure AD or Okta)
* **SOCKS** = application-layer lightweight general-purpose proxy protocol, facilitates client-server communication through a firewall
  * Convenient with `ssh -d`, but any program that can accept a TCP connection and speak the few-byte SOCKS handshake can be a SOCKS server
* **Telnet** = older (abandoned in favor of **SSH**) bi-directional client-server application protocol to access virtual terminals of remote system on LAN/Internet
* **TLS** (Transport Layer Security) = cryptographic protocol to provide communications security over a network
* **TLS Handshake** = client initiates an asymmetric connexion, then sends a (faster & more efficient for large amounts of data) symmetric key encrypted using server public key found in its certificate
* **VPN** (Virtual Private Network) = full network access via encrypted link (through VPN server), with optional firewall/NAT
* **VPS** (Virtual Private Server) = VM simulating a dedicated physical server environment (but actually shared with other users)
* **X.500** = series of networking standards covering electronic directory services

* _cURL_ = CLI for data transfer (FTP, HTTP, Email & co)
* _Cyberduck_ = (S)FTP, WebDAV (aka HTTP) & cloud storage (S3, Azure) client
* _FileZilla Portable_ = no-install FTP
* _FileZilla Server_ = FTP Server
* _LeechFTP_ = multi-threaded FTP client
* _OpenSSH_ = cross-platform (BSD licence) suite of SSH-based secure channel utilities (eg **sshd** a SSH server daemon) over an unsecured network in a client-server architecture
* _OpenSSL_ = implements TLS/SSL & other crypto functions (AES, RSA, SHA), with certificate handling (X.509), key generation/signing/verification
* _OpenVPN_ = FOSS client/server VPN using OpenSSL encryption library
* _Putty_ = FOSS SSH/SCP & Telnet/rlogin client (1999)
* _Wget_ = HTTP(S)/FTP CLI to GET files from web servers
* _WireGuard_ = communication protocol & FOSS encrypted VPN (native on Ubuntu), adds an OS-level virtual network interface

### E-mail

* **ADSP** (Author Domain Signing Practices) = optional extension to DKIM
* **ARC** (Authenticated Received Chain) = new (2019) auth protocol that adds a cryptographically verifiable chain of custody to every hop a (transfered) e-mail takes (à la blockchain)
* **BIMI** (Brand Indicators for Message Identification) = add brand logo (validated by a third-party) to outgoing e-mails
  * **CMC** (Common Mark Certificate)
  * **VMC** (Verified Mark Certificate)
* **DKIM** (DomainKeys Identified Mail) = e-mail authentication scheme, lets sender automatically sign outgoing e-mails, checkable via a public key
* **DKIM Record** = specialized DNS TXT records that stores public key used in DKIM
* **DMARC** (Domain-based Message Authentication, Reporting & Conformance) = policy protocol between servers to align SPF/DKIM failing e-mails (aka spams) management, and alert sender
* **DMARC Record** = stores DMARC policies
* **DNS** (Domain Name System) = phonebook of the Internet, hierarchical maps of readable URLs to IP addresses
* **DNS Record** = information about domains provided by authoritative DNS Servers, of different types:
  * **A / AAAA** = IP addresses for hosts (IPv4/IPv6)
  * **CNAME** (Canonical Name) = maps one domain name to another (ie alias)
  * **MX** = which hosts (ie servers) accept incoming e-mail for a domain
  * **TXT** = free form text, widely used for SPF, DKIM keys, verification tokens
* **ESP** (Email Service Provider) = cloud platform providing infrastructure to send/receive/track large volumes of e-mails (eg marketing newletter, receipts, password resets, etc)
* **IMAP** (Internet Message Access Protocol) = Internet standard protocol used by (multiple) e-mail clients to retrieve e-mail from a mail server over a TCP/IP connection
* **MIME** (Multipurpose Internet Mail Extensions) = e-mail format extension to support multi-part body, non-ASCII character sets, and multimedia attachments
* **MTA** (Message Transfer Agent) = queries MX records about an e-mail's recipient(s), and establishes an SMTP connection with those servers (by MX record priority)
* **MX** (Mail eXchanger) = e-mails routing information queryed by MTAs to accomplish SMTP
* **MX Record** = DNS Record indicating which servers should receive mail for a domain, ie a routing table using a priority list to direct e-mails to one or more mail servers
* **POP(3)** (Post Office Protocol) = application-layer Internet standard protocol used by e-mail clients to retrieve e-mail from a mail server
* **S/MIME** = standard for public-key encryption/signing of MIME data
* **SMTP** (Simple Mail Transfer Protocol) = Internet standard communication protocol for electronic mail transmission used by servers and MTAs
* **SPF** (Sender Policy Framework) = protocol to let e-mail sending domains publish a record list of authorized source address to send and avoid getting flagged as spam by receivers
* **SPF Record** = DNS TXT records including a list of IP addresses & domains authorized to send emails from a domain
* **TLD** (Top-Level Domain) = root (eg _.com_)

* _FEI_ (Forensic Email Intelligence, by _Metaspike_) = commercial desktop tool to dissect raw e-mail evidence for investigations
* _Mailgun_ = one of the best known ESPs, using REST/SMTP API (rather than a drag&drop GUI)
* _SendGrid_ (by _Twilio_) = ESP

### Wi-Fi

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
