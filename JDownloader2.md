# JDownloader2

## Filename Trim

Settings > Settings > Packagizer

* Uncheck Rule "Predifined rule: Create Subfolders by Packagename"
* Create Rule "Trim"
  * File Name = (.*) \(\d+kbit\w+\)\.(m4a|ogg) + enable Regex
  * Filename = <jd:orgfilename:1>.<jd:orgfilename:2>