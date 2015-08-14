#!/bin/bash

PassMsg="passed"
FailMsg="failed"
AllPassed=1

export JAVA_OPTS="-Xss20M -Xmx400M ${JAVA_OPTS}"

echo "----------------------------------------------------------------------"
echo "-- Testing edu:umn:cs:melt:exts:ableC:gc"
echo "----------------------------------------------------------------------"

# Turn on debugging mode if the flag is present.
if [[ $@ =~ "-x" ]]; then
    set -x
fi

if [[ $@ =~ "--no-build" ]]; then
    echo "Not building the AbleC artifact."
else
    echo "test: ./build --clean --warn-all"

    rm -f build.test.out
    ./build --clean --warn-all &> build.test.out

    if [ $? == 0 ]; then
	echo ${PassMsg}
    else
	echo ${FailMsg}
	AllPassed=0
    fi
fi


export C_INCLUDE_PATH=/project/melt/Software/ext-libs/usr/local/include
export LIBRARY_PATH=/project/melt/Software/ext-libs/usr/local/lib

FILE="example1"

echo ""
echo "test: java ${JAVA_OPTS} -jar ableC.jar ${FILE}.xc"

rm -f ableC_${FILE}.test.out
java ${JAVA_OPTS} -jar ableC.jar ${FILE}.xc &> ableC_${FILE}.test.out

if [ $? == 0 ]; then
    echo ${PassMsg}
else
    echo ${FailMsg}
    AllPassed=0
fi


echo ""
echo "test: gcc ${FILE}.pp_out.c -lgc"

rm -f gcc_${FILE}.test.out
gcc ${FILE}.pp_out.c -lgc &> gcc_${FILE}.test.out

if [ $? == 0 ]; then
    echo ${PassMsg}
else
    echo ${FailMsg}
    AllPassed=0
fi


echo ""
echo "test: ./a.out"

rm -f run_${FILE}.test.out
./a.out &> run_${FILE}.test.out

if [ $? == 0 ]; then
    echo ${PassMsg}
else
    echo ${FailMsg}
    AllPassed=0
fi



FILE="example2-include-error"

echo ""
echo "test: java ${JAVA_OPTS} -jar ableC.jar ${FILE}.xc"

rm -f ableC_${FILE}.test.out
java ${JAVA_OPTS} -jar ableC.jar ${FILE}.xc &> ableC_${FILE}.test.out

if [ $? != 0 ]; then
    echo ${PassMsg}
else
    echo ${FailMsg}
    AllPassed=0
fi



FILE="example3-type-error"

echo ""
echo "test: java ${JAVA_OPTS} -jar ableC.jar ${FILE}.xc"

rm -f ableC_${FILE}.test.out
java ${JAVA_OPTS} -jar ableC.jar ${FILE}.xc &> ableC_${FILE}.test.out

if [ $? != 0 ]; then
    echo ${PassMsg}
else
    echo ${FailMsg}
    AllPassed=0
fi




echo ""
rm -f TESTS_FAILED
if [ ${AllPassed} = 1 ]; then
    echo "All tests passed."
else
    echo "Some tests failed."
    touch TESTS_FAILED
fi

