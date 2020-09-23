# Certificates

Certificates are a way of making sure a domain/server/website is trustworthy.

It requires a 3rd party trusted by all: the Certification Authority.

It is actually a nested trust network (tree), with a root CA at the highest level.
Each descending CA can vouch for sub-CAs below it, in a pyramidal fashion.

* Certification Authority (CA)
* Root CA = CA at the top-level, whether public or installed locally

On Windows, a number of public root CAs are installed by default (Verisign, Thawte, etc.).
These probably get extended via Windows Update
Then the user can install new one herself manually

## Technical

Uses asymmetrical key signing:

1. Certificate -> (irreversible) Hash
2. Hash + private Key = Signature (large number)
  * Only CAs know the private keys, so only they can sign
3. Signature is integrated back in to Certificate, which is made public
4. Client can connect to a server, read the Certificate and check its Signature using a public Key

## Troubleshooting

If the browser complains that a certificate is not valid, that means:

* The Certificate was not recorded at one of the well-known public CAs (Verisign & co)
* The Certificate (or its parent chain root CA) is not installed locally
* The Certificate is badly configured

## Resources

* [Wikipedia](https://en.wikipedia.org/wiki/Public_key_certificate)
* [Asymmetry vs Symmetry](https://stackoverflow.com/a/37791162)
  * Asymmetric encryption is used twice during initiation (certification identificatin & to exchange symmetric key)
  * Symmetric encryption is used after that to encrypt webpages payload, as it's much faster
