PROGRAM   = project unit
CXX       = ghc
BUILD_DIR = out

all: $(PROGRAM)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

project: $(BUILD_DIR) main.hs
	$(CXX) main.hs -o $(BUILD_DIR)/project

unit: $(BUILD_DIR) unittests.hs
	$(CXX) unittests.hs -o $(BUILD_DIR)/unittests

.PHONY: clean 

clean:
	-rm -f *.o *.hi $(BUILD_DIR)/*