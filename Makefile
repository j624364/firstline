CFLAGS=-ansi -pedantic-errors -Wall -O3
OUTPUTFILE=firstline
SOURCEFILE=firstline.c

INSTALLDIR=/usr/bin
INSTALLPATH=$(INSTALLDIR)/$(OUTPUTFILE)

.PHONY: clean install uninstall

$(OUTPUTFILE): $(SOURCEFILE)
	cc $(CFLAGS) $(SOURCEFILE) -o $(OUTPUTFILE)

clean:
	rm -f $(OUTPUTFILE)

install: $(OUTPUTFILE)
	sudo cp $(OUTPUTFILE) $(INSTALLPATH)

uninstall:
	sudo rm -f $(INSTALLPATH)

