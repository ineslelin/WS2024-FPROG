PROGRAM   = project
CXX       = ghc
# CXXFLAGS  = -g -std=c++17 -Wall -lm

$(PROGRAM): main.hs
	$(CXX) main.hs -o out/$(PROGRAM)

.PHONY: clean 

clean:
	-rm -f *.o $(PROGRAM) 