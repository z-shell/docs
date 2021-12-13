all: clone zi/zi.zsh.zwc zi/lib/zsh/side.zsh.zwc zi/lib/zsh/install.zsh.zwc zi/lib/zsh/autoload.zsh.zwc

clone: clean
	command git clone --depth 1 --branch main https://github.com/z-shell/zi

%.zwc: %
	zi/lib/zcompile $<

adoc: clone zi/zi.zsh zi/lib/zsh/side.zsh zi/lib/zsh/install.zsh zi/lib/zsh/autoload.zsh
	rm -vrf zsdoc/asciidoc/*.adoc
	zsd -v --scomm --cignore "(\#*FUNCTION:*{{{*|\#[[:space:]]#}}}*)" \
	zi/zi.zsh \
	zi/lib/zsh/side.zsh \
	zi/lib/zsh/install.zsh \
	zi/lib/zsh/autoload.zsh
	@mkdir -p zsdoc/asciidoc
	mv -v zsdoc/*.adoc zsdoc/asciidoc/
	printf "Last update: [$(date '+%m/%d/%Y %H:%M:%S')]\n" >asciidoc.log

man:
	rm -vrf zsdoc/man
	make -C zsdoc man

pdf:
	rm -vrf zsdoc/pdf
	make -C zsdoc pdf

html:
	rm -vrf zsdoc/html
	make -C zsdoc html

clean:
	rm -vrf zi
	rm -vrf zsdoc/data

.PHONY: all clean clone man pdf html adoc
