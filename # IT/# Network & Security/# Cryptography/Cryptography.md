# Cryptography

## Quick Tips

* [Destination Certification - How digital certificates bind owners to their public key](https://www.youtube.com/watch?v=5rT6fZUwhG8)
  * Explains how certificates solve the issue of public key dissemination against possible men-in-the-middle (ie networks are never 100% safe)
  * The (certificate's) public key is only used to initially exchange the faster symmetric key (initiating a secure TLS connection)

## Glossary

* **AES** (Advanced Encryption Standard, aka Rijndael) = symmetric data encryption specification (via matrix transformation)
* **DES** (Data Encryption Standard) = (_obsolete_) older symmetric key algorithm using a (now-considered short) 56 bits key
* **Diffie-Hellman** shared key/secret exchange = generation & transmission of a symmetric key (eg SSL/TLS) over a **public channel** (eg mixing paints)
* **Double Ratchet Algorithm** = _Signal_ protocol
* **Elliptic Curve Digital Signature Algorithm** (ECDSA) = modern & efficient asymmetric keys for digital signature (authentication)
* **Elliptic Curve Diffie-Hellman Ephemeral** (ECDHE) = improved Diffie-Hellman, used in TLS to derive a temporary shared session key
* **Evaluation Assurance Level** (EAL) = methodological confidence in entire IT product/system (not only crypto)
* **Federal Information Processing Standard** (FIPS) = security requirement for cryptographic modules (examines correct implementation of approved algorithms)
* **HMAC** (Hardware-based Message Authentication Code) = specific type of MAC via a crypto hash function & secret crypto key
* **Hardware Security Module** (HSM) = dedicated device/PCIe card or cloud-based service to generate/store/use cryptographic keys (eg certificate private key)
* **Key Derivation** = process to generate cryptographically strong keys from one or more values (eg keys, passphrases)
* **Key Partitioning** = dividing a single key into a set of keys (eg splitting a 256-bit key into two keys of 128 bits each)
* **MAC** (Message Authentication Code) = short piece of information to attest a message's **authenticity & integrity** (aka checksum, hash, error detection)
* **On-the-fly encryption** = method used by some disk encryption tools (eg _VeraCrypt_) where data gets automatically de/encrypted as it is loaded/saved
* **One-Time Pad** (OTP) = encryption technique that's uncrackable (even with quantum computing), but necessitate a single-use **pre-shared** key that's longer than the message
* **PBKDF** (Password-Based Key Derivation Function) = turn other keys or human-friendly passphrases into strong cryptographic keys with a sliding computational cost to reduce vulnerability to brute-force attacks
  * [Peanut Butter Keeps Dogs Friendly Too](https://blog.1password.com/defending-against-crackers-peanut-butter-keeps-dogs-friendly-too)
* **PKCS** (Public-Key Cryptographi Standards) = set of crypto standards for public-key crypto systems interoperability (published by _RSA Laboratories_ in 1990)
  * #1 = RSA
  * #5 = Password-Based Encryption (PBE)
  * #7 = S/MIME email encryption
  * #8 = Private key information syntax (for _.p12_ & _.pfx_ files)
  * #10 = **Certificate Signing Request** (CSR) = a (_.csr_) file/message sent by an applicant to a CA to apply for a digital certificate (contains its public key that it chose/computed itself)
  * #12 = Personal Information Exchange (for _.p12_ & _.pfx_ files)
* **PGP** (Pretty Good Privacy) = encrypt and/or sign all in one go
  * Message body is encrypted using a symmetric session key
  * Session key is encrypted and added to output for each recipient using their public asymmetric key
* **RSA** (Rivest-Shamir-Adleman) = asymmetric public-key (eg digital certificates, TLS handshakes) crypto for secure data transmission
  * RSA is a relatively slow algorithm, so often used only to initially transmit faster symmetric shared keys
* **SHA-2** (Secure Hash Algorihm 2) = set of crypto hash functions (designed by US _NSA_ in 2001)
* **Shared Secret** (or **Private Secret**) = pre-exchanged/known secret between parties in a symmetric cryptosystem

* _Kleopatra_ = FOSS OpenPGP certificates/keys manager and GnuPG (encode/sign) GUI

### Certificates

Public key certificates are a means to attest the authenticity & trustworthiness of an entity (eg some information/organization/website), ie of its associated **public key**.
Digitally signed document/file stored on a server and containing certain metadata (subject, validity start/end), a trusted issuer identity (CA name & tamper-proof **digital signature**), and a **public key**.
Certificates are often associated with **TLS** (for HTTPS) and **SAML** authentication (to represent a logged user).

* **CA** (Certification Authority) = an issuing entity that can be trusted to validate other entities below it in a nested tree chained/propagated trust model
* **CA Public Key** = well-known (preinstalled on OS, or easily obtainable from a trusted source - but not part of the server certificate) key to verify the validity of a CA's digital signature
* **CA Digital Signature** = CA-issued signature (a large number) produced by irreversably hashing the certificate content (cannot be reused for another website), then encrypting it through the CA's private key
* **Identity Proofing** = CA initial verification of server identity & info upon registration (thus more precisely performed by entity called **Registration Authority** (RA))
* **Online Certificate Status Protocol** (OCSP) = internet protocol for obtaining the revocation status of an X.509 digital certificate
* **Personal Information eXchange** (_.pfx_, or _.pvk_+_.spc_ (or _cer_) combo) = password-protected certificate file holding both public & private keys, can be used to code sign an application
* **Public Key** = key present in a certificate that can be used to send securely encrypted information to a server
  * Its counterpart (asymmetric) private key remains stored secretly on the server; it is configured once upon certificate install - a certificate including both keys can be exported as a _.pfx_ file
* **Root CA** = top-level CA in the chain of trust; renown public ones are installed by default (eg _Symantec_, _Thawte_, _Verisign_), with more that can be installed locally manually
  * Those renown authorities are assumed to have performed some authenticity/integrity checks on a website before delivering a certificate
  * Any website that requires SSL (for HTTPS) must first register to one of those public root CA and pay a subscription fee
* **Self-Signed Certificate** = certificate that are not issued by a CA, basically managing custom certificates (chain) manually
* **SSL/TLS Handshake**
  * Client initiates connection to the server on port 443 (the default port for HTTPS)
  * Server responds by presenting its SSL/TLS certificate file content (over TLS itself, with TCP underneath)
  * Client verifies certificate (CA signature, domain name) & initiate a (symmetric) session key exchange (Diffie-Hellmann or some variation)
  * Server must sign that key exchange using its certificate private key (only that key is able to complete the handshake)
  * An attacker possessing on the (public) certificate cannot forge a signature, nor decrypt handshake messages
  * The client and server establish a secure connection, using the exchanged key to encrypt future communication
* **X.509** = standard defining the creation/format of public key certificate (also defines extensions eg _.pfx_)

* _.cer_ = (PEM or DER) certificate only (Windows/Java environments)
* _.crt_ = (base64 PEM or binary DER format) containing usually only a public certificate (Linux systems)
* _.der_ = binary format certificate or key
* _.key_ = (PEM) private key (to protect carefully)
* _.pem_ (Privacy-Enhanced Mail) = most common de facto base64 file format for storing/sending crypto keys, certificates and other data (`-----BEGIN|END PRIVATE KEY-----`)
  * Contains a certificate, private key or both
* _.pfx_ (aka PKCS#12 _.p12_) = binary container format used to bundle a private key & associated public certificate (X.509), optionally encrypted

#### API

* In Windows, execute > `mmc(.exe)` > File > _Add/Remove Snap-in…_ (`Ctrl + M`) > Certificates > Add
* In Windows, execute > `certmgr.msc`
* In Firefox, click on lock > Connection secure > More information > View Certificate = shows the certificate chain (from child to root)
