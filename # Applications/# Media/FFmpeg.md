# FFmpeg (Fast Forward Moving Picture Experts Group)

FFmpeg is a FOSS set of libraries for manipulating video, audio files/streams.

## Quick Tips

* [Download m3u8 playlists](https://old.reddit.com/r/youtubedl/comments/13yctys/comment/jmmgbo0) (eg loom)
  * Download the master, audio & video m3u8 playlists locally
  * Edit media URLs in audio/video playlists to include host root (eg `https://…`) and GET parameters (eg `?Signature=…`), which can be found in the playlists request)
  * Feed the local master playlist to ffmpeg: `ffmpeg -allowed_extensions ALL -protocol_whitelist 'crypto,file,http,https,tls,tcp,ts' -i master.m3u8 -c copy out.ts`
* `ffmpeg -i input.mp4 -vn -acodec copy output.m4a` = extract audio from video

## Glossary

* **AV1** = video coding format for transmissions over internet (successor to VP9)
* Builds
  * **Essentials** = commonly used libraries (~26MB)
  * **Full** = everything (~49MB)
* **DASH** (Dynamic Adaptive Streaming over HTTP) = adpative streaming of content
* **(De)Muxing** (multiplexing) = combine/separate one media file into its many composing streams (ie audio, video, subtitles)
* Files
  * **HLS** (HTTP Live Streaming) = HTTP-based adaptive bitrate streaming protocol (originally developed by Apple)
  * **M3U** (MP3 URL) = file format for a multimedia playlist
  * **M3U8** = unicode version of M3U (uses UTF-8)
  * **MKV** (Matroska) = container format for video, audio, pîctures & subtitles in a single file
  * **MPD** (Media Presentation Description) = description/index/manifest of resources (ie media segments) for MPEG DASH delivery
  * **TS** (Transport Stream, in full MPEG-TS) = standard digital container format
* **H.264** (aka **AVC** for Advanced Video Coding or **MPEG-4 Part 10**) = video compression standard
* **H.265** (aka **HVEC** for High Efficiency Video Coding or **MPEG-H Part 2**) = video compression standard (successor to AVC)
* **Libavcodec** = FOSS library of codecs for en/decoding video & audio data
* **x264** = FOSS library & CLI for encoding video streams into the H.264/MPEG-4 AVC video coding format (developed by VideoLAN)

## CLI ([Main options](https://ffmpeg.org/ffmpeg.html#Main-options))

* `-acodec copy` = copies audio stream without re-encoding (faster and lossless)
* `-bsf` = bitstream filtering (note: [explanation](https://stackoverflow.com/a/32035072), warning: pretty complex topic)
* `-c` or `-codec` = select an encoder
* `-c:a` = applies audio streams (`-c:a:1` = applies to a particular stream)
* `-c:v` = applies to video streams
* `-c copy` = does not re-encode stream
* `-i {url}` = one input (there can be multiple)
* `-vn` = excludes video stream from output (eg audio only)

* `ffprobe -i {input}` = information about input (streams)

### Samples

* `ffmpeg.exe -i {input} 2>&1 | find "Stream"` = simple file streams information ([source](https://superuser.com/a/1625115))
* [Merge video & audio](https://superuser.com/a/277667)
  * `ffmpeg -i video.mp4 -i audio.wav -c copy output.mkv` = simple
  * `ffmpeg -i video.mp4 -i audio.wav -c:v copy -c:a aac output.mp4` = with audio stream re-encoding
* `ffmpeg -i manifest.mpd -c copy out.mp4` = convert a MPD file (url) into a video
* `ffmpeg -i manifest.m3u8 -c copy -bsf:a aac_adtstoasc "out.mp4"` = DL stream of hls files from m3u8 index file (url)
