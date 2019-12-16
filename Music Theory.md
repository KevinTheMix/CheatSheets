# Music Theory

* Pitch (Hauteur) = particular frequency of air vibrating (in Hz)
  * Higher = Sharper
  * Lower = Flatter
  * Line of Pitch = A A# B C C# D D# E F F# G G# A A# B C C# D D# E F F# G G# A A# etc. (There is no B# nor E#)
* Note = Sound with at a certain Pitch
  * One of the 12 fixed notes within the Octave
  * Also refers to an absolute named Pitch (A4 on a guitar = 440Hz)
    * Except the relative notes Do Re Mi Fa So La Ti
* Tone = Can refer Note or Step (Interval) or Timbre
* Timbre = Mix of frequencies in a sound (dominant/fundamental 1F + overtones 2F 3F, etc.).
  * Specific to the instrument being played.
* [Note vs Tone vs Timbre](https://music.stackexchange.com/a/3263).
* Octaves = a note whose frequency is two times higher (1F => 2F)
  * By extension, all the notes whose frequencies are multiple of 2 from each other (1/2F, 1F, 2F, 4F, etc.)
  * Notes discrete number of octaves (power of 2) apart can be considered the same (i.e. 1F == 2^n*F)
  * There are 8 Notes of the Major Scale in an octave (hence the name)
  * There are 12 different Notes in an octave (a half-step or semitone apart)

* Fifth = a note whose frequency is three times higher (1F => 3F), also called Third Harmonics
  * (5 notes apart, using 3/2F by shifting down 2 octaves)
  * Further frequency, but actually closer harmonic neighbour to the original note than its Third (Fifth 3F < Third 5F).
* Third = a note whose frequency five times higher (1F => 5F)
  * (3 notes apart, using 5/4F by shifting down 4 octaves)
* Accidentals
  * Sharp ♯
  * Flat ♭
  * Natural ♮
* Root = the 1 note of a Scale.
  * Usually the note of the lowest pitch in the Scale (see <https://en.wikipedia.org/wiki/Musical_tone>).
  * Can be tricky to locate
    * If multiple tones are played, or one fundamental tone along with overtones
      * <https://music.stackexchange.com/a/3263>
      * <https://en.wikipedia.org/wiki/Pitch_(music)#Pitch_and_frequency>
    * If shifted using a different Mode (see <https://youtu.be/mdEcLQ_RQPY?t=500>).
* Key = Root note of a Scale and whether it is Major or Minor.
  * Example: C#m
* Modes = circle-shifting notes of the Major scale (7 notes => 6 variations in addition to the base Scale)
  * Dorian, Myxedillian

## Scale

Selection of some of the 12 notes within an Octave.
Some scales need more or less accidentals e.g. the C Major Scale happens to not need any, and are a piano's white keys.
The 1 note is called the root of the scale.
We can create any scale with those notes, but by convention they are labeled off the Major Scale and 1 to 12, so notes that are off the Major Scale get an accidental sign.
Note that there isn't anything wrong about # & b notes, it's just a by-product of the way we label notes based on the Major Scale.
Underneath that labeling are still 12 notes a half-step apart.

    1   1#  2   2#  3   4   4#  5   5#  6   6#  7   (Major Scale-based by convention)
    1   2   3   4   5   6   7   8   9   10  11  12  (In reality)
    1       2       3   4       5       6       7   (Major Scale)
    A   A#  B   C   C#  D   D#  E   F   F#  G   G#
    B   C   C#  D   D#  E   F   F#  G   G#  A   A#
    C   C#  D   D#  E   F   F#  G   G#  A   A#  B
    D   D#  E   F   F#  G   G#  A   A#  B   C   C#
    E   F   F#  G   G#  A   A#  B   C   C#  D   D#
    F   F#  G   G#  A   A#  B   C   C#  D   D#  E
    G   G#  A   A#  B   C   C#  D   D#  E   F   F#

### Major Scale

* Any Scale with a Natural Tree (3) is a major scale.
* _The_ Major Scale however refers to 1 2 3 4 5 6 7 (which is 1 3 5 6 8 10 12 in reality).
* Aligning the Major Scale with the named notes (A A# B C C# D D# E F F# G G#)
  * A Major Scale = A B C# D E F# G#
  * C Major Scale = C D E F G A B
    * aka Do Ré Mi Fa Sol La Si
    * aka a piano's white keys (no accidentals).
  * E Major Scale = E F# G# A B C# D#

    1       2       3   4       5       6       7
    1       3       5   6       8       10      12  (In reality)
    A       B       C#  D       E       F#      G#
    E       F#      G#  A       B       C#      D#
    C       D       E   F       G       A       B   (no Accidentals)
    D       E       F#  G       A       B       C#
    E       F#      G#  A       B       C#      D#
    F       G       A   A#      C       D       E
    G       A       B   C       D       E       F#

#### Major Pentatonic Scale

* The Major Scale minus the 4 and 7notes

    1       2       3           5       6
    1       3       5           8       10      12  (In reality)
    A       B       C#          E       F#
    E       F#      G#          B       C#
    C       D       E           G       A
    D       E       F#          A       B
    E       F#      G#          B       C#
    F       G       A           C       D
    G       A       B           D       E

### Minor Scale

* Any scale with a Three Flat (3b) is a Minor Scale.
* _The_ Natural Minor Scale refers to 1 2 3b 4 5 6b 7b (aka 1 2 2# 4 5 5# 6#), which is 1 3 4 6 9 11 in reality.

    1       2   3b      4       5   6b      7b
    1       2   2#      4       5   5#      6#
    1       3   4       6       8   9       11  12  (In reality)
    A       B   C       D       E   F       G
    B       C#  D       E       F#  G       A
    C       D   D#      F       G   G#      A#
    D       E   F       G       A   A#      C
    E       F#  G       A       B   C       D
    F       G   G#      A#      C   C#      D#
    G       A   A#      C       D   D#      F

### Minor Pentatonic Scale

* The Minor Scale minus 2 and 6b notes.

    1           3b      4       5           7b
    1           2#      4       5           6#
    1           4       6       8           11  12  (In reality)
    A           C       D       E           G
    B           D       E       F#          A
    C           D#      F       G           A#
    D           F       G       A           C
    E           G       A       B           D
    F           G#      A#      C           D#
    G           A#      C       D           F

## Circle of Fifths

There are 12 different Notes in an octave, which means there are only 12 notes in music, since the same note in different octaves can be considered the same.
Why are there only 12 notes?
When air vibrates in a physical instrument, it creates its own unique frequency, but also a little bit double that frequency (2F, one octave higher), and also three times that frequency (3F, called its fifth) - and actually also 4F, etc.
Note that a single pitch sound is only possible if produced electronically.

2F is virtually the same note, but 3F is its closest neighbour, called its _fifth_ because they are 5 notes apart, and they sound really good (the best any two different notes can) together.
If we construct the fifth of each consecutive note found this way, we end up looping back to the first one, discovering 12 notes in the process.
Actually, since we can multiply by a power of two to shift octaves, we typically use the 3/2F or 3/4 fifth that are closer to 1F to build the circle with notes in the same frequency range.

Since we end up looping back to the first note, we can draw them as a circle. This is called the Circle of Fiths.
Note that the circle doesn't actually close perfectly (Fifths 3/2^12 ~= 2^7 Octave) and various strategies have been employed to mitigate that issue.

Examples:

* [Accord pythagoricien](https://fr.wikipedia.org/wiki/Accord_pythagoricien)
  * Only Fifths are just, except the Wolf
  * Used in religious music
* [Tempérament mésotonique](https://fr.wikipedia.org/wiki/Temp%C3%A9rament_m%C3%A9sotonique) (Meantone temperament)
  * We already kinda had Thirds (4th fifth 3/2^4~=5) but a little off
  * => Shorten Fifths (3/2 -> 5^1/4) in favor perfect Thirds (5^1/4^4 == 5)
  * Still a Wolf
  * Several varieties
* [Tempérament egal](https://fr.wikipedia.org/wiki/Gamme_temp%C3%A9r%C3%A9e)
  * Take one octave & divides it by 12
  * Octave is perfect, other intervals all are little off
* Accord des physiciens
  * Build notes from Thirds & Fifths (F -> D)
  * Perfect but only for the Scale it's tuned for (here: C Major Scale)
* Musique microtonale
  * Divide in smaller intervals => more than 12 notes in one octave
  * Arabic = 24 notes (quarter-notes)
* See [Science étonnante - Les mathématiques de la musique](https://www.youtube.com/watch?v=cTYvCpLRwao)

## References

* [Musique Theory Distilled](https://www.youtube.com/watch?v=mdEcLQ_RQPY)
* [Andrew Huang](https://www.youtube.com/watch?v=rgaTLrZGlk0)
