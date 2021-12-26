all: render

render:
	./render.zsh

README.html: README.adoc
	asciidoctor -a reproducible README.adoc

README.pdf: README.adoc
	asciidoctor-pdf -a reproducible -a allow-uri-read README.adoc

gh-pages: all
	@mkdir -p ~/tmp/znsh
	@mv -v *.html ~/tmp/znsh
	git checkout gh-pages
	@cp -v ~/tmp/znsh/*.html  .
	git add -A *.html
	git commit && git push origin gh-pages

main:
	git reset --hard
	git checkout main
	make all

loop:
	@echo $(PWD)
	while true; do make all >/dev/null 2>&1; sleep 1; done

clean:
	rm -f *.pdf *.html
