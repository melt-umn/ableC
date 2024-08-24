
# Path from current directory to top level ableC repository
ABLEC_BASE?=../../ableC
# Path from current directory to top level extensions directory
EXTS_BASE?=../../extensions

MAKEOVERRIDES=ABLEC_BASE=$(abspath $(ABLEC_BASE)) EXTS_BASE=$(abspath $(EXTS_BASE))

# The name of the extension, must be defined
EXT_NAME?=$(error EXT_NAME must be defined)
# The extension's base grammar name, must be defined
EXT_GRAMMAR?=$(error EXT_GRAMMAR must be defined)
# Other extensions this extension depends on, including transitive dependencies
EXT_DEPS?=
# The Silver compiler to use
SILVER?=silver
# Extra flags passed to silver
override SVFLAGS+=-G generated

# The extension artifact jar to build
ARTIFACT_JAR=$(EXT_NAME).jar
# THe compiler jar to build
COMPILER_JAR=compiler.jar
# All silver files in included grammars, to be included as dependancies
GRAMMAR_SOURCES=$(shell find grammars/ -name *.sv -print0 | xargs -0)
# All repo folders we depend on
DEPS=$(ABLEC_BASE) $(addprefix $(EXTS_BASE)/,$(EXT_DEPS))
# All jars we depend on
DEP_JARS=$(ABLEC_BASE)/ableC.jar $(foreach dep,$(EXT_DEPS),$(EXTS_BASE)/$(dep)/$(dep).jar)
# The grammar path containing local sources and dependency jars
export GRAMMAR_PATH=$(shell echo $(DEP_JARS) $(abspath grammars) | sed "s/ \+/:/g")

