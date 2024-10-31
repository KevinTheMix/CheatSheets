# JDownloader

## Quick Tips

* [Getting started as a JD-Developer](https://jdownloader.org/knowledge/wiki/development/get-started)
* Download full Youtube Channel (adapted & corrected from <https://rgetter.com/2021/12/21/back-up-a-youtube-channel-with-jdownloader2>)
  * Go to Youtube Channel > **Videos**
  * Scroll to bottom (using script: `var scroll = setInterval(function(){ window.scrollBy(0, 1000)}, 1000);` and afterwards `window.clearInterval(scroll);`)
  * Paste `console.clear(); urls = $$('a'); urls.forEach(function(v,i,a){if (v.id=="video-title-link"){console.log('\t'+v.title+'\t'+v.href+'\t')}});` (lists all videos title & URLs)
  * Right-Click the console output and select _Copy all Messages_
  * Paste the text into Excel
  * Copy only the list of URLs and paste it into JDownloader

## Settings

* Uncheck Clipboard Observer icon in the top menu

### Account Manager

For well-known websites (eg Instagram).

* [Setting up an (Instagram) account](https://support.jdownloader.org/en/knowledgebase/article/account-cookie-login-instructions)
  * Firefox `about:profiles` > _Launch (another) profile in new browser_ (opens a separate session, so there is no interference with default profile session)
  * Log in to Instagram, accept all cookies & session
  * Install [Flag Cookies](https://addons.mozilla.org/en-US/firefox/addon/flag-cookies) add-on, go to Preferences > _Export cookie data to clipboard_
  * Copy-paste that data into the **Pass** (sic) field of the Account Manager

### Basic Authentication

1. Add
2. `http://`
3. `https://www.{site}.com` (or just `{site}.com` I guess)
4. Username
5. Password
6. Check _Always_ checkbox

### Plugins

* **instagram.com**
  * Check _Default filenames: Include date (yyyy-MM-dd) in filenames?_
* **rtbf.be**
* **youtube.com**
  * _Filename for Video files_
    * Original = `*3D* *360* *VIDEO_NAME* (*H*p_*FPS*fps_*VIDEO_CODEC*-*AUDIO_BITRATE*kbit_*AUDIO_CODEC*).*EXT*`
    * With date prefix = `*DATE[yyyy.MM.dd]*. *VIDEO_NAME*.*EXT*`

### Packagizer

* Uncheck Rule _Predifined rule: Create Subfolders by Packagename_
* Create Rule _Trim audio files_
  * _File Name_ = `(.*) \(\d+kbit\w+\)\.(m4a|ogg|opus)` & enable Regex
  * _Filename_ = `<jd:orgfilename:1>.<jd:orgfilename:2>`
* Create Rule _Trim video files_
  * _File Name_ = `(.*) \(\d+p_\d+fps_(?:AV1|H264)-\d+kbit_AAC\)\.(mp4)` & enable Regex
  * _Filename_ = `<jd:orgfilename:1>.<jd:orgfilename:2>`
