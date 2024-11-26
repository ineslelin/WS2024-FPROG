PROGRAM   = project
CXX       = ghc
BUILD_DIR = out

all: $(PROGRAM)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(PROGRAM): $(BUILD_DIR) main.hs
	$(CXX) main.hs -o $(BUILD_DIR)/$(PROGRAM)

.PHONY: clean 

clean:
	-rm -f *.o *.hi $(BUILD_DIR)/$(PROGRAM)