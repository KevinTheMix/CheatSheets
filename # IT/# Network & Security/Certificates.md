# Certificates

Certificates are a way to tie a public key to identifying/legitimating information (ie who, what, when) wrapped together & signed by an authority (a CA).
Certificates are often associated with **TLS** (for HTTPS) & **SAML** authentication (to represent a logged user).

## Quick Tips

* <https://badssl.com> = improper certificate configurations

## Glossary

* **CA** (Certification Authority) = an issuing entity that can be trusted to validate other entities below it in a nested tree chained/propagated trust model
* **CA Public Key** = well-known (preinstalled on OS, or easily obtainable from a trusted source - but not part of the server certificate) key to verify the validity of a CA's digital signature
* **CA Digital Signature** = CA-issued signature (a large number) produced by irreversably hashing the certificate content (cannot be reused for another website), then encrypting it through the CA's private key
* **Certificate** (or **Public Key Certificate**) = digitally signed document/file stored on a server containing certain metadata and a **public key**
  * It is used as an electronic identity card, attesting authenticity & trustworthiness of an entity (ie some information/organization/website), linking it(s name) to a public key
  * Information fields:
    * Owner/subject (unique) Name
    * Serial number
    * Period of validity (start/end)
    * Revocation information
    * Public Key
    * Identity of trusted issuer
      * CA Name
      * CA (tamper-proof) **Digital signature**
* **Certificate Pinning** = restrict which certificates are valid for a particular website/service to a specific (certificate/public key) subset of those trusted by recognized CAs
* **Identity Proofing** = CA initial verification of server identity & info upon registration (thus more precisely performed by entity called **Registration Authority** (RA))
* **Online Certificate Status Protocol** (OCSP) = internet protocol for obtaining revocation status of an X.509 digital certificate
* **Personal Information eXchange** (_.pfx_, or _.pvk_+_.spc_ (or _cer_) combo) = password-protected certificate file holding both public & private keys, can be used to code sign an application
* **Public Key** = key present in a certificate that can be used to send securely encrypted information to a server
  * Its counterpart (asymmetric) private key remains stored secretly on the server; it is configured once upon certificate install - a certificate including both keys can be exported as a _.pfx_ file
* **Root CA** = top-level CA in the chain of trust; renown public ones are installed by default (eg _Symantec_, _Thawte_, _Verisign_), with more that can be installed locally manually
  * Those renown authorities are assumed to have performed some authenticity/integrity checks on a website before delivering a certificate
  * Any website that requires SSL (for HTTPS) must first register to one of those public root CA and pay a subscription fee
* **Self-Signed Certificate** = certificate that are not issued by an external public CA, yet entrusted via TOFU (eg signing an app for an app store or managing custom certificates chain manually)
* **Trust On First Use** (TOFU) = first time a system encounters a new key/certificate (not signed by CA), it records its fingerprint to treat future exchanges as trusted (ie consistency)
* **Trust Store** (or **Root Store** or **Certificate Store**) = local DB containing certificates of trusted root CAs are installed
* **X.509** = standard defining the creation/format of public key certificate (also defines extensions eg _.pfx_)

* _.cer_ = (PEM or DER) certificate only (Windows/Java environments)
* _.crt_ = (base64 PEM or binary DER format) containing usually only a public certificate (Linux systems)
* _.der_ = binary format certificate or key
* _.key_ = (PEM) private key (to protect carefully)
* _.pem_ (Privacy-Enhanced Mail) = most common de facto base64 file format for storing/sending crypto keys, certificates and other data (`-----BEGIN|END PRIVATE KEY-----`)
  * Contains a certificate, private key or both
* _.pfx_ (aka PKCS#12 _.p12_) = binary container format used to bundle a private key & associated public certificate (X.509), optionally encrypted

## API

* In Windows, execute > `mmc` (Microsoft Management Console) > File > _Add/Remove Snap-in…_ (`Ctrl + M`) > Certificates > Add
* In Windows, execute > `certmgr.msc`
* In Firefox, click on lock > Connection secure > More information > View Certificate = shows the certificate chain (from child to root)
