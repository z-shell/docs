all: Zsh-Native-Scripting-Handbook.html Zsh-Plugin-Standard.html

Zsh-Native-Scripting-Handbook.html: Zsh-Native-Scripting-Handbook.adoc
    asciidoctor -a reproducible Zsh-Native-Scripting-Handbook.adoc
  
Zsh-Plugin-Standard.html: Zsh-Plugin-Standard.adoc
	asciidoctor -a reproducible Zsh-Plugin-Standard.adoc

Zsh-Native-Scripting-Handbook.pdf: Zsh-Native-Scripting-Handbook.adoc
    asciidoctor-pdf -a reproducible Zsh-Native-Scripting-Handbook.adoc

Zsh-Plugin-Standard.pdf: Zsh-Plugin-Standard.adoc
    asciidoctor-pdf -a reproducible Zsh-Plugin-Standard.adoc
 
clean:
	rm -f *.pdf *.html
