PROGRAM   = project
CXX       = clang++
CXXFLAGS  = -g -std=c++17 -Wall -lm

$(PROGRAM): main.cpp
	$(CXX) main.cpp -o out/$(PROGRAM)

.PHONY: clean 

clean:
	-rm -f *.o $(PROGRAM) 