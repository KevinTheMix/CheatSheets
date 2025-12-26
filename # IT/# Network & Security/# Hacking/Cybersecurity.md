# Team Blue

## Quick Links

* [Cybersecurity Roadmap](https://roadmap.sh/cyber-security)
* <https://learnhacking.io/5-infosec-newsletters-youll-actually-read>

## Glossary

* **AAA** (Authentication, Authorization, and Accounting) = framework to control/track access within a computer network
  * Authentication proves identity, authorization grants permissions, accounting maintains continuous & robust audit trail via logging
* **Access Control List** (ACL) = allow/deny traffic on certain criteria (eg source/destination IP, TCP/UDP ports, ICMP), used by NAT, QoS, a router ingress/egress, or an OS filesystem per user/group access rights
* **Bit-for-Bit** or **Byte-for-Byte** copy = clone entire content of a drive, including all empty areas possibly containing deleted information
* **Budapest Convention** (on CyberCrime, 2001.11.23) = 1st international treaty seeking to harmonize Internet/computer crime national laws, improving investigative techniques, increasing cooperation among nations
* **CERT** (Computer Emergency Response Team) = team responding to cybersecurity incidents (detect, analyze, coordinates response)
* **Chip Off** = hardest/last resort data extraction technique where a device is disassembled and its (possibly still encrypted) chips read externally
* **CISO** (Chief Information Security Officer) = senior-level executive responsible for ensuring assets & technologies are adequately protected
* **CSIRT** (Computer Security Incident Response Team) = similar to CERT used in organization/administration (contain & restore)
* **Cyber Threat Intelligence** (CBI) = structured collection, analysis, and dissemination of data regarding potential/existing cyber threats
* **Data Carving** = extracting & interpreting raw bit-level data from a device
* **Data Loss Prevention** (DLP) = where is your data (social security, credit card, medical records)
* Detection & Response
  * **Endpoint (Threat) Detection & Response** (E(T)DR) = continually monitors an endpoint (eg client device eg mobile phone, laptop, IoT device) to mitigate malicious cyber threats
  * **Managed Detection & Response** (MDR) = 3rd-party EDR services, provided by a Managed Security Service Provider (MSSP)
  * **Extended Detection & Response** (XDR) = improves EDR for more than individual devices, adds network-based detection, centralizes data for correlation analysis, improves missed detections, false positives & long investigation times
* **Digital Forensics and Incident Response** (DFIR) = two discrete security disciplines
  * **Digital Forsensics** = postmortem investigate & gather evidence and establish facts (from FS, memory, system & network logs)
  * **Incident Response** = detection/mitigation of potential or in progress cyberattacks (prepare, detect/analyze, contain/eradicate/recover, do better)
* **EC3** (Europol Cybercrime Centre) = Europol cybercrime division, coordinates EU investigations & provides technical expertise
* **Firewall**
  * **Application Firewall** = controls I/O or system calls of an application/service, monitors & blocks communications based on configured policy (either Network-based for TCP/IP on Host-based for system calls)
  * **Web Application Firewall** (WAF) = specific application firewall to filter/monitor/block HTTP traffic, mitigating known (eg SQLi, XSS, FI) and zero-day vulnerabilities
* **Identity and Access Management** (IAM) = deals with giving right permissions (access control) to right people/entity at right time (lifecycle management), to access widespread apps (different platforms) & data (cloud, private data centers), with auditing
* **InfoSec** (Information Security) = protecting information by mitigating risks
* **Intrusion Detection System** (IDS) = analyzes network traffic to detect anomalities
* **Intrusion Prevention System** (IPS) = monitors network traffic for potential threats & automatically blocks them by alerting security team, terminating dangerous connections, removing malicious content
* **Just-In-Time Access** = provides a time-limited administrator account access via a request to a central clearinghouse
* **Least Privilege** = provides user with limited bare minimum rights/permissions as needed to complete objectives
* **NIS2** = EU directive for senior management approval, training, risk assessment, implement cybersecurity, supply chain, reporting, certification & collaboration
* **NIST** (National Institute of Standards and Technology, formerly National Bureau of Standards) = US Department of Commerce agency to promote American innovation & industrial competitiveness (tech R&D)
* **Privileged Access Management** (PAM) = broad approach to managing administrator/superuser accesses (eg just-in-time access)
* **Principal** = entity authenticate-able by a computer system or network (eg a person, computer, service, process/thread, or group thereof), associated with an identifier (eg a Windows SID)
* **OPSEC** (Operation Security) = military analysis of whether critical information is accessible to the enemy (trackability prevention)
  * Also refers to obfuscating/hiding techniques by hackers to evade security & getting found
* **OWASP** (Open Worldwide Application Security Project) = online community producing free articles/methodologies/tools on IoT, software & web security
* **RSSI** (Responsable de la Sécurité des Systèmes d'Information) = CISO
* **SIEM** (Security Information and Event Management) = centralized logging receiver
  * Combines SIM & SEM to provide real-time analysis of security alerts generated by applications & network hardware
  * **SIM** (Security Information Management) = long-term storage & analysis/reporting of log data
  * **SEM** (Security Event Management) = real-time monitoring & correlation of events/notifications/console views
* **SOC** (Security Operations Center) = always-on hub of dedicated team/processes/tools that monitor, detect, analyze, respond to incidents/threats across an organization
* **Zero Trust** = holistic approach to network security where even devices on internal network are not trusted by default and must be verified (ie security does not stop at the border)
  * Supported by many best practices (eg multi-factor authentication, encryption, system permissions, additional firewalls, monitoring/analytics, etc)

### E-mail Integrity (BE)

* **BELAC** = SPF Economy service charged with accrediting QTSP-auditing companies
* **eIDAS** (Electronic IDentification, Authentication and Trust Services) = EU rule & common framework for digital identity & trust services
* **IPEX** = Belgian QTSP company providing eIDAS-valid Registered Mailing QERDS
* **QERDS** (Qualified Electronic Registered Delivery Service) = court admissible electronic mail (guarantees integrity, timestamp, identity of sending/receiving parties)
* **QTSP** (Qualified Trust Service Provider) = provides qualified services (ie audited & certified by states), eg electric signature, qualified timestamp, QERDS (eg EDICOM, GlobalSign, IPEX, Zetes Confidens)
* **TSR** (Time-Stamp Response) = (_.tsr_) file by a timestamp authority associated with an e-mail to attest its integrity & time

## Learn

* **CCNA** (Cisco Certified Network Associate) = network certification
* **CompTIA** (Computing Technology Industry Association) = US trade association issuing vendor-neutral (eg not Cisco-specific) professional IT certifications
  * Eg _A+_ (Help Desk Support Specialist), _Network+_, _PenTest+_, _Security+_, _Security Pro_, _Cybersecurity Analyst+_ (CySA+)
* **CPTS** (Certified Penetration Testing Specialist) = Hack The Box certification
* **OSCP** (Offensive Security Certified Professional, by _Offensive Security_ aka _Offsec_) = ethical hacking certification (gold standard for cybersecurity certifications)

## Tools

* [AbuseIPDB](https://www.abuseipdb.com) = look up blacklisted IP addresses
* [CVE](https://www.cve.org) (Common Vulnerabilities & Exposures) = US-based reference system/DB for publicly known vulnerabilities & exposures
* [NVD](https://nvd.nist.gov) (National Vulnerability Database, by NIST)
* [OWASP Top Ten](https://owasp.org/www-project-top-ten)
* [VirusTotal](https://www.virustotal.com) = scan files using multiple antivirus engines

### Forensics

* _Autopsy_ = open-source hard drive investigation forensics platform
* _EnCase_ (by OpenText) = suite of digital investigations products (eg analyze hard-drive & preserve evidence for court admission)
* _FEI_ (Forensic Email Intelligence, by _Metaspike_) = commercial desktop tool to dissect raw e-mail evidence for investigations
* _FTK Imager_ = electronic device data imaging & previewing tool, create forensic images (EO1, AFF, RAW)
* _UFED_ (Universal Forensic Extraction Device) = mobile devices data extraction product series by Israel company _Cellebrite_
* _Volatility_ = FOSS RAM forensic analysis tool