# All directories contining extension header files that may be included
XC_INCLUDE_DIRS=$(wildcard include $(addsuffix /include,$(DEPS)))
# All header files that may be included, to be included as dependencies
XC_INCLUDE_SOURCES=$(foreach dir,$(XC_INCLUDE_DIRS),$(wildcard $(dir)/*.*h))
# Flags passed to the C preprocessor including the extension header directories
XC_INCLUDE_FLAGS=$(addprefix -I,$(XC_INCLUDE_DIRS))
# Flags passed to ableC including the appropriate directories
override XCFLAGS+=$(XC_INCLUDE_FLAGS)
# Flags passed to Java when invoking ableC
override JAVAFLAGS+=-Xss6M

# The extension library to build
LIB_NAME?=
# All library extended c files to compile
LIB_XC_FILES=$(wildcard src/*.xc)
# All C library source files to compile
LIB_C_FILES=$(wildcard src/*.c)
# All library C files that should be generated
LIB_C_GEN_FILES=$(LIB_XC_FILES:src/%.xc=bin/%.c)
# All library object files that should be generated
LIB_OBJECTS=$(LIB_C_FILES:src/%.c=bin/%.o) $(LIB_XC_FILES:src/%.xc=bin/%.o)
# The name of the shared library.
SHARED_LIBRARY=lib/lib$(LIB_NAME).so
# The name of the static library.
STATIC_LIBRARY=lib/lib$(LIB_NAME).a
# Flags passed to ableC including the appropriate directories when building libraries
override LIB_XCFLAGS+=$(XC_INCLUDE_FLAGS)
# Flags passed to the C preprocessor when building libraries
override LIB_CPPFLAGS+=$(XC_INCLUDE_FLAGS)
# Flags passed to the C compiler when building libraries, e.g. to enable various compiler extensions
override LIB_CFLAGS+=-fpic
# Flags passed to the linker when building the shared library
override LIB_LDFLAGS+=-shared

CONF?=opt
ifeq ($(CONF),opt)
  override LIB_XCFLAGS+=-DNDEBUG
  override LIB_CPPFLAGS+=-DNDEBUG
  override LIB_CFLAGS+=-O3
  override LIB_LDFLAGS+=-O3
else ifeq ($(CONF),dbg)
  override LIB_CFLAGS+=-g -O0
  override LIB_LDFLAGS+=-g
else
  $(error "Unknown configuration $(CONF)")
endif

# All (static) library files we depend on in linking examples/tests
LIB_FILES=$(DEP_LIBS)

ifneq ($(LIB_NAME),)
  override LIB_FILES+=$(STATIC_LIBRARY)
  override LDFLAGS+=-Llib
  # Specify this library is to be linked statically, everything else dynamically
  override LDLIBS+=-Wl,-Bstatic -l${LIB_NAME} -Wl,-Bdynamic
endif

# Extended C files to test
EXAMPLE_XC_FILES=$(wildcard examples/*.xc)
TEST_XC_FILES=$(wildcard tests/*/*.xc)
TEST_TRANS_XC_FILES=$(wildcard tests/positive/*.xc tests/runtime_error/*.xc)
# C files that should be generated
EXAMPLE_C_FILES=$(EXAMPLE_XC_FILES:.xc=.c)
TEST_C_FILES=$(TEST_TRANS_XC_FILES:.xc=.c)
# Object files that should be generated
EXAMPLE_OBJECTS=$(EXAMPLE_XC_FILES:.xc=.o)
TEST_OBJECTS=$(TEST_TRANS_XC_FILES:.xc=.o)
# Executables that should be generated
EXAMPLE_EXECUTABLES=$(EXAMPLE_XC_FILES:.xc=.out)
TEST_EXECUTABLES=$(TEST_TRANS_XC_FILES:.xc=.out)
# Evaluation marker files that should be generated
EXAMPLE_TESTS=$(EXAMPLE_XC_FILES:.xc=.test)
TEST_TESTS=$(TEST_XC_FILES:.xc=.test)

# Flags passed to the C compiler, e.g. to enable various compiler extensions
override CFLAGS+=

all: build libraries examples analyses test

build: $(ARTIFACT_JAR) $(COMPILER_JAR)

ifeq ($(LIB_NAME),)
  libraries:
else
  libraries: $(LIB_C_GEN_FILES) $(LIB_OBJECTS) $(SHARED_LIBRARY) $(STATIC_LIBRARY)
endif

examples: $(EXAMPLE_C_FILES) $(EXAMPLE_OBJECTS) $(EXAMPLE_EXECUTABLES) $(EXAMPLE_TESTS)
test: $(TEST_C_FILES) $(TEST_OBJECTS) $(TEST_EXECUTABLES) $(TEST_TESTS)
check: test

analyses: mda mwda
mda: mda.test
mwda: mwda.test

# This file is generated below, containing dependency information for included extensions,
# and also setting variables to pass appropriate flags.
include depends.mk

generated bin lib:
	mkdir -p $@

$(DEP_JARS): export GRAMMAR_PATH=
$(DEP_JARS):
	$(MAKE) -C $(dir $@) $(notdir $@)

$(ARTIFACT_JAR): $(GRAMMAR_SOURCES) $(DEP_JARS) | generated
	$(SILVER) -o $@ $(SVFLAGS) $(EXT_GRAMMAR)

$(COMPILER_JAR): ${ARTIFACT_JAR} $(GRAMMAR_SOURCES) $(DEP_JARS) | generated
	$(SILVER) -o $@ -I $(ARTIFACT_JAR) $(SVFLAGS) $(EXT_GRAMMAR):artifacts:compiler

mda.test: $(ARTIFACT_JAR) $(DEP_JARS) | generated
	$(SILVER) --dont-translate --build-xml-location build_mda.xml -I $(ARTIFACT_JAR) $(SVFLAGS) $(EXT_GRAMMAR):artifacts:mda_test
	touch $@

mwda.test: $(GRAMMAR_SOURCES) $(DEP_JARS) | generated
	$(SILVER) --dont-translate --mwda --clean --build-xml-location build_mwda.xml $(SVFLAGS) $(EXT_GRAMMAR)
	touch $@

bin/%.c: src/%.xc $(XC_INCLUDE_SOURCES) $(COMPILER_JAR) | bin
	java $(JAVAFLAGS) -jar $(COMPILER_JAR) $< $(LIB_XCFLAGS)
	mv src/$*.c src/$*.i bin

%.c: %.xc $(XC_INCLUDE_SOURCES) $(COMPILER_JAR)
	java $(JAVAFLAGS) -jar $(COMPILER_JAR) $< $(XCFLAGS)

bin/%.o: src/%.c $(XC_INCLUDE_SOURCES) | bin
	$(CC) -c $(LIB_CPPFLAGS) $(LIB_CFLAGS) $< -o $@

bin/%.o: bin/%.c | bin
	$(CC) -c $(LIB_CFLAGS) $< -o $@

$(SHARED_LIBRARY): $(LIB_OBJECTS) | lib
	$(CC) $(LIB_LDFLAGS) $^ -o $@

$(STATIC_LIBRARY): $(LIB_OBJECTS) | lib
	$(AR) rcs $@ $^

$(DEP_LIBS):
	$(MAKE) -C $(abspath $(dir $@)/..) lib/$(notdir $@)

%.out: %.o $(LIB_FILES)
	$(CC) $(LDFLAGS) $< $(LOADLIBES) $(LDLIBS) -o $@

%.test: %.out
	@echo "Running $<..."
	@./$< || echo "(exit $$?)"
	touch $@

tests/translate_error/%.test: tests/translate_error/%.xc $(XC_INCLUDE_SOURCES) $(COMPILER_JAR)
	@echo "java $(JAVAFLAGS) -jar $(COMPILER_JAR) $< $(XCFLAGS)"
	@if java $(JAVAFLAGS) -jar $(COMPILER_JAR) $< $(XCFLAGS); then echo "Failed to error"; exit 1; fi
	touch $@

tests/runtime_error/%.test: tests/runtime_error/%.out
	@echo "./$<"
	@if ./$<; then echo "Failed to error"; exit 2; else echo "(exit $$?)"; fi
	touch $@

tests/positive/%.test: tests/positive/%.out
	./$<
	touch $@

clean:
	rm -rf generated/ bin/ lib/
	rm -f depends.mk *.jar *.copperdump.html build*.xml *.test
	cd examples && rm -f build*.xml *.jar *.test *.c *.i *.o *.out
	cd tests && rm -f build*.xml *.jar */*.test */*.c */*.i */*.o */*.out

depclean: clean
	cd $(ABLEC_BASE) && ./deep-clean
	for dep in $(EXT_DEPS); do $(MAKE) -C $(EXTS_BASE)/$$dep clean; done

# Normally MAKEOVERRIDES= up above makes sure that sub-make calls get the right
# ABLEC_BASE and EXTS_BASE if this extension isn't actually in EXTS_BASE (which
# is the case on Jenkins.) However when generating depends.mk, we want to use
# paths that are valid in *this* directory, so override MAKEOVERRIDES to ensure
# that the ABLEC_BASE and EXTS_BASE variables are inherited like normal.
depends.mk: override MAKEOVERRIDES=
depends.mk:
	@for dep in $(EXT_DEPS); do $(MAKE) -C $(EXTS_BASE)/$$dep --no-print-directory print_depends; done > $@

# Path to this extension, from any other extension
THIS_EXT=$(EXTS_BASE)/$(EXT_NAME)

# Print the definitions that should be added to the Makefile of any extension depending on this one.
print_depends:
	@echo '$(THIS_EXT)/$(ARTIFACT_JAR): $(addprefix $(THIS_EXT)/,$(GRAMMAR_SOURCES)) $(DEP_JARS)'
ifneq ($(LIB_NAME),)
	@echo '$(THIS_EXT)/$(STATIC_LIBRARY): $(addprefix $(THIS_EXT)/,$(ARTIFACT_JAR) $(XC_INCLUDE_SOURCES) $(LIB_C_FILES) $(LIB_XC_FILES))'
	@echo 'override DEP_LIBS+=$(THIS_EXT)/$(STATIC_LIBRARY)'
	@echo 'override LDFLAGS+=-L$(THIS_EXT)/lib'
	@echo 'override LDLIBS+=-Wl,-Bstatic -l${LIB_NAME} -Wl,-Bdynamic'
endif


.PHONY: print_depends build libraries examples test check analyses mda mwda clean depclean print_depends