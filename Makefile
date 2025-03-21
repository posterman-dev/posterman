PLATFORM = generic

include ./mk/p_$(PLATFORM).mk

.PHONY: all clean ./build

all: ./build

./build: ./build/Makefile

./build/Makefile:

clean:
	rm -rf build
