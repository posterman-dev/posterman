PLATFORM = generic
TOP = .

include $(TOP)/mk/p_$(PLATFORM).mk

.PHONY: all distclean clean ./build

all: ./build

./build: ./build/Makefile
	mkdir -p ./build
	cd $@ && $(MAKE) TOP=..

./build/Makefile: ./tool/template.pl template/Makefile.in
	mkdir -p ./build
	cd ./build && $(INHERIT) $(PERL) ../tool/template.pl ../template/Makefile.in > Makefile

distclean:
	rm -rf build

clean:
	cd ./build && $(MAKE) TOP=.. clean
