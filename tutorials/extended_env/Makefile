
ABLEC_JAR=ableC.jar
ARTIFACT=artifact
GRAMMAR_DIRS=. ../../
GRAMMAR_SOURCES=$(shell find $(GRAMMAR_DIRS) -name *.sv -print0 | xargs -0)
SVFLAGS=$(addprefix -I , $(GRAMMAR_DIRS))

XC_FILES=$(wildcard *.xc)
C_FILES=$(XC_FILES:.xc=.c)
OBJECTS=$(XC_FILES:.xc=.o)
EXECUTABLES=$(XC_FILES:.xc=.out)
TESTS=$(XC_FILES:.xc=.test)

all: $(ABLEC_JAR) $(C_FILES) $(OBJECTS) $(EXECUTABLES) $(TESTS)

$(ABLEC_JAR): $(GRAMMAR_SOURCES)
	touch $(wildcard $(ARTIFACT)/*.sv)
	silver -o $@ $(SVFLAGS) $(ARTIFACT)

%.c: %.xc $(ABLEC_JAR)
	java -jar $(ABLEC_JAR) $< $(XCFLAGS)

%.out: %.o
	$(CC) $(LDFLAGS) $< $(LOADLIBES) $(LDLIBS) -o $@

%.test: %.out
	@echo "Running $<..."
	@./$< || echo "(exit $$?)"
	touch $@

clean:
	rm -f *~ *.i *.c *.o *.out *.test *.jar *.copperdump.html build.xml

.PHONY: all clean
