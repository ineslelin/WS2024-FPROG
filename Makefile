PROGRAMS   = project unit
CXX       = ghc
OUTDIR     = out

$(OUTDIR):
	mkdir -p $(OUTDIR)

all: $(OUTDIR) $(PROGRAMS)

project: main.hs
	$(CXX) main.hs -o $(OUTDIR)/project

unit: unittests.hs
	$(CXX) unittests.hs -o $(OUTDIR)/unittests

.PHONY: clean

clean:
	-rm -f *.o *.hi $(OUTDIR)/*
