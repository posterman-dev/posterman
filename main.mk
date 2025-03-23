PLATFORM = generic
TOP = .

include $(TOP)/mk/p_$(PLATFORM).mk

.PHONY: all distclean clean format ./build ./build/Makefile ./build/lib ./build/lib/Makefile

all: ./build

format:
	clang-format --verbose -i `find src lib -name "*.c" -or -name "*.h"`

./build: ./build/lib ./build/Makefile
	cd $@ && $(MAKE) TOP=..

./build/lib: ./build/lib/Makefile
	cd $@ && $(MAKE) TOP=../..

./build/Makefile: ./tool/template.pl template/src-Makefile.in
	mkdir -p ./build
	cd ./build && $(INHERIT) $(PERL) ../tool/template.pl ../template/src-Makefile.in > Makefile

./build/lib/Makefile: ./tool/template.pl template/lib-Makefile.in
	mkdir -p ./build/lib
	cd ./build/lib && $(INHERIT) $(PERL) ../../tool/template.pl ../../template/lib-Makefile.in > Makefile

distclean:
	rm -rf build

clean:
	cd ./build && $(MAKE) TOP=.. clean
	cd ./build/lib && $(MAKE) TOP=../.. clean
