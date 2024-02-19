# JDownloader2

## Settings

### Account Manager

For registered websites (eg Instagram, etc.)

### Basic Authentication

1. Add
2. `http://`
3. `https://www.{site}.com` (or just `{site}.com` I guess)
4. Username
5. Password
6. Check _Always_ checkbox

### Plugins

* _rtbf.be_

### Packagizer

* Uncheck Rule _Predifined rule: Create Subfolders by Packagename_
* Create Rule _Trim audio files_
  * File Name = `(.*) \(\d+kbit\w+\)\.(m4a|ogg|opus)` & enable Regex
  * Filename = `<jd:orgfilename:1>.<jd:orgfilename:2>`
* Create Rule _Trim video files_
  * File Name = `(.*) \(\d+p_\d+fps_(?:AV1|H264)-\d+kbit_AAC\)\.(mp4)` & enable Regex
  * Filename = `<jd:orgfilename:1>.<jd:orgfilename:2>`

### Download Youtube Channel

* Go to Youtube Channel > **Videos**
* Scroll to bottom of page manually or via `var scroll = setInterval(function(){ window.scrollBy(0, 1000)}, 1000);`
* Paste the following code that lists all videos title & URLs:

```javascript
window.clearInterval(scroll); console.clear(); urls = $$('a'); urls.forEach(function(v,i,a){if (v.id=="video-title-link"){console.log('\t'+v.title+'\t'+v.href+'\t')}});
```

* Right-Click the console output and select "Copy all Messages"
* Paste the text into Excel
* Copy only the list of URLs and paste it into JDownloader
* Adapted & corrected from <https://rgetter.com/2021/12/21/back-up-a-youtube-channel-with-jdownloader2/>
