# FFmpeg (Fast Forward Moving Picture Experts Group)

FFmpeg is a FOSS set of libraries for manipulating video, audio files/streams.

## API

* `ffmpeg -i "http://example.com/video_url.m3u8" -c copy -bsf:a aac_adtstoasc "output.mp4"` = DL stream of hls files from m3u8 index file
