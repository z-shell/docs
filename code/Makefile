all: zsdoc

%.zwc: %
	zi/lib/zcompile $<

clone:
	rm -rf zi
	git clone --depth 1 --branch main https://github.com/z-shell/zi

adoc: clone zi/zi.zsh.zwc zi/lib/zsh/side.zsh.zwc zi/lib/zsh/install.zsh.zwc zi/lib/zsh/autoload.zsh.zwc zi/lib/zsh/additional.zsh.zwc
	rm -f zsdoc/*.adoc
	zsd -v --scomm --cignore '(\#*FUN(C|CTION|):*[[[*|[[:blank:]]#\#[[:blank:]]#]]]*)' \
	zi/zi.zsh \
	zi/lib/zsh/side.zsh \
	zi/lib/zsh/install.zsh \
	zi/lib/zsh/autoload.zsh \
	zi/lib/zsh/additional.zsh
	mkdir -p zsdoc/asciidoc
	cp -f zsdoc/*.adoc zsdoc/asciidoc/

zsdoc: adoc
	make -C zsdoc

clean:
	rm -rf zi
	make -C zsdoc clean

distclean: clean
	rm -rf zsdoc/man
	rm -rf zsdoc/pdf
	rm -rf zsdoc/html
	rm -rf zsdoc/asciidoc
	make -C zsdoc distclean

.PHONY: all clone adoc zsdoc clean distclean
