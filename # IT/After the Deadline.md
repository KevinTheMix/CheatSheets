# After the Deadline (AtD)

Grammar & spellcheck Java HTTP server, which can be queried via regular HTTP GET requests.

## Install & Run

1. Download the distribution Java server from <https://open.afterthedeadline.com/download/download-source-code/>
2. Download the multi-language pack from <https://open.afterthedeadline.com/download/multi-lingual-atd/>
3. Move the _lang_ language pack into the _atd_ distribution folder
4. Feel free to delete unnecessary languages folders; also comment them out in the _buildall.sh_ file (see sample below)
5. Run the sh/bat commands with additional language parameter `-Datd.lang={lg}`
6. The _lang/{lg}/models/dictionary.txt_ contains the actual spellcheck words, and can be modified manually

## Dependencies

* Requires Java Runtime Environment (JRE) 8 Update 121
  * <https://www.filepuma.com/download/java_runtime_environment_64bit_8.0.1210.13-13997/>
* Comes packaged with the following Java libraries:
  * **Sleep** = scripting language
  * **Moconti** = _Sleep_-based application server

## Files

### _run-french.bat_

launches the Java HTTP server with French language configuration

```cmd
@echo off
REM
REM startup script for AtD web service
REM
java -server -Datd.lang=fr -Dfile.encoding=UTF-8 -Dsleep.pattern_cache_size=8192 -Dbind.interface=127.0.0.1 -Dserver.port=1049 -Xmx3840M -XX:+AggressiveHeap -XX:+UseParallelGC -Dsleep.classpath=./lib:./service/code -Dsleep.debug=24 -classpath "./lib/*" httpd.Moconti atdconfig.sl
```

Java command in exploded form:

```sh
java
-server
-Dsleep.pattern_cache_size=8192
-Dbind.interface=127.0.0.1
-Dserver.port=1049
-Xmx3840M
-XX:+AggressiveHeap
-XX:+UseParallelGC
-Dsleep.classpath=./lib:./service/code
-Dsleep.debug=24
-classpath "./lib/*" httpd.Moconti atdconfig.sl

-Datd.lang=fr
-Dfile.encoding=UTF-8
```

### _lang/lib/create.bat_

probably recompiles the language dictionary

```sh
SET TARGET=fr
SET THRESHOLD=100
SET DICTSIZE=1

SET LANG=en_US.UTF-8

#
# extract all word tokens from the Wikipedia corpus
#
#rm -f lang/$TARGET/models/unigrams.bin
#java -Datd.lang=$TARGET -Dfile.encoding=UTF-8 -Xmx3840M -XX:+AggressiveHeap -XX:+UseParallelGC -jar lib/sleep.jar utils/bigrams/buildunigrams.sl lang/$TARGET/corpus lang/$TARGET/models/unigrams.bin

#
# create initial word list from Wikipedia data
#
#java -Dfile.encoding=UTF-8 -Xmx2536M -XX:NewSize=512M -jar lib/sleep.jar utils/bigrams/builddict.sl $THRESHOLD lang/$TARGET/models/unigrams.bin lang/$TARGET/wordlists/corpus.txt
#rm -f lang/$TARGET/models/unigrams.bin

#
# construct French Language Model from the corpus 
#
rm -f lang/$TARGET/models/model.bin
java -Datd.lang=$TARGET -Dfile.encoding=UTF-8 -Xmx3840M -XX:+AggressiveHeap -XX:+UseParallelGC -jar lib/sleep.jar utils/bigrams/buildcorpus.sl lang/$TARGET/corpus lang/$TARGET/models/model.bin lang/$TARGET/wordlists lang/$TARGET/homophonedb.txt

#
# create spelling dictionary
# 
java -Dfile.encoding=UTF-8 -Xmx2536M -XX:NewSize=512M -jar lib/sleep.jar utils/bigrams/builddict.sl $DICTSIZE lang/$TARGET/models/model.bin lang/$TARGET/models/dictionary.txt
```

### _buildall.sh_

Comment out all unnecessary languages:

```sh
#./lang/de/build.sh >build.de.log
#./lang/es/build.sh >build.es.log
./lang/fr/build.sh >build.fr.log
#./lang/id/build.sh >build.id.log
#./lang/it/build.sh >build.it.log
./lang/nl/build.sh >build.nl.log
#./lang/pl/build.sh >build.pl.log
#./lang/pt/build.sh >build.pt.log
#./lang/ru/build.sh >build.ru.log
```
