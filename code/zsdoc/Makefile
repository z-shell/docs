all: pdf html

# MAN
# Converted with a2x from asciidoc package

man: man/zi.zsh.1 man/side.zsh.1 man/install.zsh.1 man/autoload.zsh.1 man/additional.zsh.1

man/zi.zsh.1:
	rm -rf man/zi.zsh.1
	mkdir -p man
	a2x --verbose -L --doctype manpage --format manpage -D man zi.zsh.adoc

man/side.zsh.1:
	rm -rf man/side.zsh.1
	mkdir -p man
	a2x --verbose -L --doctype manpage --format manpage -D man side.zsh.adoc

man/install.zsh.1:
	rm -rf man/install.zsh.1
	mkdir -p man
	a2x --verbose -L --doctype manpage --format manpage -D man install.zsh.adoc

man/autoload.zsh.1:
	rm -rf man/autoload.zsh.1
	mkdir -p man
	a2x --verbose -L --doctype manpage --format manpage -D man autoload.zsh.adoc

man/additional.zsh.1:
	rm -rf man/additional.zsh.1
	mkdir -p man
	a2x --verbose -L --doctype manpage --format manpage -D man additional.zsh.adoc

# PDF
# Uses asciidoctor not a2x (i.e. not asciidoc)

pdf: pdf/zi.zsh.pdf pdf/side.zsh.pdf pdf/install.zsh.pdf pdf/autoload.zsh.pdf pdf/additional.zsh.pdf

pdf/zi.zsh.pdf:
	rm -rf pdf/zi.zsh.pdf
	mkdir -p pdf
	asciidoctor -a reproducible -b pdf -r asciidoctor-pdf -D pdf zi.zsh.adoc

pdf/side.zsh.pdf:
	rm -rf pdf/side.zsh.pdf
	mkdir -p pdf
	asciidoctor -a reproducible -b pdf -r asciidoctor-pdf -D pdf side.zsh.adoc

pdf/install.zsh.pdf:
	rm -rf pdf/install.zsh.pdf
	mkdir -p pdf
	asciidoctor -a reproducible -b pdf -r asciidoctor-pdf -D pdf install.zsh.adoc

pdf/autoload.zsh.pdf:
	rm -rf pdf/autoload.zsh.pdf
	mkdir -p pdf
	asciidoctor -a reproducible -b pdf -r asciidoctor-pdf -D pdf autoload.zsh.adoc

pdf/additional.zsh.pdf:
	rm -rf pdf/additional.zsh.pdf
	mkdir -p pdf
	asciidoctor -a reproducible -b pdf -r asciidoctor-pdf -D pdf additional.zsh.adoc

html: html/zi.zsh.html html/side.zsh.html html/install.zsh.html html/autoload.zsh.html html/additional.zsh.html

html/zi.zsh.html:
	rm -rf html/zi.zsh.html
	mkdir -p html
	asciidoctor -D html zi.zsh.adoc

html/side.zsh.html:
	rm -rf html/side.zsh.html
	mkdir -p html
	asciidoctor -D html side.zsh.adoc

html/install.zsh.html:
	rm -rf html/install.zsh.html
	mkdir -p html
	asciidoctor -D html install.zsh.adoc

html/autoload.zsh.html:
	rm -rf html/autoload.zsh.html
	mkdir -p html
	asciidoctor -D html autoload.zsh.adoc

html/additional.zsh.html:
	rm -rf html/additional.zsh.html
	mkdir -p html
	asciidoctor -D html additional.zsh.adoc

clean:
	rm -f *.adoc

distclean: clean
	rm -rf data

.PHONY: man pdf html clean distclean
