# Wi-Fi

## Glossary

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

* _Aircrack-ng_ = WiFi packet monitoring/sniffing & cracking tools suite
* _bettercap_ = (Go-based) hacking tool for WiFi, Bluetooth Low Energy, wireless hijacking
* _Flipper Zero_ = open-source & customizable portable multi-tool for hackers/pentesters (RFID, radio protocols, access control systems, GPIO pins hardware)
* _Pwnagotchi_ (for _Raspberry Pi Zero W_) = WiFi cracking (via AI + bettercap, [Guide](https://www.reddit.com/r/pwnagotchi/comments/sl2rv1/guerrilla_guide_to_pwnagotchi_v1552022))
* _WiFi Pineapple_ = pentesting router (monitoring, AP spoofing, targeted captive portals)
