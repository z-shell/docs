all: Zsh-Native-Scripting-Handbook.html Zsh-Plugin-Standard.html \
Zsh-Native-Scripting-Handbook.pdf Zsh-Plugin-Standard.pdf

Zsh-Native-Scripting-Handbook.html: Zsh-Native-Scripting-Handbook.adoc
	asciidoctor -a reproducible Zsh-Native-Scripting-Handbook.adoc

Zsh-Plugin-Standard.html: Zsh-Plugin-Standard.adoc
	asciidoctor -a reproducible Zsh-Plugin-Standard.adoc

Zsh-Native-Scripting-Handbook.pdf: Zsh-Native-Scripting-Handbook.adoc
	asciidoctor-pdf -a reproducible Zsh-Native-Scripting-Handbook.adoc

Zsh-Plugin-Standard.pdf: Zsh-Plugin-Standard.adoc
	asciidoctor-pdf -a reproducible Zsh-Plugin-Standard.adoc

prep-gh-pages: Zsh-Native-Scripting-Handbook.html Zsh-Plugin-Standard.html
	@mkdir -p gh-pages/zsh
	@mv -vf *.html gh-pages/zsh/

to-wiki-pages:
	@cp -vf Zsh-Plugin-Standard.adoc ../zi/06-knowledge-base/Zsh-Plugin-Standard.asciidoc
	@cp -vf Zsh-Native-Scripting-Handbook.adoc ../zi/06-knowledge-base/Zsh-Native-Scripting-Handbook.asciidoc

main:
	git reset --hard
	git checkout main

loop:
	@echo $(PWD)
	while true; do make all >/dev/null 2>&1; sleep 1; done

clean:
	rm -vf *.pdf *.html
