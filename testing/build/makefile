SHELL=/bin/bash

# All other variables are set as environment variables

EXAMPLES=$(filter-out $(wildcard *error*), $(wildcard example*.xc))
OBJECTS=$(EXAMPLES:.xc=.o)
EXECUTABLES=$(EXAMPLES:.xc=.out)
TESTS=$(EXAMPLES:.xc=.test)

AUTOTESTS_SRC=$(wildcard example*.xc)
AUTOTESTS=$(EXECUTABLE_DEPENDS) $(AUTOTESTS_SRC:.xc=.c) $(OBJECTS) $(EXECUTABLES) $(TESTS)

# Also building all object files to prevent recompilation when linking dependancies change
all: $(EXECUTABLE_DEPENDS) $(OBJECTS) $(EXECUTABLES) $(TESTS)

include $(INCLUDES)

$(JAR_NAME): $(ABLEC_SOURCE)
ifdef TESTING
	echo -n "Building $(shell basename `pwd`)/$(JAR_NAME)... "
	touch artifact/Main.sv
	silver -I . $(SILVER_INCLUDES) -o $(JAR_NAME) artifact &> $@.test.out && echo "passed" || (echo "failed" ; touch .tests_failed ; exit 1)
else
	touch artifact/Main.sv
	silver -I . $(SILVER_INCLUDES) -o $(JAR_NAME) artifact
endif

%.c: %.xc $(JAR_NAME)
ifdef TESTING
	echo -n "Translating $(shell basename $<)... "
	if [ -z $(findstring error, $<) ]; then (java $(JAVA_FLAGS) -jar $(JAR_NAME) $< $(CPPFLAGS) &> $@.test.out && echo "passed" || (echo "failed"; touch .tests_failed; exit 2)) else if java $(JAVA_FLAGS) -jar $(JAR_NAME) $< $(CPPFLAGS) &> $@.test.out; then echo "failed (did not error)"; rm $@; touch .tests_failed; exit 3; else echo "passed (did not compile)"; fi; fi
else
	java $(JAVA_FLAGS) -jar $(JAR_NAME) $< $(CPPFLAGS)
endif
	mv $*.pp_out.c $@
	rm $*.gen_cpp

%.o: %.c
ifdef TESTING
	echo -n "Compiling $(shell basename $<)... "
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< &> $@.test.out && echo "passed" || (echo "failed"; touch .tests_failed; exit 4)
else
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $<
endif

%.out: %.o $(EXECUTABLE_DEPENDS)
ifdef TESTING
	echo -n "Linking $(shell basename $<)... "
	$(CC) $(LDFLAGS) $< $(LOADLIBES) $(LDLIBS) -o $@ &> $@.test.out && echo "passed" || (echo "failed"; touch .tests_failed; exit 5)
else
	$(CC) $(LDFLAGS) $< $(LOADLIBES) $(LDLIBS) -o $@
endif

%.test: %.out
	@echo -n "Running $(shell basename $<)... "
ifdef TESTING
	-@if [ -z $(findstring rerr, $<) ]; then ./$< &> $@.out && (touch $@; echo "passed") || (echo "failed (exit $$?)"; touch .tests_failed; exit 6) else ./$< &> $@.out && (echo "failed (did not error)"; touch .tests_failed; exit 7) || (echo "passed (exit $$?)"; touch $@); fi
else
	@echo ""
	@./$< || (echo -e "(exit $$?)"; ! [ -z $(findstring rerr, $<) ])
	touch $@
	@echo ""
endif

tests:
	@echo "Testing $(shell basename `pwd`)..."
	@rm -f *.test *.test.out .tests_failed
	-@./make -s TESTING=true "$(AUTOTESTS)" 2>/dev/null ||:
	@if [ -f .tests_failed ]; then echo -e "\e[91mSome tests failed\e[39m"; else echo -e "\e[92mAll tests passed\e[39m"; fi

clean:
	find . -path ./.git -prune -o -type d -exec sh -c 'cd {} && rm -rf $(CLEAN_FILES)' ';'

testsclean:
	rm -rf *.test *.test.out .tests_failed

realclean: clean
	find . -path ./.git -prune -o -type d -exec sh -c 'cd {} && rm -rf $(REALCLEAN_FILES)' ';'

.PHONY: all tests clean cleantests realclean
.INTERMEDIATE: $(INTERMEDIATES)
.PRECIOUS: $(JAR_NAME)
