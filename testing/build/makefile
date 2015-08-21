SHELL=/bin/bash

# All other variables are set as environment variables

EXAMPLES=$(filter-out $(wildcard example*error*.xc), $(wildcard example*.xc))
OBJECTS=$(EXAMPLES:.xc=.o)
EXECUTABLES=$(EXAMPLES:.xc=.out)
TESTS=$(EXAMPLES:.xc=.test)

AUTOTESTS_SRC=$(wildcard example*.xc)
AUTOTESTS=$(AUTOTESTS_SRC:.xc=.c) $(TESTS)

# Also building all object files to speed up compilation when rewrite_driver.xc changes
all: $(EXECUATBLE_DEPENDS) $(OBJECTS) $(EXECUTABLES) $(TESTS)

include $(INCLUDES)

$(JAR_NAME): $(ABLEC_SOURCE)
ifdef TESTING
	echo -n "Building $(shell basename `pwd`)/$(JAR_NAME)... "
	touch artifact/Main.sv
	silver -I . $(SILVER_INCLUDES) -o $(JAR_NAME) artifact &> $@.test.out && echo "passed" || (echo "failed" ; touch .tests_failed)
else
	touch artifact/Main.sv
	silver -I . $(SILVER_INCLUDES) -o $(JAR_NAME) artifact
endif

%.c: %.xc $(JAR_NAME)
ifdef TESTING
	echo -n "Translating $<... "
	if [ -z $(findstring error, $<) ] ; then { java $(JAVA_FLAGS) -jar $(JAR_NAME) $< $(CPPFLAGS) &> $@.test.out && echo "passed" || { echo "failed" ; touch .tests_failed ; } ; } ; else { java $(JAVA_FLAGS) -jar $(JAR_NAME) $< $(CPPFLAGS) &> $@.test.out && { echo "failed (did not error)" ; touch .tests_failed ; } || echo "passed (did not compile)" ; } ; fi
else
	java $(JAVA_FLAGS) -jar $(JAR_NAME) $< $(CPPFLAGS)
endif
	mv $(patsubst %.xc, %.pp_out.c, $<) $@
	rm $(patsubst %.xc, %.gen_cpp, $<)

ifdef TESTING
%.o: %.c
	echo -n "Compiling $<... "
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< &> $@.test.out && echo "passed" || (echo "failed" ; touch .tests_failed)
endif

%.out: %.o $(EXECUATBLE_DEPENDS)
	$(CC) $(LDFLAGS) $< $(LOADLIBES) $(LDLIBS) -o $@

%.test: %.out
	@echo -n "Running $<... "
	-@./$< &> $@.out && touch $@
ifdef TESTING
	@if [ -f $@ ] ; then echo "passed" ; else echo "failed" ; touch .tests_failed ; fi
else
	@echo ""
	@cat $@.out
	@rm $@.out
endif

tests:
	@echo "Testing $(shell basename `pwd`)..."
	@rm -f *.test .tests_failed
	-@./make -s TESTING=true $(AUTOTESTS) 2>/dev/null ||:
	@if [ -f .tests_failed ] ; then echo -e "\e[91mSome tests failed\e[39m" ; else echo -e "\e[92mAll tests passed\e[39m" ; fi

clean:
	find . -path ./.git -prune -o -type d -exec sh -c 'cd {} && rm -rf $(CLEAN_FILES)' ';'

cleantests:
	rm -rf *.test *.test.out

realclean: clean
	rm -rf $(REALCLEAN_FILES)

.PHONY: all tests clean cleantests realclean
.INTERMEDIATE: $(INTERMEDIATES)
.PRECIOUS: $(JAR_NAME)
