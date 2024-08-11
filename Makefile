
# This Makefile only exists for convenience in extension Makefiles, 
# to avoid invoking Silver to rebuild ableC when it is up to date.

SVFLAGS?=

ableC.jar: $(shell find grammars/ -name *.sv -print0 | xargs -0)
	./build $(SVFLAGS)
	touch $@
