# [CDex](https://cdex.mu)

## Quick Tips

* Don't install latest version, because [project maintainer has added adware](https://en.wikipedia.org/wiki/CDex#Potential_risk)
* _Failed to load the wnaspi32.dll driver! Use the "Native NT SCSI library" driver option instead?_ > Click _Yes_

## Menu

* Options > Settings > Filenames
  * Filename Format
    * `%1` = Artist
    * `%2` = Album
    * `%3` = Track Number
    * `%4` = Track Name
    * `%5` = CD VolumeID
    * `%6` = CDDB ID
    * `%7` = Track Number Leading Zero
    * `%8` = Total Number of Tracks
    * `%G` = Genre
    * `%Y` = Year
    * `%A` = Artist Name (not affected by the split option)
    * _Use l or u prequalifier to force lower/upper case strings_
    * Eg `%Y. %1 - %2\%7 - %4` for single artist album and `%Y. %2\%7. %4` for various artists
  * WAV -> MP3 = `E:\@ Download\`
  * Recorded Tracks = `E:\@ Download\`
* Options > [Remote CDDB](https://gnudb.org/howto.php) > _Add Site_
  * Location = `gnudb.gnudb.org`
  * Address = `gnudb.gnudb.org`
  * Your E-mail address = `{email}`
  * Auto connect to remote CDDB = `check`
