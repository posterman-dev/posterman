PLATFORM = generic
TOP = .

include $(TOP)/mk/p_$(PLATFORM).mk
include $(TOP)/mk/u_inherit.mk

.PHONY: all clean ./build

all: ./build

./build: ./build/Makefile
	mkdir -p ./build

./build/Makefile: ./tool/template.pl Makefile.in
	mkdir -p ./build
	$(INHERIT) $(PERL) $(TOP)/tool/template.pl Makefile.in > $@

clean:
	rm -rf build
