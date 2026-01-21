# Cryptography

## Quick Tips

* [Destination Certification - How digital certificates bind owners to their public key](https://www.youtube.com/watch?v=5rT6fZUwhG8)
  * Explains how certificates solve the issue of public key dissemination against possible men-in-the-middle (ie networks are never 100% safe)
  * The (certificate's) public key is only used to initially exchange the faster symmetric key (initiating a secure TLS connection)

## Glossary

* **2FA** (2-Factor Authentication) = special case of Multi-Factor Authentication
* **AES** (Advanced Encryption Standard, aka Rijndael) = symmetric data encryption specification (via matrix transformation)
* **Asymmetric Authentication** = only (bearer of) private key can decrypt data/sign a nonce or transaction, and only (anyone with) matching public key encrypt data/verify signature
* **Authentication** = process of verifying/asserting of identity
* **Authorization** = ensures only authenticated identities get access to resources for which they have been granted access
* **Curve25519** = elliptic curve designed for use in ECDH
* **DES** (Data Encryption Standard) = (_obsolete_) older symmetric key algorithm using a (now-considered short) 56 bits key
* **Diffie-Hellman** shared key/secret exchange = generation & transmission of a symmetric key (eg SSL/TLS) over a **public channel** (eg mixing paints)
* **Double Ratchet Algorithm** = _Signal_ protocol
* **Digital Signature Algorithm** (DSA) = public-key crypto digital signature proposed as FIPS (US standard) by NIST (US commerce promotion)
* **EdDSA** (Edward-curve Digital Signature Algorithm) = digital signature scheme
* **Ed25519** = EdDSA using SHA-512 and a Curve25519-related elliptic curve
* **Elliptic Curve Cryptography** (ECC) = public-key crypto based on algebraic structure of elliptic curves over finit fields
* **Elliptic Curve Digital Signature Algorithm** (ECDSA) = elliptic curve DSA, a modern & efficient asymmetric keys for digital signature (authentication)
* **Elliptic Curve Diffie-Hellman Ephemeral** (ECDHE) = improved Diffie-Hellman, used in TLS & SSH to derive a temporary shared session key
* **Evaluation Assurance Level** (EAL) = methodological confidence in entire IT product/system (not only crypto)
* **Federal Information Processing Standard** (FIPS) = security requirement for cryptographic modules (examines correct implementation of approved algorithms)
* **Federation** = trust relationship/architecture allowing identity sharing across domains (eg several Google apps, or company systems)
* **FIDO** (Fast IDentity Online) Alliance = open industry association developing/promoting authentication standards reducing over-reliance on passwords
* **FIDO2** = joint effort between FIDO & W3C to create strong authentication for the web (via user-controlled authenticator eg smartphone or hardware security key)
* **Full Disk Encryption** (FDE) = (eg BitLocker)
* **Hash** = one-way irreversible transformation of an input into a fixed-size singular/unique output
* **HMAC** (Hash-based Message Authentication Code) = specific type of MAC via a crypto hash function & secret crypto key
* **Hardware Security Module** (HSM) = dedicated device/PCIe card or cloud-based service to generate/store/use cryptographic keys (eg certificate private key)
* **Key Derivation** = process to generate cryptographically strong keys from one or more values (eg keys, passphrases)
* **Key Partitioning** = dividing a single key into a set of keys (eg splitting a 256-bit key into two keys of 128 bits each)
* **MAC** (Message Authentication Code) = short piece of information to attest a message's **authenticity & integrity** (aka checksum, hash, error detection)
  * Encryption ensures confidentiality, but not that a message wasn't altered (eg blind bits flipping by an attacker with access to data)
* **Multi-Factor Authentication** = somthing you are (fingerprint, voice, face, eye), something you know (password, PIN), something you have (card, key, phone, token), somewhere you are (GPS)
* **Nonce** (Number used Once) = arbitrary number that can be used just once in a cryptographic communication (eg as a challenge to prove ownership of a private key)
* **On-the-fly encryption** = method used by some disk encryption tools (eg _VeraCrypt_) where data gets automatically de/encrypted as it is loaded/saved
* **One-Time Pad** (OTP) = encryption technique that's uncrackable (even with quantum computing), but necessitate a single-use **pre-shared** key that's longer than the message
* **One-Time Password** (OTP) = password valid for only one login session or transaction, often integrating 2FA in the process
  * Does not necessarily use time but generates a new (pseudo) random key based on a counter incremented after each code generation (ie session/login attempt, can be re-synch with server)
* **PBKDF** (Password-Based Key Derivation Function) = turn other keys or human-friendly passphrases into strong cryptographic keys with a sliding computational cost to reduce vulnerability to brute-force attacks
  * [Peanut Butter Keeps Dogs Friendly Too](https://blog.1password.com/defending-against-crackers-peanut-butter-keeps-dogs-friendly-too)
* **PKCS** (Public-Key Cryptographi Standards) = set of crypto standards for public-key crypto systems interoperability (published by _RSA Laboratories_ in 1990)
  * #1 = RSA
  * #5 = Password-Based Encryption (PBE)
  * #7 = S/MIME email encryption
  * #8 = Private key information syntax (for _.p12_ & _.pfx_ files)
  * #10 = **Certificate Signing Request** (CSR) = a (_.csr_) file/message sent by an applicant to a CA to apply for a digital certificate (contains its public key that it chose/computed itself)
  * #12 = Personal Information Exchange (for _.p12_ & _.pfx_ files)
* **OpenPGP** = open standards describing how keys, signatures & encryption works in PGP-style systems
  * Message body is encrypted using a symmetric session key
  * Session key is encrypted and added to output for each recipient using their public asymmetric key
* **PGP** (Pretty Good Privacy) = original proprietary program created in 1991, commercialized by Symantec
* **RSA** (Rivest-Shamir-Adleman) = asymmetric public-key (eg digital certificates, TLS handshakes) crypto for secure data transmission
  * RSA is a relatively slow algorithm, so often used only to initially transmit faster symmetric shared keys
* **SHA-2** (Secure Hash Algorihm 2) = set of crypto hash functions (designed by US _NSA_ in 2001)
* **Shared Secret** (or **Private Secret**) = pre-exchanged/known secret between parties in a symmetric cryptosystem
* **Time-based One-Time Password** (TOTP) = NTP-synchronized time-limited key generated from a pre-configured secret key ahead of time, requiring near real-time interception window to potential attackers
* **Universal 2nd Factor** (U2F) = open standard that strengthens/simplifies 2FA using specialized USB, NFC or BLE devices based on similar technology found in smart cards

* _GPG_ (GnuPG) = free software implementation of OpenPGP maintained by GNU Project
* _Kleopatra_ = FOSS OpenPGP certificates/keys manager and GnuPG (encode/sign) GUI
* _YubiKey_ = hardware authentication device manufactured by Yubico to protect access to computers, networks & online services that support OTP, public-key crypto, authentication & U2F/FIDO2
