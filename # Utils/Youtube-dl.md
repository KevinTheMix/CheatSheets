# Youtube-dl

* `--hls-use-mpegts` to download live streams
  * see <https://www.reddit.com/r/youtubedl/comments/kajbof/how_do_i_download_a_livestream_from_youtube/gfbvfcq/>
  * see <https://www.stellarinfo.com/blog/moov-atom-not-found/>

    Moov atom or movie atom is a part of file data that contains information about duration, timescale, display characteristics, and sub atoms of each track in a video. When you open a video file in a media player, it first reads this metadata information to play your video. For example, the Moov atom may be located at the beginning of the end of a video file.

    Without a Moov atom, you won’t be able to open a video or movie and may receive an error such as ‘Moov atom not found.’
