PLATFORM = generic
TOP = .

include $(TOP)/mk/p_$(PLATFORM).mk
include $(TOP)/mk/u_inherit.mk

.PHONY: all distclean clean ./build

all: ./build

./build: ./build/Makefile
	mkdir -p ./build
	cd $@ && $(MAKE)

./build/Makefile: ./tool/template.pl template/Makefile.in
	mkdir -p ./build
	$(INHERIT) $(PERL) $(TOP)/tool/template.pl template/Makefile.in > $@

distclean:
	rm -rf build

clean:
	cd ./build && $(MAKE) clean
