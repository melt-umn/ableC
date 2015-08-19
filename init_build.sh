#!/bin/bash

# Enable /**/ patterns
shopt -s globstar

export ABLEC_PATH="../../../ableC"
export ABLEC_SOURCE="$ABLEC_PATH/edu.umn.cs.melt.ableC/**/* artifact/Main.sv"
export SILVER_INCLUDES="-I . -I $ABLEC_PATH"
export JAR_NAME="ableC.jar"
export JAVA_FLAGS="-Xss20M -Xmx400M"
export CPPFLAGS=
export TRANSLATE_DEPENDS=
export CFLAGS="-g -std=gnu1x"
export LOADLIBES=
export LDLIBS=
export EXECUATBLE_DEPENDS=
export INTERMEDIATES=
export CLEAN_FILES="*~ *.c *.gen_cpp *.o *.out *.test *.test.out *.copperdump.html"
export INCLUDES=
