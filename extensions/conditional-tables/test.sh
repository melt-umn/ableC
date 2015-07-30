#!/bin/bash

PassMsg="passed"
FailMsg="failed"
AllPassed=1

echo "----------------------------------------------------------------------"
echo "-- Testing edu:umn:cs:melt:exts:ableC:tables                        --"
echo "----------------------------------------------------------------------"

echo "test: ./build --clean --warn-all"

rm -f build.test.out
./build --clean --warn-all &> build.test.out

if [ $? == 0 ]; then
    echo ${PassMsg}
else
    echo ${FailMsg}
    AllPassed=0
fi

echo ""
echo "test: java -jar ableC.jar example1.xc"

rm -f ableC_example1.test.out
java -jar ableC.jar example1.xc &> ableC_example1.test.out

if [ $? == 0 ]; then
    echo ${PassMsg}
else
    echo ${FailMsg}
    AllPassed=0
fi


echo ""
echo "test: gcc example1.pp_out.c"

rm -f gcc_example1.test.out
gcc example1.pp_out.c &> gcc_example1.test.out

if [ $? == 0 ]; then
    echo ${PassMsg}
else
    echo ${FailMsg}
    AllPassed=0
fi


echo ""
echo "test: ./a.out"

rm -f run_example1.test.out
./a.out &> run_example1.test.out

if [ $? == 0 ]; then
    echo ${PassMsg}
else
    echo ${FailMsg}
    AllPassed=0
fi


echo ""
echo "test: java -jar ableC.jar example2-type-error.xc"

rm -f ableC_example2.test.out
java -jar ableC.jar example1-type-error.xc &> ableC_example2.test.out

if [ $? != 0 ]; then
    echo ${PassMsg}
else
    echo ${FailMsg}
    AllPassed=0
fi



echo ""
echo "test: java -jar ableC.jar example3-mismatch.xc"

rm -f ableC_example3.test.out
java -jar ableC.jar example3-mismatch.xc &> ableC_example3.test.out

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
    exit 0
else
    echo "Some tests failed."
    touch TESTS_FAILED
    exit 1
fi

