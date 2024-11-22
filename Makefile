# This Makefile only exists to for use by recursive make, to avoid unnecessary recompilation.

ableC.jar: $(shell find grammars/ -name *.sv -print0 | xargs -0)
	./build