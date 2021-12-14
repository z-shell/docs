all: clone zi/zi.zsh.zwc zi/lib/zsh/side.zsh.zwc zi/lib/zsh/install.zsh.zwc zi/lib/zsh/autoload.zsh.zwc zi/lib/zsh/additional.zsh.zwc

%.zwc: %
	zi/lib/zcompile $<

clone: clean
	git clone --depth 1 --branch main https://github.com/z-shell/zi

adoc: clone zi/zi.zsh zi/lib/zsh/side.zsh zi/lib/zsh/install.zsh zi/lib/zsh/autoload.zsh zi/lib/zsh/additional.zsh
	rm -vrf zsdoc/data
	rm -vrf zsdoc/asciidoc/*.adoc
	zsd -v --scomm --cignore "(\#*FUNCTION:*{{{*|\#[[:space:]]#}}}*)" \
	zi/zi.zsh \
	zi/lib/zsh/side.zsh \
	zi/lib/zsh/install.zsh \
	zi/lib/zsh/autoload.zsh \
	zi/lib/zsh/additional.zsh
	@mkdir -p zsdoc/asciidoc
	mv -v zsdoc/*.adoc zsdoc/asciidoc/

clean:
	rm -vrf zi

distclean: clean
	rm -vrf zsdoc/data

.PHONY: all clean clone man pdf html adoc
