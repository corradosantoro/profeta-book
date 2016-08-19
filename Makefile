
SRCFILE=profeta-book

all:
	latex $(SRCFILE).tex

clean:
	rm -f $(SRCFILE).log $(SRCFILE).aux

ps:	$(SRCFILE).ps

$(SRCFILE).ps: $(SRCFILE).dvi
	dvips $(SRCFILE).dvi -o $(SRCFILE).ps

bib:
	bibtex $(SRCFILE)

print:
	make ps
	gs -sDEVICE=ljet4 -sOutputFile=- -sPAPERSIZE=a4 \
		-dNOPAUSE -q $(SRCFILE).ps -c quit | lpr -Plp0

view:
	make ps
	evince $(SRCFILE).ps

help:
	@echo "usage: make [bib | ps | print | view]"


