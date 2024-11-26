PROGRAM   = project
CXX       = ghc

$(PROGRAM): main.hs
	$(CXX) main.hs -o out/$(PROGRAM)

.PHONY: clean 

clean:
	-rm -f *.o $(PROGRAM) 