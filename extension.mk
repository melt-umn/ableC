
# Path from current directory to top level ableC repository
ABLEC_BASE?=../../../ableC
# Path from current directory to top level extensions directory
EXTS_BASE?=../../../extensions

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
DEPS=$(ABLEC_BASE) $(addprefix $(EXTS_BASE),$(EXT_DEPS))
# All jars we depend on
DEP_JARS=$(ABLEC_BASE)/ableC.jar $(foreach dep,$(EXT_DEPS),$(EXTS_BASE)/$(dep)/$(dep).jar)
# All silver files depended on by DEP_JARS
DEP_GRAMMAR_SOURCES=$(shell find $(addsuffix /grammars,$(DEPS)) -name *.sv -print0 | xargs -0)
# The grammar path containing local sources and dependency jars
export GRAMMAR_PATH=$(shell echo $(DEP_JARS) $(abspath grammars) | sed "s/ \+/:/g")

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

# All directories contining extension header files that may be included
XC_INCLUDE_DIRS=$(wildcard $(addsuffix /include,$(DEPS)))
# All header files that may be included, to be included as dependencies
XC_INCLUDE_SOURCES=$(foreach dir,$(XC_INCLUDE_DIRS),$(wildcard $(dir)/*.*h))
# Flags passed to ableC including the appropriate directories
override XCFLAGS+=$(addprefix -I,$(XC_INCLUDE_DIRS))
# Flags passed to Java when invoking ableC
override JAVAFLAGS+=-Xss6M

# Flags passed to the C compiler, e.g. to enable various compiler extensions
override CFLAGS+=

all: build examples analyses test

build: $(ARTIFACT_JAR) $(COMPILER_JAR)
build_artifact: $(ARTIFACT_JAR)
grammar_deps: $(ABLEC_BASE)/ableC.jar

examples: $(EXAMPLE_C_FILES) $(EXAMPLE_OBJECTS) $(EXAMPLE_EXECUTABLES) $(EXAMPLE_TESTS)
test: $(TEST_C_FILES) $(TEST_OBJECTS) $(TEST_EXECUTABLES) $(TEST_TESTS)
check: test

analyses: mda mwda
mda: mda.test
mwda: mwda.test

generated:
	mkdir -p generated/

$(DEP_JARS): export GRAMMAR_PATH=
$(DEP_JARS): $(DEP_GRAMMAR_SOURCES)
# TODO: Use a lock file here to avoid the 'diamond rebuild' problem
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

%.c: %.xc $(XC_INCLUDE_SOURCES) $(COMPILER_JAR)
	java $(JAVAFLAGS) -jar $(COMPILER_JAR) $< $(XCFLAGS)

%.out: %.o $(SRC_SOURCES)
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
	rm -rf generated/
	rm -f *.jar *.copperdump.html build*.xml *.test
	cd examples && rm -f build*.xml *.jar *.test *.c *.i *.o *.out
	cd tests && rm -f build*.xml *.jar */*.test */*.c */*.i */*.o */*.out

.PHONY: build build_artifact examples test check analyses mda mwda clean