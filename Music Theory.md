# Music Theory

* Pitch (Hauteur) = particular frequency of air vibrating (in Hz)
  * Higher = Sharper
  * Lower = Flatter
  * Line of Pitch = A A# B C C# D D# E F F# G G# A A# B C C# D D# E F F# G G# A A# etc. (There is no B# nor E#)
* Note = Sound with at a certain Pitch
  * One of the 12 discrete notes within the Octave
  * Also refers to an absolute named Pitch (A4 on a guitar = 440Hz)
    * Except the relative notes Do Re Mi Fa So La Ti
* Tone = Can refer Note or Step (Interval distance) or Timbre
* Timbre = Mix of frequencies in a sound (dominant/fundamental 1F + overtones 2F 3F, etc.).
  * Specific to the instrument being played.
* [Note vs Tone vs Timbre](https://music.stackexchange.com/a/3263).
* Octaves = a note whose frequency is two times higher (1F => 2F)
  * By extension, all the notes whose frequencies are multiple of 2 from each other (1/2F, 1F, 2F, 4F, etc.)
  * Notes a number of octaves apart can be considered the same (i.e. 1F == 2^n*F)
  * There are 8 Notes of the Major Scale in an octave (hence the name)
  * There are 12 different Notes in an octave (a half-step or semitone apart)

* Fifth = a note whose frequency is three times higher (1F => 3F), also called Third Harmonics
  * 5 semitones apart on the Major Scale (using 3/2F by shifting down 1 octave, e.g. A440 -> E660)
* Third = a note whose frequency five times higher (1F => 5F)
  * 3 semitones apart on the Major Scale (using 5/4F by shifting down 2 octaves, e.g. A440 -> C#550)
  * Closer in frequency to the original Note compared to the Fifth (5/4 < 3/2), but a Fifth is actually a closer harmonic neighbour to the original Note than its Third (since 3F < 5F when we disregard the Octave shifts).
* Accidentals
  * Sharp (Dièse) ♯
  * Flat (Bémol) ♭
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
  * Ionian (default Major Scale), Dorian, Phrygian, Lydian, Myxolydian, Aeolian, Locrian
  * See <https://en.wikipedia.org/wiki/Mode_(music)>

## Scale

Selection of some of the 12 notes within an Octave. We can create any scale with those notes.
Some scales need more or fewer accidentals e.g. the C Major Scale happens to not need any, and are a piano's white keys.
The 1 note is called the root of the scale.

By convention, we don't use numbers 1 to 12; instead, the Major Scale establishes the "alphabet" that all Scales are labeled off of: 1 2 3 4 5 6 7.
Thus, Notes that are off the Major Scale get an Accidental sign (# and b).
There isn't anything wrong about # and b notes, it's just a by-product of the way we label notes based on the Major Scale, and underneath that labeling are still 12 notes a half-step apart.

    1   2   3   4   5   6   7   8   9   10  11  12  1   (in reality)

    1   1#  2   2#  3   4   4#  5   5#  6   6#  7   1   (Major Scale-based by convention)
    1       2       3   4       5       6       7   1   (Major Scale)
    6       7   1       2       3   4       5       6   (Major Scale Aeolian Mode aka Minor Natural Scale)
    1       2   3b      4       5   6b      7b      1   (Minor Scale)

    A   A#  B   C   C#  D   D#  E   F   F#  G   G#  A
    A#  B   C   C#  D   D#  E   F   F#  G   G#  A   A#
    B   C   C#  D   D#  E   F   F#  G   G#  A   A#  B
    C   C#  D   D#  E   F   F#  G   G#  A   A#  B   C
    C#  D   D#  E   F   F#  G   G#  A   A#  B   C   C#
    D   D#  E   F   F#  G   G#  A   A#  B   C   C#  D
    D#  E   F   F#  G   G#  A   A#  B   C   C#  D   D#
    E   F   F#  G   G#  A   A#  B   C   C#  D   D#  E
    F   F#  G   G#  A   A#  B   C   C#  D   D#  E   F
    F#  G   G#  A   A#  B   C   C#  D   D#  E   F   F#
    G   G#  A   A#  B   C   C#  D   D#  E   F   F#  G
    G#  A   A#  B   C   C#  D   D#  E   F   F#  G   G#

### Major Scale

* Any Scale with a Natural Tree (3) is a major scale.
* _The_ Major Scale = 1 2 3 4 5 6 7 1 (aka Ionian Scale), or  1 3 5 6 8 10 12 1 "in reality".
* Degrees = Tonic, Supertonic, Mediant, Subdominant, Dominant, Subtonic, Leading tone, Tonic.
* Aligning the Major Scale with the named notes (A A# B C C# D D# E F F# G G#)
  * A Major Scale = A B C# D E F# G#
  * C Major Scale = C D E F G A B
    * aka Do Ré Mi Fa Sol La Si
    * aka a piano's white keys (no accidentals).

    1       3       5   6       8       10      12  1   (in reality)
    1       2       3   4       5       6       7   1
    Tonic   2nd     3th 4th     5th/Dom 6th     7th Octave
    A       B       C#  D       E       F#      G#  A
    B       C#      D#  E       F#      G#      A#  B
    C       D       E   F       G       A       B   C   (no Accidentals)
    D       E       F#  G       A       B       C#  D
    E       F#      G#  A       B       C#      D#  E
    F       G       A   A#      C       D       E   F
    G       A       B   C       D       E       F#  G

#### Major Pentatonic Scale

* The Major Scale minus the 4 and 7 notes

    1       3       5           8       10          1  (in reality)
    1       2       3           5       6           1
    Tonic   2nd     3th         5th/Dom 6th         Octave
    A       B       C#          E       F#          A
    B       C#      D#          F#      G#          B
    C       D       E           G       A           C
    D       E       F#          A       B           D
    E       F#      G#          B       C#          E
    F       G       A           C       D           F
    G       A       B           D       E           G

### Minor Scale

* Any scale with a Three Flat (3b) is a Minor Scale.
* _The_ Natural Minor Scale = 1 2 3b 4 5 6b 7b (aka Aeolian Mode), or 1 3 4 6 9 11 in reality.
* The Harmonic Minor Scale = 1 2 3b 4 5 6b 7
* The Melodic Minor Scale = 1 2 3b 4 5 6 7 8 / 1 2 3b 4 5 6b 7b 8

    1       3   4       6       8   9       11      1  (In reality)
    1       2   3b      4       5   6b      7b      1
    1       2   2#      4       5   5#      6#      1
    A       B   C       D       E   F       G       A
    B       C#  D       E       F#  G       A       B
    C       D   D#      F       G   G#      A#      C
    D       E   F       G       A   A#      C       D
    E       F#  G       A       B   C       D       E
    F       G   G#      A#      C   C#      D#      F
    G       A   A#      C       D   D#      F       G

#### Minor Pentatonic Scale

* The Minor Scale minus 2 and 6b notes.

    1           4       6       8           11      1  (In reality)
    1           3b      4       5           7b      1
    1           2#      4       5           6#      1
    A           C       D       E           G       A
    B           D       E       F#          A       B
    C           D#      F       G           A#      C
    D           F       G       A           C       D
    E           G       A       B           D       E
    F           G#      A#      C           D#      F
    G           A#      C       D           F       G

## Fifths

    F   C   G   D   A   E   B   F#  C#  G#  D#  A#  F
    C   G   D   A   E   B   F#  C#  G#  D#  A#  F   C
    G   D   A   E   B   F#  C#  G#  D#  A#  F   C   G
    D   A   E   B   F#  C#  G#  D#  A#  F   C   G   D
    A   E   B   F#  C#  G#  D#  A#  F   C   G   D   A
    E   B   F#  C#  G#  D#  A#  F   C   G   D   A   E
    B   F#  C#  G#  D#  A#  F   C   G   D   A   E   B
    F#  C#  G#  D#  A#  F   C   G   D   A   E   B   F#
    C#  G#  D#  A#  F   C   G   D   A   E   B   F#  C#
    G#  D#  A#  F   C   G   D   A   E   B   F#  C#  G#
    D#  A#  F   C   G   D   A   E   B   F#  C#  G#  D#
    A#  F   C   G   D   A   E   B   F#  C#  G#  D#  A#

### Circle of Fifths

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

## Harmony

* Refers to the playing of Notes together, or Chords.
* Chords are a set of Notes played at the same time.
* We can make several chords off the Major (or Minor) Scale but playing the 1 3 5 Notes.
  * This is called Harmonization of the Scale.
  * Chords built like this are written down with Roman numerals: I II III IV V VI VII
  * Note that the intervals built this way are not static, e.g. II is a Minor Chord because the interval is 3 half-steps (Minor Third) from 2 to 4, unlike I's 4 half-steps (Major Third) from 1 to 3.
  * Chords off the Major Scale specifically are: I IIm IIIm IV V VIm VII° (° because the Fifth is diminished).

### Guitar Chords

* Basic chords are composed of notes off the Major Pentatonic Scale
  * Even more so, Tonic, Thirds & Fifths.
* A Chord's Root or Key starts with the Tonic as lowest Note, since it's the most important Note in the Chord.
  * That's why we don't play the first E Note for an A Chord for example, even though E is A's Fifth.

    E   A   D   G   B   E

    E   B   E   G#  B   E   Tonic, 5th, Tonic, 3rd, 5th, Tonic
    G   B   D   G   B   G   Tonic, 3rd, 5th, Tonic, 3rd, Tonic
        A   E   A   C#  E   Tonic, 5th, Tonic, 3rd, 5th
        C   E   G   C   E   Tonic, 3rd, 5th, Tonic, 3rd
            D   A   D   F#  Tonic, 5th, Tonic, 3rd

* [All Guitar Chords](http://all-guitar-chords.com/index.php)

## References

* [Musique Theory Distilled](https://www.youtube.com/watch?v=mdEcLQ_RQPY)
* [Andrew Huang](https://www.youtube.com/watch?v=rgaTLrZGlk0)
