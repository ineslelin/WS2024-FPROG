PROGRAMS   = project unit
CXX       = ghc

all: $(PROGRAMS)

project: main.hs
	$(CXX) main.hs -o out/project

unit: unittests.hs
	$(CXX) unittests.hs -o out/unittests

.PHONY: clean 

clean:
	-rm -f *.o *.hi ./out/*