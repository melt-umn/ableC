SHELL=/bin/bash

# All other variables are set as environment variables

include $(INCLUDES)

EXAMPLES=$(filter-out $(wildcard example*error*.xc), $(wildcard example*.xc))
OBJECTS=$(EXAMPLES:.xc=.o)
EXECUTABLES=$(EXAMPLES:.xc=.out)
TESTS=$(EXAMPLES:.xc=.test)

# Also building all object files to speed up compilation when rewrite_driver.xc changes
all: $(EXECUATBLE_DEPENDS) $(OBJECTS) $(EXECUTABLES) $(TESTS)

$(JAR_NAME): $(ABLEC_SOURCE)
	touch artifact/Main.sv
	silver -I . $(SILVER_INCLUDES) -o $(JAR_NAME) artifact

%.c: %.xc $(JAR_NAME)
	java $(JAVA_FLAGS) -jar $(JAR_NAME) $< $(CPPFLAGS)
	mv $(patsubst %.xc, %.pp_out.c, $<) $@
	rm $(patsubst %.xc, %.gen_cpp, $<)

%.out: %.o $(EXECUATBLE_DEPENDS)
	$(CC) $(LDFLAGS) $< $(LOADLIBES) $(LDLIBS) -o $@

%.test: %.out
	@echo -n "Running $<... "
	-./$< &> $@.out && touch $@
ifdef TESTING
	@if [ -f $@ ] ; then echo "pass" ; else echo "failed" ; fi
else
	@echo ""
	@cat $@.out
	@rm $@.out
endif

tests:
	@echo "Building and running all tests..."
	@rm -f *.test
	@./make -s TESTING=true $(TESTS)

clean:
	find . -path ./.git -prune -o -type d -exec sh -c 'cd {} && rm -rf $(CLEAN_FILES)' ';'

cleantests:
	rm -rf *.test *.test.out

realclean: clean
	rm -rf $(JAR_NAME)

.PHONY: all tests clean realclean
.INTERMEDIATE: $(INTERMEDIATES)
.PRECIOUS: $(JAR_NAME)
