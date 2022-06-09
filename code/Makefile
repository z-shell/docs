all: clone zi/zi.zsh.zwc zi/lib/zsh/side.zsh.zwc zi/lib/zsh/install.zsh.zwc zi/lib/zsh/autoload.zsh.zwc zi/lib/zsh/additional.zsh.zwc zsdoc

%.zwc: %
	zi/lib/zcompile $<

clone: clean
	git clone --depth 1 --branch main https://github.com/z-shell/zi

adoc: clone zi/zi.zsh zi/lib/zsh/side.zsh zi/lib/zsh/install.zsh zi/lib/zsh/autoload.zsh zi/lib/zsh/additional.zsh
	rm -vrf zsdoc/data
	rm -vf zsdoc/asciidoc/*.adoc
	zsd -v --scomm --cignore "(\#*FUNCTION:*{{{*|\#[[:space:]]#}}}*)" \
	zi/zi.zsh \
	zi/lib/zsh/side.zsh \
	zi/lib/zsh/install.zsh \
	zi/lib/zsh/autoload.zsh \
	zi/lib/zsh/additional.zsh
	@mkdir -p zsdoc/asciidoc
	cp -vf zsdoc/*.adoc zsdoc/asciidoc/

zsdoc: adoc
	make -C zsdoc clean
	make -C zsdoc

clean:
	rm -rf zi
	rm -vf zsdoc/*.adoc

.PHONY: all clone adoc clean
