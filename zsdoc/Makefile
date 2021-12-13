all: zi/zi.zsh.zwc zi/lib/zsh/side.zsh.zwc zi/lib/zsh/install.zsh.zwc zi/lib/zsh/autoload.zsh.zwc

%.zwc: %
	zi/lib/zcompile $<
  
doc: zi/zi.zsh zi/lib/zsh/side.zsh zi/lib/zsh/install.zsh zi/lib/zsh/autoload.zsh
  git clone --depth 1 --branch main https://github.com/z-shell/zi
  rm -rvf data *.adoc
  zsd -v --scomm --cignore '(\#*FUNCTION:*{{{*|\#[[:space:]]#}}}*)' zi.zsh \
  lib/zsh/side.zsh \
  lib/zsh/install.zsh \
  lib/zsh/autoload.zsh

html: doc
	asciidoctor zi.zsh.adoc && asciidoctor side.zsh.adoc && \
	asciidoctor install.zsh.adoc && asciidoctor autoload.zsh.adoc && \
	asciidoctor additional.zsh.adoc

clean:
  rm -vrf zi 
	rm -vrf data

.PHONY: all clean doc html
