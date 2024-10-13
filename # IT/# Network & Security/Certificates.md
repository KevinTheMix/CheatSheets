# Certificates

**(Public Key) Certificates** are a means to attest the authenticity & trustworthiness of an entity (eg some information or website), more accurately of its associated **public key**.
It is a document containing certain metadata (subject, validity start/end), the trusted issuer identity (CA name & tamper-proof **digital signature**), and a **public key**.

Certificates are notably used in **TLS** (for HTTPS), and **SAML** authentication (to represent a logged user).

(ChatGPT:) _In summary, an SSL/TLS certificate is a digital file stored on the server. When a client requests a secure connection, the server reads this file and transmits its contents as part of the initial SSL/TLS handshake process_

## Quick Tips

* [Destination Certification - How digital certificates bind owners to their public key](https://www.youtube.com/watch?v=5rT6fZUwhG8)
  * Explains how certificates solve the issue of public key dissemination against possible men-in-the-middle (ie networks are never 100% safe)
  * The (certificate's) public key is only used to initially exchange the faster symmetric key (initiating a secure TLS connection)

## Glossary

* **Certification Authority** (CA) = an issuing entity that can be trusted to validate other entities below it in a nested tree chained/propagated trust model
* **CA Public Key** = well-known (preinstalled on OS, or easily obtainable from a trusted source - but not part of the server certificate) key to verify the validity of a CA's digital signature
* **CA Digital Signature** = CA-issued signature (a large number) produced by irreversably hashing the certificate content (cannot be reused for another website), then encrypting it through the CA's private key
* **Certificate Signing Request** (CSR) = message sent by an applicant CA to apply for a digital certificate, it contains the applicant's public key (that it chose/computed for itself)
* **Identity Proofing** = CA initial verification of server identity & info upon registration (thus more precisely performed by entity called **Registration Authority** (RA))
* **Online Certificate Status Protocol** (OCSP) = internet protocol for obtaining the revocation status of an X.509 digital certificate
* **Personal Information eXchange** (_.pfx_, or _.pvk_+_.spc_ (or _cer_) combo) = password-protected certificate file holding both public & private keys, can be used to code sign an application
* **Public Key** = key present in a certificate that can be used to send securely encrypted information to a server
  * Its counterpart (asymmetric) private key remains stored secretly on the server; it is configured once upon certificate install - a certificate including both keys can be exported as a _.pfx_ file
* **Root CA** = top-level CA in the chain of trust; renown public ones are installed by default (eg Symantec, Thawte, Verisign), with more that can be installed locally manually
  * Those renown authorities are assumed to have performed some authenticity/integrity checks on a website before delivering a certificate
  * Any website that requires SSL (for HTTPS) must first register to one of those public root CA and pay a subscription fee
* **Self-Signed Certificate** = certificate that are not issued by a CA, basically managing custom certificates (chain) manually
* **SSL/TLS Handshake**
  * The client initiates a connection to the server on port 443 (the default port for HTTPS)
  * The server responds by presenting its SSL/TLS certificate
  * The client and server then negotiate encryption parameters and establish a secure connection
* **X.509** = standard defining the creation/format of public key certificate (also defines extensions eg _.pfx_)

## API

* In Windows, execute > `mmc(.exe)` > File > _Add/Remove Snap-in…_ (`Ctrl + M`) > Certificates > Add
* In Windows, execute > `certmgr.msc`
* In Firefox, click on lock > Connection secure > More information > View Certificate = shows the certificate chain (from child to root)
