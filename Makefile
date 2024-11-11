CFLAGS=-ansi -pedantic-errors -Wall -O3
OUTPUTFILE=firstline
SOURCEFILE=firstline.c

$(OUTPUTFILE): $(SOURCEFILE)
	cc $(CFLAGS) $(SOURCEFILE) -o $(OUTPUTFILE)

