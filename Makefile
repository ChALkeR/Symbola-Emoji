.PHONY: all clean

all: dist

clean:
	rm -rf build

build/:
	mkdir build

build/Symbola.ttf: build/
	cd build ; \
	wget http://users.teilar.gr/~g1951d/Symbola.zip ; \
	unzip Symbola.zip ; \
	touch Symbola.ttf

build/Symbola-Emoji.ttf: build/Symbola.ttf emoji.pe
	./emoji.pe build/Symbola.ttf build/Symbola-Emoji.ttf

build/Symbola-Emoji.eot: build/Symbola-Emoji.ttf
	ttf2eot build/Symbola-Emoji.ttf > build/Symbola-Emoji.eot

build/Symbola-Emoji.woff: build/Symbola-Emoji.ttf
	ttf2woff build/Symbola-Emoji.ttf build/Symbola-Emoji.woff

dist: build/Symbola-Emoji.ttf build/Symbola-Emoji.eot build/Symbola-Emoji.woff
	mkdir -p dist
	cp build/Symbola-Emoji.* dist
