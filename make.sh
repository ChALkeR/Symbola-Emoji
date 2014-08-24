#!/bin/bash
rm -rf build
mkdir build
cd build
wget http://users.teilar.gr/~g1951d/Symbola.zip
unzip Symbola.zip

../emoji.pe Symbola.ttf Symbola-Emoji.ttf
ttf2eot Symbola-Emoji.ttf  > Symbola-Emoji.eot
ttf2woff Symbola-Emoji.ttf Symbola-Emoji.woff

mkdir -p ../dist
cp Symbola-Emoji.* ../dist
