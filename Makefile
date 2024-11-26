PROGRAM   = project
CXX       = ghc
PACKAGES = regex-compat

$(PROGRAM): main.hs
	$(CXX) -package $(PACKAGES) main.hs -o out/$(PROGRAM)

.PHONY: clean 

clean:
	-rm -f *.o $(PROGRAM) 