# Network

## Quick Tips

* **Bypass company firewall** (2014.04)
  * Remote desktop to home computer
  * SSH Tunnel + Proxy Socks via Putty (_Laurent D'Havé_ & _Frédéric Branger_)
    * <https://securitymusings.com/article/462/how-to-set-up-a-socks-proxy-using-putty-ssh>

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
* **SSL** (Secure Sockets Layer) = deprecated encryption protocol replaced with **TLS**
* **TLS** (Transport Layer Security) = cryptographic protocol to provide communications security over a network
* **TLS Handshake** = client initiates an asymmetric connexion, then sends a (faster & more efficient for large amounts of data) symmetric key encrypted using server public key found in its certificate

* _cURL_ = CLI for data transfer (FTP, HTTP, Email & co)
* _Cyberduck_ = (S)FTP, WebDAV (aka HTTP) & cloud storage (S3, Azure) client
* _Fiddler Classic_ = log & edit HTTP(S) web traffic
* _FileZilla Portable_ = no-install FTP
* _FileZilla Server_ = FTP Server
* _HTTrack_ = Web crawler/copier (also as no install)
* _LeechFTP_ = multi-threaded FTP client
* _LOIC_ (C# rewrite) = DoS and DDoS for stress-testing
* _Nmap "Network Mapper"_ = _Linux_ Network discovery
* _NukeNabber_ = Windows XP TCP/UDP ports listener (_discontinued_)
* _OpenVPN_ = FOSS client/server VPN using OpenSSL encryption library
* _PCAP_ (Packet Capture) = API for capturing network traffic (packet sniffing)
  * _libpcap_ = _Unix_ implementation of pcap API (base driver)
  * _WinPcap_ = _Windows_ port of libpcap (_discontinued_)
  * _Npcap_ = _Windows 7_ port of libpcap
* _Putty_ = FOSS SSH & telnet client
* _tcpdump_ = _Unix_ Packet analyzer (uses libcap)
* _TMeter_ = free network packet traffic analyzer with built-in firewall & NAT capabilities
* _Wget_ = CLI to GET files over HTTP(S), FTP(S)
* _WireGuard_ = FOSS VPN (Ubuntu native)
* _Wireshark_ = network packets analyzer (uses WinPcap or Npcap)
* _WinDump_ = _Windows_ port of tcpdump (uses WinPcap)
