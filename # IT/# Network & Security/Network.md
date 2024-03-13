# Network

## Quick Tips

* In Windows, execute > `mmc(.exe)` > File > _Add/Remove Snap-in…_ (`Ctrl + M`) > Certificates > Add
* In Windows, execute > `certmgr.msc`
* In Firefox, click on lock > Connection secure > More information > View Certificate = shows the certificate chain (from child to root)

## Glossary

* **DMZ** (De-Militarized Zone) = network area that's neither internal or public, where public-facing (email/web) servers get placed
  * Traffic with a DMZ is mostly one-way towards it, i.e. it has very limited connectivity towards the internal network (as much as the firewall allows basically)
  * In a DMZ, clients still connect _directly_ (through the firewall) to different servers within the DMZ. That is unlike a reverse proxy that hides all the internal servers behind it
* **gRPC** = cross-platform open source RPC framework (by Google) using HTTP/2 for transport & Protocol Buffers to encode data, usually to connect microservices, or connecting mobile clients to backends
* **HTTPS** = TLS layer between HTTP & TCP, attested via a digitally signed server certificate, initiated via public crypto key handshake
* **OAuth** = authorization framework standard for access delegation
* **OpenID Connect** = authentication layer for OAuth 2.0
* **Protocol Buffers** (aka _Protobuf_) = FOSS cross-platform data format (by Google) used to serialize structured data, described via a WSDL-like Interface Description Language (IDL)
* **Proxy (Server)** = intermediary in a client-server network, can be forward (at client) or reverse (at server)
  * **Reverse Proxy (Server)** = retrieves resources on behalf of clients (can be used for security (eg a DMZ), caching, logging, monitoring user (employee) activty)
* **SAML** (Security Assertion Markup Language) = authentication & authorization exchange standard between id & service provider (enables SSO across different domains)
* **SSL** (Secure Sockets Layer) = deprecated encryption protocol replaced with **TLS**
* **TLS** (Transport Layer Security) = cryptographic protocol to provide communications security over a network
* **TLS Handshake** = client initiates an asymmetric connexion, then sends a (faster & more efficient for large amounts of data) symmetric key encrypted using server public key found in its certificate

* _cURL_ = CLI for data transfer (FTP, HTTP, Email & co)
* _Cyberduck_ = (S)FTP, WebDAV (aka HTTP) & cloud storage (S3, Azure) client
* _FileZilla Portable_ = no-install FTP
* _FileZilla Server_ = FTP Server
* _HTTrack_ = Web crawler/copier (also as no install)
* _LeechFTP_ = multi-threaded FTP client
* _OpenVPN_ = FOSS client/server VPN using OpenSSL encryption library
* _Putty_ = FOSS terminal emulator, console & network file transfer application (SCP, SSH, SFTP, Telnet, raw sockets)
* _Wget_ = CLI to GET files over HTTP(S), FTP(S)

### Certificates

(Public Key) Certificates are a means to attest the authenticity & trustworthiness of an entity (eg some information or website), more accurately of its associated **public key**.
It is a document containing certain metadata (subject, validity start/end), the trusted issuer identity (CA name & tamper-proof **digital signature**), and a **public key**.
Certificates are notably used in **TLS** (for HTTPS), and **SAML** authentication (to represent a logged user).

* **Certification Authority** (CA) = an issuing entity that can be trusted to validate other entities below it in a nested tree chained/propagated trust model
* **CA Public Key** = known (or easily obtainable from a trusted source - but not part of the certificate itself) key to verify the validity of a CA's digital signature
* **CA Digital Signature** = CA-issued signature (a large number) produced by irreversably hashing the certificate content (cannot be reused for another website), then encrypting it through the CA's private key
* **Certificate Signing Request** (CSR) = message sent by an applicant CA to apply for a digital certificate, it contains the applicant's public key (that it chose/computed for itself)
* **Online Certificate Status Protocol** (OCSP) = internet protocol for obtaining the revocation status of an X.509 digital certificate
* **Personal Information eXchange** (_.pfx_, or _.pvk_+_.spc_ (or _cer_) combo) = password-protected certificate file holding both public & private keys, can be used to code sign an application
* **Public Key** = key present in a certificate that can be used to send securely encrypted information to a server
  * Its counterpart (asymmetric) private key remains stored secretly on the server; it is configured once upon certificate install - a certificate including both keys can be exported as a _.pfx_ file
* **Root CA** = top-level CA in the chain of trust; renown public ones are installed by default (eg Symantec, Thawte, Verisign), with more that can be installed locally manually
  * Those renown authorities are assumed to have performed some authenticity/integrity checks on a website before delivering a certificate
  * Any website that requires SSL (for HTTPS) must first register to one of those public root CA and pay a subscription fee
* **Self-Signed Certificate** = certificate that are not issued by a CA, basically managing custom certificates (chain) manually
* **X.509** = standard defining the format of public key certificate (also defines extensions eg _.pfx_)

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
