# Youtube-dl & yt-dlp

## Quick Tips

* Update frequently to fix download issues
* [Subreddit](https://www.reddit.com/r/youtubedl)
* [Set up cookies login](https://www.reddit.com/r/youtubedl/wiki/cookies)
* [Troubleshoot 403 Forbidden](https://www.reddit.com/r/youtubedl/wiki/errors-403forbidden)
* FFmpeg can often times be used directly to **download** & merge video streams from playlists
* [Downloading segmented video from Vimeo](https://gist.github.com/alexeygrigorev/a1bc540925054b71e1a7268e50ad55cd?permalink_comment_id=4366460#gistcomment-4366460)
  * find _master.json_ in browser console network
  * change _json_ to _mpd_ (remove `base64_init=1` but keep `query_string_ranges=1`, so `master.mpd?query_string_ranges=1`)
  * provide it to youtube-dl: `youtube-dl {edited_url}`
  * (FFmpeg must be installed otherwise the audio/video streams will remain separated)
* [How to download embeded Vimeo stream using yt-dlp?](https://forum.videohelp.com/threads/414977-How-to-download-embeded-vimeo-stream-using-yt-dlp)
  * Find iframe HTML request in console network by filtering on `player.vimeo.com/video` and _HTML_ type (not _XHR_)
  * Select that line in the network, go to Response tab, toggle _Raw_
  * Find `m3u8` URLs in that HTML, replace `\u0026` with `&`
  * Feed that directly to **ytp-dl** (with double quotes)

## Glossary

* [N_m3u8DL-RE](https://old.reddit.com/r/youtubedl/comments/13yctys/comment/jmm629l) = Chinese stream downloader (mpd/m3u8/ism)
* **youtube-dl-gui** = cross-platform GUI for **youtube_dl** (made in Electron & Node.js)
* **yt-dlp** = **youtube-dl** (DMCA-ed) fork based on **youtube-dlc** (inactive)
  * [How To Download & Install yt-dlp on Windows](https://old.reddit.com/r/youtubedl/comments/qzqzaz)
  * [Tutorial](https://ostechnix.com/yt-dlp-tutorial)
  * Set up yt-dlp & FFmpeg in a _ytdl_ folder on _C:_ with environment variables, then `cd \ytdl` to it

## [CLI](https://github.com/yt-dlp/yt-dlp?tab=readme-ov-file#usage-and-options)

* Use `"` (double) instead of `'` (single)
* `-F` = list available formats/resolutions
* `-f {format_id}` = pick given format
* `-f {audio_format_id+video_format_id}` = pick both audio & video together
* `-i` = ignore errors
* `-o {file}` = output
* `--audio-format mp3 {youtube_url}` = download video as mp3
* `--cookies-from-browser firefox` = [download age restricted videos](https://apple.stackexchange.com/a/456906)
* `--extract-audio` = download audio only
* `--flat-playlist` = do not extract the videos of a playlist, only list them
* `--hls-use-mpegts` = when downloading live streams that tend to get cut off, and lack a moov atom
  * [Reddit - How do I download a live-stream from Youtube?](https://www.reddit.com/r/youtubedl/comments/kajbof/comment/gfbvfcq)
  * [Fix ‘Moov Atom Not Found’ Error](https://www.stellarinfo.com/blog/moov-atom-not-found)
* `--print-to-file TEMPLATE FILE` = append to FILE
* `-s(imulate)` = don't download anything
* `--update` or `-U` = update _.exe_ in place
