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

gh-pages: all
	@mkdir -p ~/tmp/zsh
	@mv -vf *.html ~/tmp/zsh/
	git fetch
	git checkout gh-pages
	@cp -vf ~/tmp/zsh/*.html .
	git add -A *.html
	echo "Documentation update ["`date "+%m/%d/%Y %H:%M:%S"`"]" > .git/COMMIT_EDITMSG_
	cat .git/COMMIT_EDITMSG_
	git commit -F .git/COMMIT_EDITMSG_ && git push -f origin gh-pages

main:
	git reset --hard
	git checkout main

loop:
	@echo $(PWD)
	while true; do make all >/dev/null 2>&1; sleep 1; done

clean:
	rm -vf *.pdf *.html
