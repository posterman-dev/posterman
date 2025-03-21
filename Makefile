PLATFORM = generic

include ./mk/p_$(PLATFORM).mk

.PHONY: all clean ./build

all: ./build

./build: ./build/Makefile
	mkdir -p ./build

./build/Makefile: ./tool/template.pl Makefile.in
	mkdir -p ./build
	$(PERL) ./tool/template.pl Makefile.in > $@

clean:
	rm -rf build
