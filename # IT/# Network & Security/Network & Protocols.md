# Network & Protocols

## Quick Tips

* [Network Encyclopedia](https://networkencyclopedia.com)
* [DNSstuff tools](https://www.dnsstuff.com/freetools)
* [TCP & UDP Port numbers](https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers) = Well-knownn Registered, Dynamic/Private/Ephemeral
* [Notable well-known Port numbers](https://en.wikipedia.org/wiki/Port_(computer_networking)#Common_port_numbers)
* Florent = HTTP requests handled by local _Nginx_-served Vue app through bi-directional VPN tunnel via _WireGuard_ (adding OS-level virtual network I/Os) between local (dynamic IP) machine and public remote (fixed IP) _DigitalOcean Droplet_ VM

## Glossary

* **AMQP** (Advanced Message Queuing Protocol) = open standard binary application layer protocol for message-oriented middleware (with message orientation, queueing, routing, reliability & security)
* **Bluetooth Low Energy** (BLE) = wireless PAN technology aimed at novel applications in healthcare, fitness, beacons, security & home entertainment industries
* **Directory Service** = single DB of everything (computers, user accounts, file shares, printers, groups) on network, maps network resources names to their respective (IP) addresses (via DNS), providing centralized authentication/access control
  * Eg used by help desk to reset passwords & add/remove accounts
* **DMZ** (De-Militarized Zone) aka aka Perimeter Network Screened-Subnet = physical or logical subnet that contains/exposes an organization's external-facing public services (eg email, web servers) through a firewall
  * It is a separate subnet neither internal or public, has very limited connectivity towards internal network (through same or another firewall), and does not initiate outbound connections
  * Clients connect _directly_ (through a firewall) to its services, unlike a reverse proxy that hides all the internal servers behind it
* **Ethernet** = family of wired technologies used in LAN (local), MAN (metropolitan) & WAN (wide)
* **Firewall** = network security service that monitors & controls incoming/outgoing traffic
* **FTP** (File Transfer Protocol) = can be active (client start control connection, server starts data connection) or passive (client starts both, so works better with client-side firewalls)
* **HTTP** (HyperText Transfer Protocol)
* **HTTP/2** = major revision of HTTP (developed by Google), derived from (obsolete) SPDY communication protocol, supported by nearly 100% of browsers
* **HTTPd** (HTTP daemon) = any software running as background process and playing server in a client-server model, using HTTP(S) protocol (eg Apache HTTP Server)
* **HTTPS** (HTTP Secure) = TLS layer between HTTP & TCP, attested via a digitally signed server certificate, initiated via public crypto key handshake
* **IDL** (Interface Description Language) = contract/model format description (à la WSDL)
* **Jitter** = time gap consistency between data packets, becomes chaotic in case of congestion (eg choppy voice/video call)
* **LDAP(S)** (Lightweight Directory Access Protocol (Secure)) = open vendor-neutral application protocol (OSI model layer 7) for accessing/maintaining distributed directory service (ie centralized authentication) over IP network
* **Marshalling** = ensuring data gets from point A to point B (broader than serialization)
* **Network Access Control** (NAC) = approach that attempts to unify endpoint security (eg antivirus, intrusion detection), user/system authentication & network security (eg _802.1X_)
* **NetBIOS** (Network Basic Input/Output System) = obsolete session layer API/services/name resolution system letting applications on different computers in same LAN communicate
  * Uses/registers simple names (eg _SERVER1_) to identify computers without an IP address (this predates widespread use of DNS in LANs)
  * **WINS** (Windows Internet Name Service) = Microsoft network service mapping NetBIOS names to IP addresses (circa Windows NT)
* **NTP** (Network Time Protocol) = time provider, usually from a centralized server (NTP Server accessed from NTP Clients)
* **Packet Switching** = grouping data into short messages in fixed format transmitted over a network (a channel is occupied during transmission of a packet only, and made available afterwards)
* **PAN** (Personal Area Network) = own private network (bluetooth, IR, NFC eg automotile, wireless headset, connected watch)
* **PAT** (Port Address Translation, or NAT Overload) = router mechanism enabling local network device to send/receive corresponding traffic (initiated locally) from internet, from a single shared public IP
* **Port** = transport layer (L4) communication endpoint, can be Well-known (_0-1023_), Registered (_1024-49151_) or Dynamic/Private/Ephemeral (_49152-65535_)
* **Port Forwarding** (or **Port Mapping**) = redirects traffic from one port to another (used in PAT or reverse SSH tunneling)
  * **Local** = binds a local port to a remote one (eg `ssh -L` starts a local SSH client, creates a TCP-listening socket on local port, and forwards data to final destination via a SSH server)
  * **Remote** or **Reverse** = binds remote port to local one (eg `ssh -R` starts a local SSH client and creates a TCP-listening socket on remote machine forwarding data to local machine)
  * **Dynamic** = eg SOCKS
  * **Destination NAT** or **Static NAT** = router manual rule/configuration enabling uninitiated inbound connections to a specific local device's IP & port, making it accessible from internet
* **Protocol Buffers** (aka _Protobuf_) = FOSS Google cross-platform (efficient binary) IDL used to serialize strongly-typed/structured data
* **Proxy (Server)** = application-layer intermediary in a client-server network, can be forward (at client, eg provide cacheing, application content/URL filtering) or reverse (at server)
* **RADIUS** (Remote Authentication Dial-in User Service) = client-server application layer networking protocol providing centralized AAA management for users connecting/using a network service
* **RDP** (Remote Desktop Protocol)
* **Reverse Proxy** = accepts incoming client connections on behalf of server, hiding & representing it to outside world, for load balancing, security (eg DMZ), caching, logging, monitoring user activty
* **Reverse SSH Tunneling** = have a (hard to reach/well-protected behind NAT/firewall) computer grant access to it from outside by initiating an outbound SSH connection & reverse port forwarding
  * Outside machine is pre-configured to accept SSH connections (via SSHD) and allow remote/reverse port forwarding to send (usually local) TCP traffic through tunnel to protected machine
* **RPC** (Remote Procedure Call) = serialize (strongly-typed) local method call to remote handler and back
  * **gRPC** = Google cross-platform open source bi-directional (with codegened client-server stubs) real-time RPC framework using HTTP/2 for transport & Protobuf to encode data
  * **Interceptors** = both at client & server endpoints enable inspection & modification (à la middleware, ie logging, metrics, authentication, retries, rate limiting)
  * Strict common IDL contract (faster than HTTP1.1+REST overhead) promotes reliability/speed at scale between internal tightly-coupled microservices, or mobile clients & backends
  * Not ideal for loosely-coupled public/external/universal facing services (cannot use cURL, Postman, IIS), where human-friendly HTTP REST or GraphQL can still be used
* **SFTP** = file transfer over ssh
* **Spanning Tree Protocol** (SPT) = network protocol that builds loop-free logical topology for Ethernet networks, prevents bridge loops (resuliting in broadcast storms)
* **SSH** (Secure Shell) = application-layer client-server crypto protocol for network services over unsecured network (first remote login, then either CLI or GUI via X11 Forwarding-compatible apps)
  1. establish plain TCP channel (over port 22 by convention, via three-way ACK/SYN-ACK/ACK handshake)
  2. agree on SSH protocol version & key exchange algorithms (aka KEX, eg _curve25519_/_ECDH_/_DH_)
  3. server immediately sends public key (ie half of asymmetric key pair generated by algorithm, eg _ECDSA_/_Ed25519_/_RSA_) inside its key exchange reply
  4. client compares server public key against version it has cached in a _~/.ssh/known\_hosts_ file (if public key for same host has changed, a clear warning is issued)
  5. if host is yet unknown, TOFU model (Trust-on-First-Use) applies: a shorter/human-friendly (SHA-256, previously MD5) hashed fingerprint of server public key is calculated & presented to user to confirm they have verified its authenticity, potentially comparing it against out-of-band information
  6. in case of a valid new connection, client saves (based64-encoded) server public key along with (salted & HMAC-hashed because also treated as sensitive) hostname in _~/.ssh/known\_hosts_
  7. key exchange occurs using one of KEX algorithms established earlier, and mutiple symmetric keys (eg _AES_) are derived (one per direction & for MAC)
  8. further communication now symmetrically encrypted & MAC-signed
  9. server finally authenticates client (now that server validity was assured and a secure communication channel was established between parties)
  * Client authentication can be performed via either public key challenge (client public key is stored in that already existing user's _.ssh/authorized\_keys_ folder) or password (less secure)
  * Public key is the preferred choice, as it eliminates passing password over channel (even hashed, can be brute-forced, replayed), and human factor (must be remembered, rotated)
* **SSH Server** = runs a SSH daemon, has root priviledges
* **SMB** (Server Message Block) = family of protocols to share resources (eg files, printers, serial ports) over a network, with Kerberos or NTLM authentication, originally by Microsoft (no longer relying on NetBIOS)
  * **CIFS** (Common Internet File System) = a specific implementation of SMB (1.0) considered inefficient, insecure & deprecated
* **Single Sign-On** (SSO) = login once and use multiple systems/applications, improving user experience (eg OAuth 2.0 google/facebook, or entreprise-wide SAML-based SSO eg Azure AD or Okta)
* **Socket** = bidirectional OS-managed TCP or UDP communication endpoint, enabling interprocess data exchange via standard I/O semantics (à la shared file)
  * It is essentially an OS-level abstraction encapsulating several concrete resources & state (2 send/receive buffers, a file descriptor, a network IP address, TCP/UDP protocol control & queueing)
  * A **Listening** = created locally (with a local IP address & Port pair) and listens to incoming connection requests (one such socket to one local Port)
  * A **Accepted**/**Connected** = identifies a unique established TCP connection (as two local & remote IP/Port pairs, so possibly many such sockets to one local Port and listening Socket)
* **SOCKS** = application-layer lightweight general-purpose dynamic port forwarding proxy protocol, facilitates client-server communication through a firewall
  * SOCKS-compatible programs (such as Firefox) usually exhibit some sort of "network settings" where a SOCKS proxy can be entered through which all traffic is directed
  * (Convenient with `ssh -D`, but any program that can accept a TCP connection and speak the few-byte SOCKS handshake can be a SOCKS server)
* **SSL** (Secure Sockets Layer) = deprecated encryption protocol replaced with **TLS**
* **SSL/TLS Handshake** = client initiates an asymmetric connexion, then sends a (faster & more efficient for large amounts of data) symmetric key encrypted using server public key found in its certificate
  * Client initiates connection to the server on port 443 (the default port for HTTPS)
  * Server responds by presenting its SSL/TLS certificate file content (over TLS itself, with TCP underneath)
  * Client verifies certificate (CA signature, domain name) & initiate a (symmetric) session key exchange (Diffie-Hellmann or some variation)
  * Server must sign that key exchange using its certificate private key (only that key is able to complete that challenge)
  * An attacker possessing only the public certificate cannot forge a signature, nor decrypt handshake messages
  * The client and server have now established a secure connection, and use exchanged key to encrypt future communication
* **SSL Termination Proxy** = proxy server acting as intermediary point between client/server applications that terminates/establish TLS tunnels
  * Allows using HTTPS for public-facing traffic but faster normal HTTP after first gateway for internal quicker communications
* **TACACS** (Terminal Access Controller Access-Control System) = older (ARPANET-era) authentication framework (associated with Cisco switches/routers), modernized as TACACS+
* **Telnet** (Telecommunication Network) = older (abandoned in favor of **SSH**) bi-directional client-server application protocol to access virtual terminals of remote system on LAN/Internet
* **TLS** (Transport Layer Security) = cryptographic protocol to provide communications security over a network
* **TTL** (Time To Live) = mechanism using a number of (router) hops to limits lifespan/lifetime of data in a computer or network so it does not circulate indefinitely
* **WWAN** (Wireless Wide Area Network aka Mobile Broadband) = using mobile telecom cellular network (2G, 3G, 4G, LTE, 5G) to transfer data (eg using phone or dedicated WWAN card as gateway)
* **X.500** = series of networking standards covering electronic directory services

* _Apache HTTP Server_
* _cURL_ = CLI for data transfer (FTP, HTTP, Email & co)
* _Cyberduck_ = (S)FTP, WebDAV (aka HTTP) & cloud storage (S3, Azure) client
* _FileZilla Portable_ = no-install FTP
* _FileZilla Server_ = FTP Server
* _LeechFTP_ = multi-threaded FTP client
* _lighttpd_ (light + HTTPd ie a server daemon) = open-source web server optimized for speed-critical environments
* _MiFi_ = (multiple) brands of wireless routers (ie 3/4/5G dedicated devices acting as mobile Wi-Fi hotspots)
* _Nginx_ = FOSS web server that can be also used as a reverse proxy, load balancer (used for this by large fraction of web servers), mail proxy & HTTP cache
* _Ngrok_ = reverse proxy tunnel to expose a local server to the public internet (bypassing need for configuring firewall/NAT/port forwarding rules), ideal for testing webhooks
* _OpenSSH_ = cross-platform (BSD licence) suite of SSH-based secure channel utilities (eg **sshd** a SSH server daemon) over an unsecured network in a client-server architecture
* _OpenSSL_ = implements TLS/SSL & other crypto functions (AES, RSA, SHA), with certificate handling (X.509), key generation/signing/verification
* _OpenVPN_ = FOSS client/server VPN using OpenSSL encryption library
* _PuTTY_ = FOSS (ssh/scp, telnet/rlogin, etc) terminal client for administration over networks, (originally) for Windows (1999)
* _Samba_ = free re-implementation of SMB, providing file & print services for Windows clients, running on Unix-like systems (including macOS)
  * `smbclient` = ftp-like client to access SMB/CIFS resources on servers
* _Wget_ = HTTP(S)/FTP CLI to GET files from web servers
* _WireGuard_ = FOSS VPN communication protocol (native on Ubuntu) for creating secure point-to-point encrypted tunnels between machines (adding OS-level virtual network interface)
* _Wireshark_ = FOSS network packets analyzer (uses WinPcap or Npcap)
  * Protocol inspection, live capture & offline analysis, rich VoIP analysis, multi-platform, multiple capture file formats, decryption support, GUI & CLI (TShark)

### Enterprise Devices

* **Access Point** = single bridge device extending a wired network onto wireless network
* **BSSID** (Basic Service Set Identifier) = 48-bit label confirming to MAC-48 to identify a Wi-Fi AP (eg for local network devices communication through a L2 switch/router)
* **Concentrator** = company-wide VPN access device (or software) that encrypts/decrypts outbound/inbound data, with firewall
* **COPE** (Corporate Owned, Personally Enabled) = mobile devices owned by company but configured as both a personal/corporate device
* **DOCSIS** (Data Over Cable Service Interface Specification) = internet via cable television modem
* **F Connector** = associated with cable television & cable model links
* **Firewall** = filters by either port or application, encrypt/decrypts traffic between sites
* **Hub** (or Repeater Hub) = connects multiple Ethernet devices together acting as a single network segment, broadcasting one input of any port to all other ports (which filter incoming data as needed)
* **IEEE 802** = family of standards for LAN (local), PAN (personal) & MAN (metropolitan)
  * **IEEE 802.03** = Ethernet
  * **IEEE 802.11** = WLAN (Wi-Fi)
  * **IEEE 802.16** = WirelessMAN aka WiMAX
  * **IEEE 802.1X** = network port-based (physical or logical, not an IP port) access control standard to authenticate devices before they are allowed on network (typically via a RADIUS authentication server)
* **MAC** (Media Access Control) Address = unique identifier assigned to a NIC for use as a network address in communications within a network segment
  * **MAC-48** (aka **EUI-48** usually) = 48-bit identifier usually represented as 2x6 hexadecimals (6 bytes) split into two parts
  * **MAC-64** = extension of EUI-48, lengthened to 64 bits (by inserting _FF:FE_ in middle and flipping U/L bit)
  * **NIC** (Network Interface Controller) = last 24 bits uniquely identify device within vendor's allocation
  * **OUI** (Organizationally Unique Identifier) = first 24 bits identify manufactured/vendor, its last 2 bits carry special meaning (factory default to _0_)
    * I/G (Individual/Group) = indicate a destination address is multi/broadcast
    * U/L (Universal/Local) = is this address a factory one part of the hardware NIC (ie universally unique), or was it reconfigured/overriden by OS/admin in software (unique only locally)
* **MDM** (Mobile Device Manager) = central policy-controlled management of an enterprise's mobile company-owned and user-owned (aka BYOD) devices fleet (eg Microsoft Intune, Applie Configurator)
* **NIC** (Network Interface Card) = a device's network card (associated with a MAC)
* **ONT** (Optical Network Terminal) = converts an ISP's fiber optics to customer's copper Ethernet devices
* **Patch Panel** = hardware device onto which employees computers are statically connected, then individually linked to a switch over RJ45 cables
* **Plenum** = dropped ceiling or raised floor facilitating HVAC air flow/circulation (see Messer video on Network Cables), requiring special fire-rated (ie non-toxic) cables
* **Port Replicator** = external connectivity hub (à la single plug docking station)
* **Power over Ethernet** (PoE) = provides electricity over an ethernet cable, useful in difficult-to-power areas
  * **Endspan** = built in Switch
  * **Midspan** = provided by an in-line power injector (ie an ethernet relay also working as a power adapter plugged into an electrical outlet)
* **Punchdown Block** = wire-to-wire patch panel where where RJ cables terminate
* **RJ11** & **RJ14** = Phone & DSL
* **RJ45** = ethernet data & power
* **Router** = connects networks together, moving packets between them & choose best path using an IP routing table (OSI Layer 3 and above)
* **SNMP** (Simple Network Management Protocol) = internet standard for configuring/organizing hardware network devices (routers, switchs, modems, printers) behavior
* **SOHO** (Small Office/Home Office) = characterizes a network of modest size (1-1000 users), and associated hardware (eg basic home router)
* **Switch** = multiport bridging hardware connecting devices via from/to packet switching
  * **L2 Switch** = routing within a VLAN (not between VLANs), using MAC addresses to forward data at data link layer (does not have a MAC address itself, just forwards frames)
  * **L3 Switch** = L2 switch with build-in network layer routing capabilities (eg for campus or data center)
* **Toner Probe** = helps identifying one cable corresponding ends
* **UPnP** (Universal Plug and Play) = set of zero-configuration protocols built into SOHO devices to discover network peers & self-configure automatically or via a software application (to be disabled for entreprise security)
* **VLAN** (Virtual Local Area Network) = a logical network configured at one (or more) Switch's level (eg splitting interfaces/ports available on a Switch into two separate seggregated networks)
* **VPN** (Virtual Private Network) = network layer encrypted data traversing a public network (through a VPN server ie a Concentrator), optionally with firewall/NAT

### OSI Model

Abstract conceptual division of responsibilities.
Multiple layers capabilities can be taken care by a single layer (eg Session & Presentation Layer can be made at Application-level).
Layers sometimes shortened to _Ln_ (eg _L2_ for Transport Layer 2)

* Layer 1 (**Physical**) = raw **bits/symbols** over cable, radio, fiber, electrical connectors, frequencies & isolation
* Layer 2 (**Data Link**) = IEEE 802.3 Ethernet or IEEE 802.11 Wi-Fi protocols **frames**, MAC address, error checking, basic sending & receiving
* Layer 3 (**Network**) = **packets** (or **datagrams**) routing between VLANs, breaking down long data streams into segments shorter than network MTU
* Layer 4 (**Transport**) = UDP **user datagrams** or variable-length TCP **segments** sequences end-to-end with QoS functions
* Layer 5 (**Session**) = creates setup, controls connection, ends teardown (disconnect) between computers
* Layer 6 (**Presentation**) = data formatting/translation into application layer specified format (ie encoding/decoding)
* Layer 7 (**Application**) = user software (eg a browser)
* **Datagram** = PDU of a connectionless protocol (independent of layers, ie L3 routed packets or L4 UDP)
* **MTU** (Maximum Transmission Unit) = (size of) largest PDU that can be communicated in a single network layer transaction
* **PDU** (Protocol Data Unit) = single unit of information transmitted among peers in a network, composed of layer-specific control information & encapsulated SDU from higher level
* **SDU** (Service Data Unit) = unit of data passed down from a higher to a lower layer, which treats it as its payload (to encapsulate with its own control data, in an onion fashion)

### Internet

* **Address Block** (or IP Prefix) = contiguous range of public (delegated top-down via RIR -> LIR/ISP -> customer) or private IP addresses
* [Addressing Methods](https://en.wikipedia.org/wiki/Broadcasting_(networking)#Addressing_methods)
  * **Anycast** = one-to-one-of-many (any one out of a group of nodes, typically nearest)
  * **Broadcast** = one-to-many (everyone)
    * At L2, an MAC broadcast can be sent to all devices on local network segment (MAC _FF:FF:FF:FF:FF:FF_ eg ARP request or DHCP Discover)
    * At L3, an IPv4 limited to local subnet (eg DHCP discover _255.255.255.255_ when sender doesn't know its network) or directed to a specific subnet (with just host portion bits all set to _1_) can be sent
  * **Multicast** = one-to-many (group of destination that have expressed interest in receiving, ie L2 MAC address with I/G set ie starting with _01:…_)
  * **Unicast** = one-to-one transmission (specific node)
* **APIPA** (Automatic Private IP Addressing) = auto-addressing scheme that lets a device configure its own **link-local IP** in absence of any DHCP Server
  * **Link-Local Address** = self-assigned a pseudo-random IP which cannot be used to route outside local subnet (so, no internet connectivity)
    * IPv4 in range _169.254.1.0 - 169.254.254.255_ (excluding 2x256 reserved addresses), IPv6 starting with _fe80::_ (with trailing _%n_ zone index to differentiate potentially identical addresses on multiple NICs)
    * Uses a Broadcast ARP request to make sure self-assigned random IP does not conflict with an existing IP of another device on network
    * Automatically used when a DHCP server is not available, unless a static address was configured manually locally (in Windows connection IP Properties)
* **ARP** (Address Resolution Protocol) = maps (L3) IPv4s to (L2) MAC addresses
  * An host broadcasts an IPv4 address, and intended target (when present) broadcasts its MAC address back
  * ARP Broadcast = broadcast (Ethernet whole subnet ie destination MAC _FF:FF:FF:FF:FF:FF_) message to look up a specific IP address among all network hosts
  * ARP Reply = unicast message containing a MAC address sent back by IP owner (if present)
* **Autonomous System** (AS) = collection of IP networks (ie routing prefixes) operated under one (or more) organization (eg ISPs, GAFAMs, universities, governments, CDNs), presenting a unified routing policy to the internet
* **Autonomous System Number** (ASN)
* **Border Gateway Protocol** (BGP) = exterior gateway global routing/reachability tables
* **CIDR** (Classless Inter-Domain Routing) = method for allocating IP addresses for IP routing, introduced by IETF in 1993 to replace classful networks architecture
  * Classless IP addresses are not interpreted as part of one of the original (A/B/C/D/E) classful networks, allowing finer grain division and slowing down exhaustion of IPv4 while IPv6 deploys
* **CIDR Block**
* **CIDR Notation** = compact representation of an IP address & associated network mask (eg `198.51.100.14/24` indicating a 24 leading 1-bits network prefix `198.51.100.0` & subnet mask `255.255.255.0`)
* **Classful Network** = obsolete network addressing architecture (by IANA) dividing IP addressing space into a small number of discrete classes attributed to organizations according to their sizes
  * Masks are kept simple and with a full-octet boundary (ie 255.0.0.0, 255.255.0.0 and 255.255.255.0, ie not in between bits like /7)
  * Class **A** = _0.0.0.0 - 127.255.255.255_ (ie first bit is 0, mask 255.0.0.0 or /8)
    * Actually less than that:
      * _0.0.0.0_ (default unspecified address) to _0.255.255.255_ are reserved ("this network" block)
      * _10.0.0.0/8_ = private addresses (24-bit block, see below)
      * _127.0.0.0/8_ = loopback adresses that cannot be assigned to a network (16M unusable addresses)
  * Class **B** = _128.0.0.0 - 191.255.255.255_ (mask 255.255.0.0 or /16)
  * Class **C** = _192.0.0.0 - 223.255.255.255_ (mask 255.255.255.0 or /24)
  * Class **D** (multi cast) & Class E (reserved) = _224.0.0.0 - 255.255.255.255_ (broadcast)
  * Some ranges within those classes are permanentely carved out of public usage because they are reserved for **private networks**
  * Networks established with this scheme were either too small or way too large for actual organization needs, leading to exhaustion of IPv4 addresses
* **DHCP(v6)** (Dynamic Host Configuration Protocol) = IP network management protocol for automatically assigning IP addresses & other communication parameters to devices, using a client-server architecture
  * IP-less computers looking to connect start by sending a UDP DHCP probe to the entire network (ie _255.255.255.255:67_), to which any DHCP servers respond with an IP offer
* **DHCP IP Reservation** = an IP address reserved to be always associated with a specific machine (via its MAC) as it connects
  * Not to be confused with manually assigning a static IP address on each device
* **DNS** (Domain Name System) = phonebook of the Internet, hierarchical maps of readable URLs to IP addresses
* **DNS over HTTPS** (DoH) = protocol for DNS resolution over HTTPS, to increase privacy/security by preventing MitM eavesdropping & manipulation of DNS dta
* **DNS Record** = information about domains provided by authoritative DNS Servers, of different types:
  * A server's records information is viewable via Unix/Mac command `dig` or Windows `nslookup` (with option eg `-type=txt`)
  * **A**/**AAAA** = IP (respectively v4/v6) addresses to hostname translation
  * **CNAME** (Canonical Name) = maps one domain name to another (ie an alias)
  * **MX** (Mail eXchanger) = which hosts (ie servers) accept incoming e-mail for a domain (ie a routing table using a priority list to direct e-mails to one or more mail servers)
  * **TXT** = free form text for public information (widely used for SPF, DKIM keys, verification tokens)
    * **DKIM** = specialized DNS TXT records that stores public key used in DKIM
    * **DMARC** = stores DMARC policies
    * **SPF** = TXT records including a list of IP addresses & domains authorized to send emails from a domain
* **DNS Root Zone** = top-level DNS zone in hierarchical namespace of internet DNS
* **FQDN** (Fully Qualified Domain Name) = exact location in DNS tree hierarchy, including top-level domain (eg _.com_) & root zone (eg _example_)
* **Host Identifier** (or Rest Field) = host portion of an IP address following network prefix
* **ICMP** (Internet Control Message Protocol) = network-layer (L3, so no assigned port) supporting IP suite protocol, used by users (eg `ping`, `traceroute`) or by routers to send error messages and OK/NOK statuses
* **IANA** (Internet Assigned Numbers Authority) = standards organization overseeing global IP addresses & ASN allocation, root zone management in DNS, media types & other protocols
* **ICANN** (Internet Corporation for Assigned Names and Numbers) = global multistakeholder group & nonprofit US organization responsible for coordinating maintenance of internet name & numerical spaces DBs
* **IETF** (Internet Engineering Task Force) = standards (originally US government-backed, now under Internet Society) organization for internet, responsible for technical standards making up the Internet Protocol Suite
* **Internet Service Provider** (ISP) = provides internet-related services (access, transit, DNS, hosting, colocation)
* **Internet Society** = American non-profit advocacy organization
* **IPAM** (IP Address Management) = methodology used by organizations to plan & manage their uses of IP addresses (ie how to carve their allocated address block into subnets)
* **IPSec** (Internet Protocol Security) = network-layer protocol suite that secures IP packets by authenticating/encrypting each of them in a session
  * Uses **IKE** (Internet Key Exchange) to negotiate keys & settings
* **IPv6** = 128-bit addresses, represented as 8 colon-separated groups of 4 hexa digits (drafted 1998, ratified 2017)
  * Shorten by removing each group's leading zeros, then compress a single group of successive 0 into a single `::` (only once to avoid confusion, eg _::1_ is loopback address)
  * Cannot be directly converted to an IPv4 (except mapped IPv4 format eg `::ffff:192.0.2.128`), can be translated/transitioned (via eg _NAT64_ translation, _dual stack_ coexistence, _tunneling_ encapsulation)
* **Local Internet Registry** (LIR) = organization (usually an ISP/entreprise/academic institution) that was allocated an IP Address Block by a RIR to assign to its own customers
* **Loopback** = routes back to source without intentional modification, primarily to test communication infrastructure (eg _127.0.0.1_ or _http://[::1]_)
* **Neighbor Discovery Protocol** (NDP) = IPv6 equivalent of the ARP protocol
* **Network Prefix** (or Network Number or Routing Prefix) = network portion of an IP address
* **Private Network** = subnet with addresses in private IP ranges, for LANs in residential/office/enterprise environments
  * IETF has directed IANA to reserve following IPv4 address ranges for private networks(RFC 1918):
  * 24-bit block = _10.0.0.0/8_ (ie _10.0.0.0 - 10.255.255.255_)
  * 20-bit block = _172.16.0.0/12_ (ie _172.16.0.0 - 172.31.255.255_)
  * 16-bit block = _192.168.0.0/16_ (ie _192.168.0.0 - 192.168.255.255_)
* **Punycode** = Unicode hostnames using limited ASCII character subset (letters, digits, and hyphens), used for non-English alphabets (or emojis, see Dev Detour video)
* **Quad-Dotted Notation** = 4 number specific case of Dot-decimal notation (decimal numbers separated by _._ dots)
* **Regional Internet Registry** (RIR) = organization managing allocation & registration of (public) internet number resources within a world region
* **Routing Prefix** (aka **Network Number**) = network part of an IP address
* **SLAAC** (Stateless Address Autoconfiguration) = allows a device to automatically configure its own IP address without needing a DHCP server (à la APIPA + RA for IPv6)
  * **Router Advertisement** (RA) = part of NDP (Neighbor Discovery Protocol) sends messages containing network parameters periodically or in response to a host's RS (Router Solicitation) discovery
* **Subnet** = mathematical/logical prefix-length-based subdivision of an IP network, defining two parts to IP addresses (a network prefix & host identifier)
  * Number of attributable host addresses in a (sub)network = 2^number of bits in host portion (minus two: (sub)network & broadcasting addresses, ie all host bits to _0_ & _1_ respectively)
  * Subnetting is not just for private networks, RIR/LIR/ISPs all need to subnet their allocated address block
* **Subnet Mask** (or **Net Mask**) = bitwise-AND bitmask revealing network portion of an IP in quad-dotted notation (ie keep network & nullify host eg `255.255.255.0`)
* **TCP/IP** (Internet Protocol Suite) = framework predating OSI model for organizing communication protocols used in internet & similar computer networks
  1. Link (or Network Interface) = L1 + L2
  2. Internet = L3
  3. Transport = L4
  4. Application = L5 + L6 + L7
* **VLSM** (Variable-Length Subnet Mask(ing)) = designing internal networks with variable-size subnets using CIDR rules (dichotomically dividing allocating largest networks first)

### E-mail

* **ADSP** (Author Domain Signing Practices) = optional extension to DKIM
* **ARC** (Authenticated Received Chain) = new (2019) auth protocol that adds a cryptographically verifiable chain of custody to every hop a (transfered) e-mail takes (à la blockchain)
* **BIMI** (Brand Indicators for Message Identification) = add brand logo (validated by a third-party) to outgoing e-mails
  * **CMC** (Common Mark Certificate)
  * **VMC** (Verified Mark Certificate)
* **DKIM** (DomainKeys Identified Mail) = e-mail authentication scheme, lets sender automatically sign outgoing e-mails, checkable via a public key
* **DMARC** (Domain-based Message Authentication, Reporting & Conformance) = policy protocol between servers to align SPF/DKIM failing e-mails (aka spams) management, and alert sender
* **ESP** (Email Service Provider) = cloud platform providing infrastructure to send/receive/track large volumes of e-mails (eg marketing newletter, receipts, password resets, etc)
* **IMAP(4)** (Internet Message Access Protocol) = newer Internet standard protocol, including inbox management from multiple clients, folder creation, sync across systems
* **MIME** (Multipurpose Internet Mail Extensions) = e-mail format extension to support multi-part body, non-ASCII character sets, and multimedia attachments
* **MTA** (Mail/Message Transfer Agent) = queries MX records about an e-mail's recipient(s), and establishes an SMTP connection with those servers (by MX record priority)
* **MX** (Mail eXchanger) = e-mails routing information queryed by MTAs to accomplish SMTP
* **POP(3)** (Post Office Protocol) = basic application-layer Internet standard protocol used by e-mail clients to retrieve e-mail from a mail server
* **S/MIME** = standard for public-key encryption/signing of MIME data
* **SLD** or **2LD** (Second-Level Domain) = domain directly below TLD (eg _example_)
* **SMTP** (Simple Mail Transfer Protocol) = Internet standard communication protocol for electronic mail transmission used by servers and MTAs
* **SPF** (Sender Policy Framework) = protocol to let e-mail sending domains publish a record list of authorized source address to send and avoid getting flagged as spam by receivers
  * Authorized servers can be external services and don't have to be subdomains (eg authorize _Mailgun_ or _SendGrid_)
* **TLD** (Top-Level Domain) = one of domains at highest level in hierarchical DNS (eg _com_, and TLD Root Zone _com._ where trailing dot represents DNS root)

* _Mailgun_ = one of the best known ESPs, using REST/SMTP API (rather than a drag&drop GUI)
* _SendGrid_ (by _Twilio_) = ESP

### Wi-Fi

* **AAA Key** (Authentication, Authorization & Accounting) aka **MSK** (Master Session Key) = additional key so that each client has a separate session
* **AP** (Access Point) = router
* **EAPOL** (Extensible Authentication Protocol) = authentication framework frequently used in (inter)network connections, via variety of methods (TLS, PSK)
* **EAPOL-Key**
* **GMK** (Group Master Key)
* **GTK** (Group Temporal Key)
* **Monitor Mode** (& Packet Injection) = features of some WiFi routers (such as Taiwanese Alfa Network AWUS1900)
* **PMKID** = unique key used by AP to keep track of PMKs used by clients (for cacheing purposes, derived from AP MAC, Client MAC, PMK, PMK Name)
* **PMK** (Pairwise Master Key) = 256-bit key used to encrypt WiFi data between a client & router, it is composed of a Pre-shared Key (and additional AAA Key for _WPA-Enterprise_)
* **PSK** (Pre-shared Key) = PBKDF2-derived key from a personal WiFi passphrase (only key needed for _WPA-Personal_, shared by everyone without login)
* **PTK** (Pairwise Transient Key)
* **STA** (Station) = a WiFi client
* **SNonce** (STA Nonce)
* **TKIP** (Temporal Key Integrity Protocol, _deprecated_ in 2012) = encryption security protocol as an interim solution to replace WEP without replacing hardware
* **WEP** (Wireless Equivalent Privacy) = early encryption protocol to secure WLAN (started as _802.11_ in 1985, used a single key for everything)
* **WiFi** = implementation of WLAN
* **WLAN** (Wide Local Area Network) = wireless LAN (eg WiFi), as defined by various protocols in _IEEE 802.11_ (a, b, j, y, ac, …, specifying frequency & bandwidth)
* **WPA** (Wi-Fi Protected Access) = security protocol using TKIP and developed as intermediary mesure by Wi-Fi Alliance to replace WEP (introduces 4-way handshake & a hierarchy of keys)
* **WPA2** (Wi-Fi Protected Access II) = replaces WPA (defined in 2004 in _IEEE 802.11i-2004_ as an amendment to original _IEEE 802.11_), introduces **AES**
* **WPA3** (Wi-Fi Protected Access III) = replaces WPA2 (mandates stronger cryptographic algorithms, announced in 2018)
* **WPA-Personal** (aka WPA-PSK) = PSK-encrypted WiFi
* **WPA-Enterprise** = individual/per-user authentication, requires additional _802.1X_ authentication server (eg RADIUS, LDAP)
* **Yagi(–Uda) antenna** = directional antenna

* _ESP32_ (_Espressif Systems_) = low-cost low-power Wi-Fi & Bluetooth system-on-a-chip (SoC) MCU (Microcontroller Unit, ie an electronic board/chip)
