# JDownloader2

## Filename Trim

Settings > Settings > Packagizer

* Uncheck Rule "Predifined rule: Create Subfolders by Packagename"
* Create Rule "Trim Audios"
  * File Name = `(.*) \(\d+kbit\w+\)\.(m4a|ogg)` & enable Regex
  * Filename = <jd:orgfilename:1>.<jd:orgfilename:2>
* Create Rule "Trim Videos"
  * File Name = `(.*) \(\d+p_\d+fps_(?:AV1|H264)-\d+kbit_AAC\)\.(mp4)` & enable Regex
  * Filename = <jd:orgfilename:1>.<jd:orgfilename:2>
