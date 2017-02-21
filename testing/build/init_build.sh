#!/bin/bash

# Enable /**/ patterns
shopt -s globstar

# Single-name variables
export ABLEC_PATH="../../../ableC"
export JAR_NAME="ableC.jar"

# Read command-line options
TEMP=`getopt -o p: --long ablec-path:,jar-name: -n 'init_build.sh' -- "$@"`
eval set -- "$TEMP"

# Extract options and their arguments into variables
while true 
do
    case "$1" in
        -p|--ablec-path)
            ABLEC_PATH=$2 ; shift 2 ;;
        --jar-name)
            JAR_NAME=$2 ; shift 2 ;;
        --) shift ; break ;;
        *) echo "Internal error!" ; exit 1 ;;
    esac
done

# Other variables
export ABLEC_SOURCE="$ABLEC_PATH/edu.umn.cs.melt.ableC/**/* artifact/Main.sv"
export SILVER_INCLUDES="-I . -I $ABLEC_PATH"
export JAVA_FLAGS= #"-Xss20M -Xms40m -Xmx2000M"
export CPPFLAGS=
export TRANSLATE_DEPENDS=
export CFLAGS="-g -std=gnu1x"
export LOADLIBES=
export LDLIBS=
export EXECUTABLE_DEPENDS=
export INTERMEDIATES=
export CLEAN_FILES="*~ *.c *.gen_cpp *.o *.out *.test *.test.out .tests_failed *.copperdump.html build.xml"
export REALCLEAN_FILES="$JAR_NAME build.sh"
export INCLUDES=

